# Working in a Spellbound Studios repository

Three sentences to remember: the pull request title is `type(scope): what changed`; a `!` before the colon means it breaks someone; the version is made by the release and is never typed.

Everything binding about the packages, the rules of the line and the shared conventions is the line text in this repository's `line` folder: https://github.com/Spellbound-Studios/.github/tree/main/line. Nothing here copies it. This file says how the repositories, the board and the pull requests work day to day.

## Where things live

| Thing | Where |
|---|---|
| A package | Its own repository, named for the package, with the dev project at the root and the package at `Packages/<Name>` |
| A game | Its own repository, made from `GameTemplate` |
| An issue | The repository where its code changes. Work that spans repositories, or has no code, goes in `Roadmap` |
| The board | Spellbound Roadmap, https://github.com/orgs/Spellbound-Studios/projects/13. Its README is the source of truth for titles, types, fields and Status |
| The plan | `line/Roadmap.md` here, one Epic on the board per epic of the plan |
| Issue forms, the pull request template, this file, `SUPPORT.md` | This repository; GitHub applies them to every repository of the organisation that has none of its own |
| The shared workflows | `.github/workflows` here, called from every repository at `@main` |
| The shell every repository holds | `Template` for a package, `GameTemplate` for a game; the files are listed in each repository's `managed-files.txt` and `scripts/sync-template.sh` opens a pull request where one drifted |

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

Run `bash scripts/setup.sh` once after cloning: it switches the commit hook on, so a commit with a bad title is refused with the allowed types printed. Commits on a branch are free in every other way; the pull request is squash-merged with its title alone, so the title is the commit that lands.

## Branches

| Branch | Meaning |
|---|---|
| `main` | The default branch of every repository. Protected: changes arrive only through a pull request. A person moves a package's `main` at each release |
| `beta` | Where a package's pull requests land before and after its first stable release; a project the studio works in follows `#beta` |
| `rc` | A person merges `beta` into it when the strangers should run; the release tags a release candidate |
| `release-<major>` | The maintenance branch of a Core major, cut in every repository when that major's final tags are made; a shipped game follows it |
| `art/<artist>-<slug>` | The only branch shape an artist's Send pushes; a pushed `art/**` branch opens its own pull request |
| Anything else | A working branch. Name it for the work |

## Pull requests

- Before asking for review, run the Unity tests through the Unity command line in the dev project. Whoever merges an artist's pull request runs them first. Merging needs those passing tests; the status they post is `unity-tests`.
- The body opens with what the reader will see, especially when the pull request changes the shape of a repository or adds files a reader would not expect.
- One line per story the pull request delivers: `Closes Spellbound-Studios/<repository>#<number>`. Done is a merged pull request; nothing is done without one.
- A build step of the plan puts its full report in the pull request body, in the shape the line text gives under "The report a build step ends with", with `ready to test` as its last line. The merge is the sign-off.
- Never edit `version` in `package.json`; the release writes it, and the check fails a pull request that does.
- Merged head branches are deleted by the repository.

## The GitHub App

The release, catalogue and pull request Actions run as a GitHub App the organisation owns, never as a person and never as the repository token: a pull request the repository token opens runs its checks only after a person approves them, and events the repository token causes start no new workflow run. The App is created once by the organisation owner at https://github.com/organizations/Spellbound-Studios/settings/apps/new.

| Setting | Value |
|---|---|
| Name | Spellbound Workflows |
| Homepage | https://github.com/Spellbound-Studios/.github |
| Webhook | Off |
| Repository permissions | Contents: read and write (release commits, tags and releases); Pull requests: read and write (opens and labels pull requests); Issues: read and write (the Bug issue a failed art pull request files, the catalogue pull request); Commit statuses: read and write; Metadata: read |
| Where it can be installed | Only on this account |
| Installation | On the organisation, all repositories |
| Key | One private key, generated on the App's page and stored once as the secret `SPELLBOUND_APP_PRIVATE_KEY`; the App's client id as the secret `SPELLBOUND_APP_CLIENT_ID` |

A workflow gets a token for one run with `actions/create-github-app-token`, scoped to the repositories it names; the reusable workflows in this repository do that in their first step, and a caller passes the secrets with `secrets: inherit`. On GitHub Free an organisation secret does not reach a private repository, so until the organisation is on GitHub Team the two secrets are repository secrets in each repository whose workflows need them. The App is on the bypass list of every protected branch so the release can write its commit.

The first thing to confirm once the App exists: push a branch named `art/<you>-check` with one commit to a repository that holds the art pull request caller, and watch the pull request it opens run its checks without an approval prompt.

## Repository settings

Every repository of the organisation is set the same way, and `bash scripts/repository-settings.sh <repository>` prints the lines that set it, one `gh api` line per setting, for a person to type; `--check` reads them back and reports drift.

For every repository: the default branch accepts changes only through a pull request; the squash merge uses the title alone; merged head branches are deleted; the status `unity-tests` is required; review from the code owners is required for the judgment fields `CODEOWNERS` names; the App is on the bypass list. For a game repository one more rule: a branch ruleset that confines artists to `art/*`, because GitHub has no role that can push branches only. It is switched on in a game repository the day the minimal Send lands there.

On GitHub Free these rules can be set on public repositories only; a private repository answers "Upgrade to GitHub Pro or make this repository public to enable this feature" (checked 2026-10-25). Where a rule cannot be set it is a team agreement and the check reports it as unenforced.

## The board

The board's README at https://github.com/orgs/Spellbound-Studios/projects/13 is the convention for titles, types, fields and Status. `bash scripts/sprint-report.sh` prints the current sprint: what is in it, by Status and by person, what is blocked, and the gates and tokens so far.
