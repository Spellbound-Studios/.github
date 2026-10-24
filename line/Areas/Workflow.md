# Checkpoint 5, area 10: templates and studio workflow (2026-10-24)

Owner of this file: the area 10 session. Binding: `Requirements.md` 16 to 18, `Rules.md`, the library-design skill, `Corrections.md`, the approved `Revisited/Line.md` with its section "Decisions, all decided" (which wins over its body) and `Revisited/Homes.md`. Everything that exists today is the Before. Facts about today are from my own reads on 2026-10-23 (git history, `gh` reads of the organisation, the files named), and documentation cited by page; the one page re-read on 2026-10-24 is GitHub's "Triggering a workflow". I had no subagent tool in either session, so no Sonnet reader ran: every fact below was read by me and the red team is self mode, said plainly there.

Revision note, 2026-10-24, checkpoint 5 (the hand-off). The developer's 25 answers to the checkpoint 4 questions are folded in one pass; nothing decided is reopened. What changed:
- Shared workflows run at `@main` (answer 6): every caller says `uses: Spellbound-Studios/.github/.github/workflows/<name>.yml@main`; the pointer alternative and both open questions are gone (decided 21).
- A buyer installs a released tag and our games follow a branch (answer 5); the release train carries the promise: a major about every 12 months, buyers offered the upgrade at a reduced cost, and inside a major a year of bug fixes, maintenance and no API break (decided 22). A shipped game follows the maintenance branch `release-<major>` of the Core major it shipped on (answer 4, decided 23): WF5 gains that story. A renamed serialized field after first ship is a major (answer 24, decided 24): the surface comparison counts serialized-field lines like public lines. A release stops on a file saved by a newer Unity than the oldest supported editor; the scan is Living's (answer 25, decided 25).
- The one change that can break Saboteer's build inside the freeze window waits on a side branch (answer 1, decided 26): WF7a gains the freeze rule, which names Modifiers' move onto the definition contract on a branch called `definition-contract`, merged on 2 March 2027 (estimated) with whatever Saboteer needs.
- The check seam is spelled `IDefinitionCheck<T>` (answer 14). Studio.Content is edited in StudioDev only (answer 18, decided 27): no embedded copy of a Studio package in a game, and `check.sh` fails one; this file never held an embedded-copy probe, and none is added. A newer Unity opens a throwaway copy, never the working project (answer 7, decided 28).
- Claims of RedTeam 8.8: the artist ruleset is switched on in a game repository when A5a lands there (a WF1 story); the Microsoft C++ runtime files of a Windows 6.7 build are listed in the release by `tag-release.sh` (a WF7b story). Section "Claims on this area, answered at checkpoint 5".
- Second claims list of RedTeam 8.8 (five claims, section "Claims on this area, answered at checkpoint 5"): the maintenance branch `release-<major>` is named for the Core major, cut in every repository of the line by the line release, protected like main, and the final tag is refused when its major is not its branch's or its surface changed by more than additions (WF4, WF5); the 12-month cadence is a target in the release calendar and no gate; `scripts/pre-deploy-check.sh` runs `packagecheck release-scan` before a game's Steam upload (WF7b); callers are compared ignoring the ref after `@`; the artist form, the artist's `setup.sh`, the App, the Action and protected main must exist before A5a ends (a dependency of WF1 and WF2, no new story).
- The epic table is at 68 stories (checkpoint 4's 62 with WF1 +1, WF5 +2, WF7a +1, WF7b +2). Where the two cadences (PurrNet's 20 ticks a second, Unity's 50 fixed steps a second, both settings) matter to this area they do not: no script here reads either.

Revision note, 2026-10-24, checkpoint 4 (the fold and the reprice). The developer's 33 answers and the settled items of that day are folded in one pass; nothing decided is reopened. What changed:
- Nothing is pinned (question 14): no pinned tag in a game, no `consumers.txt`, no rolling bump pull request (WF5 loses two stories); a game's manifest line follows a branch; WF7a is rewritten without the pin and keeps the demo build's files and the tag script. Code freeze in Saboteer from mid January 2027 (question 13): WF7a lands before it and touches no scene.
- Two or more people work in a game project at once (question 15): no sentence assumes one person, and the word "two-person" is gone.
- Every main branch is protected; artists push branches to the game's repository; Send sends only the files changed under the art folders (question 23). WF1 gains the repository settings list.
- The release and pull request Actions run as a GitHub App the organisation owns (question 31); GitHub's page says a pull request opened with an App token runs its checks without the approval prompt. WF1 gains the App story.
- The author runs the Unity tests before review (question 30); the package folder is its short name, `Packages/Core` (question 32); the copyright line has no year (question 27); the window's package list comes from GitHub for good (question 28).
- The line text moves into the organisation's `.github` repository and the hand-off puts the executive brief, the roadmap and the line text there (question 8): WF1 gains the story that points every template and form at it.
- From RedTeam 7.7: the template's `.gitattributes` scopes Git LFS to `Assets/_Project`; `compare-surface.sh` treats stored-format lines like public lines (Living's claim, accepted). The Artist onboarding form and the sign-in at the clone stand.
- Claims round, checkpoint 4 (seven claims, section "Claims on this area, answered at checkpoint 4"): a ruleset limits artists to `art/*` branches (they hold the write role, GitHub has no branch-only role); the settings list gains the required `unity-tests` status and code owner review where the plan allows them; the template's PackageCheck line in the manifest names a branch, and `skeleton-version.txt` is a record of the copy, never a held version; the line text's address is one value in one managed file, and the studio-name search no longer fails the pointer to it; the surface hash equals the saved header's fingerprint through PackageCheck's `surface` check inside the local run. One new question (what the shared workflow callers name).
- The floor compile on 6000.3 no longer waits for 6.7 (no epic waits for 6.7). The three questions of the last round are answered and moved to Decided; one new question is open. The epic table is at 62 stories (WF1 +3, WF5 -2).

Earlier revisions, 2026-10-23: the developer's review was applied (decisions 1 to 6 answered, the self-hosted runner replaced by local Unity CLI test runs, `Packages/<name>` after a probe, the games as the only milestones, the maintenance-branch story removed because nothing keeps old behaviour alive before a package ships to customers); two claims rounds were answered (the managed list, the artist's setup script and the Artist onboarding form, the catalogue line of nine fields, the release without an Asset Store step); every operation is spelled in area 2's grammar (`spellbound_run`, `<group> <operation> [arguments]`, the `<Name>Kit` door, a result that starts with its status word).

What this area adds to the line: no Unity package, no assembly, no runtime type. It adds files, scripts and GitHub settings that make the line's rules the path of least effort. It touches Core.Editor in one place (where the Spellbound window installs from) and says what every package carries from the template.

## Decided

The developer's answers of 2026-10-23 and 2026-10-24, from `Line.md`'s decisions and the page. Nothing below is open.

1. **Release tool:** semantic-release, with a `beta` branch before a package's first stable release. YAML only (2026-10-23).
2. **Install source:** a git URL with a path, installed by the Spellbound window, which ships with Core and installs everything else. The window's package list comes from GitHub for good: the studio never leaves GitHub (question 28, 2026-10-24). What the address ends in is decided 12, 22 and 23 below.
3. **The eleven existing repos:** restructured in place, one pull request each (2026-10-23).
4. **Domain, namespace, legal name, enrolment:** one story the developer owns, with no date, outside the epics. No milestone waits on it (2026-10-23).
5. **Who opens a Story:** anyone on the team, through the form. Status is the approval; the Discord bot and the GitHub skill do the scrum master's work (2026-10-23).
6. **Where the Unity checks run:** merging needs passing tests run locally through the Unity CLI in the dev project. The author runs them before asking for review; whoever merges an artist's pull request runs them first (question 30, 2026-10-24). A hosted or self-hosted runner is a spike; nothing on the plan needs one.
7. **Where a package lives:** `Packages/<name>` in its dev project, an embedded package, cloned and edited in place. The folder is the short name, `Packages/Core` (question 32, 2026-10-24); the one-story probe confirms Unity accepts it.
8. **Infrastructure repos:** the template, the game template, the org `.github` repo, `claude-skills`, `BuildPipeline`, `SpellboundDocs` and `Roadmap` are not packages and not games (line decision 14).
9. **Send:** one button; the artist's machine needs git and Git LFS only; artists push branches to the game's own repository and Send sends only the files the artist changed under the art folders, never everything; every main branch is protected; a GitHub Action in the org `.github` repo opens the pull request (question 23, 2026-10-24).
10. **Milestones:** the two games, Saboteer on the line then Corsairs Isle on the line, each playing the same or better and easier to extend. A public release, a listing, enrolment and Core 1.0 are undated stories after them. Saboteer's Next Fest is 22 February to 1 March 2027 (Steam's dates); every date of ours is an estimate the developer is not bound by.
11. **No compatibility before a package ships to customers:** no shim, no migration, no old reader, no redirect table, no `FormerlySerializedAs`. A breaking change means re-save, re-author, re-import.
12. **Nothing is pinned (question 14, 2026-10-24):** no demo branches, no pinned versions, no pin gate. Saboteer's demo follows the package branches, and a game's manifest line names a branch. The tag script and the demo build's files stay. A maintenance branch and a released tag are not pins.
13. **Code freeze in Saboteer from mid January 2027 (question 13, 2026-10-24):** bug fixes and media only, build scenes frozen. WF7a lands before it.
14. **Two or more people work in a game project at once (question 15, 2026-10-24):** conflicts are handled as always; the one-person rule and the game days are gone.
15. **The release and pull request Actions run as a GitHub App the organisation owns (question 31, 2026-10-24).**
16. **The copyright line has no year (question 27, 2026-10-24):** `// Copyright (c) Spellbound Studios. All rights reserved.` is the one line the template writes at the top of every C# file.
17. **The line text lives in the organisation's `.github` repository (question 8, 2026-10-24):** the hand-off puts the executive brief, the roadmap and the line text there for people and agents; every template and form points there and carries no copy of the rules.
18. **The stored-format and LFS rules (RedTeam 7.7, accepted 2026-10-24):** the template's `.gitattributes` scopes Git LFS to `Assets/_Project`, and `compare-surface.sh` treats stored-format lines like public lines.
19. **Design consequence of decided 9, not a new decision: artists reach only `art/*` (checkpoint 4):** a branch ruleset in every game repository; artists keep the write role, and the ruleset, not a role, confines them (GitHub has no branch-only role). Design in "The repository settings, whole".
20. **Design consequence of decided 12, not a new decision: the template follows PackageCheck by branch (checkpoint 4):** its manifest line for PackageCheck names `#beta`, then `#main` after PackageCheck's first stable release; no tag is held.
21. **Shared workflows run at `@main` (answer 6, 2026-10-24):** every caller says `uses: Spellbound-Studios/.github/.github/workflows/<name>.yml@main`. The shared repository's own main is protected, so a change reaches the 22 repositories only after its own pull request passes.
22. **A buyer installs a released tag and our games follow a branch (answer 5, 2026-10-24):** the Spellbound window writes `#v<known-good tag>` for a customer's copy and a branch for a project the studio works in. The release train is a rule of the line: a major about every 12 months, buyers offered the upgrade at a reduced cost, and inside a major a year of bug fixes, maintenance and no API break.
23. **A shipped game follows the maintenance branch of its Core major (answer 4, 2026-10-24):** semantic-release's maintenance branch `release-<major>` carries fixes to a shipped major, and a shipped game's manifest line names it, never `main`. The story is dated to Saboteer's first Steam release built on the line.
24. **A renamed serialized field after first ship is a major (answer 24, 2026-10-24):** semantic versioning decides, and the release check fails a bump that is lower.
25. **A release stops on a file saved by a newer Unity than the oldest supported editor (answer 25, 2026-10-24):** the scan is Living's; the release runs it before it tags.
26. **The one change that can break Saboteer's build inside the freeze window waits on a side branch (answer 1, 2026-10-24):** Modifiers' move onto the definition contract is on a branch called `definition-contract` and merges on 2 March 2027 (estimated) with whatever Saboteer needs.
27. **Studio.Content is edited in StudioDev only (answer 18, 2026-10-24):** there is no embedded copy of a Studio package in a game; the designer edits in StudioDev with the studio's playable character, pushes, and presses Update in the game.
28. **A newer Unity opens a throwaway copy, once (answer 7, 2026-10-24):** the working project is never opened in an alpha or in any Unity newer than its `ProjectVersion.txt`; the probe story is Unity's U9.

## Survey: what I read

| Subject | Where | What it said |
|---|---|---|
| Package repos | `git log`, `git tag` in each package folder (Core, Chat, Controller, Inventory, Modifiers, UI, GeoForge, Persistence, Decals, VolumetricFog, WorldForge) and both games | 1,050 package commits and 1,305 game commits; conventional-commit subjects: 3 and 4. No tags. Branches: Core works on `dev`, GeoForge on `dev_1.0`, the rest on `main` |
| GitHub, read through `gh` | Tags, releases, workflows of 16 repos; rulesets of Core; the org `.github` repo; the `claude-skills` repo; the board README and fields | Zero tags and zero releases in all 16. One workflow in the organisation (Controller's `verify-format.yml`, a Super Linter run that is not in Controller's working tree). Core has one ruleset, "Merge Power": a pull request with one approving review and resolved threads, no status check among its rules; its ref conditions list no branch, so what it covers is unverified |
| Consumers | `SaboteurDev/Packages/manifest.json`, `CorsairsIsleDev/Packages/manifest.json`, `packages-lock.json` | Saboteer: 11 Spellbound lines, 6 by SSH and 5 by HTTPS, 2 name a branch (`#dev`, `#dev_1.0`), 9 name nothing. Corsairs: 8 lines, 6 SSH, 2 HTTPS, 2 name a branch. The lock file holds the commit hash; a manifest line holds no version |
| Versions and changelogs | Every `package.json`, `CHANGELOG.md`, `LICENSE.md` | Versions are hand-edited (GeoForge commit 98b2af9 "fix: bumped package 0.6.23 -> 0.6.24"). A changelog exists in 5 of 11 packages and a license file in 5 of 11; Chat, Inventory, UI, Decals, VolumetricFog and WorldForge have neither. Changelog dates read `10/18/2026` |
| Game versions | `ProjectSettings.asset` line 146 of both games; `BuildPipeline/buildpipeline/config.py` | Saboteer `0.2.2`, Corsairs `0.5.04` (a leading zero is not semantic versioning). BuildPipeline reads `bundleVersion` as the single source and names the build folder and the Steam description from it |
| Studio documents | Skills in the `spellbound` plugin (`design-pitch/references/handoff.md`, `library-design/references/boundary-sheet.md`, `unity-package.md`, `review.md`, `lead-engineer`, `spellbound-roadmap`), `claude-skills` README | The story format, the boundary sheet, the layout and the review checklist exist only as skill text; skills install by `/plugin marketplace add Spellbound-Studios/claude-skills` |
| Board | Project 13 README and fields | Titles, types and Status meanings are written down. Area options are today's package names (Chat, Controller, VolumetricFog and so on). No field for a gate or token estimate. Fifteen items |
| Dev projects | `Evidence/DevProjects.md`, directory listings | No dev project has `_Project` scaffolding; ModifiersDev holds the package inside it; every project keeps Unity template leftovers (`Readme.asset`, `TutorialInfo`, `InputSystem_Actions.inputactions`). Each package's `.git` is inside the package folder, not at the project root |
| Docs | `SpellboundDocs` | A GitBook repo with three four-line placeholder pages |
| Release of a game | `BuildPipeline/README.md`, `ROADMAP.md` | `python deploy-steam.py <game>` ships a local build. GitHub Actions automation is deferred in the repo's own roadmap. The public Steam branch is never auto-promoted, by Valve's guardrail |

Documentation checked, by page (all fetched 2026-10-23):

| Claim I rely on | Source |
|---|---|
| Git dependencies need a Git client (2.14.0 or later) on the PATH; they can be declared only in a project's manifest, never in a package's `package.json`; `#` takes a tag, branch or full commit hash; `?path=` precedes `#`; the lock file records the commit hash; updating means a new `Client.Add` | Unity 6000.4 manual, "Git dependencies" |
| `package.json` `dependencies` are exact versions, no ranges; `samples[].path` starts at `Samples~`; without a `license` field the package must hold `LICENSE.md`; `unity` is `major.minor` | Unity 6000.4 manual, "Package manifest" |
| Major for removing or renaming public API, serialized members or assemblies; the `name` cannot change, publish under a new name; deprecate in a minor, remove in a major; new packages start at 0.1.0 | Unity 6000.4 manual, "Package versioning" |
| Asset Store UPM publishing: enrol as a UPM publisher (five to seven business days; an organisation gives a DUNS number; a publisher namespace is verified by domain or, for an individual, by verified legal name); the package folder and `package.json` `name` must equal the technical name; upload and validation are the Editor windows of the Asset Store Publishing Tools; each update needs a unique version | docs.unity.com, "UPM product Asset Store publishing workflow", "Enroll as a UPM publisher", "Validate and upload", "Update a UPM product" |
| Paid UPM products: the current pages list revenue and sales for UPM products; an older Unity 6.0 page said free only. I treat paid as supported and verify at enrolment | docs.unity.com, UPM publishing section; Unity 6.0 manual (older) |
| Conventional Commits 1.0.0: `fix` is patch, `feat` is minor, a breaking change is major, marked `!` before the colon or a `BREAKING CHANGE` footer | conventionalcommits.org |
| semantic-release: default plugins commit-analyzer, release-notes-generator, npm, github; branches can include a `beta` prerelease branch and `N.x` maintenance branches; `@semantic-release/exec` runs `prepareCmd` with `${nextRelease.version}`; starting below 1.0.0 "is not supported by semantic-release" and prereleases are recommended for projects in development | semantic-release documentation and FAQ |
| release-please: a Release PR is kept open and merged by a person; `bump-minor-pre-major` makes a breaking change a minor below 1.0.0; configuration is a JSON file and a JSON manifest | release-please manifest documentation and action README |
| Issue forms: a top-level `type` sets the organisation issue type and `projects` adds the issue to a project (`OWNER/NUMBER`); URL query parameters can prefill an issue form. `gh issue create` has `--type`, `--parent`, `--blocked-by`, `--project` and `--body-file`; the page does not say it fills a form | GitHub, "Syntax for issue forms"; "Creating an issue" |
| Default community health files come from a public `.github` repository and apply to any repository of the organisation without its own file | GitHub, "Creating a default community health file" |
| Template repositories copy the files and the default branch with one starting commit | GitHub, "Creating a repository from a template" |
| Squash merging can use the pull request title alone as the commit message | GitHub, "Configuring commit squashing" |
| Free organisation: 2,000 Actions minutes a month on private repositories, 500 MB of artifact storage; standard runners are free on public repositories. Rulesets are documented for Team and Enterprise (Core's ruleset exists on a public repository) | GitHub, "About billing for GitHub Actions"; "About rulesets" |
| `gh release create` has `--generate-notes`, `--prerelease`, `--notes-start-tag`; `.github/release.yml` is YAML | GitHub CLI manual; GitHub, "Automatically generated release notes" |
| An event caused by the repository token creates no new workflow run, except `workflow_dispatch` and `repository_dispatch`; a pull request it opens runs its checks only after a person with write access approves; an App installation token or a personal access token instead lets `pull_request` workflows run without the approval prompt | GitHub, "Triggering a workflow" (fetched 2026-10-24) |

Not verified, and where the design says so: that semantic-release's `.releaserc` accepts YAML and that its default parser reads the `!` marker (story WF4-1 checks both first); that Unity resolves a package's declared dependency on a package installed from a git URL in the manifest (the line already tests this in sprint 1); that a private repository can call a reusable workflow of a public repository without an access setting (the design keeps the workflows in the public `.github` repository, and GitHub's reference format `{owner}/{repo}/.github/workflows/{file}@{ref}` covers public and private); that `uses:` references survive a rename of the organisation; that the Asset Store accepts a store package that depends on another store product; the current Asset Store paid-UPM status; the GitHub CLI filling an issue form; that a pull request opened with the App's token starts its checks without the approval prompt (GitHub's page, fetched 2026-10-24, says an App installation token does this and that the repository token's pull request runs wait for approval; WF1's first story confirms it on our organisation); that a branch can be protected on private repositories on the organisation's plan (WF1's settings story checks).

## Ideas

Twenty-seven kept, four cut. Ten were required; the rest came from walking the scenario, from the red team and from the developer's answers of 2026-10-24.

| # | Idea | Builds on | Verdict |
|---|---|---|---|
| 1 | The pull request title is the commit: squash with the title alone, one regex script checked in CI on the title and by a local hook on every commit | GitHub's own squash setting; Conventional Commits | Kept |
| 2 | Nobody bumps a version by hand: a pull request that edits `package.json` `version` fails the structure check; the release writes it | The hand-bumps in GeoForge's history | Kept |
| 3 | Until a package has its first stable release it releases on a `beta` branch as `1.0.0-beta.N`; a person merges `beta` into `rc` to ask for the strangers (`1.0.0-rc.N`), and the day it is listed is the fast-forward of `main` to a green `rc` tip, which is `1.0.0`. A package already public above 1.0.0 (Core) gets a baseline tag at its current version first | Line rule 15; semantic-release's prerelease branches | Kept |
| 4 | Issue forms for Epic, Story, Task, Bug, Boundary sheet and the two Onboarding forms in the organisation `.github` repo, each setting its type and the board, so a new story lands on the board by itself | The board README; org issue types; `type` and `projects` in forms | Kept |
| 5 | The story form is the build spec: its fields are the lead-engineer inputs (outcome, verified facts, rules, regression contract, done when). A script prints the kickoff prompt for an issue number | `handoff.md`, `lead-engineer` | Kept |
| 6 | One home for workflows: reusable workflows in the public org `.github` repo; each package holds a caller of ten lines. The logic is in scripts that live in every repo, so a person or an agent runs the same check offline | The org `.github` repo that already exists | Kept |
| 7 | A template repository: the whole dev project (`Packages/<name>`, `Assets/_Project`, manifest, hooks, callers, scripts), no `.meta` files, and an `initialise-package.sh` that fills the names | Requirement 17; `unity-package.md` | Kept |
| 8 | The same files reach the eleven existing repos and both games by `adopt-repository.sh`, in place: the package folder moves under `Packages/`, history and issues stay | Decided: the dev project is the clone, the package an embedded package inside it | Kept |
| 9 | A game follows a branch: its manifest line names `beta` before a package's first stable release and `main` after, and the window's Update button re-adds the line so the lock file moves. No tag is held, no bump pull request is opened, no list of consumers exists. A buyer's copy gets the known-good tag and a shipped game follows its major's maintenance branch (checkpoint 5) | The developer's answer that nothing is pinned; the lock file records a commit hash and moves on a new `Client.Add` (Unity manual) | Kept |
| 10 | The line's pair matrix is a release artifact: the bridge pair results from area 7's check, one plain table per Core release | Line rule 2 | Kept |
| 11 | A store pack script (undated, after the games): copies a tag to a folder named for the technical name, renames `Samples` to `Samples~`, checks the listing facts; a listing text assembled from `package.json`, the README sections and the changelog; screenshots taken from the sample scene with the Unity CLI `capture_game_view` | `unity-package.md` ("renamed at publish time"); Pipeline package commands in `Status.md` | Kept |
| 12 | A sprint report script: gates per person-day and tokens per story from the board, so sprint 1 calibrates the roadmap's two units | Decided: one gate per person per day, sprint 1 measures | Kept |
| 13 | A scheduled "Unity release review" issue that opens when a Unity release ships and links area 8's table of systems the line reinvents | Requirement 4, area 8's scenario | Kept |
| 14 | Support as a routine: `SUPPORT.md` in the org repo, a bug form with an environment block pasted from `core about`, a stated first-response time | Default community health files | Kept |
| 15 | Documentation follows the tag: a release opens a pull request in `SpellboundDocs` carrying that package's `Documentation~` | `SpellboundDocs` stubs | Kept |
| 16 | The Unity-dependent check runs where an Editor is installed (a contributor's machine, through the Unity CLI) and posts its result as a commit status the pull request shows (the local gate, decided 6) | Free-plan minutes; Unity CLI `run_tests` | Kept |
| 17 | Managed files: a list in the template of the files every repo must hold identical (hooks, scripts, `.editorconfig`, `.gitattributes`, `.releaserc.yaml` shape), and `sync-template.sh` that opens a pull request where a repo drifted | The red team's drift finding | Kept |
| 18 | `render-issue-body.sh` prints an empty issue body whose headings are the form's labels, so an agent filing through `gh issue create --type Story --body-file` writes the same story a person does | The `gh` flags above; the roadmap skill's batch script | Kept |
| 19 | A commitlint and Husky setup in every repo | Developer's idea (automated checks) | Cut: Node tooling in 22 repos for what one regex does |
| 20 | A "New package" wizard in the Spellbound window | Likely proposal | Cut as the primary path, see the rejected direction |
| 21 | A self-hosted GitHub runner on the developer's PC to run Unity tests on every pull request | Likely proposal | Cut: GitHub advises against self-hosted runners on public repositories (Core, GeoForge, Modifiers and Controller are public) and the machine must be on; idea 16 gets the result without it. A runner is a spike (WF3); nothing on the plan needs one |
| 22 | Selling the template and pipeline as a product | Ambition | Beyond the brief only |
| 23 | The local gate: one script the Unity-dependent checks run from, on a machine with the Editors, each posting a named commit status | Claims from commandline, runtime, art, networking, unity, ui and living | Kept, decided 6 |
| 24 | Release candidates: `beta` takes every merge, `rc` is asked for by a person and runs the strangers, the final tag exists only on a commit that carries a green `strangers` status | Living's tag flow; semantic-release's prerelease branches | Kept |
| 25 | The surface-bump check: the release compares the bump the commits imply with the diff of `Surface.txt` (and the stored `core help --all` text) and fails when the bump is lower | Living and commandline claims; Conventional Commits | Kept |
| 26 | The catalogue line written by the release at the final tag, as a pull request on the org repo's `Catalogue.txt` | Living's catalogue | Kept |
| 27 | A Move form (row, evidence, call sites) and a Decision issue for written go or no-go gates | Unity's ledger; pathfinding's N1 | Kept |
| 28 | A game template beside the package template: a manifest with no Spellbound lines, the LFS baseline, the hooks, the stub agent skill install | Line direction C ("the whole-line install survives as a template project"); commandline | Kept |
| 29 | The repository settings list: protected default branch (pull request required, no direct push), squash with the title alone, delete merged head branches; `repository-settings.sh` prints the `gh api` lines for a person to type, and `check.sh` reads the settings back and fails on drift | Decided: every main branch is protected; GitHub's repository settings | Kept |
| 30 | The organisation's GitHub App: one identity for the release and the pull request Actions, with a short-lived token per run, its key an organisation secret | Decided: the App; GitHub's page on App tokens | Kept |
| 31 | The line text lives in the org `.github` repo; every template's `AGENTS.md`, every onboarding form and the pull request body of `adopt-repository.sh` link to it, and the address is one value in `line-text-address.txt`; the root `AGENTS.md` is a managed file, so it cannot differ between repos, and `check.sh` fails an `AGENTS.md` (root, or a package's Rules heading, which living's rule A3 owns) that holds a line of sixty characters or more also found in the line text fetched from that address, and reports "not checked" when it cannot reach it | Decided: question 8; the copies that drift | Kept |

## Directions

I explored four and took the first all the way.

**A. Files and GitHub first (taken).** A template repository, one org `.github` repo of reusable workflows and forms, semantic-release in CI, tags on the source commit, install by git URL with `?path=` and a branch or a tag. Everything runs on a hosted Linux runner or in a shell, the Unity checks run locally through the Unity CLI, an agent can run every check, and a Unity window can wrap it later.

**B. Unity first (rejected).** The same jobs as editor windows and operations: a create-package wizard, a release button, version shown in the Spellbound window. It would be the friendliest face for a designer or an artist. It was an alternative to A and loses on three counts: CI must run with no Editor (the free plan gives 2,000 minutes a month on private repositories and no Unity license), an agent with a shell is the reader of requirement 12, and every window would need the scripts under it anyway. The good half survives: the window's install and update buttons (area 7) call the same tag URLs A produces.

**C. A release tree on a `upm` branch (rejected).** The pipeline builds the consumable package at the repository root of a bot-owned branch, with `Samples~`, no `?path=`, and tags it. Consumers get a plain URL and a correct folder. It was an alternative to tagging the source. It loses because semantic-release tags the commit it releases from, so a tag on a different commit needs glue we would own, and two trees (source and release) would answer "what is in v1.2.0" differently. Its real gain, the correct sample folder, is delivered by the pack script for the store and by assembly define constraints for git consumers (claim on area 7).

**D. A registry (rejected, decided 2).** OpenUPM or a registry we host. It would give true dependency resolution through `package.json`. It is a third party or a server to run, and OpenUPM takes open-source packages only, which three of the paid ones will not be. It stays a rejected option with its cost laid out.

## The scenario, walked

Scenario (Areas.md, area 10): a new team member writes their first story, starts a new package and makes their first release. Each starts from a template, and commits and versions follow one convention without anyone policing it. Below is a new team member's first week in the After. Every step that writes to git is a person's: the studio's agents run checks and print what to type, they never commit, tag or release.

| Step | The person does | What they get | Where the convention lives |
|---|---|---|---|
| 0 | Opens the Engineer onboarding issue assigned to them in `Roadmap`: install `gh`, Unity 6000.4.8f1, Rider, `unity setup claude`, `/plugin marketplace add Spellbound-Studios/claude-skills`, clone the first repo, run `bash scripts/setup.sh` | A checklist with commands, one per line, bash | Engineer onboarding form in the org `.github` repo |
| 0, artist | An artist with nothing installed opens the Artist onboarding issue an engineer made for them. It lists, in order: install Git for Windows (it brings Git Bash and Git LFS), install Unity Hub and sign in with a Unity account, install the Editor version the issue names, open Git Bash and paste the one clone line, sign in to GitHub when the clone asks, run `bash setup.sh` inside the cloned folder, add the folder in Unity Hub and open it | The game project open in the right Editor, with the large files fetched. The first sign-in is the clone's, not the first push's | Artist onboarding form in the org `.github` repo; `setup.sh` at the root of `GameTemplate` |
| 1 | On the board, New issue, picks **Story**. Only two fields are required: outcome (a title in the board's words) and done when. The rest, verified facts, rules, regression contract, gates and tokens, can be filled as the story firms up | An issue of type Story already on project 13 with Status Backlog; a lead moves it to Ready | Story form: `type` and `projects` keys |
| 2 | Runs `bash scripts/kickoff-prompt.sh 123` | The kickoff prompt for the agent that will build it, written from the issue | Scripts in every repo |
| 3 | Clicks **Create a branch** on the issue, works, commits `wip` as often as they like | Branch commits are free | Only the title is checked on a pull request |
| 4 | Runs `bash scripts/run-local-tests.sh` in the dev project before asking for review, then opens the pull request; the template asks for `Closes #123`, what changed, how the regression contract held, and "You need to do the following" | The Unity CLI test run posts a `unity-tests` status on the head commit; a title check, a structure check on a Linux runner, and a comment saying what version this will release | `pull-request-title.yml`, `check.yml` |
| 5 | Titles it `fix(inventory): stack split keeps the quantity`; the first attempt `Fixed bug` fails the check with the allowed list printed | The squash commit on `beta` is the title | Squash with title only |
| 6 | Starts the new package: `gh repo create Spellbound-Studios/Ropes --template Spellbound-Studios/Template --private --clone`, then `bash scripts/initialise-package.sh Ropes "Simulates ropes and chains."` | A dev project of the standard layout, names filled, hooks path set, the boundary sheet and homes test skeleton open for filling (the rules they test against are linked from the org `.github` repo, not copied), a Boundary sheet issue created | `Template` repo |
| 7 | Opens it in Unity once | Unity writes the `.meta` files; the first commit is `feat: add package skeleton` | No `.meta` in the template |
| 8 | Makes the first release: `gh workflow run release.yml -R Spellbound-Studios/Ropes` | `v1.0.0-beta.1` tagged, a GitHub release with notes, `package.json` and the changelog written by the release, the window can install it | Reusable `release.yml` |
| 9 | Asks for the strangers one day: merges `beta` into `rc` | `v1.0.0-rc.1` tagged; the local gate (`bash scripts/run-strangers.sh <tag>`, on a machine with the Editors) runs the strangers that install the package and posts a `strangers` status on that commit | Reusable `release.yml`, the local gate |
| 10 | First stable release, undated and after the games: fast-forwards `main` to the green `rc` tip | `v1.0.0` is tagged only because that commit carries a green `strangers` status; the catalogue gets its line; the store pack script produces the folder to upload | Rule 15, mechanised |

Nobody typed a version, edited a changelog, picked a tag name or looked up a template. The only judgement calls are the title's type and scope, and the check teaches them.

## Before, faithfully

What a person does today (from the reads above):

```
git clone git@github.com:Spell-Bound-Studios/Inventory.git      (the clone is the package folder)
edit the version in package.json by hand
write the changelog by hand, date as 10/18/2026, or not at all
git commit -m "update"                                            (7 of 2,355 commits are conventional)
git push                                                          (no tag, no release, no check)
```

A game takes it with a manifest line like `"com.spellboundstudios.core": "https://github.com/Spell-Bound-Studios/Core.git#dev"` or, for nine of eleven in Saboteer, a line that names nothing and follows the default branch until the lock file moves.

| Thing | Today |
|---|---|
| New package | Create a Unity project from the Unity template, create a repo, clone it into `Assets`, copy the files of another package. Eleven dev projects disagree on layout |
| Story, epic, bug | Titles are fixed by the board README; bodies are free text; the story format lives in a skill |
| Commit | Free text. Core, Controller, GeoForge and Modifiers have 52, 29, 56 and 18 merge commits, so pull requests happen; their titles are not checked |
| Version | Hand edit of `package.json`; dependents declare Core `0.0.2` or nothing |
| Release | None: no tags, no GitHub releases, no workflow (one stale Super Linter in Controller) |
| Changelog | 5 of 11 packages, hand written; GeoForge's stops at 0.5.0 at version 0.6.24 and Controller's at 1.0.0 at 1.1.5 |
| License | `LICENSE.md` in 5 of 11, naming "Spellbound Studio Inc." where `package.json` says "Spellbound Studios" |
| Game build | Local Unity build, `deploy-steam.py`, `bundleVersion` hand set (`0.5.04` is not a valid version) |
| Docs | Three four-line pages |
| Onboarding | Nothing written; the skills' install commands are in the `claude-skills` README |

## After, side by side

Each pair is what a person types.

| Task | Before | After |
|---|---|---|
| Start a package | Copy another package, rename by hand, 11 layouts disagree | `gh repo create Spellbound-Studios/Ropes --template Spellbound-Studios/Template --private --clone` then `bash scripts/initialise-package.sh Ropes "Simulates ropes and chains."` |
| Bring an old repo in | Not possible, layouts differ | `bash scripts/adopt-repository.sh Inventory`, a pull request that moves the package under `Packages/Inventory` and adds the dev project shell (the first one waits on the probe); its body links the line text in the org `.github` repo |
| Commit | `git commit -m "update"` | `git commit -m "feat(inventory): split a stack in two"`; the hook prints the allowed types when it is wrong |
| Release | Edit the version, hope | `gh workflow run release.yml` |
| Run the Unity checks before a merge | Nothing | `bash scripts/run-local-tests.sh`, which runs the Unity CLI's `run_tests` and the operation lines of the local gate, then prints the one line that posts the status |
| Send an artist's work | Not possible | Send pushes a branch `art/<artist>-<slug>` to the game's repository carrying only the files changed under the art folders; a ten-line caller in the game repo runs the Action in the org `.github` repo that opens the pull request into the protected main |
| Install in a game | `"com.spellboundstudios.core": "https://github.com/Spell-Bound-Studios/Core.git#dev"` | `"com.spellboundstudios.core": "https://github.com/Spellbound-Studios/Core.git?path=/Packages/Core#beta"` (the manifest line the window writes for a game; Unity's own file) |
| Update a game | Edit each manifest, remember which | Press Update in the Spellbound window: the line names a branch (`beta`, `main`, or `release-2` once the game has shipped), so re-adding it moves the lock file to the branch's newest commit. Nothing opens a pull request and nothing is held at a version |
| Install as a buyer | Clone a branch of a public repository and hope | The window writes `"com.spellboundstudios.core": "https://github.com/Spellbound-Studios/Core.git?path=/Packages/Core#v2.1.0"`, the catalogue's known-good tag of a released version; a year of fixes and no API break inside the major |
| File a story | Free text issue, the developer sets type and board | The Story form, which sets both; or `gh issue create --type Story --body-file <(bash scripts/render-issue-body.sh story)` for an agent |
| Keep repos alike | Nothing | `bash scripts/sync-template.sh` opens a pull request where a managed file drifted |
| Start a game | Copy another game | `gh repo create Spellbound-Studios/Farm --template Spellbound-Studios/GameTemplate --private --clone`, then open the Spellbound window and pick a starter set |
| Ship a game | Hand set `bundleVersion`, deploy, no record | Deploy, then `bash scripts/tag-release.sh`: tag `v<bundleVersion>` and a GitHub release with generated notes |
| Ask for help (a buyer) | Nowhere | `SUPPORT.md`, the bug form, an environment block from `core about` |

The template's tree (this is the whole of it, and the part a package author edits is only `Packages/<name>`):

```
AGENTS.md                      how to work in this repo: title rule, never edit the version, how to release, how to run the checks, and the address of the line text in the org .github repo (no copy of the rules)
CODEOWNERS                     the judgment fields (area 7) name the developer
Packages/<name>/package.json, README.md, AGENTS.md (shipped: the six headings Purpose, Front door, Rules, Not for, Gaps, Ledger, living's version), CHANGELOG.md, LICENSE.md, the committed surface file and the documentation index (both made by PackageCheck's init)
Packages/<name>/Runtime/ (with the front door <Name>Kit and the one [assembly: OperationGroup] line, the group being the package name in lower case), Editor/, Tests/Runtime/, Tests/Editor/, Samples~/<Name>Sample/, Documentation~/index.md, Documentation~/boundary-sheet.md
               (Identity.asset is made by PackageCheck's init on the first open, a ScriptableObject cannot exist without its .meta)
               (every .cs file the template writes starts with the copyright header line, `// Copyright (c) Spellbound Studios. All rights reserved.`, no year)
               (initialise-package.sh --requires burst,mathematics,urp declares the Unity packages the sentence names in package.json, with the exact versions of managed-unity-packages.txt)
               (initialise-package.sh --presentation adds <Name>.Presentation with defineConstraints ["!UNITY_SERVER"])
Assets/_Project/Scenes/, Settings/
Packages/manifest.json (its PackageCheck line names a branch: #beta, then #main after PackageCheck's first stable release)
ProjectSettings/ProjectVersion.txt
.editorconfig, .gitattributes (Saboteer's LFS patterns as the baseline, rewritten under Assets/_Project only), .gitignore, .releaserc.yaml
.githooks/commit-msg
.github/workflows/pull-request.yml, release.yml
scripts/setup.sh, check.sh, check-commit-message.sh, compare-surface.sh, set-package-version.sh, kickoff-prompt.sh, render-issue-body.sh, pack-store-package.sh, run-local-tests.sh, run-strangers.sh, drift-report.sh, post-status.sh, update-catalogue.sh, tag-release.sh, sync-template.sh, repository-settings.sh, initialise-package.sh (deletes itself)
managed-files.txt, line-text-address.txt (one value: the address of the line text in the org .github repo)
```

`GameTemplate` is the same idea for a game (it also holds the artist's `setup.sh` at its root, described below): a Unity project with a manifest that holds no Spellbound line (the window installs Core and a starter set), the same hooks, scripts, `.editorconfig` and LFS baseline, a root `AGENTS.md`, the stub agent skill installed by `core context-install --target agents` (area 2) as part of `setup.sh`, and a ten-line caller that runs, on a push to `art/**`, the reusable workflow in the org `.github` repo that opens the pull request. That workflow takes the title from the first commit subject (`feat(art): ...`, which Send writes) and the body from the commit body, so sending needs git and Git LFS on the artist's machine and nothing else, and Send adds only the files the artist changed under the art folders. Its `AGENTS.md` names the two templates a person meets in the editor but does not own them: `ui new-view <name>` is UI's, and the console profile is a sample of the networked text package. Studio.Content and every other Studio package is edited in StudioDev only (decided 27): `check.sh` fails a game repository whose `Packages` folder holds the folder of a Studio package, so no embedded copy of one exists in a game.

The managed list. `managed-files.txt` names the shell-side files every repo holds identical, and `sync-template.sh` opens a pull request where one drifted. The list, whole: `.githooks/commit-msg`; `.github/workflows/pull-request.yml` and `release.yml` (the callers); every file in `scripts/`; `.editorconfig`; `.gitattributes`; `.gitignore`; `.releaserc.yaml`; `CODEOWNERS`; the root `AGENTS.md`; `line-text-address.txt`; `managed-files.txt` itself. `sync-template.sh` and `check.sh` compare a caller with the managed copy ignoring the ref after the `@`, so a repository may point one caller at a branch of the shared workflows to try a change without a drift report; every committed caller says `@main`. PackageCheck's skeleton owns the rest: everything under `Packages/<name>/`, the Spellbound entries of `Packages/manifest.json`, `ProjectSettings/ProjectVersion.txt` and `Assets/_Project/Ledger/`. No path is on both lists. Living's file lists `.github/workflows/`, `CODEOWNERS`, `.editorconfig` and `.gitignore` under the skeleton and in the skeleton upgrade row; those four are on this list, so living drops them from the skeleton (request to living, below). The harness test in LV3 reads both lists and fails when one path is on both. The template's copy of the package folder is a copy of PackageCheck's skeleton as of the PackageCheck commit named in `skeleton-version.txt`. That file is a record of where the copy came from, not a held version: the template's manifest line for PackageCheck names a branch (`#beta`, then `#main` after its first stable release), and `update-skeleton.sh` compares the record with the branch's tip and opens a pull request when the skeleton changed, so the skeleton has one source and nothing is pinned.

The artist's way in. It is its own form, Artist onboarding, because the engineer's list assumes tools an artist does not have and the artist's script cannot exist before the clone. An engineer opens the issue for the artist and fills three fields: the game repository's address, the Editor version (copied from `ProjectSettings/ProjectVersion.txt`), and a tick that the artist's GitHub account has been invited with the right to push a branch (decided 2026-10-24: artists push branches to the game's repository). The steps, each one line with the command or the address: Git for Windows (the installer is the one piece that gives an artist bash, git and Git LFS together; read from the reviewer's finding, and the WF2 walk confirms it on a clean machine); Unity Hub, then a Unity account sign-in; the Editor version the issue names, installed from the Hub; in Git Bash, `git clone <address>`, where Git for Windows' credential helper opens the GitHub sign-in in the browser (expected, unverified on the artists' machines; art's A5 checks it at the clone, not at the first push); `bash setup.sh` inside the clone; then Add in Unity Hub and open. A Mac artist installs the same pieces by name; the form lists Mac addresses beside the Windows ones. Send itself still needs git and Git LFS on the machine and nothing else, as the line says; Unity Hub and the Editor are needed to make art at all, so they are not Send's requirements.

The artist's `setup.sh`. It is a different script from `scripts/setup.sh` (which sets the hooks path and runs the stub skill install for an engineer). It sits at the root of `GameTemplate`, so it exists only after the clone, and it is run once, after the clone. It installs nothing. It runs `git lfs install` and `git lfs pull`, checks that git and Git LFS answer and that no large file is still a pointer, prints the Editor version the project needs (read from `ProjectSettings/ProjectVersion.txt`), and prints each missing piece as a sentence ("Git LFS is not installed: install Git for Windows again with the default options, or download it from this address"). It commits nothing and holds no sign-in; the clone asked for that. Art's Preflight shows the same list in the Send tab. Whether it can tell that the Editor is installed (the Hub's install folder is unchecked) is left to the WF2 walk; until then it prints the version and stops.

The pull request Action for Send. A caller of ten lines in the game repo runs, on a push to `art/**`, the reusable workflow in the org `.github` repo. It takes the pull request title from the first commit subject on the branch (`feat(art): ...` or `fix(art): ...`, which the title rule accepts) and the body from that commit's body, which carries the changed files and each verdict. When it fails it opens a Bug issue in `Roadmap` naming the branch, so an engineer, not the artist, sees it. The repository setting "Automatically delete head branches" is on in every game repo (GitHub documents it as an admin setting under Settings, General, Pull Requests), so merged art branches disappear. GitHub's page says events caused by the repository token start no new workflow runs, except `workflow_dispatch` and `repository_dispatch`, and that a pull request it opens runs its checks only after a person with write access approves; an App installation token lets them run without the prompt. The Action therefore runs as the organisation's GitHub App (decided 2026-10-24), and WF1's App story confirms on our organisation that checks start on a pull request it opens. Artists may push branches to the game's repository (decided); the default branch of every game repository is protected, so nothing lands without a pull request. That a branch can be protected on a private repository on the organisation's plan is unverified, and WF1's settings story checks it first.

The repository settings, whole. `repository-settings.sh` prints one `gh api` line per setting for a person to type, and `check.sh` reads them back and fails on drift. For every repository: the default branch accepts changes only through a pull request; squash merge uses the title alone; merged head branches are deleted; the status `unity-tests` is required; review from the code owners is required for the judgment fields `CODEOWNERS` names (living's judgment fields); the App is on the bypass list so the release can write its commit. For every game repository one more: a branch ruleset that confines artists. GitHub has no role that can push branches only (checked on the repository roles page), and an artist needs the write role to push at all, so the ruleset does it: target every branch except `art/*`, with the rules "Restrict creations" and "Restrict updates"; its bypass list names the maintain role (engineers), repository admins and the App, and not the write role. GitHub's rules page says that with these rules "only users with bypass permissions can create branches" or "push to branches" matching the pattern; its rulesets page says `fnmatch` `*` does not match `/`, so `art/*` matches `art/<artist>-<slug>` and nothing deeper, which is the shape Send pushes. An artist can then create, push and (by the repository's own delete-on-merge) lose only branches under `art/`. Where the plan cannot enforce a rule, it is a team agreement and `check.sh` reports it as unenforced. Whether the plan allows rulesets, required statuses and code owner review on private repositories is not stated on the pages I fetched on 2026-10-24 and is unverified: WF1's settings story checks it on one private repository first, and the answer is the developer's if the plan cannot.

`run-local-tests.sh` is the merge rule: it runs the Unity CLI's `run_tests` in the dev project, then these lines through `unity command spellbound_run --line "<line>"`, each answering with its status word first: `packagecheck check --path Packages/<name>`, `packagecheck surface` (fails when a stored-format line's layout hash differs from the fingerprint a saved section header gets from the same type), `core ledger` when `ProjectVersion.txt` or a manifest changed, `artpipeline check` when a model changed, and `core validate` when a definition changed (its report, status word first, holds the findings of Core's `IDefinitionCheck<T>` seam and of every package's own checks). It prints the result and the one `post-status.sh` line that posts `unity-tests` on the head commit; an agent prints it, a person types it. The author runs it before asking for review (decided 2026-10-24); whoever merges an artist's pull request runs it first. It also compiles on the 6000.3 floor (no epic waits for 6.7), and the 6.3 test row runs the same tests on a 6.3 Editor: the CL1 and CL2 fixtures (area 2), UI's logic tests and play-mode element tests (area 11; the UI Test Framework package is test-only and is declared in the dev project's manifest, not in a package's dependencies), and whatever else the package's tests hold. The soak and fault matrix of Character, Inventory and Diagnostics (area 3's R7b) run through the same local Unity CLI test runs when the changed paths touch one of the three, and at every candidate; its duration is unmeasured and WF4's pilot records it. A runner stays a spike. A run on an alpha or on any Unity newer than the one `ProjectVersion.txt` names (the 6.7 beta, the Unity 7 alpha) is on a throwaway copy (decided 28): the script copies the project without its `Library` folder to a scratch folder, opens the copy, says so in its first line and refuses to open the working project in that Editor, because a newer Unity reimports and re-saves what it opens (`UnityChanges.md`, the Unity 7 notes). The Editor list is data in the script. `artpipeline check` runs inside the same script when a model changed, and its result is part of the one `unity-tests` status; there is no separate art status.

The caller a package holds (the real logic is in the org repo and the repo's own `scripts/`, so changing a workflow is one commit for 22 repos):

```
name: pull request
on:
  pull_request:
    types:
      - opened
      - edited
      - synchronize
jobs:
  checks:
    uses: Spellbound-Studios/.github/.github/workflows/check.yml@main
```

The release configuration a package holds (YAML; the `beta` and `rc` entries are what make releases before the first stable one work):

```
branches:
  - main
  - name: rc
    prerelease: true
  - name: beta
    prerelease: true
plugins:
  - "@semantic-release/commit-analyzer"
  - "@semantic-release/release-notes-generator"
  - - "@semantic-release/changelog"
    - changelogFile: Packages/Ropes/CHANGELOG.md
  - - "@semantic-release/exec"
    - prepareCmd: bash scripts/set-package-version.sh ${nextRelease.version}
  - - "@semantic-release/git"
    - assets:
        - Packages/Ropes/package.json
        - Packages/Ropes/CHANGELOG.md
  - "@semantic-release/github"
```

The maintenance branch (decided 23). It is named for the Core major, `release-2` for Core's second, in every repository of the line, so a shipped game's manifest lines all name the same branch. The line release (`gh workflow run line-release.yml`, run by a person, the App's token making the branches) cuts it in each repository from that repository's last commit when the Core major's tags are made, adds an entry in `.releaserc.yaml` whose `range` is the package's own current major (Inventory at 1.x carries `range: 1.x` on `release-2`), and protects it like main (pull request required, status required, the App on the bypass list). semantic-release's documentation lists maintenance branches of the `N.x` form, which release only inside their range and never a major; a branch named otherwise with a `range` property, and a prerelease on such a branch, are from my memory of the documentation and are unverified, and WF4's first story checks both before any branch is cut. Fixes land by pull request under the same title rule, and `compare-surface.sh` fails a pull request into it whose title carries `!` or whose `Surface.txt` loses or changes a line (public, stored-format or serialized-field), so a buyer who stays on a major never meets a break. The story is WF5's. If a game ships before the Core major has a stable tag, the branch is cut at the line release the game ships on and carries beta tags; if semantic-release will not release a prerelease on a maintenance branch, that is a decision for the developer (ship after the stable tag, or follow `beta` for that one release), raised when the check reports.

The commit rule, one line of bash used by the hook and by the pull request job:

```
pattern='^(feat|fix|perf|refactor|docs|test|build|ci|chore)(\([a-z0-9._-]+\))?!?: .{1,100}$'
```

The Story form, the part that makes it the build spec (excerpt; two fields are required, the rest invite detail without demanding it):

```
name: Story
description: Something you can show working at the end of a sprint
type: Story
projects:
  - Spellbound-Studios/13
body:
  - type: input
    id: outcome
    attributes:
      label: Outcome
      description: What someone can do when it is done
    validations:
      required: true
  - type: textarea
    id: verified-facts
    attributes:
      label: Verified facts
  - type: textarea
    id: regression-contract
    attributes:
      label: Regression contract
  - type: textarea
    id: done-when
    attributes:
      label: Done when
    validations:
      required: true
```

## The commit and version convention

Three sentences a person must remember: the pull request title is `type(scope): what changed`; a `!` before the colon means it breaks someone; the version is made by the release and is never typed.

| Title type | After the first stable release | Before it (`beta`) |
|---|---|---|
| `fix`, `perf` | patch | next `-beta.N` |
| `feat` | minor | next `-beta.N` |
| `!` or `BREAKING CHANGE` | major | next `-beta.N` |
| `refactor`, `docs`, `test`, `build`, `ci`, `chore` | none | none |

Why `beta` is not a workaround: semantic-release cannot release below 1.0.0 (its FAQ), and pre-1.0 is exactly the period the line spends rewriting every package, where nothing is kept for compatibility. A `-beta.N` version says what a `0.x` says, in a form the tool supports, and the day of listing becomes a merge instead of a decision remembered.

Release candidates and the final tag. Pull requests always land on `beta`, before and after the first stable release. A person merges `beta` into `rc` when the strangers should run: the release tags `v1.0.0-rc.1` (then `rc.2` on the next merge). The local gate (`run-strangers.sh <tag>`, on a machine with the Editors, one candidate at a time) runs the line tier in StrangersDev for the strangers that install that package, the Matrix when a bridge changed (area 7), and the soak with its fault matrix for Character, Inventory and Diagnostics, which is part of the definition of done of those three (area 3). Green posts a `strangers` status on the tagged commit. The first stable release, undated and after the games, is a person fast-forwarding `main` to that commit; the release tags the final version only if the commit carries a green `strangers` status, so a final tag never exists for a package the strangers did not pass. The release commit edits `package.json` and the changelog, so the final tag's tree differs from the tested one in those two files and nowhere else. Every repo is tagged: packages by the release, games and infrastructure repos by `tag-release.sh` (`v<bundleVersion>` for a game, an integer a person moves for `.github` and `Template`, as a record only: no caller names it).

The catalogue line. At the final tag the local gate attaches one line to the GitHub release, and `update-catalogue.sh` opens a pull request that adds it to `Catalogue.txt` in the org repo. The file is one tab-separated text file, one line per package, nine fields in this order: id, name, kind, status, note, job, install address, known-good tag, Core range. There is no store column until a listing exists. Shell cannot safely read `Identity.asset`, so the line is printed by an operation of PackageCheck, `packagecheck catalogue-line --tag <tag>`, which this area asks living to add (request to living). The release has no Asset Store step: the pack script is WF6 and runs only when a listing exists.

The tag gate. The release refuses a final tag whose major differs from its branch's (a `release-2` entry releases only the range it names; `main` releases the next major above every maintenance branch), and refuses one whose `Surface.txt` differs from the previous final tag of the same major by anything but added lines; both are `diff` on files in the repository and need no Editor, and Living's V3 is the same compare run on the maintenance branch's pull requests. The promise to a buyer (decided 22) and the rule that a renamed serialized field after first ship is a major (decided 24) are enforced here, in Living's rule and the release check, and nowhere else.

The bump must cover the surface. After a package's first stable release, `compare-surface.sh` diffs `Surface.txt` between the last tag and the pull request: a removed or changed line needs `!` in the title (major), an added line needs at least `feat` (minor). Stored-format lines, one per type Core's packing registers with its layout hash, count like public lines: a changed or removed one needs `!`. Serialized-field lines, one per Unity-serialized field of a type that implements the authoring contract (Living's section of `Surface.txt`), count the same: after a package has shipped to customers a renamed or removed field is a major, because semantic versioning says so, and the release check fails a lower bump (decided 24); before the first customer the comparison only informs. It runs on the pull request, where the title can still be fixed, and again inside the release before it tags, which fails when the implied bump is lower than the bump the commits made. Before it, it only prints. The comparison is `diff` on a file already in the repo and needs no Editor; that `Surface.txt` is current is PackageCheck's V3, which the release requires as a green status from the local gate. Shell cannot compute a layout hash, so the equality of each stored-format line's hash with the fingerprint a saved section header carries is checked by `packagecheck surface` in `run-local-tests.sh`, which needs Core's packing to expose the layout description both the surface writer and the header read (living's claim on Core); the author runs it and posts the `unity-tests` status before asking for review, so a hash edited by hand or a layout changed without regenerating the file never reaches review green. The local gate also attaches the text of `core help --all` to the GitHub release of every candidate and final tag, and the release diffs it against the previous release's, so a removed or renamed operation shows as a visible major change (area 2); that diff happens at candidate and final tag, not on a pull request. At the same two points the release runs Living's scan of the first line of every file it ships for a `%UNITY` directive newer than the oldest supported editor, and stops on a hit (decided 25); the scan's code is Living's and this area only calls it.

Baselines: a package already public above 1.0.0 gets a tag at its current version on its last commit before the rewrite (Core: `v1.1.9`), so the rewrite releases as `2.0.0-beta.1` and then `2.0.0`, and never as a version lower than the one buyers hold. Every other existing package is at `0.x` and untagged: its first release is `1.0.0-beta.1`, which Unity orders above its `0.x`. Controller and Chat are replaced by new packages (StateMachine, Character, Switchboard) that start at `1.0.0-beta.1`.

The release train, a rule of the line (decided 22). A major about every 12 months; buyers of the previous major are offered the upgrade at a reduced cost (the amount is the developer's business choice, not designed here); and inside a major a year of bug fixes, maintenance and no API break. The pipeline makes the third part mechanical: after a package's first stable release every pull request is judged by the surface comparison above, and a pull request into `release-<major>` may carry no `!` and no removed or changed surface line.

Following, three roads, none of them a pin. A project the studio works in follows a branch: `beta` before a package's first stable release and `main` after it, so the games and the Saboteer demo follow the package branches. A game that has shipped to players follows the maintenance branch of the Core major it shipped on (`release-2`), never `main` (decided 23). A buyer installs a released tag: the window writes `#v<known-good tag>` from the catalogue (decided 22). Unity records the commit hash in the lock file and moves it only on a new `Client.Add` (Unity manual), so the window's Update button re-adds the line. Tags are written by every release; no pull request moves a game to one, `consumers.txt` does not exist, and two people updating at once meet the lock file as any other file.

Bridge ranges and dependencies: a bridge assembly's `versionDefines` range (line rule 2) is edited by hand and checked by area 7; this area only makes sure the matrix exists. Package `dependencies` in `package.json` are exact versions (Unity manual), so a Spellbound package declares Core only once the line's sprint 1 test says Unity accepts it; the template leaves the field empty and the structure check says why.

## Business practice

What the studio adopts for the business side, each with what it costs. None of it is code.

| Practice | What it is | Cost and lead time |
|---|---|---|
| Enrol as a UPM publisher | Portal enrolment, identity verification, DUNS number for an organisation, publisher namespace verified by domain, the legal name: one story the developer owns, undated, outside the epics | Unity answers in five to seven business days; no milestone waits on it, because the games are the milestones |
| One legal name | `LICENSE.md` says "Spellbound Studio Inc.", `package.json` says "Spellbound Studios", the funding file says "SpellboundStudiosInc" | One string in the template; part of the developer's enrolment story. The copyright line carries no year and the name `Spellbound Studios` |
| A license per package, from the template | Open packages carry the permission text Core carries; paid packages carry the store's terms | Six packages have no license file today; Unity requires one when `license` is absent |
| Namespace and id | The publisher namespace becomes part of every technical name, and the folder and `name` must equal it | If the verified namespace is not `com.spellboundstudios`, every id changes. Unverified, a question for the developer |
| Core on the store as well as on GitHub | The window's git route needs a Git client on the buyer's machine (Unity manual); a free store listing of Core is the route without one | Needs enrolment first; unverified that the store takes it |
| Support routine | `SUPPORT.md`, a bug form with an environment block, a first-response time we promise | An hour to write; the promise is a business choice |
| Supported Unity | The floor is 6000.3; the studio edits on 6.4 (line rule 5; no epic waits for 6.7), printed on the listing and in the pair matrix | Needs the local gate on the studio's Editor and a 6.3 Editor for the floor compile and the 6.3 test row |
| Release calendar | Releases on sprint boundaries unless a fix is urgent; the board's Sprint field already exists. The 12-month cadence of the release train is a target the calendar shows (a line release about every 12 months) and no check or gate fails on it; the reduced upgrade price is a term of the listing and no machine checks it | None |
| Release train | A major about every 12 months, buyers of the previous major offered the upgrade at a reduced cost, a year of fixes and no API break inside a major (decided 22) | The amount of the reduced cost is a business choice; whether the Asset Store has an upgrade price for a UPM product is unverified |
| Documentation | The store and the package manager both link documentation; `Documentation~` is its source and the docs site follows the final tag | One workflow |
| Listing text and screenshots | Undated, after the games. Assembled from the package's own files; screenshots captured from the sample scene | They never drift from the code |

Not covered: pricing, tax, invoicing, refunds, legal review of the license wording. They are business decisions and I have no design to offer.

## What a buyer writes, gets for free, can replace, and what the editor gives them

This area adds no package, so the table covers what every package carries because of it, and the two places it touches Unity code.

| Package or assembly | A buyer writes | Gets for free | Can replace | The editor gives them |
|---|---|---|---|---|
| Every library, from the template | Nothing from this area | A `README.md` in fixed section order (what it is, install, first hour, front door, operations, costs, license), a `CHANGELOG.md` the release writes, a `LICENSE.md`, a `Documentation~/index.md`, an `AGENTS.md` so an agent knows the package, an identity asset and a committed surface file, the `<Name>Kit` front door with its operation group, `Samples~` the package manager can import, a version that means something | Every file, because they are text in the buyer's copy of the package | The Package Manager shows the changelog, documentation link and samples from `package.json` |
| Core.Editor, the Spellbound window (touched, designed by area 7) | Nothing; picks a package and presses Install | Install and update by git URL and tag, the catalogue the release updates at each final tag (one public text file the window fetches from GitHub for good, caches and draws offline, area 7; no tag query per package; Unity already requires a Git client for git dependencies) | The source table the window reads is data in Core.Editor; a studio with a registry replaces the install call | Installed version beside the catalogue's known-good version, the changelog of the newer tag, a "Report a bug" button that opens the Bug form prefilled |
| Core, `core about` (touched, designed by areas 2 and 7) | Nothing | One line per installed Spellbound package with its version, plus Unity version and render pipeline, pastable into a bug | Nothing to replace; it reports | The same text in the window's "Copy support info" |
| Studio.Tools | Nothing | The editor-side house operations stay Unity code; the workflow scripts are not Unity code and live outside it | Not sold | |

A stranger who never reads the workflow sees only the files above and the version. The farming sim, the racing game, the card game and the underwater game are indifferent to everything else here, which is the point: none of it compiles into their game.

## The homes test and the stranger test, written out

Homes procedure from `Homes.md`: separate type from value, then Library, Studio, Game. Workflow files are not types in a package, so the first question is whether any stranger would want the thing. None would pay for our commit rule, so none of it is Library. It is Studio-owned and, because it is not Unity code, it cannot sit inside a Unity package. That is a gap in the line, raised as claim 1 below.

| Thing | Type or value | Library? | Studio? | Home | Stranger test |
|---|---|---|---|---|---|
| Issue forms, pull request template, `SUPPORT.md`, `CONTRIBUTING.md`, the onboarding checklist | Values | No: strangers do not file against our board | Yes, identical in every repo | The org `.github` repo (public; GitHub reads defaults from it) | Contains no game noun; the bug form is the one a buyer sees, and says nothing about us beyond contact |
| Reusable workflows `check.yml`, `release.yml`, `pull-request-title.yml` | Mechanism of the studio | No | Yes | The org `.github` repo | Nothing a buyer runs |
| `Template` repository | A skeleton of values | No | Yes | A new private repo `Template`, kind: studio infrastructure | The skeleton it makes contains no game noun; names come from the init script |
| `initialise-package.sh`, `adopt-repository.sh`, `sync-template.sh`, `check.sh`, `check-commit-message.sh`, `set-package-version.sh`, `kickoff-prompt.sh`, `render-issue-body.sh`, `pack-store-package.sh`, `tag-release.sh`, `compare-surface.sh`, `post-status.sh`, `update-catalogue.sh`, `sprint-report.sh` | Scripts | No | Yes | Written once in `Template`; copied into each repo as managed files (idea 17) | None ships inside `Packages/<name>`, so none reaches a buyer |
| The commit rule and the `beta` branch rule | Values | No | Yes | In the scripts and `.releaserc.yaml` | Not visible to a buyer; they see only a version |
| Board Area options and the Gates and Tokens fields | Values | No | Yes | Project 13 settings, recorded in the board README | Not applicable |
| Files every package carries (README, AGENTS.md, LICENSE, CHANGELOG, Documentation~, `.editorconfig`) | Skeletons inside Library packages | The shape is a convention every package shares; the content is the package's | | The package, filled from the template | The shipped skeletons hold no studio names; `check.sh` searches `Packages/<name>` outside the sample for the names of Studio packages (`Spellbound.Studio`), `Saboteer` and `Corsairs`, and the whole repo for the placeholder organisation `Spell-Bound-Studios`; the one address of the line text, read from `line-text-address.txt`, is the only mention of the organisation allowed there |
| The window's install source and `core about` | Mechanism | Every multi-package buyer wants them | | Core.Editor (area 7 designs) | A buyer with a registry replaces the install call; the list is data |
| The Unity release review issue and the sprint report | Rituals | No | Yes | The org `.github` repo (issue form and schedule), `Template` (script) | Not applicable |
| The store pack script and listing generator | Mechanism for us | No: only a seller needs it | Yes | `Template`, managed file | Not applicable |
| `Catalogue.txt` and its update at the final tag | Value (the format is area 7's) | No | Yes, our packages | The org `.github` repo, one file; `update-catalogue.sh` opens a pull request there | The window reads any file of that shape |
| `CODEOWNERS` naming the judgment fields | Value | No | Yes | `Template`, managed file | Not shipped |
| The local gate: `run-local-tests.sh`, `run-strangers.sh`, `post-status.sh`, the job list | Mechanism of the studio | No | Yes | `Template`, managed files; `StrangersDev` (its project, area 7) | Not shipped |
| The pull request action Send needs | Mechanism of the studio | No | Yes | The org `.github` repo (reusable workflow); a ten-line caller in `GameTemplate` | Names no game; branch prefix `art/` and commit subject only |
| The GitHub App and the repository settings list | Mechanism of the studio | No | Yes | The App belongs to the organisation; `repository-settings.sh` is a managed file in `Template` | Not shipped |
| The pointers to the line text | Values | No | Yes | Each `AGENTS.md`, form and pull request body links the org `.github` repo; no copy | Contains no game noun; `check.sh` fails a copy |
| `GameTemplate` | Skeleton of values | No | Yes | A new private repo, studio infrastructure | Contains no game noun; names come from the init script |
| The Move form and the Decision issue | Values | No | Yes | The org `.github` repo | Not applicable |

Every row has one home. There is no Library row with work in it other than what the line already placed.

## Epics

Ids are WF1 to WF8; WF7 is split into WF7a (before the Saboteer code freeze) and WF7b (after Next Fest). "Alone" says whether the epic delivers if nothing after it is built. Lines are my counts of the files each epic produces and the existing material it reads; the roadmap owner prices tokens and gates from them. Dependencies use the area keys: line, commandline, runtime, art, world, networking, living, unity, pathfinding, workflow, ui, roadmap.

| Id | Delivers | Depends on | Alone | Stories | Lines read | Lines written |
|---|---|---|---|---|---|---|
| WF1 One convention, one board | The org `.github` repo gains the issue forms (Epic, Story, Task, Bug, Move, Boundary sheet, Engineer onboarding, Artist onboarding, Decision), the pull request template, `SUPPORT.md`, `CONTRIBUTING.md`; the title rule script and hook; the board's Area options renamed to the line's packages (reusing option ids, as the skill requires); the Gates and Tokens number fields and a rewritten board README; `sprint-report.sh`; `render-issue-body.sh` and the roadmap skill's bodies aligned to the form labels; the Story form open to anyone on the team, with its blocked-by line so a story can wait on a written Decision issue; the reusable workflow that opens a pull request from a pushed `art/**` branch (title from the first commit subject, body from the commit body, reports its own failure as a Bug issue in `Roadmap`); **added:** the GitHub App the organisation owns for the release and pull request Actions (its permissions listed, its key an organisation secret, its first story confirming that checks start without the approval prompt on a pull request it opens); **added:** the repository settings list (protected default branch, squash with the title alone, delete merged head branches, the required `unity-tests` status, code owner review on the judgment fields, and in game repositories the ruleset that confines artists to `art/*`) with `repository-settings.sh` printing the lines for a person to type and the plan's limit on private repositories checked first; **added:** the pointers to the line text in the org `.github` repo from every form, template and `adopt-repository.sh` body, with `line-text-address.txt` and the `check.sh` rule that fails a copy; **added (checkpoint 5):** the ruleset that confines artists switched on in each game repository when art's A5a (the minimal Send) lands there, in the same sitting as the caller | Nothing; line (names) for the Area options; art (the branch prefix, the commit subject and the changed-files-only rule Send follows; A5a for the ruleset). Art's A5a in turn needs this epic's GitHub App, the Action and protected main, so those stories land before A5a ends | Yes, the day it lands for the team | 13 | 500 | 960 |
| WF2 Templates | First story, the probe: a scratch dev project with an embedded package at `Packages/<name>` proves Unity's `Samples~` import and test runner filter, git and Git LFS from the repo root, install by `?path=/Packages/<name>#<ref>` into a second project, and says whether a nested clone works and that Unity accepts the short folder name; then the `Template` repo with the standard dev project and the six parts every package ships (`Samples~`, the `<Name>Kit` front door with its `OperationGroup` line, the `AGENTS.md` skeleton, the presentation flag, `--requires` for Burst, Mathematics and URP, Saboteer's LFS patterns rewritten under `Assets/_Project`); `initialise-package.sh` (the copyright line without a year in every C# file it writes); `scripts/setup.sh` (hooks path, stub skill install); the Artist onboarding form and the artist's `setup.sh` for `GameTemplate` (a check, not an installer), walked on a clean Windows machine from nothing installed to the project open in the named Editor, and on a Mac; thin callers; root `AGENTS.md` and `CODEOWNERS`; `managed-files.txt` and `sync-template.sh`, `update-skeleton.sh` and `skeleton-version.txt`; `GameTemplate` with the stub skill install and the art pull request caller; proven by creating the first new package of the line from it | line (the decided layout); commandline (the shipped `AGENTS.md` headings and the grammar; the skeleton can start with headings only); living (the skeleton version, the identity asset, the copyright header line, the folder name). Art's A5a needs the Artist onboarding form and the artist's `setup.sh` from this epic, because A5a reports a missing git or large-file tool only as the failing command's message (art's claim W9), so both land before A5a ends | Yes: new packages and games can start from it | 9 | 680 | 1,040 |
| WF3 Checks, adoption and the local gate | `check.sh` (the shell rules, including the one that fails a Studio package embedded in a game, and a driver that calls `packagecheck check` through the Unity CLI when an Editor is present), the reusable `check.yml` and `pull-request-title.yml`; `adopt-repository.sh`; the pilot adoption of Inventory, then the other ten repos as one story of ten pull requests; the local gate (`run-local-tests.sh`, `run-strangers.sh`, `post-status.sh`, the job list: PackageCheck read and run tiers, UI's edit and play tests, Networking's simulation with fixed seeds, `artpipeline check` on changed models, `core validate` when a definition changed, `core ledger` when the editor or a package version changes, the command line scenario, the floor compile on 6000.3 and the 6.3 test row, no longer waiting for 6.7, and a throwaway copy for any alpha or newer Unity); the judgment-field review job; the runner spike, one story with a written go or no-go | WF1, WF2, living (the content of the checks), unity (the Editor versions) | Partly: the title check works at once, the Unity jobs wait on living | 10 | 1,580 | 990 |
| WF4 Releases from commits | Reusable `release.yml` (the App's token), `.releaserc.yaml` with `beta` and `rc`, `set-package-version.sh`, the baseline tag for Core, the promotion rules, release notes; the surface-bump comparison with stored-format and serialized-field lines counted like public lines, Living's scan for a file saved by a newer Unity run before the tag, and the `core help --all` text stored per release; the `strangers` status required for the final tag; the tag gate (a final tag whose major is not its branch's, or whose surface differs from the previous final tag of that major by more than additions, is refused); the catalogue line of nine fields written at the final tag from `packagecheck catalogue-line`; the first release of one pilot package (Inventory, 4 commits, the smallest) with its Actions minutes, install time and `run_tests` time measured; every package after; the install URL form handed to living's window (a branch for a game, the maintenance branch for a shipped game, the known-good tag for a customer's copy); the unverified tool behaviours checked first (the second prerelease branch, and the maintenance branch's name and range) | WF1, WF3; living (the catalogue, the surface file with its stored-format section) | Yes | 12 | 1,020 | 830 |
| WF5 The release train | Release order (Core first) and one command for a line release; the pair matrix as a release artifact; the candidate tag starting the StrangersDev run; `drift-report.sh` filing the drift as an issue (run by hand until the runner spike says a nightly is worth a machine). **Removed:** `consumers.txt` and the rolling bump pull request, because nothing is pinned; **added (checkpoint 5):** the maintenance branch `release-<major>` for a shipped major (its entry in `.releaserc.yaml`, the pull request guard that refuses `!` and any removed or changed surface line, and the check that a shipped game's manifest line names it), dated to Saboteer's first Steam release built on the line; **added (second claims list):** the line release cuts `release-<major>` in every repository of the line when a Core major's tags are made and protects it like main (settings through `repository-settings.sh`) | WF4; living (the bridge pair check, StrangersDev; the window's following mode; V3 and the tag gate) | Yes, after WF4 | 6 | 520 | 380 |
| WF6 Selling | Undated, after the games: the Asset Store check of Networking with an undeclared, gated PurrNet (run when a listing is planned; a failure is a question for the developer), the license and legal-name pass, `pack-store-package.sh` (which names the folder for the store's technical name), the listing generator, screenshots through the Unity CLI, the docs-follow-the-final-tag workflow publishing `Documentation~`, the support routine live, the bug button URL prefill. Enrolment itself is the developer's own undated story, not in this count | WF4; commandline (Unity CLI commands); the developer's enrolment story | Yes, per package that is listed | 7 | 500 | 600 |
| WF7a Saboteer adopts the files | Saboteer adopts the template files, the title rule and a protected main (no game code and no scene is touched), and `tag-release.sh` tags the Next Fest demo build after `deploy-steam.py` with generated notes; the demo follows the package branches and nothing is pinned. Lands before the code freeze that starts in mid January 2027 (estimated), after which only bug fixes and media change and the build scenes are frozen. **Added (checkpoint 5):** the freeze rule, filed as a Decision issue a person closes with text: a change to a branch Saboteer follows that can break its build waits on a side branch inside the freeze and merges after Next Fest; the one named now is Modifiers' move onto the definition contract, on `definition-contract`, merged on 2 March 2027 (estimated) with whatever Saboteer needs, with `beta` merged into the branch at the end of each sprint | WF1, WF2; roadmap (the freeze date, the merge date); the owner of Modifiers' move | Yes | 3 | 130 | 130 |
| WF7b Games ship the same way | After Next Fest: Corsairs adopts the template files, the title rule and a protected main, and normalises `bundleVersion` (`0.5.04` becomes a valid version); both games replace ParrelSync with Multiplayer Play Mode (a manifest change the game sessions make; unity names the versions); both games hold the art pull request caller; **added (checkpoint 5):** `tag-release.sh` attaches the file list of the shipped build folder to the release and prints whether the Microsoft C++ runtime files of a Windows 6.7 build are in it, so the Steam upload includes them or the copy is switched off deliberately (BuildPipeline's choice, recorded in the release; whether a Windows 6.7 build ships them and whether the upload includes them is found first by unity's U9 story 2, on a copy); **added (second claims list):** `scripts/pre-deploy-check.sh` in `GameTemplate` runs Living's `packagecheck release-scan` over the project's text assets and stops on a `failed:`, and BuildPipeline's `deploy-steam.py` calls it before it runs `steamcmd` (the one edit in that repository) | WF1, WF2, WF7a; unity (the 6.7 move, MV; U9); living (`release-scan`) | Yes | 5 | 400 | 280 |
| WF8 Rituals | The scheduled Unity release review issue (opens when Unity ships a release, where the ledger check opens when our own Editor version changes), a per-sprint line review issue and the retrospective form | WF1; unity (the table and the ledger); roadmap (the units) | Yes | 3 | 200 | 250 |

Totals: 68 stories, about 5,500 lines read, 5,450 lines written, almost all YAML, bash and Markdown. The checkpoint 5 fold changed the table of checkpoint 4 (62 stories) by: WF1 +1 (the artist ruleset per game repository when A5a lands), WF5 +1 (the maintenance branch), WF7a +1 (the freeze rule and the side branch), WF7b +1 (the C++ runtime files listed in the release); WF2 is unchanged (no embedded-copy probe was ever a story here), WF3 and WF4 grew in content only. The second claims list adds WF5 +1 (the line release cutting and protecting `release-<major>` in every repository) and WF7b +1 (the pre-deploy scan): 68 in all, WF1 13, WF2 9, WF3 10, WF4 12, WF5 6, WF6 7, WF7a 3, WF7b 5, WF8 3. The checkpoint 4 fold before it: WF1 +3, WF5 -2, WF7a rewritten without the pin. Milestones for the roadmap: WF1 to WF5, WF7a and WF8 serve the Saboteer milestone (WF1 and WF2 are needed before L3 starts; WF1's ruleset story waits for art's A5a), the WF5 maintenance story is dated to Saboteer's first Steam release on the line, WF7b serves the Corsairs milestone, WF6 is undated. WF1 can start on 2026-11-02 (estimated) with no gate.

The milestones. Saboteer on the line needs packages it can follow by branch, so WF4's first release is on its path and WF5 serves the line release; WF6, the first stable release, the store and enrolment are not, and no milestone waits on them. WF2 is a gate of L3, L4 and L5, because each creates a new package repository in its first story (WorldObjects, StateMachine and Character, Switchboard), and of Navigation's N1, which pathfinding starts in the first sprint from a repo made by the template. The probe and the first four WF2 stories after it (skeleton, initialise, setup, callers) must land before L3 and N1 start; the roadmap owner places them. N1's written go or no-go is a Decision issue a person closes with text, and N2's first story is blocked by it. L1 and L2 need none of it. Order inside this area: WF1 and WF2 first and in parallel; WF3 after both and after living; WF4; then WF5 and WF7a; WF7b after Next Fest; WF6 last and undated; WF8 beside WF3.

## Decisions

None open. The two questions of the last round are answered and are in Decided above: shared workflows at `@main` (21), and a released tag for a buyer with a branch for our games (22).

## Limits

- Unity-dependent checks (tests, the strangers, the soak, `artpipeline check`, bridge pairs on two Editors, a player build of a host project) run on a machine with the Editors and post a status; one machine runs one candidate at a time, so two candidates queue; the status is required by the repository settings where the plan enforces required statuses, and is a team agreement elsewhere (the pages I fetched on 2026-10-24 do not state which plan allows it on private repositories; WF1 checks). Rulesets are documented for Team and Enterprise; Core's exists on a public repository. The pointer to the line text is a public address by necessity (GitHub reads default community files only from a public `.github` repository), so whatever the hand-off puts there is public; that is the developer's decision 8 and is named here so it is a choice made knowingly. A hosted or self-hosted runner is the WF3 spike, not designed here.
- The merge rule leans on the Unity CLI, which the Pipeline package marks experimental (area 2's survey). `run-local-tests.sh` is the one place that names its commands, so a change in the CLI is one edit. Whether the CLI chooses an Editor version for the 6.3 test row is unverified; WF3 checks it, and Unity's own batch-mode test run is the fallback.
- The probe for `Packages/<name>` is unverified in every part: that git and Git LFS behave from the repo root with the package inside `Packages`, that a nested clone works, and that Unity accepts the short folder name. Until it reports, no repo is restructured.
- A pull request opened with the repository token gets checks that wait for a person to approve them; one opened with an App token does not (GitHub's page, fetched 2026-10-24). That this holds on our organisation is unverified until WF1's App story runs it.
- The artist's onboarding is read from documentation and the reviewer's finding, never walked: that Git for Windows brings Git Bash and Git LFS, that the clone opens a browser sign-in, that Unity Hub offers the named Editor and that a free Unity account is enough for an artist are unverified until the WF2 walk on a clean Windows machine.
- The nightly drift report has no machine until the runner spike says so; until then `drift-report.sh` is run by hand and files the issue.
- Saboteer's code freeze starts in mid January 2027 (estimated): bug fixes and media only, build scenes frozen. WF7a touches no game code and no scene and lands before it; everything else tagged Saboteer waits for the freeze to end. The demo follows the package branches, so a push to a branch changes the demo; that is the developer's decision, not a gap. A change that can break the build waits on a side branch and merges after the festival (decided 26).
- The Asset Store upload is the Editor's Uploader window; I found no documented command line, so the last step of a listed release is a person (a community batch tool exists and I did not evaluate it). It is undated and after the games.
- Generated release notes list titles. The API-level prose in today's changelogs (what a class does and why) is lost unless the title carries it.
- The release commit pushes to protected branches on the four public repos; the bypass for the organisation's App on a protected branch is unverified on this plan, and so is protecting a branch on a private repository at all (WF1's settings story checks both before any repository is called protected).
- Unverified and tested first in WF4: that semantic-release accepts a second prerelease branch (`rc`) beside `beta` and orders their versions; that a prerelease version string does not change how a bridge's `versionDefines` range matches; that a workflow can open a pull request on the org repo's catalogue file (it needs a credential with write access to that repo, which the App provides).
- The surface comparison reads `Surface.txt` lines: a renamed type shows as a removal and an addition, so it asks for `!`, which is correct, and a reordering is not a change because the file is sorted.
- Whether Unity accepts a declared dependency on a package installed by git URL is unverified; until sprint 1 says yes, packages declare no Spellbound dependency in `package.json`. Unity packages the sentence names (Burst, Mathematics, URP) are declared with exact versions.
- Whether the Asset Store accepts a store package that depends on another store product, or a free Core listing, is unverified.
- No measurement was taken: the Actions minutes one pull request spends, the time Unity takes to install a package from a tag (it clones the repository, which is a whole dev project; unverified) and the time `run_tests` takes on a cold Library are measured on the pilot in WF4 and recorded in `Status.md`. Sample assets stay small until then.
- The hook is a local git setting: a fresh clone that skips `scripts/setup.sh` has none, and a direct push to `main` on a private repo is blocked only if branch protection is available on the plan (unverified, WF1). The pull request title check and a post-merge audit of subjects are the backstop.
- Everything lives on GitHub. Tags, releases, issues and the board are exportable; the Actions workflows are not portable. The organisation was renamed once already and the org name sits in manifests, `package.json` author URLs and `uses:` lines; `check.sh` fails on the old placeholder `Spell-Bound-Studios`, and whether `uses:` survives a rename is unverified.
- The studio's agents never commit, tag or release (the developer's hard rule). They run `check.sh`, `run-local-tests.sh`, `kickoff-prompt.sh`, `render-issue-body.sh` and the release dry run, and print what a person should type, including the line that posts a status. Delivery by an agent end to end is not offered.
- Twenty-two repos each hold ten-line callers, and a change to a reusable workflow reaches all at once, good and bad. Callers name `@main` of the org repo (decided 21); the org repo's own main is protected, so a change reaches the 22 only after its own pull request passes, and nothing is held. A bad merge still stops every check until the next fix.
- The maintenance branch `release-<major>` is built when Saboteer ships its first Steam release on the line (WF5, dated by the roadmap), and is cut in every repository of the line at once. Its name, its `range` entry and semantic-release's refusal of a major on it are unverified until WF4's first story. How long it takes fixes after the next major ships is the line's (claim on line).
- Business practice stops at the list above. Revenue, tax and legal work are not designed.
- What the fold left for a spike or a probe: the App's checks and permissions (WF1), protection of a branch on private repositories (WF1), the short folder name (WF2's probe), the Editor choice of the Unity CLI for the 6.3 row (WF3), the runner (WF3 spike), the maintenance branch's name and range (WF4), the walk on a clean Windows machine (WF2).
- A game that follows a branch has a lock file that records one commit hash; two people pressing Update at different times meet that file in a merge like any other file (decided 2026-10-24: conflicts are handled as always).
- A shipped game follows `release-<major>`, so a fix reaches it only by a pull request into that branch; a fix made on `main` is not carried over by anything automatic, a person ports it, which costs a review twice. Unmeasured.
- The Microsoft C++ runtime files of a Windows build on 6.7 are from the Unity reader's note (`UnityChanges.md`, page 8), not from my reading. `tag-release.sh` lists them; whether a build ships them and the upload includes them is found by unity's U9 story 2 on a copy, and the choice is BuildPipeline's. I read `deploy-steam.py` and `steam.py` on 2026-10-24: the deploy cleans the build output, writes the VDF scripts and runs `steamcmd`, so the scan has one place to be called before it; I did not run it.
- A throwaway copy of a dev project is its working tree without `Library`; a project whose large files Git LFS fetched copies them too. The disk and time cost is unmeasured.

## Claims on this area, answered

Ten claims from seven areas, 2026-10-23. None contradicts the approved line. Seven needed an Editor in CI, which this file had ruled out for hosted runners, so they share one decision, now answered (decided 6): the local gate.

| From | Claim | Verdict | What changed here |
|---|---|---|---|
| commandline | Store and diff `core help --all` per release; template carries the `AGENTS.md` skeleton and the `OperationGroup` line; CI drives CL8 with the Unity CLI; stub skill install in the new-project template | Accepted; CL8 amended | Text attached to each candidate and final release and diffed there (WF4); skeleton, `OperationGroup` line and `GameTemplate` with the stub skill install (WF2); CL8 runs in the local gate, since it needs an Editor (decided 6) |
| runtime | Headless soak on every candidate of Character, Inventory and Diagnostics; the fault matrix is part of their definition of done | Accepted; amended | Runs in the local gate on the candidate tag, and its green is part of the `strangers` status the final tag requires; "headless" is a batch-mode Editor, not a hosted runner (decided 6) |
| art | Commit message format of `GitLfsDestination`; `artpipeline check` in CI failing the pull request; Saboteer's LFS patterns as the baseline | Accepted; the CI part amended | The convention is `feat(art): <message>` (the pull request title rule); Send runs the checks before it pushes and the pull request body carries the verdicts; the reviewer's local run repeats `artpipeline check` on changed models; the pull request is opened by an Action in the org `.github` repo (WF1), not by a tool on the artist's machine; the baseline `.gitattributes` is in both templates |
| world | `Samples~` carries the seed preview and the golden world; each package keeps the six parts; Horizon carries `!UNITY_SERVER` | Accepted; the third amended | The template ships `Samples~` and all six parts; `initialise-package.sh --presentation` adds the `!UNITY_SERVER` assembly so no author writes the constraint by hand |
| networking | CI runs the protocol simulation in EditMode with fixed seeds on every pull request, with no network, second process or PurrNet | Accepted; amended | The simulation is an EditMode job in the local gate; whether it could run on a hosted runner depends on Networking's pure assembly being engine-free, which the line's L1 checks (Line, Limits) |
| living | Host the shell template, CI calling the same check, CODEOWNERS, candidate tags, tagging every repo, the catalogue and its update, docs publishing, the runner and cache for StrangersDev, the install source | Accepted; the runner is a spike | `rc` branch and tags, the `strangers` status, `tag-release.sh`, `update-catalogue.sh`, `CODEOWNERS` in the template, docs on the final tag, install by the catalogue's tag (WF2 to WF6); a runner is a spike (decided 6) |
| living | The bump must cover the `Surface.txt` diff after 1.0 | Accepted | `compare-surface.sh` on the pull request and again in the release (convention section, WF4) |
| unity | Multiplayer Play Mode replaces ParrelSync; the ledger check runs in CI on every editor or package change; a Move story template | Accepted; CI amended | A Move form (WF1); the ledger job runs in the local gate when `ProjectVersion.txt` or a manifest changes (WF3); the ParrelSync change is a WF7b story the game sessions make, with versions from area 8 |
| pathfinding | N1's go or no-go gates N2; N1 can start in the first sprint from a repo of the template | Accepted | A Decision issue form; N2's first story is blocked by it; WF2's first four stories gate N1 (epics section) |
| ui | The New View action and a Switchboard profile are templates area 10 can list; CI runs UI's edit and play tests | Accepted as a listing; tests amended | `GameTemplate`'s `AGENTS.md` names `ui new-view` and the console profile sample but does not own them (one sentence, one owner); UI's tests are a local gate job (decided 6) |

## Claims on this area, answered at checkpoint 4 (2026-10-24)

Seven claims. None contradicts the decided line. Two are accepted as they stand, five amended; one new question, answered at checkpoint 5 (decided 21).

| # | From | Claim | Verdict | What changed here |
|---|---|---|---|---|
| 1 | living (RedTeam 7.7 item 6) | The template's `.gitattributes` scopes LFS to `Assets/_Project`; `compare-surface.sh` treats stored-format lines like public lines | Accepted as is | Already in decided 18, the template tree and the surface paragraph. Living's I4 fails a pointer file under `Packages`, which is what makes the scope safe |
| 2 | art | The Action runs as the App; every main is protected; artists hold write and push only `art/<artist>-<slug>`; GitHub has no branch-only role; whether a ruleset can limit artists to `art/**` is Workflow's to verify | Amended | Verified on GitHub's rules and rulesets pages: "Restrict creations" and "Restrict updates" on every branch except the pattern, bypass for the maintain role, admins and the App, and not the write role. The pattern is `art/*`, because `*` does not match `/` and Send's branch has no deeper level. Written in "The repository settings, whole", decided 19, WF1. Whether the plan allows it on private repositories is unverified |
| 3 | art | `setup.sh` installs nothing; the Artist form installs Git for Windows, Unity Hub and the Editor; the sign-in is the clone's; the merger of an artist's pull request runs the Unity tests first with `artpipeline check` in the run | Accepted as is | Already written in "The artist's way in", "The artist's `setup.sh`" and the `run-local-tests.sh` paragraph; the walk on a clean machine stays WF2's |
| 4 | living | The template's setup protects main on every repo (no direct push, the author's posted Unity status required, code owner review on judgment fields); the release, catalogue-line, pull request and sync-template Actions run as the App | Amended | The settings are printed for a person to type by `repository-settings.sh`, not applied by `setup.sh` (a clone-side script that holds no administrator credential, and an agent never holds the App's key). The required `unity-tests` status and code owner review are in the list but enforced only where the plan allows, a team agreement otherwise, and `check.sh` reports which. All four named Actions use the App's token (WF1, WF4) |
| 5 | living | The root `AGENTS.md` and every package's Rules heading point to the line text in the org `.github` repo and carry no copy; rule A3 checks it, with the address as one value | Amended | The address is one value in the managed `line-text-address.txt`; the root `AGENTS.md` is managed so it cannot drift; a package's Rules heading is living's A3, and `check.sh` supplies the copy test. My studio-name search would have failed the pointer itself, so it now looks for Studio package names and excepts the address. The shipped pointer is a public address; the line text there is public by decision 8 |
| 6 | living | Drop the check against a branch in a manifest and the bump pull request that moves a pin; the template references PackageCheck by branch, not tag | Amended | Both already gone since the fold (decided 12, idea 9, WF5). New: the template's PackageCheck line names a branch, `skeleton-version.txt` records where the copy came from and holds nothing, and the callers' `@v1` became `@main` at checkpoint 5 (decided 21) |
| 7 | living | `compare-surface.sh` treats stored-format lines like public lines; the layout hash in `Surface.txt` equals the fingerprint a saved header carries; the author runs the Unity tests and posts the status before review | Amended | The shell diff covers the first half. The hash equality needs Core's layout description, so it is `packagecheck surface` inside `run-local-tests.sh` (living's operation, Core's exposure), not shell |

## Claims on this area, answered at checkpoint 5 (2026-10-24)

Seven claims from RedTeam 8.8, two in the first pass and five in the second. None contradicts the decided line or a developer answer.

| # | From | Claim | Verdict | What changed here |
|---|---|---|---|---|
| 1 | roadmap (8.8 item 5) | The artist ruleset on a game repository is switched on when A5a, the minimal Send, lands there, a story inside WF1 | Accepted as is | A WF1 story (13 stories): the ruleset of "The repository settings, whole" is typed in each game repository in the sitting where A5a's caller lands, so no ruleset exists before a Send that can use it. A5a is estimated to run 2027-03-09 to 2027-03-12, after the demo build, as the hand-off roadmap dates it (step 15), so none of these prerequisites enters the train before the freeze |
| 2 | unity (8.8 item 8) | Windows builds in 6.7 copy the Microsoft C++ runtime files into the build folder, so the Steam depot and the BuildPipeline upload include them or the copy is switched off deliberately; the throwaway-copy rule for any alpha or newer Unity | Amended | Two parts. The throwaway copy is in `run-local-tests.sh` (decided 28): the script copies the project without `Library`, opens the copy and refuses the working project in a newer Editor. The C++ files: this area owns `tag-release.sh`, not the upload, so a WF7b story makes it attach the build folder's file list to the release and print whether those files are in it; the choice (include them or switch the copy off) is BuildPipeline's, recorded in the release. I did not read BuildPipeline's upload script, so the claim on unity names the choice and the roadmap's MV owns it |
| 3 | commandline | The release check and Living's rule carry the release promise to a buyer and the rule that a rename after ship is a major; `run-local-tests.sh` keeps treating any `failed:` from `core validate` as a failed run | Accepted as is | Both are already written: the promise is decided 22 and the tag gate and surface comparison enforce it (convention section), the rename rule is decided 24, and `run-local-tests.sh` stops on a `failed:` from `core validate` (checkpoint 4 claim 21). The tag gate paragraph now says the promise is enforced there and in Living's rule and nowhere else |
| 4 | art | The artist ruleset switches on in a game repository when A5a lands there, so the Artist onboarding form and the template's `setup.sh` must exist by then (A5a reports a missing git or large-file tool only as the failing command's message, claim W9); the App, the Action and protected main are needed for A5a, which ends after the demo build | Accepted as is | Stated as a dependency of WF1 and WF2 on art's A5a, in the epic table and in the claim to art: the form, `setup.sh`, the App, the Action and protected main land before A5a ends (estimated 2027-03-12, after the demo build, not before the freeze). No story is added; the roadmap owner orders them |
| 5 | world | StudioDev holds the studio's gym profile with a playable character so Edit terrain and the gym run there; the probe of an embedded Studio package and the Edit here and Stop editing buttons are withdrawn, and nothing in the world area relies on them | Accepted as is | Matches decided 27: Studio packages are edited in StudioDev only and `check.sh` fails an embedded copy of one in a game. StudioDev is a dev project made from `Template` like any other. This file never held the probe or the buttons |
| 6 | living | The release pipeline cuts `release-<major>` in every repo of the line when a Core major's tags are made, protects it like main and runs V3's compare there; the tag gate refuses a final tag whose major differs from its branch or whose surface differs from the previous tag of that major by more than additions; the release calendar holds the 12-month cadence as a target and no gate; the Steam build step calls `packagecheck release-scan` before upload; shared workflows are called at `@main` and the template check ignores the ref | Amended | Four parts taken, two shaped. The branch is named for the Core major but its release range is each package's own major, because a package at 1.x cannot release 2.x on it (semantic-release's `range`, unverified, WF4 checks first); the line release cuts and protects it in every repository (WF5, +1 story); the tag gate and the calendar target are in WF4 and the business table. The Steam step: BuildPipeline is a Python repository that runs `steamcmd` and is not mine, so `scripts/pre-deploy-check.sh` in `GameTemplate` runs the scan and BuildPipeline's deploy calls it before `steamcmd` (WF7b, +1 story). `sync-template.sh` and `check.sh` ignore the ref after `@`. One tension raised: a game that ships before its Core major has a stable tag needs the branch cut on beta tags, which semantic-release may refuse; the developer decides if the check says so |
| 7 | unity | U9 story 2 checks whether a Windows build ships the C++ runtime files and whether the Steam upload includes them, on a copy; the Unity 7 copy is a copy of a folder and the working project never opens in it | Accepted as is | Matches decided 28 and the throwaway-copy paragraph (the script copies the working tree without `Library`, opens the copy, refuses the working project). The finding of U9 story 2 feeds the choice recorded by WF7b's listing of the build folder |

## Claims round two (2026-10-23)

Thirteen claims. None contradicts the amended line. Two requests go to living.

| # | From | Claim | Verdict | What changed here |
|---|---|---|---|---|
| 1 | orchestrator | The AGENTS.md headings copied into the template follow living's six | Accepted | Purpose, Front door, Rules, Not for, Gaps, Ledger in the template tree and in WF2; the generated blocks are written by `packagecheck fix --rule A3`, not by the template |
| 2 | orchestrator | The sync script touches only shell-side files; state the list | Accepted, with a request to living | The list is in "The managed list". Living's file puts four of those paths in the skeleton; living drops them. LV3's harness test reads both lists |
| 3 | orchestrator, art | A template `setup.sh` for artists installing git and Git LFS only | Accepted in round two; changed at the checkpoint 3 review: the script installs nothing, the Artist onboarding form installs the tools | The artist's `setup.sh` at the root of `GameTemplate`, a new WF2 story |
| 4 | commandline | Store only the text of `core help --all`; no `core schema`, no field diff; the 6.3 row runs CL1 and CL2; the package template carries the six headings and the `OperationGroup` line | Accepted | The release attaches only that text; the 6.3 row names the fixtures; the template has both |
| 5 | runtime | R7b's soak runs through local Unity CLI test runs as the merge rule; the runner is a spike | Accepted | The soak runs inside `run-local-tests.sh` when a change touches Character, Inventory or Diagnostics, and at every candidate; duration unmeasured |
| 6a | art | W1 to W4: `feat(art)` format, a status for `artpipeline check`, the LFS baseline, the title rule | Accepted; W2 amended | The title rule accepts `feat(art)` and `fix(art)`; the baseline `.gitattributes` is in both templates; there is no separate status: `artpipeline check` is part of the one `unity-tests` status, because only an Editor can run it |
| 6b | art | W5: setup installs git and Git LFS and nothing else, fetches large files, prints missing pieces as sentences | Accepted | As claim 3 |
| 6c | art | W6: an Action opens the pull request from subject and body and reports its own failure; the repository deletes head branches on merge; artists can push branches | Accepted; artists pushing is decided (2026-10-24) | The Action files a Bug issue in `Roadmap` on failure; deletion is a documented admin setting turned on in game repos; artists push branches to the game's repository and main is protected |
| 7 | world | `Samples~` carries the seed preview and the neutral golden world; six parts per line rule 8; no old format read | Accepted | The template has `Samples~` and the six parts of rule 8 (Runtime, Editor, Tests, Samples~, operations, AI context); no script or sample here reads any stored format |
| 8 | networking | The Asset Store check of an undeclared, gated PurrNet is undated; the two games move to a PurrNet of 1.25 or later as N2's first story | Accepted | A WF6 story, run when a listing is planned; that move is N2's, and `GameTemplate` carries no PurrNet line |
| 9 | living | Dev project at `Packages/<name>`; install address `?path=/Packages/<name>#<tag>`; sync script follows; copyright header on every C# file | Accepted | Already the layout of this file; the probe stays the first WF2 story; the header is added to every `.cs` the template writes |
| 10 | living | The push gate compiles at the floor; no Asset Store step until a listing exists; the two managed lists disjoint with a harness test in LV3 | Accepted | The floor compile was already a gate job and no longer waits for 6.7 (no epic does); the release text says there is no store step; the lists are in "The managed list" |
| 11 | living | The catalogue is one tab-separated file of nine fields written at the final tag; no store column | Accepted, with a request to living | "The catalogue line" in the convention section; the release needs `packagecheck catalogue-line`, which living adds or answers otherwise |
| 12 | pathfinding | N1's written go or no-go is a gate on the roadmap | Accepted | Already a Decision issue that blocks N2's first story; the roadmap owner places it |
| 13 | ui | The 6.3 row runs UI's logic tests and play-mode element tests with the UI Test Framework (test-only); local Unity CLI runs are the merge rule until the runner spike | Accepted | In the local gate paragraph; the probe also checks that an embedded package's tests show in the Test Runner |

Requests to living, for the orchestrator to carry: (a) remove `.github/workflows/`, `CODEOWNERS`, `.editorconfig` and `.gitignore` from the skeleton and its upgrade row, because the sync script owns them; (b) add `packagecheck catalogue-line --tag <tag>` printing the nine fields; (c) state the skeleton version at each PackageCheck release so `update-skeleton.sh` can copy it into the template.

## Claims other areas must honour

| Target | Claim |
|---|---|
| line | No disagreement with the amendments. The rewrite can carry three statements as this file uses them: the install line is `?path=/Packages/<name>#<tag>`; before a package's first stable release it releases from a `beta` branch as `1.0.0-beta.N`, and Core, public at 1.1.9, gets a baseline tag and releases the rewrite as `2.0.0-beta.N`; rule 15's maintenance branch is `release-<major>`, a WF5 story dated to Saboteer's first Steam release on the line (checkpoint 5) |
| living | 1. The probe for `Packages/<name>` is the first story of WF2 and gates every restructuring; living recommended the full id as the folder name and the line says `<name>`, decided 2026-10-24: the short name, so the template and the install address use `Packages/<name>` |
| living | 2. The PackageCheck operations are spelled `packagecheck check --path Packages/<name>`, `packagecheck run-start --tier line`, `packagecheck run-status`, `packagecheck package-init`, `packagecheck gate`, `packagecheck surface`, run through `unity command spellbound_run --line "<line>"`; the flat spellings in `Living.md` are the wrong ones (the table in `CommandLine.md`) |
| living | 3. The template implements area 7's convention and `check.sh` runs area 7's checks as shell that prints plain text and exits non-zero; the Unity-dependent checks, including a player build of a minimal host project, run locally through `run-local-tests.sh` and post a commit status |
| living | 4. The template uses `Samples~`, which a git consumer's compile does not see; if the decision goes the other way the template follows. The template writes the copyright header line in every `.cs` file it makes; the text of the line is living's |
| living | 5. The window installs with `Client.Add("<url>?path=/Packages/<name>#<tag>")` using the catalogue's address; for a game the ref is a branch (nothing is pinned, decided 2026-10-24), for a customer's copy it is the catalogue's known-good tag (decided 22), and for a shipped game the maintenance branch `release-<major>` (decided 23); the catalogue's known-good tag is advice the window shows, detects a missing Git client and points to the store listing; `package.json` `version` is written only by the release |
| living | 6. Assembly references: the template ships no `.meta`, so references are by name at birth; the OpenAI opinion prefers GUIDs. Living picks one and the template follows. `Identity.asset`, the committed surface file and the documentation index are made by PackageCheck's init on the first open, because a ScriptableObject cannot be in a template that carries no `.meta` |
| living | 7. `--requires` writes Burst, Mathematics or URP into `package.json` with the exact versions of `managed-unity-packages.txt`; PackageCheck fails a package whose assembly references one it does not declare, and Horizon, Instancing and Volumetrics always declare URP |
| living | 8. The skeleton's version and upgrade are PackageCheck's; the template holds the shell-side files listed in `managed-files.txt`, and `sync-template.sh` never touches a file PackageCheck's upgrade owns; the two lists are disjoint. The floor compile and the 6.3 test row are local gate jobs that run living's checks on those Editors |
| commandline | 9. The template ships a package `AGENTS.md` skeleton and the `<Name>Kit` front door with one operation; commandline decides the sections and discovery. `core about` prints installed packages, versions, Unity version and render pipeline as plain text. Every operation this file names is in area 2's grammar, and `core check` resolving backticked operation lines in the template's `AGENTS.md` is what keeps them true |
| commandline, living | 10. Settled: living's six headings (Purpose, Front door, Rules, Not for, Gaps, Ledger); the template copies them |
| art | 11. Before A5a lands in a game repository the Artist onboarding form, the artist's `setup.sh`, the App, the Action and protected main exist there (WF1, WF2). Send pushes a branch `art/<artist>-<slug>` and writes the commit subject `feat(art): <message>` or `fix(art): <message>`, with the changed files and each verdict in the commit body; the Action in the org `.github` repo opens the pull request from them. The artist's machine needs git and Git LFS only and no GitHub tool; `artpipeline check` runs at Send and again in the reviewer's local run; there is no `art-check` status |
| unity | 12. Area 8's table of systems the line reinvents is a plain Markdown document the scheduled review issue links; the Editor versions for the floor compile, the 6.3 row and Multiplayer Play Mode are unity's to name |
| networking | 13. The protocol simulation runs in the local gate; if `Spellbound.Networking.Replication` is engine-free it could move to a hosted runner, which is the runner spike's to weigh, not a promise here |
| art | 15. The artist's first sign-in is the clone's, so Preflight's sign-in finding and A5's sign-in spike move from the first push to the clone; step 0 of the art scenario points at the Artist onboarding form (Git for Windows, Unity Hub, the Editor version, the clone line, `bash setup.sh`) and not at "the project the engineers gave them"; the Send tab's setup check keeps the large-file and git findings. Art edits its own file |
| roadmap | 14. Epics WF1 to WF8 with WF7 split (68 stories after the checkpoint 5 fold: WF1 13, WF2 9, WF3 10, WF4 12, WF5 6, WF6 7, WF7a 3, WF7b 5, WF8 3); the probe and WF2's first four stories gate L3, L4, L5 and N1; N1's go or no-go is a Decision issue that blocks N2; WF7a lands before the Saboteer code freeze of mid January 2027 (estimated) and WF7b after Next Fest; no pin gate and no demo branch; WF6 and enrolment are undated and after the games; the runner is one spike story in WF3; the board Area options change to the line's names; Gates and Tokens fields and `sprint-report.sh` land in WF1 before sprint 1 starts; the App, the settings list and the pointers to the line text are WF1 stories |

## Claims of checkpoint 4 (2026-10-24)

| Target | Claim |
|---|---|
| living | 16. The window writes a branch ref (`#beta`, then `#main`) into a game's manifest line and its Update button re-adds the line; the catalogue's known-good tag is shown as advice, never written for a game. A customer's copy writes the known-good tag and a shipped game the maintenance branch (checkpoint 5, decided 22 and 23) |
| living | 17. `compare-surface.sh` counts stored-format lines of `Surface.txt` like public lines, as asked in 7.7: a changed or removed one needs `!`, an added one `feat`; the template's `.gitattributes` scopes LFS to `Assets/_Project`, so rule I4 holds for everything under `Packages` |
| living | 18. The copyright line is `// Copyright (c) Spellbound Studios. All rights reserved.`, and the template writes it at the top of every C# file it makes |
| living | 19. New-package and adoption steps link the line text in the org `.github` repo; living's scenario does the same |
| art | 20. Send adds only the files the artist changed under the art folders, on a branch pushed to the game's repository whose main is protected; the Action opens the pull request; the artist's first sign-in is the clone's (7.7 item 8 stands) |
| commandline | 21. `run-local-tests.sh` runs `core validate` when a definition changed and treats any `failed:` as a failed run; the findings of Core's `IDefinitionCheck<T>` and every package's own checks arrive in that one report |
| roadmap | 22. (superseded at checkpoint 5: WF1 13, WF5 5, WF7a 3, WF7b 4, a total of 66) no pin gate, no demo branch, no `consumers.txt`; WF7a before the mid January freeze (estimated); WF7b after Next Fest |
| unity | 23. The Editor list of the local gate is data in `run-local-tests.sh`; the floor compile on 6000.3 runs now; the 6.7 beta probe project uses the same script |
| line | 24. Answered by the developer (answer 5, 2026-10-24): a buyer installs a released tag and our games follow a branch; both decisions stand and this file carries the release train as a rule (decided 22) |


## Claims of checkpoint 5 (2026-10-24)

| Target | Claim |
|---|---|
| living | 25. The window writes `#v<known-good tag>` for a customer's copy, a branch for a project the studio works in, and `#release-<major>` for a game that has shipped; the maintenance branch `release-<major>` releases only inside its range, and `compare-surface.sh` fails a pull request into it that carries `!` or loses or changes a surface line |
| living | 26. `Surface.txt` carries a serialized-field section for authored types; `compare-surface.sh` counts its lines like public lines after the first customer; the release calls Living's scan for a `%UNITY` directive newer than the oldest supported editor before it tags |
| line | 27. For the orchestrator: rule 17 says a Core major happens at most once per Unity LTS cycle and rule 15 says buyers hold the previous major for one LTS cycle, while answer 5 says a major about every 12 months with a year of fixes and no API break inside a major; the rules and the answer disagree on the length. How long `release-<major>` takes fixes after the next major ships is not stated anywhere. Rule 16 still calls the buyer's ref a checkpoint 4 question |
| roadmap | 28. WF1 13, WF5 5, WF7a 3, WF7b 4, total 66 then, 68 after the second claims list; WF1's ruleset story waits for art's A5a; WF5's maintenance story is dated to Saboteer's first Steam release built on the line; the `definition-contract` branch merges on 2 March 2027 (estimated), after the festival |
| commandline | 29. Modifiers' move onto the definition contract is done on a branch called `definition-contract` during Saboteer's freeze, and merges on 2 March 2027 (estimated); `run-local-tests.sh` runs `core validate` on it like any branch |
| unity | 30. A run on any Editor newer than a project's `ProjectVersion.txt` is on a throwaway copy made by `run-local-tests.sh`; the probe's own Unity 7 copy is U9's, the 6.7 beta probe uses the same script; the choice of including the C++ runtime files in the Steam upload or switching the copy off is MV's, recorded in the release by `tag-release.sh` |
| art | 31. A5a lands in a game repository with its caller and WF1 switches the artist ruleset on in the same sitting; A5a pushes `art/<artist>-<slug>`, the only shape the ruleset lets an artist create |
| world | 32. Studio.Content is edited in StudioDev only; `check.sh` fails a game repository that holds the folder of a Studio package under `Packages`, so the shared-place edit loop is StudioDev, push, Update |

## Against revision 4

Read after the draft above existed. Revision 4's `Workflow.md` and the OpenAI files `04-engineering-standards.md`, `05-roadmap.md` and `07-next-phase-proposal.md` are opinions. Where a row says "Took", the draft already agreed or changed because of it.

### Revision 4's Workflow.md

| Item | Verdict | Why |
|---|---|---|
| Conventional Commits and semantic-release in CI, never as a package dependency | Took | Decided by the developer; I checked what it cannot do (start below 1.0.0) and added the `beta` rule |
| Tags pinned in games, a branch pin is a smell | Took on 2026-10-23, reversed on 2026-10-24 | The developer decided nothing is pinned: games follow a branch, no bump pull request moves anything, and the structure check does not flag a branch in a manifest |
| Issue templates for Story, Epic, Bug in `Roadmap` and every repo | Took, moved | One copy in the public org `.github` repo, which GitHub applies to every repo without its own (documented); the forms set type and project, which revision 4 did not know |
| Story template holds the hand-off format | Took | Same fields; the form is also the input of a kickoff script |
| `PackageTemplate` repo applied by `new-package.sh` in BuildPipeline using `unity projects create` | Rejected in part | A GitHub template repo makes the repo and the dev project in one command with no Editor installed; BuildPipeline's job is shipping game builds (its README), so a package scaffold there gives it a second sentence. The template carrying a front door class, one operation, one meter and a sample is worth keeping, and is area 7's and area 2's content for the skeleton |
| A commit-message check inside the release workflow; no client hook because `husky` is third party | Rejected | Checking at release time finds the mistake weeks after it was made. A pull request title check plus a hook that is a plain shell script costs no dependency |
| The release script run by the developer, gating on the audit and the tests through the Unity CLI | Took the gate, moved it | The Unity-dependent half runs locally and posts a commit status (idea 16); the release itself runs in CI so it needs nobody's machine |
| `line.json` in `Roadmap`, a compatibility set | Rejected as written | It is a JSON file, and `Rules.md` forbids JSON. The same information is the matrix release artifact (plain text) |
| `package.json` declares Core by version for the Asset Store's resolution | Rejected until proven | Unity's manual says dependencies are exact versions and a git dependency cannot be named inside a package; whether a git-installed Core satisfies the declaration is the line's sprint 1 test |
| Cut: hosted CI ("two people, one machine") | Reversed | The `.github` repo already exists and GitHub hosts the pipeline (decided); everything that needs no Editor runs on a free Linux runner. What does need one stays local |
| Directions: rejected hand-maintained versions; rejected a Python versioning tool in BuildPipeline | Took both | Same reasons; my own-script option in the release tool question (decided 1) was a bash script and is laid out as a cost, not recommended |
| Business practice: cadence, changelog is the store release note, docs rebuilt from `Documentation~` | Took | And added what it missed: UPM publisher enrolment with its five to seven business day lead time, the namespace and legal-name facts, the pack script, the Asset Store folder-name rule |
| Known limit: "the developer named GitLab" | Closed | GitHub hosts the pipeline (decided 2026-10-23) |
| "Whether paid UPM packages can be sold is unconfirmed; the `.unitypackage` route stays" | Took the doubt, changed the fact | Unity's current publishing pages carry UPM revenue and sales sections; I verify at enrolment and keep the `.unitypackage` route as the fallback |

What revision 4 missed and this file adds: semantic-release's 0.x gap; squash by title; the Story form's `type` and `projects`; the public `.github` repo as the home of reusable workflows; the in-place adoption of eleven repos; the release being the only writer of a version; the Asset Store's folder and namespace rules; the dev project layout implication for install URLs; template drift and the sync that answers it.

### OpenAI opinion

| Item | Verdict | Why |
|---|---|---|
| `CODEOWNERS` naming an owner per package | Took, small | In the template; it asks the right reviewer for review |
| Decision records, one file per decision | Took, as the boundary sheet | The skill's boundary sheet is the decision record; the template puts the filled sheet in `Documentation~/boundary-sheet.md` so the why stays with the code |
| Changelog line per pull request under Unreleased | Rejected | The title is the line and the release writes the changelog; a second place to edit is how changelogs go stale (GeoForge's stops at 0.5.0 at 0.6.24) |
| Unity tests in CI through GameCI on GitHub Actions, Personal license credentials as secrets | Deferred | Its own cited page needs the license file, email and password as repository secrets, and a Unity job spends minutes from a 2,000 a month budget across twenty-two private repos (unmeasured). Idea 16 gets the same result from the Editor already installed, and a runner is the WF3 spike. `check.yml` is built so a Unity job is an added job, not a redesign |
| CI lint of `package.json` fields, asmdef references and namespace against folder | Took, forwarded | These are `check.sh` content; area 7 owns the rules |
| A player build of a minimal host project with the package installed as a game does | Took, forwarded | Part of the local Unity gate; catches editor code in runtime assemblies (the audit's `ImmutableAttribute.cs` finding). Claim 6 on area 7 |
| A private scoped npm registry such as Verdaccio; GitHub Packages does not fit because its npm registry needs `@scope/name` names | Taken as the registry option of the install source, then rejected (decided 2) | I did not verify the GitHub Packages claim; it is not needed for the recommendation |
| `release/1.x` maintenance branch for the previous major | Took at checkpoint 5, named `release-<major>` | The branch is a promise to keep old behaviour alive, and nothing is kept before a package ships to customers; the story is WF5's, dated to Saboteer's first Steam release on the line, when a game becomes a customer. semantic-release's default branches include `N.x` maintenance branches (its documentation) |
| `[MovedFrom]`, `[Obsolete]` windows of a quarter | Rejected | No shim of any kind before a package ships to customers; a breaking change means re-save, re-author, re-import. After a package ships, Unity's own policy applies: deprecate in a minor, remove in a major (Unity manual, package versioning) |
| Phases in quarters, effort in engineer-weeks | Rejected | Decided: tokens and gates |
| GUID references to assemblies | Left to area 7 | Claim 9; the template has no `.meta` so it cannot hold GUIDs at birth |
| Coverage targets 70 and 50 percent, API snapshot, analyzers for banned APIs | Not mine | Area 7's check, or later |
| Unity Build Automation for game player builds | Not taken | `BuildPipeline` defers CI builds by its own roadmap, and the public Steam branch is never auto-promoted |

## Red team

Mode: self, Sonnet 5.5, author the same session. I had no subagent tool, so no reader sessions ran. To counter defending my own draft I wrote the strongest claim of the draft under each lens first, then tried to break it. Lenses run: Ambition first, then Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap (all seven of `Review.md`). Skipped: none. Each finding is followed by what changed.

### Ambition

Strongest claim: conventions hold without policing because the title is the commit and the release writes the version.

1. Serious, the boldest version, an agent that takes a Ready story to a released package, is not on the page. Who: the developer wanting the line to ship itself. Break: every step that writes to git is a person's. Evidence: the global instruction "Never touch git ... He decides what gets committed". Not fixable by design, and not wanted: the Limits say agents run checks and print what to type. The delivery loop stops at a person on purpose.
2. Serious, templates rot. Who: a new package author in a year. Task: start a package from a template that now differs from the 22 repos that grew from the old one. Break: hooks, scripts, `.editorconfig` and the release configuration are copies. Evidence: the draft had only `adopt-repository.sh`, run once. Fixed: managed files and `sync-template.sh` (idea 17, WF2).
3. Minor, the check lived as a CI job an agent offline could not run. Fixed: the logic is `scripts/check.sh` in every repo and the workflows only call it (idea 6).

### Stranger

Strongest claim: none of this compiles into a buyer's game.

1. Serious, the window's git route fails for a buyer without a Git client. Who: a farming sim buyer on a fresh Windows machine. Task: install Core. Break: git dependencies need a Git client on the PATH (Unity manual). Fixed in part: Core also offered free on the store, window detects a missing client (claim 5, decided 2, business table). Could not fix: whether the store takes a free Core listing is unverified until enrolment.
2. Minor, shipped skeletons could carry our names. Fixed: `check.sh` searches the shipped folder for the names of Studio packages, `Saboteer` and `Corsairs` (the line text address excepted) and the repo for `Spell-Bound-Studios`.
3. No findings for a buyer with a private registry: the install call is the window's replaceable part.

### Scale

Strongest claim: reusable workflows make 22 repos cost what one costs. (The rolling bump half of the claim is withdrawn: nothing is pinned, so nothing is bumped.)

1. Withdrawn 2026-10-24: the finding was a review flood from bump pull requests; none exists now because nothing is pinned (convention section, idea 9).
2. Minor, one broken `@v1` of the org repo stops every pull request check. Fixed in Limits: the tag is moved by the developer, not floating. Superseded at checkpoint 5: callers name `@main` (decided 21) and the org repo's main is protected.
3. No finding for the MMO build: a dedicated server build installs the same tags; this area adds nothing to compile.

### Agent

Strongest claim: every step is a shell command an agent can run.

1. Serious, an agent entering a repo cold had no rules for it (title rule, never edit the version, how to release). Evidence: the template had only the shipped `AGENTS.md`. Fixed: a root `AGENTS.md` for working in the repo, distinct from the shipped one.
2. Serious, an agent could not file a story that matched the form. Evidence: `gh issue create` has `--type`, `--parent`, `--blocked-by` and `--project` but the page does not say it fills a form. Fixed: `render-issue-body.sh` prints the form's labels as headings (idea 18, WF1); the roadmap skill's bodies follow the same labels.
3. Serious, the scenario had agents doing git writes the developer forbids them. Fixed: scenario header and Limits say agents run and print, people write.

### Designer and artist

Strongest claim: the first story is easy to write.

1. Serious, the Story form had ten fields, hostile for a first story. Fixed: only outcome and done-when are required; the rest invite detail.
2. Serious, an artist cannot be asked to type conventional titles. Fixed as a claim on area 4 (claim 11): the tool writes the title.
3. Minor, a designer or artist reports a bug without a terminal. Fixed: the window's "Report a bug" button opens the Bug form prefilled with `core about`; GitHub documents prefill by URL query, the form-field keys are unverified (WF6).
4. Could not fix: the workflow assumes a terminal for everything except reporting and viewing. A designer's start-a-place path is area 5's, not here.

### Performance

Strongest claim: the checks are cheap and the free plan carries them.

1. Serious, the draft said the free plan gives "2,000 Linux-priced minutes" and measured nothing. Evidence: GitHub's page gives 2,000 minutes a month and per-minute prices, no multiplier. Fixed: wording corrected; WF4's pilot measures one pull request's minutes and the install time and records them. Unmeasured until then, and said so in Limits.
2. Minor, installing from a tag clones a whole dev project. Fixed in Limits: unmeasured, sample assets stay small until the pilot measures the clone.

### Time

Strongest claim: tags are the one record and everything else regenerates.

1. Serious, Core is public at 1.1.9 with no tag; a first `beta` release would be `1.0.0-beta.1`, lower than what buyers hold. Evidence: semantic-release starts from tags; there are none. Fixed: baseline tag `v1.1.9`; rule for 0.x packages (convention section, claim 3).
2. Serious, the organisation was renamed once and its name is in manifests, author URLs and `uses:` lines. Fixed in part: `check.sh` fails on the old placeholder; whether `uses:` survives a rename is unverified.
3. Minor, if semantic-release stops being maintained, the logic is in one workflow and `.releaserc.yaml`; tags and releases are the data and survive. No change needed.
4. Could not fix: GitHub is the host for everything; Actions workflows are not portable.

### Roadmap

Strongest claim: nothing in this area is on the line's critical path.

1. Serious, that claim was false. Who: the engineer starting L3 (WorldObjects). Task: create the package repo, whose first story is "repo from the template". Break: the template belongs to this area. Evidence: `Line.md` epics table, L3 and the sentence "Repo creation from the template is the first story of each new package's first epic". Fixed: WF2 split from the checks (WF3) so the template depends on the line alone and its first four stories gate L3, L4 and L5 (claim 13).
2. Serious, sprint 1 calibrates gates and tokens (decided) but the fields and report script were in a late epic. Fixed: both moved into WF1.
3. Minor, enrolment has a five to seven business day latency no epic shortens. Fixed, then superseded: it is the developer's own undated story outside the epics, and no milestone waits on it.

### Claims pass (second run, 2026-10-23)

Superseded in part: items 1, 3, 6, 8 and 9 assumed a self-hosted runner, which the developer's answer replaced with local Unity CLI test runs; read them with the checkpoint 3 round below.

Mode: self, Sonnet 5.5, author the same session; no reader sessions. Lens order: Ambition first, then the seven. Findings only where the amendments above broke something.

1. Ambition, serious: the boldest version of the local gate is a line that reports its own drift, and the first draft of WF5 only ran the nightly. Fixed: the nightly files its drift report as an issue (WF5), so the developer reads an issue, not a log.
2. Time, serious: the tag a buyer installs differs from the commit the strangers tested in `package.json` and the changelog, and a prerelease version string might change how a bridge range matches. Fixed in part: the difference is named; WF4's first story tests the range behaviour; unverified until then.
3. Scale, serious: one machine runs candidates one at a time, so two packages queue and a missed night is silent. Not fixable under the decided local gate; said in Limits.
4. Time, serious: with `main` fast-forwarded only from `rc`, a fix to a listed package would skip the strangers if someone pushed to `main`. Fixed: pull requests always land on `beta`, the release refuses a final tag without a green `strangers` status.
5. Agent, minor: an agent that cannot merge or tag must still know the next step. Fixed: `check.sh` prints "next: ask a person to merge `beta` into `rc`" when the beta is green; it never performs the merge.
6. Designer and artist, serious: an artist's pull request waits on the local gate, which is a machine that may be off. Not fixable under the decided local gate; the pull request template tells the artist that a missing `unity-tests` status means waiting for the reviewer, not failure.
7. Stranger, minor: the catalogue sits in the org repo, so a renamed organisation breaks the window's address. Fixed in part: the address is one line in a file the bootstrap holds (area 7); the sold copies keep the old one (area 7's limit).
8. Roadmap, serious: sprint 1 cannot wait for the Unity checks. Fixed: WF1, WF2 and N1 need no Editor job; only the local gate story in WF3 waits.
9. Performance, minor: the local gate's minutes per push are unmeasured, as before. Fixed: WF4's pilot also records the gate's time on a warm and a cold Library.

### Checkpoint 3 round (2026-10-23)

Mode: self, Sonnet 5.5, author the same session. I had no subagent tool, so no reader sessions ran; the attack is mine. Strongest claim first, under each lens, then the break. Lenses run: Ambition, Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap. Skipped: none.

1. Ambition, minor: the boldest version, a pull request that tests itself on a hosted machine, is the runner spike, and the page now says the plan does not need it. No change.
2. Stranger: no findings. Walked: a farming-sim buyer installing a package by `?path=/Packages/<name>#<tag>`, a card-game buyer reading the shipped `AGENTS.md`, a racing-game buyer opening `Samples~`. None of the new files compiles into a buyer's game, and `check.sh` still searches the shipped folder for studio names.
3. Designer and artist, serious: question 1 as first written said the author runs the tests, and an artist's pull request is opened by an Action from a branch the artist pushed, so no status would ever appear on it. Fixed: whoever merges an art pull request runs `run-local-tests.sh` first, and the question says so.
4. Agent, serious: `run-local-tests.sh` posts a status, which is a write to GitHub, and the studio's agents may run checks and print but not publish. Fixed: the script prints the result and the one `post-status.sh` line; a person types it.
5. Time, serious: the merge rule leans on the Unity CLI, which the Pipeline package marks experimental. Fixed in part: one script names its commands, and Unity's own batch-mode test run is the stated fallback; whether the CLI picks an Editor version for the 6.3 row is unverified and WF3 checks it.
6. Scale, minor: with no runner there is no nightly, so drift between bridge pairs is found only when someone runs `drift-report.sh`. Not fixable under the answer; said in Limits and in WF5.
7. Performance, minor: a local run on a cold Library costs a contributor real minutes, unmeasured. Fixed: WF4's pilot records the `run_tests` time on a cold and a warm Library.
8. Roadmap, serious: WF7 as one epic would have put Saboteer-tagged changes (Multiplayer Play Mode, the adoption of files) into the weeks before the demo of 11 February. Fixed: WF7a is files and a tag with no game code and lands before the freeze; WF7b waits for Next Fest.
9. Roadmap, minor: the probe gates WF2's other stories, and WF2 gates L3, L4, L5 and N1, so a probe that fails would stall four epics in sprint 1. Not fixable by design; the probe is the first story of the first sprint, and its fallback is the layout the line had before, `Assets/<name>`, whose three costs living measured in its survey.
10. Time, minor: the pull request Action's credential is a new secret in the organisation; if it is a personal token it expires silently. Fixed: the App is decided (2026-10-24).

### Claims round (2026-10-23)

Mode: self, Sonnet 5.5, author the same session; no subagent tool. Only breaks the claims caused.

1. Serious, two owners for the same files: living's skeleton upgrade and the sync script both rewrote workflows and `.editorconfig`. Fixed in this file by one list each; living must drop four paths (request to living).
2. Serious, the Template repo held a copy of the package folder that PackageCheck also owns, so two sources could drift. Fixed: `skeleton-version.txt` and `update-skeleton.sh`, the skeleton having one source.
3. Serious, the release could not safely write the catalogue line from shell. Fixed in part: it asks for a PackageCheck operation; unverified until living answers.
4. Minor, the artist's setup script assumed bash on a machine that may have none. Fixed in part: Git for Windows named in Onboarding; unverified on real machines.
5. Serious, the art pull request's checks wait for approval when opened with the repository token (GitHub documentation). Fixed: the Action runs as the organisation's App, whose pull requests run their checks without the approval prompt (GitHub's page; WF1 confirms).

Could not fix: the probe, the Unity CLI's Editor selection, whether checks start on a pull request the repository token opens, and the merge rule being a team agreement on private repositories. All four are stories or limits above, none is answered by reading.

### Answers to the revisited findings

1. Minor, the maintenance window had two lengths. Superseded: no maintenance branch is built now, and the first story for one is written when a package ships to customers (undated). The remaining gap in Line rule 15, which names an LTS cycle but not its end date, belongs to the line owner; I do not edit `Line.md`.

### Checkpoint 3 review, answers (2026-10-23)

Mode: self, Sonnet 5.5, author the same session; I read the files myself and ran nothing.

1. Serious, the artist's setup lives inside the repository it sets up and installs no Unity. Who and task: an artist new to Unity on a bare Windows machine, getting to the game project open in the right Editor. Checked and true: `setup.sh` is at the root of `GameTemplate`, so it exists only after a clone, and a clone of a private repository needs git and a sign-in; running bash at all needs Git for Windows; the script installed neither an Editor nor the Hub, and the engineer form (step 0) was the only one that named Unity 6000.4.8f1. Fixed: the artist has their own form, Artist onboarding, in the org `.github` repo (new paragraph "The artist's way in", scenario row 0 for the artist, WF1 and WF2 rows, Limits). Order: Git for Windows, Unity Hub and a Unity sign-in, the named Editor, one clone line, the sign-in at the clone, `bash setup.sh`, Add in Unity Hub. `setup.sh` now installs nothing: it fetches the large files and checks, and prints the Editor version. The first sign-in moved from the first push to the clone, which is a request to art (claim 15), not a change here. This does not contradict the line's amendment: it says the artist's machine needs git and Git LFS only for Send, and the Editor is needed to make art at all. Not fixed: that the form's assumptions hold on a real machine (Git for Windows contents, the browser sign-in, Hub offering the Editor, a free Unity account being enough) is unverified until the WF2 walk; and the artist's right to push a branch is decided (2026-10-24). No decision for the developer arises from this fix. The epic table is unchanged.

### Checkpoint 4 round (2026-10-24)

Mode: self, Sonnet 5.5, author the same session; no subagent tool, so no reader ran. Strongest claim first, then the break. Lenses run: Ambition, Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap.

1. Time, serious: line decision 2 says an exact tag, the later decision says nothing is pinned. Task: the window writes a manifest line for a game. Break: a tag is a pin. Evidence: `Line.md` decision 2 and "Also decided on 2026-10-24". Fixed for our games (a branch ref, decided item 12); the customers' half was the open question, answered at checkpoint 5: a customer installs a released tag (decided 22).
2. Scale, serious: a game that follows a branch has a lock file that records one hash, so two people updating at different times conflict on it. Who: two or more people in one game project. Fixed in part: stated in Limits; the developer decided conflicts are handled as always. Not fixable by design.
3. Designer and artist, serious: an artist's pull request lands in a protected main, and the artist's machine posts no `unity-tests` status. Fixed: the merger runs `run-local-tests.sh` first (decided 6); with the App token the checks that need no Editor start without the approval prompt (GitHub's page), to be confirmed by WF1's App story.
4. Designer and artist, minor: Send sending only the changed files means a changed file that needs a missing companion (a texture a model uses) is not in the pull request. Not mine: Send's list is art's, and the claim on art says only changed files under the art folders.
5. Agent, serious: the App's key is a secret an agent must never print or commit. Fixed: the key lives only as an organisation secret and no script reads it; `repository-settings.sh` prints settings lines for a person to type and holds no credential.
6. Roadmap, serious: protecting every main branch may be impossible on private repositories on the organisation's plan, and the decided rule would then be unmet. Evidence: Core's ruleset exists on a public repository, and the documentation lists rulesets for Team and Enterprise. Not fixable by reading; WF1's settings story checks first, and the answer is the developer's if the plan cannot.
7. Roadmap, minor: WF7a before the freeze depends on the freeze date, which is an estimate. Fixed: the roadmap owner places WF7a; the epic says "before the freeze" and not a date.
8. Stranger, minor: the pointers to the line text make every template depend on one repository; a rename of the organisation breaks all of them. Fixed in part: the address is one line in the managed `AGENTS.md`; `check.sh` already fails the old placeholder name.
9. Ambition, minor: the boldest version, the settings list applied by the App itself, writes repository settings from an Action. Not taken: it needs an administrator permission on every repository for an automated identity, and the list is short enough for a person to type.
10. Performance: no new claim; the unmeasured items stay in Limits.


### Checkpoint 5 round (2026-10-24)

Mode: self, Sonnet 5.5, author the same session; no subagent tool, so no reader ran. Strongest claim first, then the break. Lenses run: Ambition, Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap.

1. Time, serious: a shipped game on `release-2` gets a fix only if someone ports it from `main`, and the buyer's year of fixes doubles every review. Not fixable by design; said in Limits and left unmeasured.
2. Scale, serious: `@main` reaches 22 repositories at once, and a bad merge stops every check. Fixed in part: the org repo's own main is protected; no pointer is held, by decision. A bad merge still needs the next fix.
3. Roadmap, serious: switching the artist ruleset on before A5a would lock out the only way to send. Fixed by order: the WF1 story waits for A5a.
4. Time, minor: the side branch `definition-contract` drifts from `beta` for about seven weeks (15 January to 2 March, estimated). Fixed: `beta` is merged into it at each sprint end, in the freeze rule.
5. Performance, minor: the throwaway copy duplicates a project with its large files. Unmeasured, said in Limits.
6. Stranger, minor: a buyer on a tag sees no `-beta` build by accident. Checked: the catalogue's known-good tag is written only at the final tag, so a buyer's line never names a candidate.
7. Ambition: the boldest version, an automatic port of a fix from `main` to `release-<major>`, writes to git, which the studio's agents never do; not taken.
8. Designer and artist, minor: the two answers to the roadmap and art claims dated A5a 2026-12-09, before the freeze, against the hand-off, which dates A5a 2027-03-09 to 2027-03-12, after the demo build. Fixed: both answers now carry the hand-off dates, so the form, setup.sh, App, Action and protected main are not rushed into the pre-freeze train.

### Could not fix

- Delivery by an agent end to end: by design and by the developer's rule.
- Whether the store takes a free Core listing and whether a store package may depend on another: unverified until enrolment.
- Merge blocking on private repositories on the free plan, and the bypass for the release bot on the four public repos.
- Unity tests on a hosted or self-hosted runner: a spike (WF3), with local Unity CLI test runs as the merge rule meanwhile.
- Portability off GitHub, and the effect of an organisation rename on `uses:`.
- Editor-dependent checks depend on a contributor's machine being on and a license being valid; merge blocking for them exists only where rulesets or branch protection do.
- Whether a prerelease version string changes how a bridge's `versionDefines` range matches, and whether a workflow may open a pull request on the catalogue, until WF4 tests them.
- The Asset Store upload remaining a manual Editor step.
- No reader sessions: this review is self mode. A reviewer session should attack the baseline-tag rule, the `beta` promotion and the branch-following install first, since those are the three places the design leans on tool behaviour I could only read about.

Could not check: any behaviour of semantic-release, `gh` or Unity by running it; nothing was run, by the design-only rule.
