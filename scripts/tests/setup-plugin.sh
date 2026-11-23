#!/usr/bin/env bash
set -uo pipefail

test_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
setup_script="${1:-$test_folder/../../setup.sh}"
studio_plugins=(spellbound spellbound-networking)
all_scopes="'admin:public_key', 'gist', 'project', 'repo'"

workspace="$(mktemp -d)"
trap 'rm -rf "$workspace"' EXIT

mkdir -p "$workspace/bin"
cat > "$workspace/bin/gh" <<'STUB'
#!/usr/bin/env bash
printf 'called: gh %s\n' "$*" >> "$STUB_CALLS"
case "$1 $2" in
    "auth status")
        printf '%s\n' "github.com" "  - Token scopes: $STUB_GH_SCOPES"
        ;;
    "repo view")
        case " $STUB_GH_UNREADABLE " in
            *" $3 "*) printf 'GraphQL: Could not resolve to a Repository with the name %s.\n' "$3" >&2; exit 1 ;;
        esac
        ;;
    "api user")
        printf '%s\n' "fixture-login"
        ;;
esac
exit 0
STUB
cat > "$workspace/bin/claude" <<'STUB'
#!/usr/bin/env bash
printf 'called: claude %s\n' "$*" >> "$STUB_CALLS"
case "$*" in
    "plugin marketplace list") printf 'Configured marketplaces:\n\n%s\n' "$STUB_CLAUDE_MARKETPLACES" ;;
    "plugin list") printf 'Installed plugins:\n\n%s\n' "$STUB_CLAUDE_PLUGINS" ;;
esac
exit 0
STUB
chmod +x "$workspace/bin/gh" "$workspace/bin/claude"

failures=()
functions_under_test="step_studio_plugin"
transcript=""

fail() {
    failures+=("$1")
}

plugin_listing() {
    local plugin_status="$1"
    local plugin
    shift
    for plugin in "$@"; do
        printf '  > %s@spellbound-skills\n    Status: %s\n' "$plugin" "$plugin_status"
    done
}

run_case() {
    local name="$1" scopes="$2" unreadable="$3" marketplaces="$4" plugins="$5"
    shift 5
    calls="$workspace/$name.calls"
    : > "$calls"
    output="$(STUB_CALLS="$calls" STUB_GH_SCOPES="$scopes" STUB_GH_UNREADABLE="$unreadable" \
        STUB_CLAUDE_MARKETPLACES="$marketplaces" STUB_CLAUDE_PLUGINS="$plugins" \
        SPELLBOUND_SETUP_DRY_RUN=1 PATH="$workspace/bin:$PATH" \
        bash -c 'source "$1"; exec 3>> "$2"; functions="$3"; shift 3; repositories=("$@")
            for function_name in $functions; do "$function_name"; done' \
        _ "$setup_script" "$calls" "$functions_under_test" "$@" 2>&1)"
    status=$?
    transcript="$transcript"$'\n'"case $name exited $status and printed:"$'\n'"$output"
    transcript="$transcript"$'\n'"and recorded:"$'\n'"$(cat "$calls")"
}

recorded() {
    grep -qxF "$1" "$calls"
}

run_case fresh "'admin:public_key', 'repo'" "" "  > claude-plugins-official" "" \
    Spellbound-Studios/ArtRegistry Spellbound-Studios/SaboteurDev
if [ "$status" -ne 0 ]; then
    fail "fresh: exited $status"
fi
if ! recorded "would run: claude plugin marketplace add Spellbound-Studios/claude-skills"; then
    fail "fresh: the marketplace add was not recorded"
fi
for plugin in "${studio_plugins[@]}"; do
    if [ "$(grep -cxF "would run: claude plugin install $plugin@spellbound-skills" "$calls")" -ne 1 ]; then
        fail "fresh: $plugin was not installed exactly once"
    fi
done
if [ "$(grep -c 'claude plugin install' "$calls")" -ne "${#studio_plugins[@]}" ]; then
    fail "fresh: the installs do not match the plugins in the setting"
fi

run_case unreadable_roadmap "$all_scopes" "Spellbound-Studios/Roadmap" "" "" Spellbound-Studios/SaboteurDev
if [ "$status" -eq 0 ]; then
    fail "unreadable_roadmap: did not stop"
fi
if ! printf '%s\n' "$output" | grep -q '^stop: .*Roadmap'; then
    fail "unreadable_roadmap: no stop naming Roadmap"
fi
if ! recorded "called: gh repo view Spellbound-Studios/Roadmap"; then
    fail "unreadable_roadmap: the Roadmap access check was not recorded"
fi
if awk '/gh repo view Spellbound-Studios\/Roadmap/ { seen = 1; next } seen && /claude/ { found = 1 }
    END { exit !found }' "$calls"; then
    fail "unreadable_roadmap: a claude call was recorded after the Roadmap access check"
fi

run_case missing_project_scope "'admin:public_key', 'repo'" "" "  > spellbound-skills" \
    "$(plugin_listing enabled "${studio_plugins[@]}")" Spellbound-Studios/SaboteurDev
if [ "$status" -ne 0 ]; then
    fail "missing_project_scope: exited $status"
fi
if ! grep -qE '^would run: gh auth refresh .*-s ([^ ]*,)?project(,[^ ]*)?$' "$calls"; then
    fail "missing_project_scope: no gh auth refresh with project in its scopes"
fi

run_case missing_both_scopes "'repo'" "" "  > spellbound-skills" \
    "$(plugin_listing enabled "${studio_plugins[@]}")" Spellbound-Studios/SaboteurDev
if [ "$(grep -c 'gh auth refresh' "$calls")" -ne 1 ] \
    || ! recorded "would run: gh auth refresh -h github.com -s admin:public_key,project"; then
    fail "missing_both_scopes: both scopes were not asked for in one refresh"
fi

run_case installed "$all_scopes" "" "  > spellbound-skills" \
    "$(plugin_listing enabled "${studio_plugins[@]}")" Spellbound-Studios/SaboteurDev
if [ "$status" -ne 0 ]; then
    fail "installed: exited $status"
fi
if grep -q 'claude plugin install\|claude plugin marketplace add\|gh auth refresh' "$calls"; then
    fail "installed: a change was recorded on a machine that has everything"
fi
if ! printf '%s\n' "$output" | grep -q '^skipped: '; then
    fail "installed: the output holds no skipped sentence"
fi

run_case disabled_plugin "$all_scopes" "" "  > spellbound-skills" \
    "$(plugin_listing disabled spellbound; plugin_listing enabled spellbound-networking)" \
    Spellbound-Studios/SaboteurDev
if [ "$status" -ne 0 ]; then
    fail "disabled_plugin: exited $status"
fi
if grep -q 'claude plugin install\|claude plugin enable' "$calls"; then
    fail "disabled_plugin: a listed but disabled plugin is no longer treated as installed"
fi
if ! printf '%s\n' "$output" | grep -q '^skipped: '; then
    fail "disabled_plugin: the output holds no skipped sentence"
fi

functions_under_test="step_github step_studio_plugin"
run_case one_sign_in "'admin:public_key', 'repo'" "" "  > spellbound-skills" \
    "$(plugin_listing enabled "${studio_plugins[@]}")" Spellbound-Studios/SaboteurDev
functions_under_test="step_studio_plugin"
if [ "$status" -ne 0 ]; then
    fail "one_sign_in: exited $status"
fi
if [ "$(grep -c 'gh auth refresh' "$calls")" -ne 1 ] \
    || ! recorded "would run: gh auth refresh -h github.com -s admin:public_key,project"; then
    fail "one_sign_in: the GitHub sign-in did not ask for both scopes in one refresh"
fi

if ! awk '/^main\(\) \{/ { inside = 1 } inside && /return 0/ { returned = NR }
    inside && /step_studio_plugin/ { plugin = NR } inside && /step_application/ { application = NR }
    inside && /^\}/ { inside = 0 }
    END { exit !(returned && plugin > returned && application > plugin) }' "$setup_script"; then
    fail "order: main does not run the studio plugin part after the tool-only return and before step_application"
fi

run_case registry_only "'repo'" "" "" "" Spellbound-Studios/ArtRegistry
if [ "$status" -ne 0 ]; then
    fail "registry_only: exited $status"
fi
if [ -s "$calls" ]; then
    fail "registry_only: calls were recorded for an artist"
fi
if ! printf '%s\n' "$output" | grep -qxF 'skipped: Only engineers need the studio plugin.'; then
    fail "registry_only: the artist was not skipped"
fi

if [ "${#failures[@]}" -ne 0 ]; then
    printf 'failed: %s\n' "${failures[@]}"
    printf '%s\n' "$transcript"
    exit 1
fi
printf '%s\n' "$transcript"
printf '%s\n' "succeeded: a fresh machine adds the marketplace and installs each plugin once, an unreadable Roadmap" \
    "stops before Claude Code is called, a missing project scope is refreshed, both missing scopes share one" \
    "refresh, a second run changes nothing, a listed but disabled plugin counts as installed, the GitHub" \
    "sign-in asks once for both scopes, main runs the part before the clones and an artist is skipped" \
    | paste -sd ' '
