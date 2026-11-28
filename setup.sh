#!/usr/bin/env bash
set -euo pipefail

exec 3>&1

export UNITY_NO_BANNER=1
export UNITY_NO_PAGER=1

dry_run="${SPELLBOUND_SETUP_DRY_RUN:-0}"
studio_plugins=(spellbound spellbound-networking)
studio_marketplace_name="spellbound-skills"
studio_marketplace_repository="Spellbound-Studios/claude-skills"
roadmap_repository="Spellbound-Studios/Roadmap"
raw_address="https://raw.githubusercontent.com/Spellbound-Studios/.github/main"
shell_file="$HOME/.bashrc"
shell_block_begin="# >>> Spellbound setup >>>"
shell_block_end="# <<< Spellbound setup <<<"
shell_block_changed="false"
folder_staging=""
into=""
application_argument=""
application=""
repositories=()
folders=()
steps_done=()
steps_skipped=()
current_step=""
github_command="gh"
unity_command="unity"
github_login=""
github_scope_refreshed="false"
installed_editors_text=""
installed_editors_read="false"
placeholder_count=0
git_user_name=""
git_user_email=""
typed_answer=""
retry_sentence="run the line again, and if it fails again, ask an engineer."
local_application_data="${LOCALAPPDATA:-$HOME/AppData/Local}"
local_application_data="${local_application_data//\\//}"

say() {
    printf '%s\n' "$*"
}

stop() {
    printf 'stop: %s\n' "$*"
    exit 1
}

begin_step() {
    current_step="${3:-$1}"
    printf '\nStep %s: %s\n' "$1" "$2"
}

step_done() {
    say "done"
    steps_done+=("$current_step")
}

step_skipped() {
    say "skipped: $*"
    steps_skipped+=("$current_step")
}

describe_command() {
    local word
    local line=""
    for word in "$@"; do
        case "$word" in
            "" | *[[:space:]]*) line="$line \"$word\"" ;;
            *) line="$line $word" ;;
        esac
    done
    printf '%s\n' "${line# }"
}

run() {
    if [ "$dry_run" = "1" ]; then
        printf 'would run: %s\n' "$(describe_command "$@")" >&3
        return 0
    fi
    "$@"
}

windows_path() {
    local path="$1"
    if [[ "$path" =~ ^/([a-zA-Z])/(.*)$ ]]; then
        path="${BASH_REMATCH[1]^^}:/${BASH_REMATCH[2]}"
    fi
    printf '%s\n' "${path//\//\\}"
}

join_words() {
    local count="$#"
    local index=1
    local text=""
    local word
    for word in "$@"; do
        if [ "$index" -eq 1 ]; then
            text="$word"
        elif [ "$index" -eq "$count" ]; then
            text="$text and $word"
        else
            text="$text, $word"
        fi
        index=$((index + 1))
    done
    printf '%s' "$text"
}

valid_application() {
    case "$1" in
        maya | blender | none) return 0 ;;
        *) return 1 ;;
    esac
}

folder_for() {
    local name="${1#*/}"
    case "$name" in
        *Dev) printf '%s/%s\n' "$into" "$name" ;;
        *) printf '%s/%sDev\n' "$into" "$name" ;;
    esac
}

registry_named() {
    local repository
    for repository in "${repositories[@]}"; do
        if [ "${repository#*/}" = "ArtRegistry" ]; then
            return 0
        fi
    done
    return 1
}

maya_menu_sentence() {
    say "Unity's menu for Maya is installed from inside the registry project: with Maya closed, open Edit," \
        "Project Settings, Fbx Export, pick Maya 2026 under 3D Application and press Install Unity Integration."
    say "The install adds Unity's line to Maya's shared userSetup.mel file in Maya's scripts folder," \
        "Documents\\maya\\scripts. If Maya's File menu shows no Unity entry after the install, an earlier line" \
        "in that file is failing and stops Unity's line from running, so move Unity's line to the top of that file."
}

check_operating_system() {
    case "$(uname -s)" in
        MINGW* | MSYS*) ;;
        *) stop "This script runs on Windows only and a Mac route is written when a Mac user joins," \
            "so ask the developer for help." ;;
    esac
}

folder_path() {
    local path="${1//\\//}"
    case "$path" in
        /* | [A-Za-z]:*) ;;
        *) path="$PWD/$path" ;;
    esac
    if [[ "$path" =~ ^/([a-zA-Z])(/.*)?$ ]]; then
        path="${BASH_REMATCH[1]^^}:${BASH_REMATCH[2]:-/}"
    elif [[ "$path" =~ ^([a-zA-Z]):(.*)$ ]]; then
        path="${BASH_REMATCH[1]^^}:${BASH_REMATCH[2]}"
    fi
    while [[ "$path" == ?*/ ]] && ! [[ "$path" =~ ^[A-Z]:/$ ]]; do
        path="${path%/}"
    done
    printf '%s\n' "$path"
}

remembered_folder() {
    [ -f "$shell_file" ] || return 1
    local value
    value="$(awk -v BINMODE=3 -v begin="$shell_block_begin" -v end="$shell_block_end" '
        { sub(/\r$/, "") }
        $0 == begin { inside = 1; next }
        $0 == end { inside = 0; next }
        inside && /^export SPELLBOUND_HOME=/ { sub(/^export SPELLBOUND_HOME=/, ""); print; exit }' "$shell_file")"
    value="${value#\"}"
    value="${value%\"}"
    rememberable_folder "$value" || return 1
    printf '%s\n' "$value"
}

rememberable_folder() {
    [[ "$1" =~ ^[A-Za-z0-9/:._\ -]+$ ]]
}

parse_arguments() {
    local repository
    while [ "$#" -gt 0 ]; do
        case "$1" in
            --into)
                [ "$#" -ge 2 ] || stop "Put a folder after --into, then run the line again."
                into="$2"
                shift 2
                ;;
            --application)
                [ "$#" -ge 2 ] || stop "Put maya, blender or none after --application, then run the line again."
                application_argument="${2,,}"
                shift 2
                ;;
            -*)
                stop "The option $1 is not known, so use only --into and --application, then run the line again."
                ;;
            *)
                repository="${1%.git}"
                if ! [[ "$repository" =~ ^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$ ]]; then
                    stop "Name each repository as owner/name, such as Spellbound-Studios/ArtRegistry," \
                        "then run the line again."
                fi
                repositories+=("$repository")
                shift
                ;;
        esac
    done
    if [ -n "$application_argument" ] && ! valid_application "$application_argument"; then
        stop "Put maya, blender or none after --application, then run the line again."
    fi
    if [ -z "$into" ]; then
        into="${SPELLBOUND_HOME:-}"
    fi
    if [ -z "$into" ]; then
        into="$(remembered_folder || true)"
    fi
    if [ -z "$into" ]; then
        into="$HOME/Spellbound"
    fi
    into="$(folder_path "$into")"
    if ! rememberable_folder "$into"; then
        stop "The folder $into holds characters other than letters, digits, spaces, dots, underscores, hyphens," \
            "slashes and a colon, so pick another folder with --into, then run the setup command again."
    fi
    for repository in "${repositories[@]}"; do
        folders+=("$(folder_for "$repository")")
    done
}

install_with_winget() {
    if ! command -v winget >/dev/null 2>&1; then
        stop "Install App Installer from the Microsoft Store, then run the line again."
    fi
    say "Windows may ask to allow the installer, so press Yes if it does."
    run winget install --id "$1" -e --source winget --accept-source-agreements --accept-package-agreements \
        || stop "Windows could not install $2, so $retry_sentence"
    hash -r
}

stop_for_git() {
    stop "Install Git for Windows from https://gitforwindows.org with its default options, then run the line again."
}

step_git() {
    begin_step "1" "Git"
    command -v git >/dev/null 2>&1 || stop_for_git
    local version_text
    version_text="$(git --version)"
    [[ "$version_text" =~ ([0-9]+)\.([0-9]+) ]] || stop_for_git
    local major="${BASH_REMATCH[1]}"
    local minor="${BASH_REMATCH[2]}"
    if [ "$major" -lt 2 ] || { [ "$major" -eq 2 ] && [ "$minor" -lt 25 ]; }; then
        stop_for_git
    fi
    git lfs version >/dev/null 2>&1 || stop_for_git
    local changed="false"
    local filter
    local filters_set="true"
    for filter in clean smudge process; do
        if [ -z "$(git config --global --get "filter.lfs.$filter" || true)" ]; then
            filters_set="false"
        fi
    done
    if [ "$filters_set" != "true" ]; then
        run git lfs install --skip-repo >/dev/null \
            || stop "Git LFS could not set itself up, so $retry_sentence"
        changed="true"
    fi
    if git_identity_changed; then
        changed="true"
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "Git $major.$minor and Git LFS are installed and set up already," \
            "and Git signs your changes as $git_user_name <$git_user_email>."
    fi
}

ask_answer() {
    local question="$1"
    local requirement="$2"
    local pattern="$3"
    local stop_sentence="$4"
    typed_answer=""
    while ! [[ "${typed_answer,,}" == $pattern ]]; do
        printf '%s ' "$question"
        if ! read -r typed_answer; then
            printf '\n'
            stop "$stop_sentence"
        fi
        if [ ! -t 0 ]; then
            printf '\n'
        fi
        typed_answer="${typed_answer#"${typed_answer%%[![:space:]]*}"}"
        typed_answer="${typed_answer%"${typed_answer##*[![:space:]]}"}"
        if ! [[ "${typed_answer,,}" == $pattern ]]; then
            say "$requirement"
        fi
    done
}

git_identity_changed() {
    local changed="false"
    local identity_stop_sentence="Git needs your name and email, so run the line again and type them when it asks."
    local save_stop_sentence="Git could not save your name and email, so $retry_sentence"
    git_user_name="$(git config --global --get user.name || true)"
    git_user_email="$(git config --global --get user.email || true)"
    if [ -z "$git_user_name" ]; then
        ask_answer "What name should Git sign your changes with? Type your full name." \
            "The answer has to be your name." "?*" "$identity_stop_sentence"
        git_user_name="$typed_answer"
        run git config --global user.name "$git_user_name" || stop "$save_stop_sentence"
        changed="true"
    fi
    if [ -z "$git_user_email" ]; then
        ask_answer "What email should Git sign your changes with? Type the email you use on GitHub." \
            "The answer has to be an email address, such as name@example.com." "?*@?*.?*" \
            "$identity_stop_sentence"
        git_user_email="$typed_answer"
        run git config --global user.email "$git_user_email" || stop "$save_stop_sentence"
        changed="true"
    fi
    if [ "$changed" = "true" ]; then
        say "Git signs your changes as $git_user_name <$git_user_email>."
        return 0
    fi
    return 1
}

locate_github_command() {
    local candidate
    if command -v gh >/dev/null 2>&1; then
        github_command="gh"
        return 0
    fi
    for candidate in "/c/Program Files/GitHub CLI/gh.exe" "$local_application_data/Programs/GitHub CLI/gh.exe"; do
        if [ -x "$candidate" ]; then
            github_command="$candidate"
            return 0
        fi
    done
    return 1
}

step_github() {
    begin_step "2" "GitHub's command-line tool"
    local changed="false"
    if ! locate_github_command; then
        install_with_winget "GitHub.cli" "GitHub's command-line tool"
        changed="true"
        if ! locate_github_command; then
            if [ "$dry_run" = "1" ]; then
                stop "Run the line without the dry run, because the next steps need GitHub's command-line tool."
            fi
            stop "GitHub's command-line tool did not install, so restart the computer, then run the line again."
        fi
    fi
    if ! "$github_command" auth status </dev/null >/dev/null 2>&1; then
        say "A browser window will ask you to sign in to GitHub."
        run "$github_command" auth login --hostname github.com --git-protocol ssh --web --skip-ssh-key \
            --scopes admin:public_key,project \
            || stop "GitHub sign-in did not finish, so run the line again and finish signing in in the browser."
        changed="true"
    fi
    github_login="$("$github_command" api user --jq .login </dev/null 2>/dev/null || true)"
    if [ -z "$github_login" ]; then
        stop "GitHub sign-in did not finish, so run the line again and finish signing in in the browser."
    fi
    if [ -n "$(missing_github_scopes)" ]; then
        refresh_github_scopes || stop "GitHub sign-in did not finish, so $retry_sentence"
        changed="true"
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "GitHub's command-line tool is installed and you are signed in as $github_login."
    fi
}

missing_github_scopes() {
    local scope_text
    local scope
    local missing=""
    scope_text="$("$github_command" auth status </dev/null 2>&1 | grep 'Token scopes:' || true)"
    for scope in admin:public_key project; do
        if [[ "$scope_text" != *"'$scope'"* ]]; then
            missing="${missing:+$missing,}$scope"
        fi
    done
    printf '%s' "$missing"
}

refresh_github_scopes() {
    if [ "$github_scope_refreshed" = "true" ]; then
        return 1
    fi
    github_scope_refreshed="true"
    say "A browser window will ask you to let this computer manage your SSH keys and move work on the studio board."
    run "$github_command" auth refresh -h github.com -s admin:public_key,project
}

read_key_list() {
    local stop_sentence="GitHub did not list your SSH keys, so $retry_sentence"
    if key_list="$("$github_command" ssh-key list </dev/null 2>&1)"; then
        return 0
    fi
    if grep -q "scope" <<< "$key_list" && refresh_github_scopes; then
        key_list="$("$github_command" ssh-key list </dev/null 2>&1)" || stop "$stop_sentence"
        return 0
    fi
    stop "$stop_sentence"
}

add_public_key() {
    local stop_sentence="GitHub did not take your SSH key, so $retry_sentence"
    local add_output
    if add_output="$(run "$github_command" ssh-key add "$1" --title "$2" </dev/null 2>&1)"; then
        return 0
    fi
    if grep -q "scope" <<< "$add_output" && refresh_github_scopes; then
        run "$github_command" ssh-key add "$1" --title "$2" </dev/null >/dev/null 2>&1 || stop "$stop_sentence"
        return 0
    fi
    stop "$stop_sentence"
}

step_ssh_key() {
    begin_step "3" "SSH key"
    local changed="false"
    local key_file="$HOME/.ssh/id_ed25519"
    local public_key_file="$key_file.pub"
    local known_hosts_file="$HOME/.ssh/known_hosts"
    local host_name
    host_name="$(hostname)"
    if [ ! -d "$HOME/.ssh" ]; then
        run mkdir -p "$HOME/.ssh"
    fi
    if [ ! -f "$key_file" ]; then
        run ssh-keygen -q -t ed25519 -N "" -f "$key_file" -C "$github_login@$host_name" \
            || stop "Windows could not make an SSH key, so ask an engineer."
        changed="true"
    elif [ ! -f "$public_key_file" ]; then
        stop "The file $(windows_path "$public_key_file") is missing, so ask an engineer."
    fi
    if [ -f "$public_key_file" ]; then
        local public_key
        local key_list=""
        public_key="$(awk '{ print $1 " " $2; exit }' "$public_key_file")"
        read_key_list
        if ! awk -F '\t' -v key="$public_key" '$2 == key { found = 1 } END { exit !found }' <<< "$key_list"; then
            add_public_key "$public_key_file" "$host_name"
            changed="true"
        fi
    else
        add_public_key "$public_key_file" "$host_name"
    fi
    if ! ssh-keygen -F github.com -f "$known_hosts_file" >/dev/null 2>&1; then
        if [ "$dry_run" = "1" ]; then
            printf 'would run: ssh-keyscan -t ed25519 github.com >> %s\n' "$known_hosts_file" >&3
        else
            local host_key
            host_key="$(ssh-keyscan -t ed25519 github.com </dev/null 2>/dev/null || true)"
            if [ -z "$host_key" ]; then
                stop "GitHub could not be reached, so check the internet connection, then run the line again."
            fi
            printf '%s\n' "$host_key" >> "$known_hosts_file"
        fi
        changed="true"
    fi
    if [ "$dry_run" = "1" ] && [ "$changed" = "true" ]; then
        run ssh -T git@github.com
    else
        local greeting
        greeting="$(ssh -o BatchMode=yes -T git@github.com </dev/null 2>&1 || true)"
        case "$greeting" in
            *"Hi $github_login!"*) ;;
            *"Hi "*) stop "SSH signs in to GitHub as an account other than $github_login, so ask an engineer." ;;
            *) stop "GitHub did not accept your SSH key, so $retry_sentence" ;;
        esac
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "Your SSH key is on GitHub already and signs in as $github_login."
    fi
}

locate_unity_command() {
    if command -v unity >/dev/null 2>&1; then
        unity_command="unity"
        return 0
    fi
    if [ -x "$local_application_data/Microsoft/WindowsApps/unity.exe" ]; then
        unity_command="$local_application_data/Microsoft/WindowsApps/unity.exe"
        return 0
    fi
    return 1
}

unity_signed_in() {
    local status_text
    status_text="$("$unity_command" auth status </dev/null 2>/dev/null || true)"
    case "$status_text" in
        *"Signed in as"*) return 0 ;;
        *) return 1 ;;
    esac
}

unity_licensed() {
    local license_text
    license_text="$("$unity_command" license --format tsv --no-header </dev/null 2>/dev/null || true)"
    grep -q '^Unity' <<< "$license_text"
}

step_unity_command_line() {
    begin_step "4" "The Unity command line"
    local changed="false"
    local license_stop_sentence="Unity could not activate a licence for your account, so ask an engineer."
    if ! locate_unity_command; then
        install_with_winget "Unity.CLI" "the Unity command line"
        changed="true"
        if ! locate_unity_command; then
            if [ "$dry_run" = "1" ]; then
                stop "Run the line without the dry run, because the next steps need the Unity command line."
            fi
            stop "The Unity command line did not install, so restart the computer, then run the line again."
        fi
    fi
    if ! unity_signed_in; then
        say "A browser window will ask you to sign in to Unity."
        run "$unity_command" auth login \
            || stop "Unity sign-in did not finish, so run the line again and finish signing in in the browser."
        changed="true"
        if [ "$dry_run" != "1" ] && ! unity_signed_in; then
            stop "Unity sign-in did not finish, so run the line again and finish signing in in the browser."
        fi
    fi
    if ! unity_licensed; then
        run "$unity_command" license activate || true
        if [ "$dry_run" = "1" ] || ! unity_licensed; then
            run "$unity_command" license activate --personal --accept-eula || stop "$license_stop_sentence"
        fi
        changed="true"
        if [ "$dry_run" != "1" ] && ! unity_licensed; then
            stop "$license_stop_sentence"
        fi
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "The Unity command line is installed, signed in and licensed already."
    fi
}

step_unity_hub() {
    begin_step "5" "Unity Hub"
    if [ -x "/c/Program Files/Unity Hub/Unity Hub.exe" ]; then
        step_skipped "Unity Hub is installed already."
        return 0
    fi
    say "Windows may ask to allow the Unity Hub installer, so press Yes if it does."
    local hub_output
    hub_output="$(run "$unity_command" hub install --headless </dev/null 2>&1)" \
        || stop "Unity Hub did not install, so $retry_sentence"
    if grep -qi "already" <<< "$hub_output"; then
        step_skipped "Unity Hub is installed already."
    else
        step_done
    fi
}

engineer_repository_named() {
    local repository
    for repository in "${repositories[@]}"; do
        if [ "${repository#*/}" != "ArtRegistry" ]; then
            return 0
        fi
    done
    return 1
}

listing_names() {
    awk -v name="$1" '{ for (position = 1; position <= NF; position++) if ($position == name) found = 1 }
        END { exit !found }' <<< "$2"
}

step_studio_plugin() {
    begin_step "6" "The studio plugin for Claude Code"
    if ! engineer_repository_named; then
        step_skipped "Only engineers need the studio plugin."
        return 0
    fi
    command -v claude >/dev/null 2>&1 \
        || stop "Install Claude Code from https://docs.claude.com/en/docs/claude-code/setup, then $retry_sentence"
    local repository
    for repository in "$roadmap_repository" "$studio_marketplace_repository"; do
        "$github_command" repo view "$repository" </dev/null >/dev/null 2>&1 \
            || stop "GitHub did not let you read $repository, so ask an organisation owner to give you access," \
                "then $retry_sentence"
    done
    local changed="false"
    if [[ ",$(missing_github_scopes)," == *",project,"* ]] && [ "$github_scope_refreshed" != "true" ]; then
        refresh_github_scopes || stop "GitHub sign-in did not finish, so $retry_sentence"
        changed="true"
    fi
    local marketplace_text
    marketplace_text="$(claude plugin marketplace list </dev/null 2>/dev/null || true)"
    if ! listing_names "$studio_marketplace_name" "$marketplace_text"; then
        run claude plugin marketplace add "$studio_marketplace_repository" </dev/null \
            || stop "Claude Code could not add the studio marketplace, so $retry_sentence"
        changed="true"
    fi
    local installed_text
    local plugin
    installed_text="$(claude plugin list </dev/null 2>/dev/null || true)"
    for plugin in "${studio_plugins[@]}"; do
        if ! listing_names "$plugin@$studio_marketplace_name" "$installed_text"; then
            run claude plugin install "$plugin@$studio_marketplace_name" </dev/null \
                || stop "Claude Code could not install $plugin, so $retry_sentence"
            changed="true"
        fi
    done
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "The studio plugins $(join_words "${studio_plugins[@]}") are installed in Claude Code already," \
            "and you can read $roadmap_repository and $studio_marketplace_repository."
    fi
}

step_application() {
    begin_step "7" "The program you model in"
    local stored
    stored="$(git config --global --get spellbound.application || true)"
    if [ -n "$application_argument" ]; then
        application="$application_argument"
    elif valid_application "$stored"; then
        application="$stored"
    else
        ask_answer "Which program do you model in? Type maya, blender or none." \
            "The answer has to be maya, blender or none." "@(maya|blender|none)" \
            "Run the line again with --application maya, --application blender or --application none."
        application="${typed_answer,,}"
    fi
    if [ "$application" = "$stored" ]; then
        step_skipped "Your answer $application was stored on an earlier run."
        return 0
    fi
    run git config --global spellbound.application "$application"
    step_done
}

origin_names_repository() {
    local origin="$1"
    local name="$2"
    [ -n "$origin" ] || return 1
    origin="${origin%/}"
    origin="${origin%.git}"
    origin="${origin##*[:/]}"
    [ "${origin,,}" = "${name,,}" ]
}

hooks_changed() {
    local folder="$1"
    local current
    current="$(git -C "$folder" config --get core.hooksPath || true)"
    if [ -f "$folder/.githooks/pre-push" ]; then
        if [ "$current" != ".githooks" ]; then
            run git -C "$folder" config core.hooksPath .githooks
            return 0
        fi
        return 1
    fi
    if [ -n "$current" ]; then
        run git -C "$folder" config --unset core.hooksPath
    fi
    if [ ! -f "$folder/.git/hooks/pre-push" ] || ! grep -q "git lfs pre-push" "$folder/.git/hooks/pre-push" 2>/dev/null; then
        run git -C "$folder" lfs install --local --force >/dev/null
        return 0
    fi
    [ -n "$current" ]
}

read_placeholder_count() {
    local listing
    listing="$(git -C "$1" lfs ls-files)" \
        || stop "Git LFS could not list the large files in $(windows_path "$1"), so ask an engineer."
    placeholder_count="$(awk '$2 == "-" { count++ } END { print count + 0 }' <<< "$listing")"
}

run_repository_setup() {
    local folder="$1"
    if [ "$dry_run" = "1" ] && [ ! -d "$folder" ]; then
        printf 'would run: bash scripts/setup.sh in %s, where the clone holds it\n' "$(windows_path "$folder")" >&3
        return 0
    fi
    [ -f "$folder/scripts/setup.sh" ] || return 0
    if [ "$dry_run" = "1" ]; then
        printf 'would run: bash scripts/setup.sh in %s\n' "$(windows_path "$folder")" >&3
        return 0
    fi
    local code=0
    (cd "$folder" && bash scripts/setup.sh) </dev/null >/dev/null 2>&1 || code=$?
    if [ "$code" -eq 0 ]; then
        say "The folder's own setup script: passed."
    else
        say "The folder's own setup script exited $code, so open Git Bash in $(windows_path "$folder")," \
            "run bash scripts/setup.sh and send what it prints to an engineer."
    fi
}

step_clone() {
    local repository="$1"
    local folder="$2"
    local name="${repository#*/}"
    local pull_stop_sentence="Git LFS could not download the large files, so $retry_sentence"
    begin_step "8" "Clone $repository" "8 ($name)"
    local changed="false"
    local pulled="false"
    if [ -e "$folder" ]; then
        local origin=""
        if [ -e "$folder/.git" ]; then
            origin="$(git -C "$folder" remote get-url origin 2>/dev/null || true)"
        fi
        if ! origin_names_repository "$origin" "$name"; then
            stop "The folder $(windows_path "$folder") holds something other than $repository," \
                "so move it away or pick another folder with --into, then run the line again."
        fi
        local updated="false"
        local commit_before
        commit_before="$(git -C "$folder" rev-parse HEAD 2>/dev/null || true)"
        local own_changes_stop_sentence="The folder $(windows_path "$folder") holds changes of its own that are not on"
        own_changes_stop_sentence="$own_changes_stop_sentence GitHub, so ask an engineer before you run the line again."
        run git -C "$folder" fetch --quiet origin \
            || stop "Git could not reach GitHub to update $(windows_path "$folder")," \
                "so check your internet connection, then run the line again."
        if ! git -C "$folder" rev-parse --verify --quiet '@{upstream}' >/dev/null 2>&1; then
            stop "The folder $(windows_path "$folder") is not on a branch that GitHub knows, so ask an engineer."
        fi
        local commits_ahead
        commits_ahead="$(git -C "$folder" rev-list --count '@{upstream}..HEAD')" || stop "$own_changes_stop_sentence"
        if [ "$commits_ahead" -gt 0 ]; then
            stop "$own_changes_stop_sentence"
        fi
        run git -C "$folder" pull --quiet --ff-only 2>/dev/null || stop "$own_changes_stop_sentence"
        if [ "$(git -C "$folder" rev-parse HEAD 2>/dev/null || true)" != "$commit_before" ]; then
            say "The folder $(windows_path "$folder") now has the newest changes from GitHub."
            updated="true"
            changed="true"
        fi
        if [ -n "$(git -C "$folder" status --porcelain --untracked-files=no 2>/dev/null || true)" ]; then
            say "The folder $(windows_path "$folder") has edits of its own that are not on GitHub, and they were kept."
        fi
        if hooks_changed "$folder"; then
            changed="true"
        fi
        read_placeholder_count "$folder"
        if [ "$placeholder_count" -gt 0 ] || [ "$updated" = "true" ]; then
            run git -C "$folder" lfs pull || stop "$pull_stop_sentence"
            changed="true"
            pulled="true"
        fi
    else
        if [ ! -d "$into" ]; then
            run mkdir -p "$into"
        fi
        if ! run git clone "git@github.com:$repository.git" "$folder"; then
            rm -rf "$folder"
            stop "Git could not clone $repository, so check that you accepted the invitation to the" \
                "organisation and your internet connection, then run the line again."
        fi
        hooks_changed "$folder" || true
        run git -C "$folder" lfs pull || stop "$pull_stop_sentence"
        changed="true"
        pulled="true"
    fi
    run_repository_setup "$folder"
    if [ "$dry_run" = "1" ]; then
        if [ "$pulled" = "true" ]; then
            run git -C "$folder" lfs ls-files
        fi
    else
        read_placeholder_count "$folder"
        if [ "$placeholder_count" -gt 0 ]; then
            stop "Some large files came down as placeholders, so run the line again; if they stay, ask an engineer."
        fi
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "The folder $(windows_path "$folder") is a clone of $repository already" \
            "and has the newest changes from GitHub."
    fi
}

editor_installed() {
    if [ "$installed_editors_read" != "true" ]; then
        installed_editors_text="$("$unity_command" editors --installed --format tsv --no-header </dev/null 2>/dev/null || true)"
        installed_editors_read="true"
    fi
    awk -F '\t' -v version="$1" '$1 == version { found = 1 } END { exit !found }' <<< "$installed_editors_text"
}

step_editor() {
    local repository="$1"
    local folder="$2"
    local name="${repository#*/}"
    local version_file="$folder/ProjectSettings/ProjectVersion.txt"
    begin_step "9" "Unity editor for $repository" "9 ($name)"
    if [ ! -f "$version_file" ]; then
        if [ "$dry_run" = "1" ]; then
            step_skipped "The dry run made no clone to read the editor version from."
            return 0
        fi
        stop "The project in $(windows_path "$folder") has no ProjectSettings/ProjectVersion.txt, so ask an engineer."
    fi
    local editor_version
    editor_version="$(sed -n 's/^m_EditorVersion:[[:space:]]*//p' "$version_file")"
    editor_version="${editor_version//$'\r'/}"
    editor_version="${editor_version%%$'\n'*}"
    if [ -z "$editor_version" ]; then
        stop "The project in $(windows_path "$folder") names no editor version, so ask an engineer."
    fi
    if editor_installed "$editor_version"; then
        step_skipped "Unity $editor_version is installed already."
        return 0
    fi
    say "One Windows prompt will ask to allow the Unity installer, so press Yes."
    run "$unity_command" install "$editor_version" --yes --accept-eula \
        || stop "Unity $editor_version did not install, so $retry_sentence"
    installed_editors_text="$installed_editors_text"$'\n'"$editor_version"$'\t'"installed by setup"
    step_done
}

step_registry_watch() {
    begin_step "10" "Registry items and notifications"
    local owner=""
    local repository
    for repository in "${repositories[@]}"; do
        if [ "${repository#*/}" != "ArtRegistry" ]; then
            owner="${repository%%/*}"
            break
        fi
    done
    if [ -z "$owner" ]; then
        step_skipped "Only the art registry was named, so there is nothing to fetch or watch."
        return 0
    fi
    local index
    for index in "${!repositories[@]}"; do
        if [ "${repositories[$index]#*/}" != "ArtRegistry" ]; then
            fetch_registry_items "${repositories[$index]}" "${folders[$index]}"
        fi
    done
    local subscribed
    subscribed="$("$github_command" api "repos/$owner/ArtRegistry/subscription" --jq .subscribed \
        </dev/null 2>/dev/null || true)"
    if [ "$subscribed" = "true" ]; then
        step_skipped "You get the art registry's notifications already."
        return 0
    fi
    if run "$github_command" api -X PUT "repos/$owner/ArtRegistry/subscription" -F subscribed=true -F ignored=false \
        </dev/null >/dev/null 2>&1; then
        step_done
    else
        step_skipped "GitHub did not let you watch $owner/ArtRegistry, so ask an engineer to invite you to it."
    fi
}

editor_log_for() {
    if [ -f "$1/Logs/Editor.log" ]; then
        windows_path "$1/Logs/Editor.log"
    else
        windows_path "$local_application_data/Unity/Editor/Editor.log"
    fi
}

open_project_without_window() {
    local folder="$1"
    local project_path
    project_path="$(windows_path "$folder")"
    say "Close Unity first if it is open, because Unity cannot open a project that is already open."
    say "Unity opens the project without a window so its packages download, and the first time takes a while."
    if ! run "$unity_command" open "$project_path" --batchmode --until-ready --timeout 3600; then
        stop "Unity could not open $project_path, so send the editor log at $(editor_log_for "$folder")" \
            "to an engineer."
    fi
}

close_project_without_window() {
    local project_path
    project_path="$(windows_path "$1")"
    run "$unity_command" close "$project_path" \
        || stop "Unity opened $project_path but did not close it, so restart the computer, then run the line again."
}

fetch_registry_items() {
    local repository="$1"
    local folder="$2"
    local project_path
    local fetch_text
    local fetch_line
    project_path="$(windows_path "$folder")"
    say "Fetching the art registry's items for $repository."
    open_project_without_window "$folder"
    fetch_text="$(run "$unity_command" command spellbound_run --line "artpipeline fetch" --result-only \
        --project-path "$project_path" </dev/null 2>&1 || true)"
    fetch_line="$(grep -o -m 1 -E '(succeeded|previewed|refused|failed|invalid): [^"]*' <<< "$fetch_text" || true)"
    fetch_line="${fetch_line%%\\n*}"
    fetch_line="${fetch_line%$'\r'}"
    case "$fetch_line" in
        succeeded:* | previewed:*)
            say "$fetch_line"
            ;;
        invalid:*)
            say "This game's art tools do not fetch registry items yet, so nothing was fetched."
            ;;
        refused:* | failed:*)
            close_project_without_window "$folder"
            local sentence="${fetch_line#*: }"
            stop "${sentence%.}, then run the line again."
            ;;
    esac
    close_project_without_window "$folder"
}

step_open_project() {
    local repository="$1"
    local folder="$2"
    local name="${repository#*/}"
    begin_step "11" "Open $repository once" "11 ($name)"
    if [ -f "$folder/Library/Spellbound/opened-by-setup.txt" ]; then
        step_skipped "The project was opened on an earlier run."
        return 0
    fi
    open_project_without_window "$folder"
    close_project_without_window "$folder"
    if [ "$dry_run" != "1" ]; then
        mkdir -p "$folder/Library/Spellbound"
        date -u '+%Y-%m-%d %H:%M' > "$folder/Library/Spellbound/opened-by-setup.txt"
    fi
    step_done
}

step_maya_menu() {
    begin_step "12" "Unity's menu for Maya"
    if [ "$application" != "maya" ]; then
        step_skipped "Only people who model in Maya need this step."
        return 0
    fi
    if ! registry_named; then
        step_skipped "The art registry was not named, so there is no project to install the menu from."
        return 0
    fi
    maya_menu_sentence
    say "This script cannot install it for you."
    step_done
}

fetch_raw() {
    curl -fsSL "$raw_address/$1" -o "$2" </dev/null 2>/dev/null \
        || stop "GitHub did not send $1, so check the internet connection, then run the setup command again."
}

install_text() {
    local staged="$1"
    local target="$2"
    if [ -f "$target" ] && cmp -s "$staged" "$target"; then
        return 1
    fi
    if [ "$dry_run" = "1" ]; then
        printf 'would write: %s\n' "$(windows_path "$target")" >&3
        return 0
    fi
    { mkdir -p "$(dirname "$target")" && cp "$staged" "$target"; } \
        || stop "Windows could not write $(windows_path "$target"), so ask an engineer."
    return 0
}

text_hash() {
    git hash-object --no-filters "$1"
}

shell_block() {
    printf '%s\n' "$shell_block_begin"
    printf 'export SPELLBOUND_HOME="%s"\n' "$into"
    printf '%s\n' \
        'spellbound() {' \
        '    cd "$SPELLBOUND_HOME" || return 1' \
        '    local plugin' \
        "    for plugin in ${studio_plugins[*]}; do" \
        "        claude plugin update \"\$plugin@$studio_marketplace_name\" </dev/null >/dev/null 2>&1" \
        '    done' \
        '    local staging' \
        '    staging="$(mktemp -d 2>/dev/null)" || return 0' \
        '    mkdir -p .spellbound' \
        '    if curl -fsSL '"$raw_address"'/scripts/greeting.sh -o "$staging/greeting.sh" 2>/dev/null \' \
        '        && ! cmp -s "$staging/greeting.sh" .spellbound/greeting.sh; then' \
        '        cp "$staging/greeting.sh" .spellbound/greeting.sh' \
        '    fi' \
        '    if curl -fsSL '"$raw_address"'/folder/CLAUDE.md -o "$staging/CLAUDE.md" 2>/dev/null; then' \
        '        if [ ! -f CLAUDE.md ]; then' \
        '            cp "$staging/CLAUDE.md" CLAUDE.md' \
        '        elif ! cmp -s "$staging/CLAUDE.md" CLAUDE.md \' \
        '            && ! cmp -s "$staging/CLAUDE.md" .spellbound/CLAUDE.md; then' \
        '            cp "$staging/CLAUDE.md" .spellbound/CLAUDE.md' \
        '        fi' \
        '    fi' \
        '    if curl -fsSL '"$raw_address"'/setup.sh -o "$staging/setup.sh" 2>/dev/null; then' \
        '        local fetched' \
        '        local recorded' \
        '        fetched="$(git hash-object --no-filters "$staging/setup.sh")"' \
        '        recorded="$(cat .spellbound/setup.hash 2>/dev/null)"' \
        '        if [ "$#" -gt 0 ] || [ "$fetched" != "$recorded" ]; then' \
        '            bash "$staging/setup.sh" "$@"' \
        '        fi' \
        '    fi' \
        '    rm -rf "$staging"' \
        '}' \
        "$shell_block_end"
}

merged_shell_file() {
    local carriage_return=""
    if [ "$(tr -dc '\r' < "$1" | wc -c)" -gt 0 ]; then
        carriage_return="$(printf '\r')"
    fi
    awk -v BINMODE=3 -v begin="$shell_block_begin" -v end="$shell_block_end" -v block_file="$2" \
        -v ending="$carriage_return" '
        function print_block(   row) {
            while ((getline row < block_file) > 0) print row ending
            close(block_file)
        }
        { text = $0; sub(/\r$/, "", text) }
        skipping && text == end { skipping = 0; held = 0; next }
        skipping { held_rows[++held] = $0; next }
        text == begin {
            if (!placed) print_block()
            placed = 1
            skipping = 1
            held = 0
            held_rows[++held] = $0
            next
        }
        { print }
        END {
            if (skipping) for (position = 1; position <= held; position++) print held_rows[position]
            if (!placed) {
                if (NR > 0) print ending
                print_block()
            }
        }' "$1"
}

session_start_entry() {
    local indent="$1"
    local command="bash \\\"$into/.spellbound/greeting.sh\\\""
    printf '%s\n' \
        "$indent{" \
        "$indent  \"matcher\": \"startup\"," \
        "$indent  \"hooks\": [" \
        "$indent    {" \
        "$indent      \"type\": \"command\"," \
        "$indent      \"command\": \"$command\"," \
        "$indent      \"timeout\": 20" \
        "$indent    }" \
        "$indent  ]" \
        "$indent}"
}

session_start_hook() {
    local indent="$1"
    printf '%s\n' "$indent\"SessionStart\": ["
    session_start_entry "$indent  "
    printf '%s\n' "$indent]"
}

greeting_settings_changed() {
    local staging="$1"
    local settings_file="$into/.claude/settings.json"
    if [ ! -f "$settings_file" ]; then
        {
            printf '%s\n' '{' '  "hooks": {'
            session_start_hook "    "
            printf '%s\n' '  }' '}'
        } > "$staging/settings.json"
        install_text "$staging/settings.json" "$settings_file"
        say "Claude Code now opens each session in the folder with your work from the studio board."
        return 0
    fi
    if grep -qF ".spellbound/greeting.sh" "$settings_file"; then
        return 1
    fi
    if grep -qF '"SessionStart"' "$settings_file"; then
        say "The file $(windows_path "$settings_file") has a SessionStart hook of its own and no session greeting," \
            "so add this entry to its SessionStart list, with a comma between entries:"
        session_start_entry "      "
    else
        say "The file $(windows_path "$settings_file") has settings of its own and no session greeting," \
            "so add this inside its hooks section, with a comma after it if another hook follows:"
        session_start_hook "    "
    fi
    return 1
}

step_folder() {
    begin_step "13" "The Spellbound folder"
    local changed="false"
    local kept_sentence="its shell setting, its CLAUDE.md, the session greeting and the record of this setup already."
    local staging
    staging="$(mktemp -d)"
    folder_staging="$staging"
    trap 'rm -rf "$folder_staging"' EXIT
    if [ ! -d "$into" ]; then
        run mkdir -p "$into"
        changed="true"
    fi
    if [ -f "$shell_file" ]; then
        cp "$shell_file" "$staging/shell.current"
    else
        : > "$staging/shell.current"
    fi
    shell_block > "$staging/shell.block"
    merged_shell_file "$staging/shell.current" "$staging/shell.block" > "$staging/shell.next"
    if install_text "$staging/shell.next" "$shell_file"; then
        say "The shell file $(windows_path "$shell_file") now sets SPELLBOUND_HOME to $(windows_path "$into")," \
            "so a later run without --into keeps this folder."
        shell_block_changed="true"
        changed="true"
    fi
    if command -v claude >/dev/null 2>&1; then
        fetch_raw "folder/CLAUDE.md" "$staging/CLAUDE.md"
        if [ ! -f "$into/CLAUDE.md" ]; then
            install_text "$staging/CLAUDE.md" "$into/CLAUDE.md"
            say "The folder now has the studio's CLAUDE.md."
            changed="true"
        elif ! cmp -s "$staging/CLAUDE.md" "$into/CLAUDE.md"; then
            if install_text "$staging/CLAUDE.md" "$into/.spellbound/CLAUDE.md"; then
                changed="true"
            fi
            say "The folder's CLAUDE.md differs from the studio's and was kept," \
                "so the studio's copy is in $(windows_path "$into/.spellbound/CLAUDE.md") to compare."
        fi
        fetch_raw "scripts/greeting.sh" "$staging/greeting.sh"
        if install_text "$staging/greeting.sh" "$into/.spellbound/greeting.sh"; then
            say "The session greeting now matches the studio's copy."
            changed="true"
        fi
        if greeting_settings_changed "$staging"; then
            changed="true"
        fi
    else
        say "Claude Code is not installed, so the folder gets no CLAUDE.md and no session greeting."
        kept_sentence="its shell setting and the record of this setup already."
    fi
    fetch_raw "setup.sh" "$staging/setup.sh"
    text_hash "$staging/setup.sh" > "$staging/setup.hash"
    if install_text "$staging/setup.hash" "$into/.spellbound/setup.hash"; then
        changed="true"
    fi
    rm -rf "$staging"
    trap - EXIT
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "The folder $(windows_path "$into") has $kept_sentence"
    fi
}

print_summary() {
    local folder
    say ""
    say "Summary"
    if [ "${#steps_done[@]}" -gt 0 ]; then
        say "These steps ran: $(join_words "${steps_done[@]}")."
    else
        say "No step needed to run."
    fi
    if [ "${#steps_skipped[@]}" -gt 0 ]; then
        say "These steps were skipped: $(join_words "${steps_skipped[@]}")."
    else
        say "No step was skipped."
    fi
    say "Here is what to do next."
    if [ "$shell_block_changed" = "true" ]; then
        say "Open a new Git Bash window and type spellbound: it opens $(windows_path "$into")," \
            "updates the studio plugins and runs this setup again whenever the studio changes it."
    fi
    if [ "${#repositories[@]}" -eq 0 ]; then
        say "Run the same line again with a repository after it, such as Spellbound-Studios/ArtRegistry."
        return 0
    fi
    for folder in "${folders[@]}"; do
        say "Open Unity Hub, press Add, choose Add project from disk and pick the folder $(windows_path "$folder")."
    done
    if [ "$application" = "maya" ] && registry_named; then
        maya_menu_sentence
    fi
}

main() {
    check_operating_system
    parse_arguments "$@"
    if [ "$dry_run" = "1" ]; then
        say "This is a dry run, so every command that changes something is printed instead of run."
    fi
    step_git
    step_github
    step_ssh_key
    step_unity_command_line
    step_unity_hub
    if [ "${#repositories[@]}" -eq 0 ]; then
        step_folder
        say ""
        say "No repository was named, so nothing was cloned."
        print_summary
        return 0
    fi
    step_studio_plugin
    step_application
    local index
    for index in "${!repositories[@]}"; do
        step_clone "${repositories[$index]}" "${folders[$index]}"
    done
    for index in "${!repositories[@]}"; do
        step_editor "${repositories[$index]}" "${folders[$index]}"
    done
    step_registry_watch
    for index in "${!repositories[@]}"; do
        step_open_project "${repositories[$index]}" "${folders[$index]}"
    done
    step_maya_menu
    step_folder
    print_summary
}

if [ "${BASH_SOURCE[0]}" = "$0" ]; then
    main "$@"
fi
