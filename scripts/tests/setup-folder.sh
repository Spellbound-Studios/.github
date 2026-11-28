#!/usr/bin/env bash
set -uo pipefail

test_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
setup_script="${1:-$test_folder/../../setup.sh}"
repository_root="$(cd "$test_folder/../.." && pwd)"
studio_plugins=(spellbound spellbound-networking)

workspace="$(mktemp -d)"
trap 'rm -rf "$workspace"' EXIT

mkdir -p "$workspace/bin" "$workspace/raw/folder" "$workspace/raw/scripts" "$workspace/local"
cp "$repository_root/folder/CLAUDE.md" "$workspace/raw/folder/CLAUDE.md"
cp "$repository_root/scripts/greeting.sh" "$workspace/raw/scripts/greeting.sh"
cat > "$workspace/raw/setup.sh" <<'STUB'
printf 'setup ran with: %s\n' "$*"
STUB

cat > "$workspace/bin/curl" <<'STUB'
#!/usr/bin/env bash
printf 'called: curl %s\n' "$*" >> "$STUB_CALLS"
output=""
address=""
while [ "$#" -gt 0 ]; do
    case "$1" in
        -o) output="$2"; shift 2 ;;
        -*) shift ;;
        *) address="$1"; shift ;;
    esac
done
source_file="$STUB_RAW/${address#*/main/}"
[ -f "$source_file" ] || exit 22
if [ -n "$output" ]; then
    cp "$source_file" "$output"
else
    cat "$source_file"
fi
STUB
cat > "$workspace/bin/claude" <<'STUB'
#!/usr/bin/env bash
printf 'called: claude %s\n' "$*" >> "$STUB_CALLS"
case "$*" in
    "plugin marketplace list") printf 'Configured marketplaces:\n\n  > spellbound-skills\n' ;;
    "plugin list") printf 'Installed plugins:\n\n  > spellbound@spellbound-skills\n  > spellbound-networking@spellbound-skills\n' ;;
esac
exit 0
STUB
cat > "$workspace/bin/gh" <<'STUB'
#!/usr/bin/env bash
printf 'called: gh %s\n' "$*" >> "$STUB_CALLS"
case "$1 $2" in
    "auth status") printf '%s\n' "github.com" "  - Token scopes: 'admin:public_key', 'project', 'repo'" ;;
    "api user") printf '%s\n' "fixture-login" ;;
esac
exit 0
STUB
cat > "$workspace/bin/unity" <<'STUB'
#!/usr/bin/env bash
printf 'called: unity %s\n' "$*" >> "$STUB_CALLS"
case "$1 $2" in
    "auth status") printf 'Signed in as fixture-login\n' ;;
    "license --format") printf 'Unity Personal\tactive\n' ;;
esac
exit 0
STUB
for recorder in ssh ssh-keygen winget; do
    printf '%s\n' '#!/usr/bin/env bash' "printf 'called: $recorder %s\\n' \"\$*\" >> \"\$STUB_CALLS\"" 'exit 1' \
        > "$workspace/bin/$recorder"
done
cat > "$workspace/local/git" <<'STUB'
#!/usr/bin/env bash
printf 'called: git %s\n' "$*" >> "$STUB_CALLS"
if [ "$1" = "clone" ]; then
    mkdir -p "$3/scripts" "$3/.githooks" "$3/.git"
    : > "$3/.githooks/pre-push"
    printf '%s\n' 'printf "called: repository setup in %s\n" "$(basename "$PWD")" >> "$STUB_CALLS"' \
        'exit "${STUB_REPOSITORY_SETUP_EXIT:-0}"' > "$3/scripts/setup.sh"
    exit 0
fi
case "$3 $4" in
    "config --get") exit 1 ;;
    "remote get-url") printf 'git@github.com:Spellbound-Studios/Sample.git\n' ;;
    "rev-list --count") printf '0\n' ;;
    "rev-parse HEAD") printf 'fixture-commit\n' ;;
esac
exit 0
STUB
chmod +x "$workspace/bin/"* "$workspace/local/git"

export STUB_RAW="$workspace/raw"
failures=()
transcript=""
cases=0

fail() {
    failures+=("$1")
}

record() {
    cases=$((cases + 1))
    transcript="$transcript"$'\n'"case $1 exited $status and printed:"$'\n'"$output"
}

in_setup() {
    local home="$1"
    shift
    calls="$workspace/calls.txt"
    : > "$calls"
    output="$(STUB_CALLS="$calls" HOME="$home" SPELLBOUND_SETUP_DRY_RUN=0 PATH="$workspace/bin:$PATH" \
        bash -c 'source "$1"; code="$2"; shift 2; eval "$code"' _ "$setup_script" "$@" 2>&1)"
    status=$?
}

folder_from() {
    local home="$1"
    shift
    in_setup "$home" 'parse_arguments "$@"; printf "%s\n" "$into"' "$@"
}

home="$workspace/home"
mkdir -p "$home"

in_setup "$home" 'for path in "D:/dev/unity/spellbound" "/d/dev/unity/spellbound" "D:\\dev\\unity\\spellbound" \
    "d:/dev/unity/spellbound/"; do folder_path "$path"; done'
record folder_path
if [ "$output" != "$(printf 'D:/dev/unity/spellbound\n%.0s' 1 2 3 4)" ]; then
    fail "folder_path: Windows and Git Bash forms do not all become D:/dev/unity/spellbound"
fi

in_setup "$home" 'printf "%s\n" "$(folder_path "$HOME/Spellbound")"'
default_folder="$output"
unset SPELLBOUND_HOME
folder_from "$home"
record default
if [ "$status" -ne 0 ] || [ "$output" != "$default_folder" ] || [[ "$output" != */Spellbound ]]; then
    fail "default: the folder is not the home folder's Spellbound"
fi

folder_from "$home" --into D:/dev/unity/spellbound
record into_windows
if [ "$output" != "D:/dev/unity/spellbound" ]; then
    fail "into_windows: --into D:/dev/unity/spellbound gave $output"
fi

folder_from "$home" --into /d/dev/unity/spellbound
record into_git_bash
if [ "$output" != "D:/dev/unity/spellbound" ]; then
    fail "into_git_bash: --into /d/dev/unity/spellbound gave $output"
fi

output="$(SPELLBOUND_HOME="D:/studio/elsewhere" HOME="$home" bash -c \
    'source "$1"; parse_arguments; printf "%s\n" "$into"' _ "$setup_script" 2>&1)"
status=$?
record environment
if [ "$output" != "D:/studio/elsewhere" ]; then
    fail "environment: SPELLBOUND_HOME gave $output"
fi

output="$(SPELLBOUND_HOME="D:/studio/elsewhere" HOME="$home" bash -c \
    'source "$1"; parse_arguments --into D:/studio/chosen; printf "%s\n" "$into"' _ "$setup_script" 2>&1)"
status=$?
record into_over_environment
if [ "$output" != "D:/studio/chosen" ]; then
    fail "into_over_environment: --into did not win over SPELLBOUND_HOME"
fi

folder="$workspace/Spellbound Folder"
first_shell_text="alias first='true'"
last_shell_text="alias last='true'"
printf '%s\n' "$first_shell_text" "# >>> Spellbound setup >>>" "export SPELLBOUND_HOME=/old/place" \
    "# <<< Spellbound setup <<<" "$last_shell_text" > "$home/.bashrc"

in_setup "$home" 'parse_arguments --into "$1"; step_folder' "$folder"
record first_folder
if [ "$status" -ne 0 ] || ! printf '%s\n' "$output" | grep -qxF "done"; then
    fail "first_folder: the folder part did not finish with done"
fi
if [ "$(grep -cxF "# >>> Spellbound setup >>>" "$home/.bashrc")" -ne 1 ] \
    || [ "$(grep -cxF "# <<< Spellbound setup <<<" "$home/.bashrc")" -ne 1 ]; then
    fail "first_folder: the shell file does not hold exactly one block"
fi
if grep -qF "/old/place" "$home/.bashrc"; then
    fail "first_folder: the old block was kept"
fi
if [ "$(sed -n 1p "$home/.bashrc")" != "$first_shell_text" ] || [ "$(tail -n 1 "$home/.bashrc")" != "$last_shell_text" ]; then
    fail "first_folder: the block was not replaced in place"
fi
if [ "$(tr -dc '\r' < "$home/.bashrc" | wc -c)" -ne 0 ]; then
    fail "first_folder: the rewrite put CRLF endings into a shell file that had none"
fi
if ! cmp -s "$folder/CLAUDE.md" "$repository_root/folder/CLAUDE.md"; then
    fail "first_folder: CLAUDE.md was not written from the raw address"
fi
if ! cmp -s "$folder/.spellbound/greeting.sh" "$repository_root/scripts/greeting.sh"; then
    fail "first_folder: the greeting was not fetched into .spellbound"
fi
greeting_command="\"command\": \"bash \\\"$folder/.spellbound/greeting.sh\\\"\","
if ! grep -qF '"SessionStart": [' "$folder/.claude/settings.json" \
    || ! grep -qF '"matcher": "startup",' "$folder/.claude/settings.json" \
    || ! grep -qF '"type": "command",' "$folder/.claude/settings.json" \
    || ! grep -qF "$greeting_command" "$folder/.claude/settings.json" \
    || ! grep -qF '"timeout": 20' "$folder/.claude/settings.json"; then
    fail "first_folder: settings.json does not hold the session greeting hook"
fi
cp "$home/.bashrc" "$workspace/bashrc.first"
cp "$folder/.claude/settings.json" "$workspace/settings.first"

folder_from "$home"
record remembered
if [ "$output" != "$folder" ]; then
    fail "remembered: a run without --into gave $output instead of the remembered folder"
fi

in_setup "$home" 'parse_arguments; step_folder'
record second_folder
if [ "$status" -ne 0 ] || ! printf '%s\n' "$output" | grep -q '^skipped: '; then
    fail "second_folder: a second run did not skip"
fi
if ! cmp -s "$home/.bashrc" "$workspace/bashrc.first"; then
    fail "second_folder: the shell file changed on a second run"
fi
if printf '%s\n' "$output" | grep -qF "now has the studio's CLAUDE.md"; then
    fail "second_folder: CLAUDE.md was written again"
fi
if ! cmp -s "$folder/.claude/settings.json" "$workspace/settings.first"; then
    fail "second_folder: settings.json changed on a second run"
fi

shell_calls="$workspace/shell-calls.txt"
run_spellbound() {
    : > "$shell_calls"
    output="$(STUB_CALLS="$shell_calls" HOME="$home" PATH="$workspace/bin:$PATH" \
        bash -c 'unset SPELLBOUND_HOME; source "$HOME/.bashrc"; spellbound "$@"; printf "now in %s\n" "$PWD"' _ "$@" 2>&1)"
    status=$?
}

setup_fetches() {
    grep -c '^called: curl .*/main/setup\.sh' "$shell_calls"
}

rm "$folder/.spellbound/greeting.sh"
run_spellbound
record command_unchanged
if [ "$output" != "now in $(cd "$folder" && pwd)" ]; then
    fail "command_unchanged: spellbound printed more than the folder change, or did not change to the folder"
fi
if [ "$(setup_fetches)" -ne 1 ]; then
    fail "command_unchanged: setup.sh was not fetched exactly once"
fi
if ! cmp -s "$folder/.spellbound/greeting.sh" "$repository_root/scripts/greeting.sh"; then
    fail "command_unchanged: the greeting was not refreshed"
fi
for plugin in "${studio_plugins[@]}"; do
    if ! grep -qxF "called: claude plugin update $plugin@spellbound-skills" "$shell_calls"; then
        fail "command_unchanged: $plugin was not updated"
    fi
done

printf '%s\n' 'printf "setup ran with: %s, from %s\n" "$*" "$(basename "$(dirname "$0")")"' > "$workspace/raw/setup.sh"
run_spellbound
record command_changed
if ! printf '%s\n' "$output" | grep -qE '^setup ran with: , from tmp\.'; then
    fail "command_changed: a changed setup did not run again from its fetched copy"
fi
if [ "$(setup_fetches)" -ne 1 ]; then
    fail "command_changed: setup.sh was not fetched exactly once"
fi

printf '%s\n' "# a local edit" >> "$folder/CLAUDE.md"
cp "$folder/CLAUDE.md" "$workspace/claude.edited"
in_setup "$home" 'parse_arguments; step_folder'
record edited_claude
if ! cmp -s "$folder/CLAUDE.md" "$workspace/claude.edited"; then
    fail "edited_claude: a CLAUDE.md that differs was overwritten"
fi
if ! cmp -s "$folder/.spellbound/CLAUDE.md" "$repository_root/folder/CLAUDE.md"; then
    fail "edited_claude: the studio's copy did not go to .spellbound/CLAUDE.md"
fi
if [ "$(printf '%s\n' "$output" | grep -c 'differs from the studio')" -ne 1 ]; then
    fail "edited_claude: no single sentence says where the studio's copy went"
fi

rm "$folder/.spellbound/CLAUDE.md"
run_spellbound
record command_edited_claude
if ! cmp -s "$folder/CLAUDE.md" "$workspace/claude.edited" \
    || ! cmp -s "$folder/.spellbound/CLAUDE.md" "$repository_root/folder/CLAUDE.md"; then
    fail "command_edited_claude: spellbound overwrote the folder's CLAUDE.md or did not refresh the studio's copy"
fi

printf '%s\n' '{' '  "permissions": {}' '}' > "$folder/.claude/settings.json"
cp "$folder/.claude/settings.json" "$workspace/settings.own"
in_setup "$home" 'parse_arguments; step_folder'
record own_settings
if [ "$status" -ne 0 ]; then
    fail "own_settings: exited $status"
fi
if ! printf '%s\n' "$output" | grep -qF "add this inside its hooks section" \
    || ! printf '%s\n' "$output" | grep -qxF '    "SessionStart": [' \
    || ! printf '%s\n' "$output" | grep -qF "$greeting_command"; then
    fail "own_settings: the block to add was not printed"
fi
if ! cmp -s "$folder/.claude/settings.json" "$workspace/settings.own"; then
    fail "own_settings: a settings.json of its own was changed"
fi
if ! printf '%s\n' "$output" | grep -qxF "done" && ! printf '%s\n' "$output" | grep -q '^skipped: '; then
    fail "own_settings: the folder part did not continue to its end"
fi

hostile_home="$workspace/hostile-home"
mkdir -p "$hostile_home"
printf '%s\n' "# >>> Spellbound setup >>>" 'export SPELLBOUND_HOME="$(touch "$HOME/evaluated")/x"' \
    "# <<< Spellbound setup <<<" > "$hostile_home/.bashrc"
folder_from "$hostile_home"
record hostile_value
if [ -e "$hostile_home/evaluated" ] || [[ "$output" != */Spellbound ]]; then
    fail "hostile_value: a remembered value outside the strict pattern was evaluated or used"
fi

crlf_home="$workspace/crlf-home"
mkdir -p "$crlf_home"
printf 'alias first=true\r\nalias last=true\r\n' > "$crlf_home/.bashrc"
in_setup "$crlf_home" 'parse_arguments --into "$1"; step_folder' "$workspace/crlf-folder"
record crlf_shell_file
if [ "$(tr -dc '\r' < "$crlf_home/.bashrc" | wc -c)" -ne "$(wc -l < "$crlf_home/.bashrc")" ] \
    || [ "$(wc -l < "$crlf_home/.bashrc")" -lt 4 ]; then
    fail "crlf_shell_file: the rewrite did not keep the file's CRLF endings"
fi
cp "$crlf_home/.bashrc" "$workspace/crlf.first"
in_setup "$crlf_home" 'parse_arguments; step_folder'
if ! cmp -s "$crlf_home/.bashrc" "$workspace/crlf.first"; then
    fail "crlf_shell_file: a second run changed a CRLF shell file"
fi

mkdir -p "$workspace/staging-parent" "$workspace/empty-raw"
output="$(STUB_CALLS="$workspace/calls.txt" STUB_RAW="$workspace/empty-raw" TMPDIR="$workspace/staging-parent" \
    HOME="$home" PATH="$workspace/bin:$PATH" bash -c 'source "$1"; parse_arguments; step_folder' _ "$setup_script" 2>&1)"
status=$?
record fetch_stops
if [ "$status" -eq 0 ] || ! printf '%s\n' "$output" | grep -q '^stop: GitHub did not send'; then
    fail "fetch_stops: a failed fetch did not stop"
fi
if [ -n "$(ls -A "$workspace/staging-parent")" ]; then
    fail "fetch_stops: the temporary folder was left behind"
fi

clone_home="$workspace/clone-home"
mkdir -p "$clone_home"
clone_folder="$workspace/clones"
calls="$workspace/clone-calls.txt"
clone_once() {
    output="$(STUB_CALLS="$calls" HOME="$clone_home" SPELLBOUND_SETUP_DRY_RUN=0 \
        PATH="$workspace/local:$workspace/bin:$PATH" \
        bash -c 'source "$1"; parse_arguments --into "$2" Spellbound-Studios/Sample
            step_clone "${repositories[0]}" "${folders[0]}"' _ "$setup_script" "$clone_folder" 2>&1)"
    status=$?
}
: > "$calls"
clone_once
record clone
if [ "$status" -ne 0 ] || ! printf '%s\n' "$output" | grep -qxF "The folder's own setup script: passed."; then
    fail "clone: exited $status or did not say the repository's own setup passed"
fi
if ! awk '/^called: git clone / { cloned = NR } /^called: repository setup in SampleDev$/ { ran = NR }
    END { exit !(cloned && ran > cloned) }' "$calls"; then
    fail "clone: the repository's own setup did not run after the clone"
fi
clone_once
record update
transcript="$transcript"$'\n'"and recorded:"$'\n'"$(cat "$calls")"
if [ "$status" -ne 0 ] || [ "$(grep -c '^called: repository setup' "$calls")" -ne 2 ]; then
    fail "update: the repository's own setup did not run again on an existing clone"
fi
export STUB_REPOSITORY_SETUP_EXIT=3
clone_once
unset STUB_REPOSITORY_SETUP_EXIT
record failing_repository_setup
if [ "$status" -ne 0 ] || ! printf '%s\n' "$output" | grep -qF "The folder's own setup script exited 3"; then
    fail "failing_repository_setup: the exit code of the repository's own setup was not said"
fi

full_home="$workspace/full-home"
mkdir -p "$full_home"
printf '%s\n' '[user]' '    name = Fixture Engineer' '    email = fixture@example.com' \
    '[filter "lfs"]' '    clean = git-lfs clean -- %f' '    smudge = git-lfs smudge -- %f' \
    '    process = git-lfs filter-process' '    required = true' > "$full_home/.gitconfig"
full_folder="$workspace/full"
calls="$workspace/full-calls.txt"
: > "$calls"
output="$(STUB_CALLS="$calls" HOME="$full_home" GIT_CONFIG_GLOBAL="$full_home/.gitconfig" \
    LOCALAPPDATA="$full_home/AppData/Local" SPELLBOUND_SETUP_DRY_RUN=1 PATH="$workspace/bin:$PATH" \
    bash "$setup_script" --into "$full_folder" --application none Spellbound-Studios/SaboteurDev </dev/null 2>&1)"
status=$?
record full_dry_run
if [ "$status" -ne 0 ]; then
    fail "full_dry_run: exited $status"
fi
for number in 1 2 3 4 5 6 7 8 9 10 11 12 13; do
    if ! printf '%s\n' "$output" | grep -qE "^[A-Z][a-z]+ $number( \([A-Za-z]+\))?: "; then
        fail "full_dry_run: heading $number is missing"
    fi
done
full_windows_folder="$(HOME="$full_home" bash -c 'source "$1"; windows_path "$(folder_path "$2")"' \
    _ "$setup_script" "$full_folder")"
for written in "$(HOME="$full_home" bash -c 'source "$1"; windows_path "$HOME/.bashrc"' _ "$setup_script")" \
    "$full_windows_folder\\CLAUDE.md" "$full_windows_folder\\.spellbound\\greeting.sh" \
    "$full_windows_folder\\.claude\\settings.json" "$full_windows_folder\\.spellbound\\setup.hash"; do
    if ! printf '%s\n' "$output" | grep -qxF "would write: $written"; then
        fail "full_dry_run: no would write for $written"
    fi
done
if ! printf '%s\n' "$output" | grep -qxF \
    "would run: bash scripts/setup.sh in $full_windows_folder\\SaboteurDev, where the clone holds it"; then
    fail "full_dry_run: the repository's own setup was not printed after the clone"
fi
if [ -e "$full_home/.bashrc" ] || [ -e "$full_folder" ]; then
    fail "full_dry_run: the dry run wrote a file"
fi

if [ "${#failures[@]}" -ne 0 ]; then
    printf 'failed: %s\n' "${failures[@]}"
    printf '%s\n' "$transcript"
    exit 1
fi
printf '%s\n' "$transcript"
printf '%s\n' "succeeded: $cases cases; the folder defaults to the home folder's Spellbound, --into and" \
    "SPELLBOUND_HOME choose it in Windows and Git Bash forms, the shell file holds one block replaced in place" \
    "with its endings kept and remembered by a strict pattern on a later run, CLAUDE.md is written only when absent" \
    "and an edited one is kept with the studio's copy beside it, the greeting and settings.json are written once," \
    "a settings.json of its own gets the block printed, spellbound refreshes the folder files, updates the plugins" \
    "and runs its one fetched copy of setup only when it changed, a failed fetch leaves no temporary folder, the" \
    "repository's own setup runs on every clone or update and says its exit code, and a full dry run writes nothing" \
    | paste -sd ' '
