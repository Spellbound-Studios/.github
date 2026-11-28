#!/usr/bin/env bash
set -uo pipefail

test_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
greeting="${1:-$test_folder/../greeting.sh}"
fixture_login="fixture-login"
separator=$'\x1f'
long_title="Session greeting reads the studio board and names the waiting work for each engineer today"

workspace="$(mktemp -d)"
trap 'rm -rf "$workspace"' EXIT

mkdir -p "$workspace/bin" "$workspace/empty"
board_row() {
    printf '%s\n' "$1${separator}$2${separator}$3${separator}$4${separator}$5"
}
{
    board_row "Refinement" OPEN "Roadmap#101" "$fixture_login" "Board greeting at session start"
    board_row "Ready" OPEN "Roadmap#102" "" "$long_title"
    board_row "Done" CLOSED "Roadmap#103" "$fixture_login" "Finished epic on the board"
    board_row "Refinement" CLOSED "Roadmap#104" "$fixture_login" "Closed epic left in Refinement"
    board_row "Ready" OPEN "Roadmap#105" "$fixture_login" "Setup folder for every engineer"
    board_row "In progress" OPEN "Core#7" "$fixture_login" "Packing reads nested lists"
    board_row "Red team" OPEN "UI#9" "other-login,$fixture_login" "Tooltip layout attack"
    board_row "Backlog" OPEN "Roadmap#106" "$fixture_login" "Someday epic in the backlog"
    board_row "Ready" OPEN "Sky#3" "" "Rain sheets over the sea"
    board_row "Ready" OPEN "Sky#4" "" "Lightning flashes"
    board_row "Ready" OPEN "Sky#5" "" "Fog banks at dawn"
} > "$workspace/rows.txt"

cat > "$workspace/bin/gh" <<'STUB'
#!/usr/bin/env bash
printf 'called: gh %s\n' "$*" >> "$STUB_CALLS"
case "$1 $2" in
    "api user")
        if [ "$STUB_LOGIN_SLEEP" != "0" ]; then
            exec sleep "$STUB_LOGIN_SLEEP"
        fi
        printf '%s\n' "$STUB_LOGIN"
        ;;
    "api graphql")
        if [ "$STUB_BOARD" = "refused" ]; then
            printf 'GraphQL: Could not resolve to a ProjectV2 with the number 13.\n' >&2
            exit 1
        fi
        if [ "$STUB_BOARD" = "slow" ]; then
            exec sleep 20
        fi
        cat "$STUB_ROWS"
        ;;
esac
exit 0
STUB
chmod +x "$workspace/bin/gh"

export STUB_CALLS="$workspace/calls.txt"
export STUB_LOGIN="$fixture_login"
export STUB_LOGIN_SLEEP=0
export STUB_ROWS="$workspace/rows.txt"

failures=()

fail() {
    failures+=("$1")
}

expect_output() {
    local name="$1" expected="$2" actual="$3" status="$4"
    if [ "$status" -ne 0 ]; then
        fail "$name: the greeting exited $status"
    fi
    if [ "$actual" != "$expected" ]; then
        fail "$name: the greeting printed: $(printf '%s' "$actual" | tr '\n' '|')"
    fi
}

expect_quick() {
    local name="$1" started="$2" limit="$3"
    if [ "$((SECONDS - started))" -ge "$limit" ]; then
        fail "$name: the greeting took $((SECONDS - started)) seconds"
    fi
}

expected="$(printf '%s\n' \
    "Engineer: $fixture_login." \
    "Yours in Refinement: Roadmap#101 Board greeting at session start." \
    "Yours in Ready: Roadmap#105 Setup folder for every engineer." \
    "Yours in progress, in review or at red team: Core#7 Packing reads nested lists; UI#9 Tooltip layout attack." \
    "Ready and unassigned: 4 epics, for example Roadmap#102 Session greeting reads the studio board and names the...; Sky#3 Rain sheets over the sea; Sky#4 Lightning flashes." \
    "Open the session with two or three sentences from these facts in plain words, naming features before numbers, then stop and wait.")"

: > "$STUB_CALLS"
output="$(STUB_BOARD=read PATH="$workspace/bin:$PATH" bash "$greeting")"
expect_output "the board" "$expected" "$output" $?
if ! grep -q -- "--paginate" "$STUB_CALLS"; then
    fail "the board query does not page through the items"
fi
if ! grep -q "assignee:$fixture_login" "$STUB_CALLS"; then
    fail "the board query does not ask for the engineer's items"
fi
for absent in "Roadmap#103" "Roadmap#104" "Roadmap#106" "Sky#5"; do
    if printf '%s\n' "$output" | grep -q "$absent"; then
        fail "the greeting names $absent"
    fi
done

printf '%s\n' "Ready${separator}OPEN${separator}Sky#3${separator}${separator}Rain sheets over the sea" > "$workspace/one.txt"
output="$(STUB_BOARD=read STUB_ROWS="$workspace/one.txt" STUB_LOGIN=other-login PATH="$workspace/bin:$PATH" \
    bash "$greeting" | sed -n 5p)"
expect_output "one ready epic" "Ready and unassigned: 1 epic, for example Sky#3 Rain sheets over the sea." "$output" 0

: > "$workspace/none.txt"
output="$(STUB_BOARD=read STUB_ROWS="$workspace/none.txt" PATH="$workspace/bin:$PATH" bash "$greeting" | sed -n 2,5p)"
expect_output "an empty board" "$(printf '%s\n' "Yours in Refinement: none." "Yours in Ready: none." \
    "Yours in progress, in review or at red team: none." "Ready and unassigned: none.")" "$output" 0

output="$(STUB_BOARD=refused PATH="$workspace/bin:$PATH" bash "$greeting")"
expect_output "a refused query" "" "$output" $?

output="$(STUB_LOGIN="not signed in" STUB_BOARD=read PATH="$workspace/bin:$PATH" bash "$greeting")"
expect_output "a login that is not a login" "" "$output" $?

started=$SECONDS
output="$(STUB_LOGIN_SLEEP=20 STUB_BOARD=read PATH="$workspace/bin:$PATH" bash "$greeting")"
expect_output "a login that hangs" "" "$output" $?
expect_quick "a login that hangs" "$started" 5

started=$SECONDS
output="$(STUB_BOARD=slow PATH="$workspace/bin:$PATH" bash "$greeting")"
expect_output "a board that hangs" "" "$output" $?
expect_quick "a board that hangs" "$started" 5

bash_path="$(command -v bash)"
output="$(PATH="$workspace/empty" "$bash_path" "$greeting")"
expect_output "no gh" "" "$output" $?

if [ "${#failures[@]}" -gt 0 ]; then
    printf 'failed: %s\n' "${failures[@]}"
    exit 1
fi
echo "passed: the greeting sorts the board by its live statuses, counts the ready epics, and prints nothing when the board cannot be read in time"
