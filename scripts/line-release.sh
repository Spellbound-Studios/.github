#!/usr/bin/env bash
set -uo pipefail

ORGANISATION="Spellbound-Studios"
APP_LOGIN="spellbound-workflows[bot]"
APP_USER_PATH="users/spellbound-workflows%5Bbot%5D"
APP_PATH="apps/spellbound-workflows"
RELEASE_WORKFLOW="release.yml"
SETTINGS_SCRIPT="scripts/repository-settings.sh"
RUN_WAIT_SECONDS=300
POLL_SECONDS=5
LOG_ATTEMPTS=3
LOG_RETRY_SECONDS=10

usage() {
    cat <<'TEXT'
usage: bash scripts/line-release.sh [--branch <beta|rc|main>] [--dry-run] [--plan-only] [--order <file>]
                                    [--cut-maintenance <major> [--origin-root <folder>]]

Releases every repository of ReleaseOrder.txt in order: dispatches release.yml on the branch, waits for its run
and reads the status word of its last status line, stopping the order on failed:. A repository that does not
exist, has no release.yml or has no workflow_dispatch trigger is skipped: with the reason; any other refusal,
or a run that never appears, is failed:. --dry-run dispatches with dry-run=true. --plan-only prints the order
and what would be dispatched, and calls nothing.

--cut-maintenance <major> cuts release-<major> from the branch's head in every repository instead, with the
.releaserc.yaml entry whose range is the package's own major, and prints one repository-settings.sh line per
repository for a person to type. A package at major 0 is skipped. An existing release-<major> that holds its
entry is skipped, so a partial cut can run again; one without it is refused. --origin-root reads each
repository from <folder>/<repository>.git instead of GitHub.
TEXT
}

script_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
branch="beta"
dry_run="false"
plan_only="false"
order_file="$script_folder/../ReleaseOrder.txt"
cut_major=""
origin_root=""

while [ "$#" -gt 0 ]; do
    case "$1" in
        --branch) branch="${2:-}"; shift 2 || { usage; exit 2; } ;;
        --dry-run) dry_run="true"; shift ;;
        --plan-only) plan_only="true"; shift ;;
        --order) order_file="${2:-}"; shift 2 || { usage; exit 2; } ;;
        --cut-maintenance) cut_major="${2:-}"; shift 2 || { usage; exit 2; } ;;
        --origin-root) origin_root="${2:-}"; shift 2 || { usage; exit 2; } ;;
        -h|--help) usage; exit 0 ;;
        *) echo "failed: unknown argument $1" >&2; usage >&2; exit 2 ;;
    esac
done

case "$branch" in
    beta|rc|main) ;;
    *) echo "failed: --branch is beta, rc or main, not '$branch'" >&2; exit 2 ;;
esac
if [ -n "$cut_major" ] && ! [[ "$cut_major" =~ ^[0-9]+$ ]]; then
    echo "failed: --cut-maintenance takes a Core major number, not '$cut_major'" >&2
    exit 2
fi
if [ -n "$origin_root" ] && [ -z "$cut_major" ]; then
    echo "failed: --origin-root works with --cut-maintenance alone" >&2
    exit 2
fi
if [ ! -f "$order_file" ]; then
    echo "failed: the order file $order_file does not exist" >&2
    exit 2
fi

repositories=()
while IFS= read -r line || [ -n "$line" ]; do
    line="${line%$'\r'}"
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"
    if [ -z "$line" ] || [ "${line:0:1}" = "#" ]; then
        continue
    fi
    if ! [[ "$line" =~ ^[A-Za-z0-9._-]+$ ]]; then
        echo "failed: '$line' in $order_file is not a repository name" >&2
        exit 2
    fi
    repositories+=("$line")
done < "$order_file"

if [ "${#repositories[@]}" -eq 0 ]; then
    echo "failed: $order_file names no repository" >&2
    exit 2
fi

last_word=""

report() {
    last_word="$1"
    printf '%s: %s: %s\n' "$1" "$2" "$3"
}

newest_identifier=0
run_list_refusal=""

newest_run_identifier() {
    local listed
    if ! listed="$(gh run list -R "$1" --workflow "$RELEASE_WORKFLOW" --branch "$branch" --event workflow_dispatch \
        --limit 1 --json databaseId --jq '.[].databaseId' 2>&1)"; then
        run_list_refusal="$listed"
        return 1
    fi
    if [[ "$listed" =~ ^[0-9]+$ ]]; then
        newest_identifier="$listed"
    else
        newest_identifier=0
    fi
}

names_absent_workflow() {
    printf '%s\n' "$1" | grep -Eq 'HTTP 404|could not find any workflows'
}

first_line() {
    printf '%s\n' "$1" | sed -e 's/\r$//' -e '/^[[:space:]]*$/d' | head -n 1
}

print_plan() {
    local index=0 repository
    if [ -n "$cut_major" ]; then
        echo "the cut of release-$cut_major from $branch, in order:"
    else
        echo "the line release on $branch, in order:"
    fi
    for repository in "${repositories[@]}"; do
        index=$((index + 1))
        if [ -n "$cut_major" ]; then
            printf '%3d %s: cut release-%s from the head of %s, range <major>.x from Packages/*/package.json\n' \
                "$index" "$repository" "$cut_major" "$branch"
        else
            printf '%3d %s: gh workflow run %s -R %s/%s --ref %s -f dry-run=%s\n' \
                "$index" "$repository" "$RELEASE_WORKFLOW" "$ORGANISATION" "$repository" "$branch" "$dry_run"
        fi
    done
}

release_repository() {
    local repository="$1"
    local target="$ORGANISATION/$repository"
    local refusal previous_identifier run_identifier="" deadline watch_status attempt status_line word text

    if ! newest_run_identifier "$target"; then
        if names_absent_workflow "$run_list_refusal"; then
            report skipped "$repository" "$(first_line "$run_list_refusal")"
            return 0
        fi
        report failed "$repository" "its release runs could not be listed: $(first_line "$run_list_refusal")"
        return 1
    fi
    previous_identifier="$newest_identifier"
    if ! refusal="$(gh workflow run "$RELEASE_WORKFLOW" -R "$target" --ref "$branch" -f "dry-run=$dry_run" \
        2>&1 >/dev/null)"; then
        if names_absent_workflow "$refusal" \
            || printf '%s\n' "$refusal" | grep -q "HTTP 422: Workflow does not have 'workflow_dispatch' trigger"; then
            report skipped "$repository" "$(first_line "$refusal")"
            return 0
        fi
        report failed "$repository" "the dispatch was refused: $(first_line "$refusal")"
        return 1
    fi

    deadline=$((SECONDS + RUN_WAIT_SECONDS))
    while [ -z "$run_identifier" ]; do
        if newest_run_identifier "$target" && [ "$newest_identifier" -gt "$previous_identifier" ]; then
            run_identifier="$newest_identifier"
            break
        fi
        if [ "$SECONDS" -ge "$deadline" ]; then
            report failed "$repository" "no $RELEASE_WORKFLOW run on $branch appeared within $RUN_WAIT_SECONDS seconds"
            return 1
        fi
        sleep "$POLL_SECONDS"
    done

    gh run watch "$run_identifier" -R "$target" --exit-status >/dev/null 2>&1
    watch_status=$?
    status_line=""
    for attempt in $(seq 1 "$LOG_ATTEMPTS"); do
        status_line="$(gh run view "$run_identifier" -R "$target" --log 2>/dev/null \
            | sed -E -e 's/\r$//' -e 's/^[^\t]*\t[^\t]*\t[^ ]* //' \
            | grep -E '^(succeeded|skipped|previewed|failed): ' | tail -n 1)"
        if [ -n "$status_line" ] || [ "$attempt" -eq "$LOG_ATTEMPTS" ]; then
            break
        fi
        sleep "$LOG_RETRY_SECONDS"
    done

    if [ -z "$status_line" ]; then
        if [ "$watch_status" -ne 0 ]; then
            report failed "$repository" "run $run_identifier failed and its log holds no status line"
            return 1
        fi
        report skipped "$repository" "run $run_identifier finished without a status line"
        return 0
    fi
    word="${status_line%%:*}"
    text="${status_line#*: }"
    if [ "$watch_status" -ne 0 ] || [ "$word" = "failed" ]; then
        report failed "$repository" "$text (run $run_identifier)"
        return 1
    fi
    report "$word" "$repository" "$text (run $run_identifier)"
    return 0
}

workspace=""
git_access=()
settings_targets=()
identity_resolved="false"

origin_of() {
    if [ -n "$origin_root" ]; then
        printf '%s/%s.git\n' "$origin_root" "$1"
    else
        printf 'https://github.com/%s/%s.git\n' "$ORGANISATION" "$1"
    fi
}

resolve_identity() {
    local app_user_identifier
    if [ "$identity_resolved" = "true" ]; then
        return 0
    fi
    if [ -z "${GIT_AUTHOR_NAME:-}" ] || [ -z "${GIT_AUTHOR_EMAIL:-}" ] \
        || [ -z "${GIT_COMMITTER_NAME:-}" ] || [ -z "${GIT_COMMITTER_EMAIL:-}" ]; then
        if ! app_user_identifier="$(gh api "$APP_USER_PATH" --jq .id 2>&1)"; then
            echo "failed: the App's user could not be read: $(first_line "$app_user_identifier")"
            return 1
        fi
        export GIT_AUTHOR_NAME="$APP_LOGIN"
        export GIT_AUTHOR_EMAIL="$app_user_identifier+$APP_LOGIN@users.noreply.github.com"
        export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
        export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
    fi
    identity_resolved="true"
}

cut_repository() {
    local repository="$1"
    local name="release-$cut_major"
    local origin clone existing heads output manifest manifests package_major version_lines configuration
    local branches_lines head scope

    origin="$(origin_of "$repository")"
    if ! heads="$(git ${git_access[@]+"${git_access[@]}"} ls-remote --heads "$origin" 2>&1)"; then
        report skipped "$repository" "$origin could not be read: $(first_line "$heads")"
        return 0
    fi
    if ! printf '%s\n' "$heads" | grep -q $'\t'"refs/heads/$branch\$"; then
        report skipped "$repository" "it has no $branch branch"
        return 0
    fi
    if printf '%s\n' "$heads" | grep -q $'\t'"refs/heads/$name\$"; then
        existing="$workspace/$repository-$name"
        if ! output="$(GIT_LFS_SKIP_SMUDGE=1 git ${git_access[@]+"${git_access[@]}"} clone --quiet --single-branch \
            --branch "$name" "$origin" "$existing" 2>&1)"; then
            report failed "$repository" "the clone of $name failed: $(first_line "$output")"
            return 1
        fi
        if [ -f "$existing/.releaserc.yaml" ] \
            && grep -qE "^  - name: $name"$'\r'"?\$" "$existing/.releaserc.yaml"; then
            report skipped "$repository" "$name exists and already holds its .releaserc.yaml entry"
            return 0
        fi
        report failed "$repository" "$name exists without its .releaserc.yaml entry, and a cut never moves a branch"
        return 1
    fi

    clone="$workspace/$repository"
    if ! output="$(GIT_LFS_SKIP_SMUDGE=1 git ${git_access[@]+"${git_access[@]}"} clone --quiet --single-branch \
        --branch "$branch" "$origin" "$clone" 2>&1)"; then
        report failed "$repository" "the clone failed: $(first_line "$output")"
        return 1
    fi

    manifests=()
    for manifest in "$clone"/Packages/*/package.json; do
        if [ -f "$manifest" ]; then
            manifests+=("$manifest")
        fi
    done
    if [ "${#manifests[@]}" -ne 1 ]; then
        report skipped "$repository" "it holds ${#manifests[@]} Packages/*/package.json files, and the cut reads one"
        return 0
    fi
    version_lines="$(sed -nE 's/^[[:space:]]*"version"[[:space:]]*:[[:space:]]*"([0-9]+)\.[0-9]+\.[0-9]+[^"]*".*/\1/p' \
        "${manifests[0]}" | tr -d '\r')"
    if [ -z "$version_lines" ] || [ "$(printf '%s\n' "$version_lines" | wc -l)" -ne 1 ]; then
        report skipped "$repository" "${manifests[0]#"$clone/"} has no single version line"
        return 0
    fi
    package_major="$version_lines"
    if [ "$package_major" -eq 0 ]; then
        report skipped "$repository" "its package is at major 0, and semantic-release releases nothing below 1.0.0"
        return 0
    fi

    configuration="$clone/.releaserc.yaml"
    if [ ! -f "$configuration" ]; then
        report skipped "$repository" "it has no .releaserc.yaml"
        return 0
    fi
    branches_lines="$(grep -cE '^branches:[[:space:]]*$' "$configuration")"
    if [ "$branches_lines" -ne 1 ]; then
        report skipped "$repository" ".releaserc.yaml has $branches_lines branches: lines, and the cut edits one"
        return 0
    fi

    head="$(git -C "$clone" rev-parse --short HEAD)"
    settings_targets+=("$ORGANISATION/$repository")
    if [ "$dry_run" = "true" ]; then
        report previewed "$repository" "$name would be cut from $branch at $head with range $package_major.x"
        return 0
    fi

    resolve_identity || return 1
    if ! awk -v name="$name" -v range="$package_major.x" '
        { print }
        /^branches:[[:space:]]*$/ {
            ending = ($0 ~ /\r$/) ? "\r" : ""
            print "  - name: " name ending
            print "    range: " range ending
        }
    ' "$configuration" > "$configuration.cut" || ! mv "$configuration.cut" "$configuration"; then
        unset 'settings_targets[${#settings_targets[@]}-1]'
        report failed "$repository" "the .releaserc.yaml edit failed"
        return 1
    fi
    scope="$(printf '%s' "$repository" | tr '[:upper:]' '[:lower:]')"
    if ! output="$(git -C "$clone" checkout --quiet -b "$name" 2>&1 \
        && git -C "$clone" add .releaserc.yaml 2>&1 \
        && git -C "$clone" commit --quiet -m "ci($scope): maintenance branch $name" 2>&1 \
        && git ${git_access[@]+"${git_access[@]}"} -C "$clone" push --quiet origin "$name" 2>&1)"; then
        unset 'settings_targets[${#settings_targets[@]}-1]'
        report failed "$repository" "the cut did not land: $(first_line "$output")"
        return 1
    fi
    report succeeded "$repository" "$name cut from $branch at $head with range $package_major.x"
}

print_settings_lines() {
    local target app_identifier="${SPELLBOUND_APP_ID:-}"
    if [ "${#settings_targets[@]}" -eq 0 ]; then
        return 0
    fi
    if [ -z "$app_identifier" ] && ! app_identifier="$(gh api "$APP_PATH" --jq .id 2>&1)"; then
        echo "the App's id could not be read from $APP_PATH: $(first_line "$app_identifier")"
        app_identifier="<app id>"
    fi
    echo "for a person to type, one line per repository:"
    for target in "${settings_targets[@]}"; do
        printf 'bash %s %s --maintenance-branch release-%s --app-id %s --require-unity-tests --apply\n' \
            "$SETTINGS_SCRIPT" "$target" "$cut_major" "$app_identifier"
    done
}

print_plan
if [ "$plan_only" = "true" ]; then
    printf 'previewed: %d repositories in order, nothing called\n' "${#repositories[@]}"
    exit 0
fi

done_count=0
skipped_count=0
outcome_word="succeeded"
if [ "$dry_run" = "true" ]; then
    outcome_word="previewed"
fi

count_outcome() {
    if [ "$last_word" = "skipped" ]; then
        skipped_count=$((skipped_count + 1))
    else
        done_count=$((done_count + 1))
    fi
}

if [ -n "$cut_major" ]; then
    workspace="$(mktemp -d "${RUNNER_TEMP:-${TMPDIR:-/tmp}}/line-release.XXXXXX")"
    trap 'rm -rf "$workspace"' EXIT
    if [ -z "$origin_root" ] && [ -n "${GH_TOKEN:-}" ]; then
        credential="$(printf 'x-access-token:%s' "$GH_TOKEN" | base64 | tr -d '\n')"
        git_access=(-c "http.https://github.com/.extraheader=AUTHORIZATION: basic $credential")
    fi
    for repository in "${repositories[@]}"; do
        if ! cut_repository "$repository"; then
            print_settings_lines
            echo "failed: the cut of release-$cut_major stopped at $repository"
            exit 1
        fi
        count_outcome
    done
    print_settings_lines
    echo "$outcome_word: release-$cut_major from $branch: $done_count cut or previewed, $skipped_count skipped"
    exit 0
fi

for repository in "${repositories[@]}"; do
    if ! release_repository "$repository"; then
        echo "failed: the line release on $branch stopped at $repository"
        exit 1
    fi
    count_outcome
done
echo "$outcome_word: the line release on $branch: $done_count released or previewed, $skipped_count skipped"
