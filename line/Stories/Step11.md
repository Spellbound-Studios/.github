## The stories of step 11: one convention, one board (WF1a, WF1b, WF2b)

Step 11 gives the team one convention and one board: the forms and the convention text in the organisation's `.github` repository, the board's fields and README, the scripts every repository carries, the art pull request workflow, the GitHub App, the repository settings and the game template. Sixteen stories: WF1a two, WF1b ten, WF2b four. The split is the planner's; the outcomes are the epics'. Everything here is YAML, bash and Markdown; no package, no Unity project and no game changes. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the rules of steps 1 and 2 hold where they apply (spelled-out names, no comments in code, work only in the named directories, a gap is raised and stops the story). Bash with POSIX tools and `gh` only; no new dependency; a GitHub API body is built where its line is typed and no data file of another format is stored.
- **Rules:** every form, template, script and AGENTS.md points at the line text through `line-text-address.txt` or its one address and copies nothing of it.
- **Rules:** the lead never touches git and never writes to GitHub. Branches, commits, pushes, pull requests, board writes, issue types and repository settings are the developer's acts, each through one script the lead prepares and runs in read mode first.
- **Rules:** a GitHub fact the area marked unverified is checked live before anything is built on it, and the answer is written into this section.
- **Rules:** nothing changes how a pull request into Core or UI is checked or merged until steps 4 and 5 have merged. The stories that protect a default branch or add the pull request Action are prepared in this step and their pull request opens last.
- **Regression contract:** the Template's existing scripts behave as before (a bad title is refused and a good one passes, the initialiser is untouched, `adopt-repository.sh` is untouched); every board item keeps its field values, no issue is closed or re-typed, the four views keep working; Core's existing ruleset stays until the settings story runs.
- **Done, for each story:** the files exist, each script ran on this machine in read mode or against a copy with the result recorded here, and the report lists what the developer runs.

### WF1a-1 The board's fields and README

- **Outcome:** the board's Area holds the line's packages beside the plan's areas; Gates and Tokens are number fields and Gates is filled from each epic's body; a Decision issue type exists beside Epic, Story, Task and Bug; the board README is rewritten for the forms, the fields, the title rule, Decision issues and the pull request that closes a story.
- **Verified (2026-10-25):** the board holds 169 items and 28 Area options (the plan's areas and today's package names), the fields Step and Class exist, the organisation has four issue types, and 100 epics carry a plan area (Core 18, World 15, Runtime 13, UI 11, Networking 9, Unity 9, Command line 8, Navigation 4).
- **Rules:** a rename reuses the option id (Chat to Switchboard, Controller to Character, VolumetricFog to Volumetrics); WorldObjects, StateMachine, Diagnostics, Horizon, Places, Instancing, TetherShop, ArtPipeline and PackageCheck are added; the plan's areas stay because the epics carry them, and nothing is removed. Gates holds the plan's gate count; Tokens holds the millions of tokens a step's sessions used, written at the step's report. The Discord bot's briefing names the board's fields and lives outside this step's directories, so the lines it needs are listed in the report and not edited.
- **Regression contract:** every item keeps its Area, Status, Priority, Sprint, Class and Step; the four views are unchanged.
- **Done:** the batch script; after it runs the fields, the options, the type and the README read back as written.

### WF1a-2 The work forms and the pull request template

- **Outcome:** `.github/ISSUE_TEMPLATE/` in the organisation's `.github` repository holds the Epic, Story, Task and Bug forms and `config.yml`, and `.github/PULL_REQUEST_TEMPLATE.md` exists. Each form sets its issue type and adds the issue to the board; the Story form requires Outcome and Done when and offers Verified facts, Rules, Regression contract and Waits on, so a story can wait on a written Decision issue; anyone on the team opens one.
- **Verified (2026-10-25):** GitHub reads an organisation's default forms from `.github/ISSUE_TEMPLATE` of its public `.github` repository; the `type` and `projects` keys are supported and the projects key needs write permission on the project; no repository of the organisation has forms of its own.
- **Rules:** titles follow the board README and carry no prefix; the Bug form is the one a buyer sees and asks only what a bug needs; blank issues are off and the chooser links the line text and Discord.
- **Regression contract:** none.
- **Done:** the files, each read back against GitHub's form syntax.

### WF1b-1 CONTRIBUTING.md and SUPPORT.md

- **Outcome:** `CONTRIBUTING.md` says how the repositories, the issues, the titles, the branches, the pull requests, the GitHub App, the repository settings and the board work day to day and points at the line text for every rule; `SUPPORT.md` says where a buyer asks, what to include and what to expect.
- **Rules:** no copy of the line's rules; the first-response time of two working days is a setting with a default.
- **Regression contract:** none.
- **Done:** the files; the pointer check passes on the repository.

### WF1b-2 The Decision, Move, Boundary sheet and Engineer onboarding forms

- **Outcome:** four more forms: Decision (Question, Recommendation, Alternative, What waits on it, Answer; type Decision), Move (From, To, Ledger rows that change, Projects to move, Steps, Done when; type Story), Boundary sheet (the headings of `Documentation~/boundary-sheet.md`; type Task) and Engineer onboarding (repository, editor version and the steps as checkboxes; type Task).
- **Verified (2026-10-25):** no Decision issue type exists; the Roadmap names Decision issues for the Navigation spike, the freeze rule and the Story form's blocked-by line.
- **Rules:** a Decision is closed by writing the answer into the issue; the Move form's steps are the shell the Unity ledger epic fills at step 13.
- **Regression contract:** none.
- **Done:** the files.

### WF1b-3 render-issue-body.sh

- **Outcome:** `bash scripts/render-issue-body.sh <kind> --<field> "<text>"...` prints a body with the headings the form of that kind produces, for epic, story, task, bug and decision, so an issue an agent opens with `gh issue create --type` reads like one opened through the form.
- **Rules:** an unknown kind or field is refused with the usage; bash only.
- **Regression contract:** none.
- **Gap raised:** the roadmap skill's issue bodies live in the `claude-skills` repository, outside this step's directories; aligning them to the form labels is raised and not done.
- **Done:** run for a story with three fields and for a bad field.

### WF1b-4 sprint-report.sh

- **Outcome:** `bash scripts/sprint-report.sh [--sprint "Sprint N"]` prints the sprint running today, or the named one: its dates and day, the items by Status with assignee, priority, gates and what blocks them, gates done of planned, tokens recorded, and what each person has in progress.
- **Verified (2026-10-25):** run against the live board for Sprint 1: 28 items Done and 18 Ready, before the Gates field existed.
- **Rules:** reads through `gh api graphql --paginate` and writes nothing.
- **Regression contract:** none.
- **Done:** the run above.

### WF1b-5 The art pull request workflow

- **Outcome:** `.github/workflows/art-pull-request.yml` in the organisation's `.github` repository is a reusable workflow: called from a game repository on a push to `art/**`, it takes a token as the App, reads the first commit beyond the default branch, checks its subject against the title rule, opens the pull request with that subject as the title and the commit's body as the body, and on any failure files a Bug issue in `Roadmap` naming the branch and the repository.
- **Verified (2026-10-25):** events caused by the repository token start no workflow run and a pull request it opens waits for a person's approval, while an App installation token avoids both (GitHub's page on triggering a workflow); `actions/create-github-app-token` is at v3 and takes a client id and a private key.
- **Rules:** the caller is ten lines in the game repository with `secrets: inherit`; the workflow names no game; it is the pull request Action, so its pull request opens last.
- **Regression contract:** no repository calls it until GameTemplate holds the caller, so nothing changes when it merges.
- **Done:** the file; its first run is the App's confirmation in WF1b-6.

### WF1b-6 The GitHub App

- **Outcome:** the App the organisation owns is described in `CONTRIBUTING.md` (name, permissions, installation, the two secrets) and the developer creates it; the first run confirms that a pull request the App opens runs its checks without the approval prompt.
- **Verified (2026-10-25):** the organisation has one App installed (gitbook) and ten organisation secrets; on GitHub Free an organisation secret does not reach a private repository (GitHub's page on secrets), so until the plan changes the two secrets are repository secrets in each repository whose workflows need them.
- **Rules:** the key is generated on the App's page and stored once as a secret; no key is written in any repository.
- **Regression contract:** none.
- **Done:** the App exists and the confirmation run is recorded here.

### WF1b-7 repository-settings.sh

- **Outcome:** `bash scripts/repository-settings.sh <owner/repository> [--game] [--app-id <id>] [--template-repository] [--check]` prints the lines that set a repository as every repository is set, or with `--check` reads the settings back and reports drift; it reads the plan's answer first and says when rulesets are not available.
- **Verified (2026-10-25):** run in check mode against Core, Inventory and Template: the drift of each is listed, and Inventory and Template report the plan limit.
- **Rules:** it prints and never applies; the ruleset bodies are built where the line is typed.
- **Regression contract:** none.
- **Done:** the runs above.

### WF1b-8 Protected default branches

- **Outcome:** it is known which repositories can be protected on the organisation's plan, and every repository that can is set: squash merge with the title alone, merged head branches deleted, the default branch changed only through a pull request with the `unity-tests` status and code owner review on the judgment fields, the App on the bypass list. Core's ruleset "Merge Power" is replaced by the standard one.
- **Verified (2026-10-25):** the organisation is on GitHub Free; branch protection and rulesets are refused on private repositories ("Upgrade to GitHub Pro or make this repository public to enable this feature", HTTP 403 on Inventory) and allowed on public ones (Core answers "Branch not protected" and holds one ruleset); Core allows merge commits only and every other repository allows all three merge kinds.
- **Rules:** the lines run after steps 4 and 5 have merged, because they change how a pull request into Core merges; where the plan refuses, the rule is a team agreement and the check reports it as unenforced; whether the organisation moves to GitHub Team is the developer's decision.
- **Regression contract:** nothing in step 4's or step 5's pull requests is blocked before they merge.
- **Done:** the plan check's written result below, and the settings applied with the check green on every repository that can be set.

### WF1b-9 The artist ruleset

- **Outcome:** `repository-settings.sh --game` prints the ruleset that confines artists to `art/*`: every branch but `art/*` is created or updated only by the maintain and admin roles, organisation admins and the App.
- **Verified (2026-10-25):** both game repositories hold two admins and one collaborator with the write role; a private repository cannot hold a ruleset on the plan.
- **Rules:** printed now and switched on by WF1r (step 15) the day A5a lands in a game repository; the role ids 2 (maintain) and 5 (admin) are **verify before building on it**, checked when the ruleset is first created.
- **Regression contract:** none.
- **Done:** the printed lines.

### WF1b-10 The pointers to the line text

- **Outcome:** every form, template, AGENTS.md and adoption body points at the line text and none copies it; `bash scripts/check-line-text-pointer.sh [root]` fails a missing pointer or a copy, both for a repository made from a template and for the organisation's `.github` repository itself.
- **Rules:** the Bug form and `config.yml` carry no pointer, because the Bug form is the one a buyer sees; the `.github` repository is the home of the line text and needs no address file.
- **Regression contract:** none.
- **Done:** run on Template and on the `.github` repository's files, both green.

### WF2b-1 sync-template.sh

- **Outcome:** `bash scripts/sync-template.sh [--template <owner/repository>] [--ref <branch>] [--check]` compares every file in the template's `managed-files.txt` with the repository's copy, a workflow caller with the ref after `@` ignored, and opens a pull request taking the template's copies where one drifted. A game repository passes GameTemplate.
- **Verified (2026-10-25):** run in check mode inside Template against its own `main`: the two files this step changes are the only drift, and a checkout with carriage returns compares equal to GitHub's copy.
- **Rules:** refuses a dirty working tree before it writes; line endings are compared without the carriage return.
- **Regression contract:** none.
- **Done:** the run above.

### WF2b-2 update-skeleton.sh

- **Outcome:** `bash scripts/update-skeleton.sh [--repository <owner/repository>] [--ref <branch>] [--path <folder>] [--check]` compares the commit `skeleton-version.txt` records with PackageCheck's branch tip and opens a pull request copying the changed skeleton files when it moved; `none` means PackageCheck does not exist yet and nothing is compared.
- **Rules:** the skeleton path's default, `Packages/PackageCheck/Skeleton~`, is a setting LV2 names when PackageCheck exists.
- **Regression contract:** none.
- **Done:** run with `none` recorded.

### WF2b-3 GameTemplate

- **Outcome:** the `GameTemplate` repository: a Unity project whose manifest holds no Spellbound line, the hooks, the scripts, the LFS baseline scoped to `Assets/_Project`, `.editorconfig`, `CODEOWNERS`, the root `AGENTS.md`, `line-text-address.txt`, `managed-files.txt`, the artist's root `setup.sh` (a check, not an installer: git, Git LFS, the large files pulled, the editor version), the pull request caller and the ten-line art pull request caller; and the Artist onboarding form in the organisation's `.github` repository.
- **Verified (2026-10-25):** no GameTemplate folder or repository exists; the Template holds every file the game template copies.
- **Rules:** the tree is prepared outside every repository and the developer publishes it with one script; the project opens with no error through the Unity command line on a copy.
- **Regression contract:** none.
- **Done:** the tree, the Unity open recorded here, the publish script.

### WF2b-4 The template is a template

- **Outcome:** Template and GameTemplate are marked as template repositories, so `gh repo create --template` starts a package or a game; the start-a-package walk is in Template's `AGENTS.md` and the start-a-game walk in GameTemplate's; the engineer's `setup.sh` is tried on a clean Windows machine and a Mac.
- **Rules:** the walk on clean machines is the developer's act and the step's stop item.
- **Regression contract:** none.
- **Done:** the two `gh repo edit --template` lines run and the walks written; the clean-machine result is recorded here when it comes.

### The written result of the plan check (WF1b-8, 2026-10-25)

Read live with `gh api` on 2026-10-25. The organisation `Spellbound-Studios` is on GitHub Free.

| Question | Result | Evidence |
|---|---|---|
| Branch protection on a private repository | refused | `repos/Spellbound-Studios/Inventory/branches/main/protection` answers HTTP 403, "Upgrade to GitHub Pro or make this repository public to enable this feature" |
| Rulesets on a private repository | refused | `repos/Spellbound-Studios/Inventory/rulesets` answers the same 403 |
| Rulesets on a public repository | allowed | Core holds the ruleset "Merge Power" (pull request with one approval, thread resolution, code quality, no deletion, no force push; organisation admins bypass) |
| An organisation secret in a private repository | not available on this plan | GitHub's page on secrets: "Organization-level secrets and variables are not accessible by private repositories for GitHub Free" |
| GitHub Team | required pull request reviewers, protected branches and code owners in private repositories; billed per user | GitHub's plans and pricing pages, 2026-10-25 |

Repositories that can be protected today: `.github`, Core, Modifiers, GeoForge, Controller, SpellboundDocs, NetworkedTerraformingExample (public). Repositories that cannot: Inventory, Decals, UI, Chat, Persistence, WorldForge, VolumetricFog, GeoForgePro, Template, GameTemplate, Roadmap, SaboteurDev, CorsairsIsleDev, BuildPipeline, claude-skills (private). Until the plan changes, the default branch of a private repository is a team agreement and `repository-settings.sh --check` reports it as unenforced.

### The written result of the settings (WF1b-8 and WF1b-9, 2026-10-25)

Applied on 2026-10-25 with `repository-settings.sh --apply` over the twenty active repositories of the organisation, after steps 4 and 5 had merged, and read back green with `--check` on every one. The organisation stays on GitHub Free by the developer's decision of the same day; private repositories are a team agreement until that changes.

| Setting | Where | Result |
|---|---|---|
| Squash merge only, the pull request title alone as the commit, a blank message, merged head branches deleted | all twenty repositories | applied |
| The ruleset "Default branch": changes only through a pull request, code owner review on the `CODEOWNERS` paths, no deletion, no force push, squash only, organisation owners bypass | `.github`, Core, Modifiers, GeoForge, Controller, SpellboundDocs (public) | applied; Core's ruleset "Merge Power" (one approval, thread resolution, code quality) removed and replaced |
| The same ruleset | Template, GameTemplate, Chat, UI, Decals, Inventory, VolumetricFog, WorldForge, claude-skills, SaboteurDev, CorsairsIsleDev, GeoForgePro, Persistence, BuildPipeline (private) | refused by the plan; reported as unenforced |
| The required `unity-tests` status | nowhere yet | opt-in through `--require-unity-tests`, switched on when the local gate that posts the status lands (WF3a, step 33); requiring it earlier would block every pull request from anyone who is not an organisation owner |
| The artist ruleset "Artists push art branches only" | the two game repositories | printed, not applied: the plan refuses rulesets there and WF1r switches it on when A5a lands |
| The App on the bypass lists | nowhere yet | the App is deferred to step 15 (A5a) by the developer's decision of 2026-10-25, pending the artist's preference between an Action running as the App, a personal token, or `gh` on the artist's machine; one re-run with `--app-id` adds it |
| Template and GameTemplate marked as template repositories | both | applied |

Core's pull requests now merge with `--squash` like every other repository's; only its default branch `main` carries the rule, `dev` does not.

