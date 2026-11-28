# Working in a Spellbound Studios repository

Three sentences to remember: the pull request title is `type(scope): what changed`; a `!` before the colon means it breaks someone; the version is made by the release and is never typed.

Everything binding about the packages, the way the studio works and the shared conventions is the rulebook in the private `Roadmap` repository: https://github.com/Spellbound-Studios/Roadmap/blob/main/Rulebook.md. Nothing here copies it. This file says how the repositories, the board and the pull requests work day to day.

## Where things live

| Thing | Where |
|---|---|
| A package | Its own repository, named for the package, with the dev project at the root and the package at `Packages/<Name>` |
| A game | Its own repository, made from `GameTemplate` |
| The studio's art | The `ArtRegistry` repository, a private Unity project made from `GameTemplate`: every model, texture and source file, the studio's rules as its settings, and a record per item; games pull single items from it through ArtPipeline's Registry window and never hold the files in their own repositories |
| An issue | An epic, story, bug or task goes in the repository it serves; an initiative, which crosses repositories, goes in `Roadmap` |
| The board | Spellbound Roadmap, https://github.com/orgs/Spellbound-Studios/projects/13. It holds one card per initiative and per epic and shows each epic's state |
| The plan | The issues in each repository, as the rulebook says: https://github.com/Spellbound-Studios/Roadmap/blob/main/Rulebook.md. The rulebook's sections Kinds of work, Issue forms and People and states are the source of truth for titles, types, fields and states |
| Issue forms, the pull request template, this file, `SUPPORT.md`, `SECURITY.md`, the setup script | This repository; GitHub applies the forms to every repository of the organisation that has none of its own, and `setup.sh` is fetched by its raw address |
| The shared workflows | `.github/workflows` here, called from every repository at `@main` |
| The shell every repository holds | `Template` for a package, `GameTemplate` for a game; the art registry was made from `GameTemplate` once and keeps its own files. The files are listed in each repository's `managed-files.txt` and `scripts/sync-template.sh` opens a pull request where one drifted |

## Setting up a computer

A new Windows PC needs one install by hand, Git for Windows from https://gitforwindows.org with its default options, and then one command in Git Bash, which the onboarding issue carries:

```
bash <(curl -fsSL https://raw.githubusercontent.com/Spellbound-Studios/.github/main/setup.sh) Spellbound-Studios/<Repository> [more repositories]
```

It installs GitHub's CLI, the Unity CLI, Unity Hub and the editor each repository needs, makes an SSH key with no passphrase and adds it to the person's GitHub account, asks which program the person models in, clones each repository over SSH with its large files, watches the art registry for an engineer, and opens each project once so its packages resolve. Run again for another repository it skips what exists. The repositories go in a Spellbound folder under the home directory unless `--into <folder>` or SPELLBOUND_HOME names another; the choice is remembered. The command also writes a `spellbound` function into the shell file, which opens that folder, updates the studio plugin and re-runs the setup when the script has changed, and it gives the folder its instruction file and the session-start greeting that reads the board. The sign-ins to GitHub and Unity happen in the browser when the script asks for them. A Mac route is written when a Mac user joins.

## Issues

Open an issue through its form: Initiative, Epic, Story, Bug, Task, Engineer onboarding, Artist onboarding. The form sets the issue type. Only initiatives and epics are added to the board, and stories are sub-issues of an epic. The rulebook's Kinds of work and Issue forms say what each form holds and how its title reads. An epic or story needs only its title and its first sentence to be recorded in Backlog; every field is filled by the time the item is Ready, with None where nothing applies.

- A story waits only on a story in its own repository, named in its Waits on field and marked blocked by it: on the issue, Relationships, then Mark as blocked by.
- An agent writes an issue body with `bash scripts/render-issue-body.sh`, which prints the same headings the form produces, and opens it with `gh issue create --type <Type>`.

## Titles and commits

Commits on a branch are free. The title rule is one pattern, used by the pull request check on every repository:

```
^(feat|fix|perf|refactor|docs|test|build|ci|chore)(\([a-z0-9._-]+\))?!?: .{1,100}$
```

| Title type | After the first stable release | Before it (`beta`) |
|---|---|---|
| `fix`, `perf` | patch | next `-beta.N` |
| `feat` | minor | next `-beta.N` |
| `!` or `BREAKING CHANGE` | major | next `-beta.N` |
| `refactor`, `docs`, `test`, `build`, `ci`, `chore` | none | none |

The setup command runs each repository's `scripts/setup.sh` after cloning it; for a clone made by hand, run `bash scripts/setup.sh` once. The script points git at the repository's `.githooks` folder, so a commit with a bad title is refused with the allowed types printed; a repository that keeps large files in Git LFS ships the Git LFS hooks in that folder too, since git reads no other. Commits on a branch are free in every other way; the pull request is squash-merged with its title alone, so the title is the commit that lands.

## Branches

| Branch | Meaning |
|---|---|
| `main` | The default branch of every repository. Protected: changes arrive only through a pull request. A person moves a package's `main` at each release |
| `beta` | Where a package's pull requests land before and after its first stable release; a project the studio works in follows `#beta` |
| `rc` | A person promotes `beta` to it with `promote-release.sh rc` when the strangers should run; the release tags a release candidate |
| `release-<major>` | The maintenance branch of a Core major, cut in every repository when that major's final tags are made; a shipped game follows it |
| `art/<login>-<slug>` | The only branch shape an artist's Send pushes, to the art registry alone; a pushed `art/**` branch opens its own pull request there, assigned to the person who pushed it |
| Anything else | A working branch. Name it for the work |

A release is never typed. Pull requests land on `beta`, and each merge whose title is a `fix`, a `perf`, a `feat` or a breaking change releases the next `-beta.N` of the package. When the strangers should run, a person promotes `beta` to `rc` with `promote-release.sh rc`, a merge whose push starts the release, and the release tags the next `-rc.N`, which the strangers run against. A person promotes `rc` to `main` with `promote-release.sh main` only when the head of `rc` carries a green `strangers` status, and the release tags the final version; after a final release `promote-release.sh sync` merges `main` back into `beta`. Nobody types a version, edits the changelog or picks a tag name: the release reads the titles that landed and writes all three. Core's `v1.1.9` is the one tag that existed before the release did, so Core's rewrite releases as `2.0.0-beta.N`, and every other package's first release is `1.0.0-beta.1`. A repository releases only when it holds the App's two secrets; where they are absent, its release run ends green with a message that begins `skipped:`.

## Pull requests

- Before merging, run the Unity tests through the Unity CLI in the dev project. Whoever merges an artist's pull request runs the art registry's tests first. A merge needs the checks in the rulebook's Checks before a merge, not another person's approval.
- The body opens with what the reader will see, especially when the pull request changes the shape of a repository or adds files a reader would not expect.
- Each story the pull request delivers gets its own `Closes Spellbound-Studios/<repository>#<number>` in the body. Done is a merged pull request; nothing is done without one.
- The body carries the evidence the rulebook's Checks before a merge asks for and ends with `ready to test`. The merge is the sign-off.
- Never edit `version` in `package.json`; the release writes it, and the check fails a pull request that does.
- Merged head branches are deleted by the repository.

## The GitHub App

The release, catalogue and pull request Actions run as a GitHub App the organisation owns, never as a person and never as the repository token: a pull request the repository token opens runs its checks only after a person approves them, and events the repository token causes start no new workflow run. The App is created once by the organisation owner at https://github.com/organizations/Spellbound-Studios/settings/apps/new and installed on every repository of the organisation.

| Setting | Value |
|---|---|
| Name | Spellbound Workflows |
| Homepage | https://github.com/Spellbound-Studios/.github |
| Webhook | Off |
| Repository permissions | Actions: read and write (the dispatch release starts each release run and reads its log); Contents: read and write (release commits, tags and releases); Pull requests: read and write (opens and assigns pull requests); Issues: read and write (the Bug issue a failed art pull request files, the catalogue pull request); Commit statuses: read and write; Metadata: read |
| Where it can be installed | Only on this account |
| Installation | On the organisation, all repositories |
| Keys | The App's client id and one private key generated on the App's page |

A workflow gets a token for one run with `actions/create-github-app-token`, scoped to the repository it runs in; the reusable workflows in this repository do that before anything else, and a caller passes the secrets with `secrets: inherit`. On GitHub Free an organisation secret does not reach a private repository, so the two keys live as the repository secrets `SPELLBOUND_APP_CLIENT_ID` and `SPELLBOUND_APP_PRIVATE_KEY` of the one repository whose workflow needs them today, the art registry, and nowhere else; a repository that gains a workflow run as the App takes the same two secrets. No key is ever written in a repository. The App is on the bypass list of every protected branch so the release can write its commit.

What confirms the App: a branch named `art/<login>-check` with one commit pushed to the art registry opens a pull request authored by the App and assigned to the person who pushed it. That its checks run without an approval prompt is confirmed when the registry has a check workflow.

## Repository settings

Every public repository of the organisation is set the same way, by `python -I tools/going_public.py Spellbound-Studios/<Name>` run from the Roadmap repository, as the rulebook's Public repositories paragraph says. `bash scripts/repository-settings.sh <repository> --check` reads the settings back, reports drift, and prints the organisation's Git LFS storage and this month's downloads against the free 10 GB of each, so the quota is seen before it runs out.

For every public repository, as the rulebook's Public repositories paragraph says: `beta`, `rc`, `main` and `release-<major>` change only through a pull request whose title check and structure check pass; nobody force pushes to them or deletes them; no review is required; the squash merge uses the title alone; merged head branches are deleted; the owner and the App are on the bypass list. The art registry adds a team agreement, printed by `--art-registry`: an artist holds the write role and pushes `art/<login>-<slug>` branches only, and `main` changes only through a pull request an engineer merges after the registry's tests. Games carry no artist rule, because art reaches them through the registry.

- The canary rows of `bash scripts/run-local-tests.sh` run on demand: `--only canary-beta` runs on the next Unity's beta named by `CANARY_EDITOR`, and the status it posts is `unity-canary-beta`. No ruleset requires it: a pull request merges whatever its state, because the canary is allowed to fail.
- `run-local-tests.sh --only canary-coreclr` reads that editor for the CoreCLR player module, and when the module is installed the status it posts is `unity-canary-coreclr`. No ruleset requires it either; where the module is absent the row says not run and posts nothing.

On GitHub Free these rules can be set on public repositories only; a private repository answers "Upgrade to GitHub Pro or make this repository public to enable this feature" (checked 2026-10-25). Where a rule cannot be set it is a team agreement and the check reports it as unenforced.

## The board

The board at https://github.com/orgs/Spellbound-Studios/projects/13 holds one card per initiative and per epic. Titles, types, fields and states are the rulebook's, in its sections Kinds of work, Issue forms and People and states. `bash scripts/sprint-report.sh` prints the current sprint: what is in it, by state and by person, and which epics wait.

An epic moves through seven stages: Backlog, Refinement, Ready, In progress, In review, Red team and Done, and skips Red team when it needs none. Backlog is an idea anyone recorded with no owner, holding only its title and one sentence, and a story can be recorded the same way under its epic. Refinement is an epic or story an engineer has taken and is planning with their AI, and the refine skill fills the rest of its fields. Ready means every field holds an answer or None, every story has its checks, the planning record is linked where the refinement was full, and nothing it waits for is still open. The rulebook's People and states section defines the stages after Ready.
