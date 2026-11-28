#!/usr/bin/env bash
set -uo pipefail

ORGANISATION="Spellbound-Studios"
PROJECT_NUMBER=13
LOGIN_SECONDS=3
BOARD_SECONDS=2.5
TITLE_LIMIT=60
READY_EXAMPLES=3
SEPARATOR=$'\x1f'
INSTRUCTION="Open the session with two or three sentences from these facts in plain words, naming features before numbers, then stop and wait."

BOARD_QUERY='query($endCursor: String, $filter: String!) {
  organization(login: "'"$ORGANISATION"'") {
    projectV2(number: '"$PROJECT_NUMBER"') {
      items(first: 100, after: $endCursor, query: $filter) {
        pageInfo { hasNextPage endCursor }
        nodes {
          fieldValueByName(name: "Status") { ... on ProjectV2ItemFieldSingleSelectValue { name } }
          content {
            ... on Issue { number title state repository { name } assignees(first: 20) { nodes { login } } }
            ... on PullRequest { number title state repository { name } assignees(first: 20) { nodes { login } } }
          }
        }
      }
    }
  }
}'

BOARD_ROWS='.data.organization.projectV2.items.nodes[]
  | select(.content.repository != null)
  | [(.fieldValueByName.name // ""), .content.state, "\(.content.repository.name)#\(.content.number)",
     ([.content.assignees.nodes[].login] | join(",")), (.content.title | gsub("[\t\r\n\u001f]"; " "))]
  | join("\u001f")'

stop() {
    exit 0
}

shorten() {
    local title="$1" kept
    if [ "${#title}" -le "$TITLE_LIMIT" ]; then
        printf '%s' "$title"
        return
    fi
    kept="${title:0:$((TITLE_LIMIT + 1))}"
    if [[ "$kept" == *" "* ]]; then
        kept="${kept% *}"
    else
        kept="${title:0:$TITLE_LIMIT}"
    fi
    kept="${kept%"${kept##*[![:space:][:punct:]]}"}"
    if [ -z "$kept" ]; then
        kept="${title:0:$TITLE_LIMIT}"
    fi
    printf '%s...' "$kept"
}

joined() {
    local text
    text="$(printf '%s; ' "$@")"
    text="${text%; }"
    if [ "${text: -1}" = "." ]; then
        printf '%s' "$text"
    else
        printf '%s.' "$text"
    fi
}

sentence() {
    local label="$1"
    shift
    if [ "$#" -eq 0 ]; then
        printf '%s: none.\n' "$label"
        return
    fi
    printf '%s: %s\n' "$label" "$(joined "$@")"
}

ready_sentence() {
    local count="$1"
    shift
    local noun="epics"
    if [ "$count" -eq 0 ]; then
        printf 'Ready and unassigned: none.\n'
        return
    fi
    if [ "$count" -eq 1 ]; then
        noun="epic"
    fi
    printf 'Ready and unassigned: %s %s, for example %s\n' "$count" "$noun" "$(joined "$@")"
}

command -v gh >/dev/null 2>&1 || stop
command -v timeout >/dev/null 2>&1 || stop
export GH_PROMPT_DISABLED=1

login="$(timeout "$LOGIN_SECONDS" gh api user -q .login </dev/null 2>/dev/null)" || stop
login="${login%$'\r'}"
[[ "$login" =~ ^[A-Za-z0-9-]+$ ]] || stop

board_rows() {
    timeout "$BOARD_SECONDS" gh api graphql --paginate -f query="$BOARD_QUERY" -f filter="$1" -q "$BOARD_ROWS" \
        </dev/null 2>/dev/null
}

assigned_rows="$(board_rows "is:open -status:Done assignee:$login")" || stop
ready_rows="$(board_rows "is:open no:assignee status:Ready")" || stop

refinement=()
ready_yours=()
active=()
ready_examples=()
ready_count=0
seen=" "
while IFS="$SEPARATOR" read -r status state reference assignees title; do
    title="${title%$'\r'}"
    if [ -z "$reference" ] || [ "$state" != "OPEN" ] || [[ "$seen" == *" $reference "* ]]; then
        continue
    fi
    seen+="$reference "
    entry="$reference $(shorten "$title")"
    case ",$assignees," in
        *",$login,"*) assigned="true" ;;
        *) assigned="false" ;;
    esac
    case "$status" in
        Refinement)
            [ "$assigned" = "true" ] && refinement+=("$entry")
            ;;
        Ready)
            if [ "$assigned" = "true" ]; then
                ready_yours+=("$entry")
            elif [ -z "$assignees" ]; then
                ready_count=$((ready_count + 1))
                if [ "${#ready_examples[@]}" -lt "$READY_EXAMPLES" ]; then
                    ready_examples+=("$entry")
                fi
            fi
            ;;
        "In progress"|"In review"|"Red team")
            [ "$assigned" = "true" ] && active+=("$entry")
            ;;
    esac
done <<< "$assigned_rows"$'\n'"$ready_rows"

printf 'Engineer: %s.\n' "$login"
sentence "Yours in Refinement" ${refinement[@]+"${refinement[@]}"}
sentence "Yours in Ready" ${ready_yours[@]+"${ready_yours[@]}"}
sentence "Yours in progress, in review or at red team" ${active[@]+"${active[@]}"}
ready_sentence "$ready_count" ${ready_examples[@]+"${ready_examples[@]}"}
printf '%s\n' "$INSTRUCTION"
exit 0
