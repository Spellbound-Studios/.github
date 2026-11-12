#!/usr/bin/env bash
set -uo pipefail

test_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
line_release="${1:-$test_folder/../line-release.sh}"
major=2
branch=beta

workspace="$(mktemp -d)"
trap 'rm -rf "$workspace"' EXIT

export GIT_CONFIG_NOSYSTEM=1
export GIT_CONFIG_GLOBAL="$workspace/gitconfig"
export GIT_AUTHOR_NAME="line release fixture"
export GIT_AUTHOR_EMAIL="fixture@example.invalid"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
export SPELLBOUND_APP_ID=123456
: > "$GIT_CONFIG_GLOBAL"

failures=()

fail() {
    failures+=("$1")
}

make_origin() {
    local name="$1" version="$2"
    local seed="$workspace/seeds/$name"
    git init --quiet --bare "$workspace/origins/$name.git"
    git init --quiet "$seed"
    git -C "$seed" checkout --quiet -b "$branch"
    mkdir -p "$seed/Packages/Fixture"
    printf '{\n  "name": "com.spellboundstudios.fixture",\n  "version": "%s",\n  "unity": "6000.3"\n}\n' "$version" \
        > "$seed/Packages/Fixture/package.json"
    printf 'branches:\n  - main\nplugins:\n  - "@semantic-release/commit-analyzer"\n' > "$seed/.releaserc.yaml"
    git -C "$seed" add --all
    git -C "$seed" commit --quiet -m "feat(fixture): the fixture package at $version"
    git -C "$seed" push --quiet "$workspace/origins/$name.git" "$branch"
}

head_of() {
    git --git-dir "$workspace/origins/$1.git" rev-parse --verify --quiet "refs/heads/$2"
}

check_cut() {
    local name="$1" range="$2" scope="$3"
    local origin="$workspace/origins/$name.git"
    local cut_head beta_head expected actual subject
    if ! cut_head="$(head_of "$name" "release-$major")"; then
        fail "$name has no release-$major after the cut"
        return
    fi
    beta_head="$(head_of "$name" "$branch")"
    if [ "$(git --git-dir "$origin" rev-parse "$cut_head^")" != "$beta_head" ]; then
        fail "$name: release-$major does not start at the head of $branch"
    fi
    expected="$(printf 'branches:\n  - name: release-%s\n    range: %s\n  - main\nplugins:\n  - "%s"' \
        "$major" "$range" "@semantic-release/commit-analyzer")"
    actual="$(git --git-dir "$origin" show "$cut_head:.releaserc.yaml")"
    if [ "$actual" != "$expected" ]; then
        fail "$name: .releaserc.yaml on release-$major reads: $(printf '%s' "$actual" | tr '\n' '|')"
    fi
    subject="$(git --git-dir "$origin" log -1 --format=%s "$cut_head")"
    if [ "$subject" != "ci($scope): maintenance branch release-$major" ]; then
        fail "$name: the cut commit reads: $subject"
    fi
}

make_origin First 1.4.0
make_origin Second 2.1.0
make_origin Zero 0.2.0
printf 'First\nAbsent\nSecond\nZero\n' > "$workspace/order.txt"

first_output="$(bash "$line_release" --cut-maintenance "$major" --branch "$branch" --order "$workspace/order.txt" \
    --origin-root "$workspace/origins" 2>&1)"
first_status=$?

if [ "$first_status" -ne 0 ]; then
    fail "the first cut exited $first_status"
fi
check_cut First 1.x first
check_cut Second 2.x second
if ! printf '%s\n' "$first_output" | grep -q '^skipped: Absent: '; then
    fail "the missing repository Absent was not skipped"
fi
if ! printf '%s\n' "$first_output" | grep -q '^skipped: Zero: its package is at major 0'; then
    fail "the major 0 package Zero was not skipped"
fi
for name in First Second; do
    line="bash scripts/repository-settings.sh Spellbound-Studios/$name --maintenance-branch release-$major"
    line="$line --app-id 123456 --require-unity-tests --apply"
    if ! printf '%s\n' "$first_output" | grep -qxF "$line"; then
        fail "the settings line for $name was not printed"
    fi
done

make_origin Third 3.0.0
git -C "$workspace/seeds/Third" push --quiet "$workspace/origins/Third.git" "$branch:refs/heads/release-$major"
third_head="$(head_of Third "release-$major")"
printf 'First\nAbsent\nSecond\nThird\n' > "$workspace/order-again.txt"

first_cut_head="$(head_of First "release-$major")"
second_cut_head="$(head_of Second "release-$major")"
second_output="$(bash "$line_release" --cut-maintenance "$major" --branch "$branch" \
    --order "$workspace/order-again.txt" --origin-root "$workspace/origins" 2>&1)"
second_status=$?

if [ "$second_status" -eq 0 ]; then
    fail "the second cut was not refused at Third"
fi
for name in First Second; do
    if ! printf '%s\n' "$second_output" | grep -q "^skipped: $name: release-$major exists and already holds"; then
        fail "the second cut did not skip $name, whose release-$major holds its entry"
    fi
done
if ! printf '%s\n' "$second_output" | grep -q "^failed: Third: release-$major exists without"; then
    fail "the second cut did not refuse Third, whose release-$major lacks its entry"
fi
if [ "$(head_of First "release-$major")" != "$first_cut_head" ] \
    || [ "$(head_of Second "release-$major")" != "$second_cut_head" ] \
    || [ "$(head_of Third "release-$major")" != "$third_head" ]; then
    fail "the second cut moved an existing release-$major"
fi

if [ "${#failures[@]}" -ne 0 ]; then
    printf 'failed: %s\n' "${failures[@]}"
    printf '%s\n' "the first cut printed:" "$first_output" "the second cut printed:" "$second_output"
    exit 1
fi
printf '%s\n' "succeeded: release-$major cut in two origins with ranges 1.x and 2.x," \
    "the missing one skipped, a rerun skipping both and a branch without its entry refused" | paste -sd ' '
