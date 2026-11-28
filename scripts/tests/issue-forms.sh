#!/usr/bin/env bash
set -uo pipefail

test_folder="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_root="$test_folder/../.."
forms="${1:-$repository_root/.github/ISSUE_TEMPLATE}"
contributing="${2:-$repository_root/CONTRIBUTING.md}"
rulebook_address="https://github.com/Spellbound-Studios/Roadmap/blob/main/Rulebook.md"
old_rules_address="tree/main/line"
retired_words="lines?|steps?|gates?|charters?|drafts?"
fully_required_forms=(initiative.yml bug.yml task.yml)
refinement_placeholder="Filled during refinement, or None."
stages="Backlog, Refinement, Ready, In progress, In review, Red team and Done"
forms_on_the_board=(epic.yml initiative.yml)
retired_forms=(decision.yml move.yml boundary-sheet.yml)
retired_form_names=(Decision Move "Boundary sheet")
rewritten_files=(config.yml engineer-onboarding.yml initiative.yml epic.yml story.yml bug.yml task.yml)

failures=()
problems=()

problem() {
    problems+=("$1")
}

conclude() {
    local number="$1" assertion="$2" joined
    if [ "${#problems[@]}" -eq 0 ]; then
        printf 'passed: %s: %s\n' "$number" "$assertion"
    else
        joined="$(printf '%s; ' "${problems[@]}")"
        printf 'failed: %s: %s: %s\n' "$number" "$assertion" "${joined%; }"
        failures+=("$number")
    fi
    problems=()
}

form_text() {
    tr -d '\r' < "$forms/$1"
}

has_form() {
    if [ -f "$forms/$1" ]; then
        return 0
    fi
    problem "$1 is missing"
    return 1
}

holds() {
    has_form "$1" || return
    if ! form_text "$1" | grep -qF -- "$2"; then
        problem "$1 does not hold \"$2\""
    fi
}

labels_of() {
    form_text "$1" | awk '/^      label: /{sub(/^      label: /, ""); print}' | paste -sd '|'
}

hint_of() {
    form_text "$1" | awk -v label="$2" '
        $0 == "      label: " label { found = 1; next }
        found && /^      description: / { sub(/^      description: /, ""); print; exit }
        found && /^      label: / { exit }'
}

dropdown_options_of() {
    form_text "$1" | awk '
        /^  - type: / { inside = ($0 == "  - type: dropdown") }
        inside && /^        - / { sub(/^        - /, ""); print }' | paste -sd '|'
}

optional_fields_of() {
    form_text "$1" | awk '
        function close_field() { if (field != "" && !required) print field }
        /^  - type: / { close_field(); field = ""; required = 0; is_field = ($0 != "  - type: markdown") }
        is_field && /^    id: / { field = $0; sub(/^    id: /, "", field) }
        is_field && /^      required: true$/ { required = 1 }
        END { close_field() }' | paste -sd ','
}

required_fields_of() {
    form_text "$1" | awk '
        function close_field() { if (field != "" && required) print field }
        /^  - type: / { close_field(); field = ""; required = 0; is_field = ($0 != "  - type: markdown") }
        is_field && /^    id: / { field = $0; sub(/^    id: /, "", field) }
        is_field && /^      required: true$/ { required = 1 }
        END { close_field() }' | paste -sd ','
}

optional_fields_without_placeholder_of() {
    form_text "$1" | awk -v placeholder="      placeholder: $2" '
        function close_field() { if (field != "" && !required && !marked) print field }
        /^  - type: / { close_field(); field = ""; required = 0; marked = 0; is_field = ($0 != "  - type: markdown") }
        is_field && /^    id: / { field = $0; sub(/^    id: /, "", field) }
        is_field && /^      required: true$/ { required = 1 }
        is_field && $0 == placeholder { marked = 1 }
        END { close_field() }' | paste -sd ','
}

expect_backlog_form() {
    local form="$1" first_sentence="$2" required unmarked
    has_form "$form" || return
    required="$(required_fields_of "$form")"
    if [ "$required" != "$first_sentence" ]; then
        problem "$form requires ${required:-nothing} instead of $first_sentence alone"
    fi
    unmarked="$(optional_fields_without_placeholder_of "$form" "$refinement_placeholder")"
    if [ -n "$unmarked" ]; then
        problem "$form leaves $unmarked optional without saying it is filled during refinement"
    fi
}

expect_labels() {
    local form="$1" expected="$2" actual
    has_form "$form" || return
    actual="$(labels_of "$form")"
    if [ "$actual" != "$expected" ]; then
        problem "$form reads $actual"
    fi
}

expect_hint_holds() {
    local form="$1" label="$2" words="$3"
    has_form "$form" || return
    if ! hint_of "$form" "$label" | grep -qF -- "$words"; then
        problem "the $label hint in $form does not hold \"$words\""
    fi
}

is_on_the_board() {
    local board_form
    for board_form in "${forms_on_the_board[@]}"; do
        if [ "$1" = "$board_form" ]; then
            return 0
        fi
    done
    return 1
}

expect_labels initiative.yml "Shown in|Target|Done when|Out of scope"
expect_labels epic.yml "Initiative|Done when|Target version|Needs from other repositories|Out of scope|Red team"
expect_labels story.yml "Behavior|Checks|Days|Waits on|Time box|Default answer|Needed by"
expect_labels bug.yml "Found in|Expected|How to reproduce|Actual|Severity|Regression test"
expect_labels task.yml "Why|Done when|Estimate"
conclude 1 "each form's labels are the rulebook's fields in its order"

for form in "${forms_on_the_board[@]}"; do
    has_form "$form"
done
for path in "$forms"/*.yml; do
    form="$(basename "$path")"
    if is_on_the_board "$form"; then
        form_text "$form" | grep -q '^projects:' || problem "$form is not placed on the board"
    elif form_text "$form" | grep -q '^projects:'; then
        problem "$form is placed on the board"
    fi
done
conclude 2 "only the epic and initiative forms place an issue on the board"

for form in "${retired_forms[@]}"; do
    if [ -e "$forms/$form" ]; then
        problem "$form exists"
    fi
done
conclude 3 "the Decision, Move and Boundary sheet forms are not offered"

if has_form bug.yml; then
    severity_options="$(dropdown_options_of bug.yml)"
    if [ "$severity_options" != "Blocker|Major|Minor" ]; then
        problem "the bug dropdown offers $severity_options"
    fi
fi
conclude 4 "the bug form's Severity offers Blocker, Major and Minor"

for words in Given When Then "three to five"; do
    holds story.yml "$words"
done
expect_hint_holds story.yml "Time box" five
expect_hint_holds story.yml "Needed by" None
conclude 5 "the story form asks for Given, When, Then checks, a time box of five days at most and Needed by"

holds epic.yml "GeoForge can draw terrain to the horizon"
holds epic.yml Refinement
holds story.yml "A player can dig through a cave wall"
conclude 6 "the epic and story forms give a capability sentence title and the epic's Refinement wait"

holds initiative.yml "Roadmap repository"
conclude 7 "the initiative form says it belongs in the Roadmap repository"

for path in "$forms"/*.yml; do
    form="$(basename "$path")"
    if form_text "$form" | grep -qF -- "$old_rules_address"; then
        problem "$form holds $old_rules_address"
    fi
done
conclude 8 "no form holds the old rules address"

holds engineer-onboarding.yml "$rulebook_address"
holds engineer-onboarding.yml setup.sh
conclude 9 "the engineer onboarding form points at the rulebook and the setup script"

for form in "${rewritten_files[@]}"; do
    has_form "$form" || continue
    found="$(form_text "$form" | grep -Eiwo -- "$retired_words" | sort -u | paste -sd ',')"
    if [ -n "$found" ]; then
        problem "$form holds $found"
    fi
done
conclude 10 "no rewritten form holds a retired word"

for path in "$forms"/*.yml; do
    form="$(basename "$path")"
    if form_text "$form" | grep -qF -- "Repository#number"; then
        problem "$form holds Repository#number"
    fi
done
expect_hint_holds story.yml "Needed by" "Spellbound-Studios/<Repository>#<number>"
expect_hint_holds epic.yml "Needs from other repositories" "Spellbound-Studios/<Repository>#<number>"
expect_hint_holds epic.yml Initiative "Spellbound-Studios/Roadmap#<number>"
conclude 11 "cross-repository references are asked for in the form GitHub links"

for form in "${fully_required_forms[@]}"; do
    has_form "$form" || continue
    optional="$(optional_fields_of "$form")"
    if [ -n "$optional" ]; then
        problem "$form leaves $optional optional"
    fi
done
expect_hint_holds story.yml "Time box" "None unless this is a spike"
expect_hint_holds story.yml "Default answer" "None unless this is a spike"
expect_backlog_form epic.yml done-when
expect_backlog_form story.yml behavior
conclude 12 "the initiative, bug and task forms require every field, and the epic and story forms require only their first sentence"

holds config.yml "$rulebook_address"
holds config.yml "It needs organisation access, so read it before you open an issue."
conclude 13 "the rulebook link says it needs organisation access"

if [ ! -f "$contributing" ]; then
    problem "CONTRIBUTING.md is missing"
else
    contributing_text="$(tr -d '\r' < "$contributing")"
    for words in "Initiative, Epic, Story, Bug, Task, Engineer onboarding, Artist onboarding" \
        "Only initiatives and epics are added to the board"; do
        printf '%s\n' "$contributing_text" | grep -qF -- "$words" || problem "CONTRIBUTING.md does not hold \"$words\""
    done
    for name in "${retired_form_names[@]}"; do
        if printf '%s\n' "$contributing_text" | grep -qwF -- "$name"; then
            problem "CONTRIBUTING.md still names the $name form"
        fi
    done
fi
conclude 14 "CONTRIBUTING.md lists the forms and says only initiatives and epics go on the board"

if [ -f "$contributing" ]; then
    tr -d '\r' < "$contributing" | grep -qF -- "$stages" || problem "CONTRIBUTING.md does not name $stages"
fi
conclude 15 "CONTRIBUTING.md names the seven stages in order"

if [ "${#failures[@]}" -ne 0 ]; then
    exit 1
fi
