# Working in a Spellbound Studios repository

Three sentences to remember: the pull request title is `type(scope): what changed`; a `!` before the colon means it breaks someone; the version is made by the release and is never typed.

Everything binding about the packages, the rules of the line and the shared conventions is the line text in this repository's `line` folder: https://github.com/Spellbound-Studios/.github/tree/main/line. Nothing here copies it. This file says how the repositories, the board and the pull requests work day to day.

## Where things live

| Thing | Where |
|---|---|
| A package | Its own repository, named for the package, with the dev project at the root and the package at `Packages/<Name>` |
| A game | Its own repository, made from `GameTemplate` |
| The studio's art | The `ArtRegistry` repository, a private Unity project made from `GameTemplate`: every model, texture and source file, the studio's rules as its settings, and a record per item; games pull single items from it through ArtPipeline's Registry window and never hold the files in their own repositories |
| An issue | The repository where its code changes. Work that spans repositories, or has no code, goes in `Roadmap` |
| The board | Spellbound Roadmap, https://github.com/orgs/Spellbound-Studios/projects/13. Its README is the source of truth for titles, types, fields and Status |
| The plan | `line/Roadmap.md` here, one Epic on the board per epic of the plan |
| Issue forms, the pull request template, this file, `SUPPORT.md`, the setup script | This repository; GitHub applies the forms to every repository of the organisation that has none of its own, and `setup.sh` is fetched by its raw address |
| The shared workflows | `.github/workflows` here, called from every repository at `@main` |
| The shell every repository holds | `Template` for a package, `GameTemplate` for a game; the art registry was made from `GameTemplate` once and keeps its own files. The files are listed in each repository's `managed-files.txt` and `scripts/sync-template.sh` opens a pull request where one drifted |

## Setting up a computer

A new Windows PC needs one install by hand, Git for Windows from https://gitforwindows.org with its default options, and then one line in Git Bash, which the onboarding issue carries:

```
bash <(curl -fsSL https://raw.githubusercontent.com/Spellbound-Studios/.github/main/setup.sh) Spellbound-Studios/<Repository> [more repositories]
```

It installs GitHub's command-line tool, the Unity command line, Unity Hub and the editor each repository needs, makes an SSH key with no passphrase and adds it to the person's GitHub account, asks which program the person models in, clones each repository over SSH with its large files, watches the art registry for an engineer, and opens each project once so its packages resolve. Run again for another repository it skips what exists. The sign-ins to GitHub and Unity happen in the browser when a step asks. A Mac route is written when a Mac user joins.

## Issues

Open an issue through its form: Epic, Story, Task, Bug, Decision, Move, Boundary sheet, Engineer onboarding, Artist onboarding. The form sets the issue type and adds the issue to the board. Stories are sub-issues of an epic, tasks are sub-issues of a story.

- Anyone on the team opens a story. Its Status on the board is the approval.
- A story that waits on another issue is marked blocked by it: on the issue, Relationships, then Mark as blocked by. The Status does not change.
- A Decision is a question a person must answer in writing before work goes on. The answer is written into the issue's Answer field and the issue is closed. A story that waits on it is marked blocked by it. A question a standing rule or the game's premise already answers is applied, not asked.
- An agent writes an issue body with `bash scripts/render-issue-body.sh`, which prints the same headings the form produces, and opens it with `gh issue create --type <Type>`.

## Titles and commits

The title rule is one pattern, used by the commit hook in every repository and by the pull request check:

```
^(feat|fix|perf|refactor|docs|test|build|ci|chore)(\([a-z0-9._-]+\))?!?: .{1,100}$
```

| Title type | After the first stable release | Before it (`beta`) |
|---|---|---|
| `fix`, `perf` | patch | next `-beta.N` |
| `feat` | minor | next `-beta.N` |
| `!` or `BREAKING CHANGE` | major | next `-beta.N` |
| `refactor`, `docs`, `test`, `build`, `ci`, `chore` | none | none |

Run `bash scripts/setup.sh` once after cloning: it points git at the repository's `.githooks` folder, so a commit with a bad title is refused with the allowed types printed; a repository that keeps large files in Git LFS ships the Git LFS hooks in that folder too, since git reads no other. Commits on a branch are free in every other way; the pull request is squash-merged with its title alone, so the title is the commit that lands.

## Branches

| Branch | Meaning |
|---|---|
| `main` | The default branch of every repository. Protected: changes arrive only through a pull request. A person moves a package's `main` at each release |
| `beta` | Where a package's pull requests land before and after its first stable release; a project the studio works in follows `#beta` |
| `rc` | A person merges `beta` into it when the strangers should run; the release tags a release candidate |
| `release-<major>` | The maintenance branch of a Core major, cut in every repository when that major's final tags are made; a shipped game follows it |
| `art/<login>-<slug>` | The only branch shape an artist's Send pushes, to the art registry alone; a pushed `art/**` branch opens its own pull request there, assigned to the person who pushed it |
| Anything else | A working branch. Name it for the work |

## Pull requests

- Before asking for review, run the Unity tests through the Unity command line in the dev project. Whoever merges an artist's pull request runs the art registry's tests first. Merging needs those passing tests; the status they post is `unity-tests`.
- The body opens with what the reader will see, especially when the pull request changes the shape of a repository or adds files a reader would not expect.
- One line per story the pull request delivers: `Closes Spellbound-Studios/<repository>#<number>`. Done is a merged pull request; nothing is done without one.
- A build step of the plan puts its full report in the pull request body, in the shape the line text gives under "The report a build step ends with", with `ready to test` as its last line. The merge is the sign-off.
- Never edit `version` in `package.json`; the release writes it, and the check fails a pull request that does.
- Merged head branches are deleted by the repository.

## The GitHub App

The release, catalogue and pull request Actions run as a GitHub App the organisation owns, never as a person and never as the repository token: a pull request the repository token opens runs its checks only after a person approves them, and events the repository token causes start no new workflow run. The App is created once by the organisation owner at https://github.com/organizations/Spellbound-Studios/settings/apps/new and installed on every repository of the organisation.

| Setting | Value |
|---|---|
| Name | Spellbound Workflows |
| Homepage | https://github.com/Spellbound-Studios/.github |
| Webhook | Off |
| Repository permissions | Contents: read and write (release commits, tags and releases); Pull requests: read and write (opens and assigns pull requests); Issues: read and write (the Bug issue a failed art pull request files, the catalogue pull request); Commit statuses: read and write; Metadata: read |
| Where it can be installed | Only on this account |
| Installation | On the organisation, all repositories |
| Keys | The App's client id and one private key generated on the App's page |

A workflow gets a token for one run with `actions/create-github-app-token`, scoped to the repository it runs in; the reusable workflows in this repository do that in their first step, and a caller passes the secrets with `secrets: inherit`. On GitHub Free an organisation secret does not reach a private repository, so the two keys live as the repository secrets `SPELLBOUND_APP_CLIENT_ID` and `SPELLBOUND_APP_PRIVATE_KEY` of the one repository whose workflow needs them today, the art registry, and nowhere else; a repository that gains a workflow run as the App takes the same two secrets. No key is ever written in a repository. The App is on the bypass list of every protected branch so the release can write its commit.

What confirms the App: a branch named `art/<login>-check` with one commit pushed to the art registry opens a pull request authored by the App and assigned to the person who pushed it. That its checks run without an approval prompt is confirmed when the registry has a check workflow.

## Repository settings

Every repository of the organisation is set the same way, and `bash scripts/repository-settings.sh <repository>` prints the lines that set it, one `gh api` line per setting, for a person to type; `--check` reads them back, reports drift, and prints the organisation's Git LFS storage and this month's downloads against the free 10 GB of each, so the quota is seen before it runs out.

For every repository: the default branch accepts changes only through a pull request; the squash merge uses the title alone; merged head branches are deleted; the status `unity-tests` is required once the local gate exists; review from the code owners is required for the judgment fields `CODEOWNERS` names; the App is on the bypass list. The art registry adds a team agreement, printed by `--art-registry`: an artist holds the write role and pushes `art/<login>-<slug>` branches only, and `main` changes only through a pull request an engineer merges after the registry's tests. Games carry no artist rule, because art reaches them through the registry.

On GitHub Free these rules can be set on public repositories only; a private repository answers "Upgrade to GitHub Pro or make this repository public to enable this feature" (checked 2026-10-25). Where a rule cannot be set it is a team agreement and the check reports it as unenforced.

## The board

The board's README at https://github.com/orgs/Spellbound-Studios/projects/13 is the convention for titles, types, fields and Status. `bash scripts/sprint-report.sh` prints the current sprint: what is in it, by Status and by person, what is blocked, and the gates and tokens so far.
