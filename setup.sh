#!/usr/bin/env bash
set -euo pipefail

exec 3>&1

export UNITY_NO_BANNER=1
export UNITY_NO_PAGER=1

dry_run="${SPELLBOUND_SETUP_DRY_RUN:-0}"
into="$HOME/Spellbound"
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
}

check_operating_system() {
    case "$(uname -s)" in
        MINGW* | MSYS*) ;;
        *) stop "This script runs on Windows only and a Mac route is written when a Mac user joins," \
            "so ask the developer for help." ;;
    esac
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
    into="${into//\\//}"
    case "$into" in
        /* | [A-Za-z]:*) ;;
        *) into="$PWD/$into" ;;
    esac
    into="${into%/}"
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
    local filter
    local filters_set="true"
    for filter in clean smudge process; do
        if [ -z "$(git config --global --get "filter.lfs.$filter" || true)" ]; then
            filters_set="false"
        fi
    done
    if [ "$filters_set" = "true" ]; then
        step_skipped "Git $major.$minor and Git LFS are installed and set up already."
        return 0
    fi
    run git lfs install --skip-repo >/dev/null \
        || stop "Git LFS could not set itself up, so $retry_sentence"
    step_done
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
            --scopes admin:public_key \
            || stop "GitHub sign-in did not finish, so run the line again and finish signing in in the browser."
        changed="true"
    fi
    github_login="$("$github_command" api user --jq .login </dev/null 2>/dev/null || true)"
    if [ -z "$github_login" ]; then
        stop "GitHub sign-in did not finish, so run the line again and finish signing in in the browser."
    fi
    if [ "$changed" = "true" ]; then
        step_done
    else
        step_skipped "GitHub's command-line tool is installed and you are signed in as $github_login."
    fi
}

refresh_key_scope() {
    if [ "$github_scope_refreshed" = "true" ]; then
        return 1
    fi
    github_scope_refreshed="true"
    say "A browser window will ask you to let GitHub's command-line tool manage your SSH keys."
    run "$github_command" auth refresh -h github.com -s admin:public_key
}

read_key_list() {
    local stop_sentence="GitHub did not list your SSH keys, so $retry_sentence"
    if key_list="$("$github_command" ssh-key list </dev/null 2>&1)"; then
        return 0
    fi
    if grep -q "scope" <<< "$key_list" && refresh_key_scope; then
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
    if grep -q "scope" <<< "$add_output" && refresh_key_scope; then
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

step_application() {
    begin_step "6" "The program you model in"
    local stored
    stored="$(git config --global --get spellbound.application || true)"
    if [ -n "$application_argument" ]; then
        application="$application_argument"
    elif valid_application "$stored"; then
        application="$stored"
    else
        while ! valid_application "$application"; do
            printf '%s ' "Which program do you model in? Type maya, blender or none."
            if ! read -r application; then
                printf '\n'
                stop "Run the line again with --application maya, --application blender or --application none."
            fi
            if [ ! -t 0 ]; then
                printf '\n'
            fi
            application="${application//[[:space:]]/}"
            application="${application,,}"
            if ! valid_application "$application"; then
                say "The answer has to be maya, blender or none."
            fi
        done
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

step_clone() {
    local repository="$1"
    local folder="$2"
    local name="${repository#*/}"
    local pull_stop_sentence="Git LFS could not download the large files, so $retry_sentence"
    begin_step "7" "Clone $repository" "7 ($name)"
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
        if hooks_changed "$folder"; then
            changed="true"
        fi
        read_placeholder_count "$folder"
        if [ "$placeholder_count" -gt 0 ]; then
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
        step_skipped "The folder $(windows_path "$folder") is a clone of $repository already."
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
    begin_step "8" "Unity editor for $repository" "8 ($name)"
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
    begin_step "9" "Registry items and notifications"
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
    say "A game's items from the art registry are fetched by the art tools once they can do it; nothing is fetched today."
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

step_open_project() {
    local repository="$1"
    local folder="$2"
    local name="${repository#*/}"
    local project_path
    project_path="$(windows_path "$folder")"
    begin_step "10" "Open $repository once" "10 ($name)"
    if [ -f "$folder/Library/Spellbound/opened-by-setup.txt" ]; then
        step_skipped "The project was opened on an earlier run."
        return 0
    fi
    say "Unity opens the project without a window so its packages download, and the first time takes a while."
    if ! run "$unity_command" open "$project_path" --batchmode --until-ready --timeout 3600; then
        stop "Unity could not open $project_path, so send the editor log at $(editor_log_for "$folder")" \
            "to an engineer."
    fi
    run "$unity_command" close "$project_path" \
        || stop "Unity opened $project_path but did not close it, so restart the computer, then run the line again."
    if [ "$dry_run" != "1" ]; then
        mkdir -p "$folder/Library/Spellbound"
        date -u '+%Y-%m-%d %H:%M' > "$folder/Library/Spellbound/opened-by-setup.txt"
    fi
    step_done
}

step_maya_menu() {
    begin_step "11" "Unity's menu for Maya"
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
        say ""
        say "No repository was named, so the script ran the tool steps only."
        print_summary
        return 0
    fi
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
    print_summary
}

main "$@"
