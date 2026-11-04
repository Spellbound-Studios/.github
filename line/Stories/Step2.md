## The stories of step 2: layout, templates, Core's first vocabulary (LV1a, LV1b, L1-7, WF2a, L2c, R0d)

Step 2 settles where a package lives and starts Core's vocabulary. The probe runs first and gates every move; the template, Core's declarations and the packing description need only the probe's folder answer and run beside each other; the three moves come last, prepared by the lead and made by the developer. Fifteen stories: LV1a two, LV1b four, L1 one (L1-7, written under step 1), WF2a four, L2c three, R0d one. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the rules of step 1 hold (engine-only Core, references down or sideways, spelled-out names, one type per file, no comments, logging through Core, the studio's Rider formatting; a move changes no namespace and no public type; work only in the named directories; a gap is raised and stops the story; nothing merges to a branch a game follows).
- **Rules:** every new C# file starts with `// Copyright (c) Spellbound Studios. All rights reserved.`; existing files keep their header until the C1 rule exists.
- **Rules:** the lead never touches git in a repository the developer owns. A move of a repository's root, a branch, a tag or a commit is the developer's act; the story prepares the script and the files, verifies them on a throwaway copy made outside every repository, and hands the developer one bash line. Git runs only inside throwaway copies and scratch repositories the lead creates for the probe.
- **Rules:** the new repository of this step (`Template`) is created as a folder beside the other repositories; the developer initialises and publishes it.
- **Rules:** a type enters Core only as the line declares it (rule 4); every value a game might tune is a parameter or a setting with a default; nothing in Core knows a connection, a scene or a game.
- **Regression contract:** Core's edit-mode tests pass unchanged (141, counted by attribute on 2026-10-24); every public type of Core keeps its name and namespace; the logger, packing, hashing, registries, `SingletonManager`, weighted tables and assembly scanning behave as before.
- **Regression contract:** Inventory's and Decals' tests pass in the moved layout; their package.json, asmdefs and GUIDs are unchanged by the move; both games compile against the branches they follow today, and nothing in this step changes a game.
- **Done, for each story:** compiles clean through the Unity CLI in the project named, its tests pass, and the report lists what was built, what was proposed and what the developer must do.

### LV1a-1 The layout probe

- **Outcome:** it is known, from a scratch project, that a package at `Packages/<Name>` works: git and Git LFS from the project root with the package inside, `PackageInfo` found for the embedded package, a version define naming an embedded package and one naming a Unity module, an install by `?path=/Packages/<Name>#<ref>` into a second project, `Samples~` import, the test runner finding the package's tests, and Unity accepting the short folder name `Packages/Core` for `com.spellboundstudios.core`.
- **Verified (2026-10-24):** git 2.52 and Git LFS 3.7.1 are on the PATH; editors 6000.4.8f1 and 6000.3.10f1 are installed; no package repository has an LFS file; Unity's manual says a local git dependency needs `git+file://` or a `.git` suffix and that `?path=` comes before `#`.
- **Verify before building on it:** that Unity's version defines accept an embedded package's name and a `com.unity.modules.*` name; the manual page did not answer and the probe does.
- **Rules:** the probe uses a copy of Core (today's working tree, no `.git`) as the embedded package, so the folder name question is answered on the real package; the scratch projects live in the session's scratch folder and are deleted at the end.
- **Rules:** if git or Git LFS misbehaves inside the folder, or Unity rejects the short name, the step stops and asks; nothing after this story is built.
- **Regression contract:** none; nothing of the developer's changes.
- **Done:** a written result per question, pass or fail with the evidence, in the report; the nested clone (a package repository inside a project repository) is answered too.

### LV1a-2 The bootstrap in a clean project

- **Outcome:** it is known what a package's `Bootstrap` assembly costs and whether it works: a package installed without Core into a clean 6000.3 and a clean 6000.4.8f1 project, no studio credentials, compiles with no error, its bootstrap says Core is missing and names the install, and Core can then be fetched from its public address; the compile cost of one more assembly and the fetch time are measured.
- **Verified (2026-10-24):** the Core repository is public; Core has no `Packages/Core` on GitHub yet, so the fetch probes today's address on `dev` and the `?path=` form is proven by LV1a-1 on the scratch repository.
- **Rules:** the probe package is throwaway and ships nowhere; its main assembly is constrained on `SPELLBOUND_CORE` from a version define on Core's id, its `Bootstrap` assembly has no references, reads the address from a text file beside its class and writes one console line; no window exists yet (LV2), so the probe records the console line.
- **Rules:** a Git LFS client cannot be removed from this machine; the probe records that the package has no LFS file and that the fetch does not call LFS.
- **Regression contract:** none.
- **Done:** the written result with the numbers (compile delta of one assembly, fetch time on each editor), which gates the Core constraint in every L epic that rewrites a package.

### LV1b-1 The convention and the dev project shell

- **Outcome:** the `Template` repository holds the standard dev project shell: `Assets/_Project/Scenes` and `Settings`, `Packages/manifest.json` (Core by `?path=/Packages/Core#beta`, the test framework, the Pipeline package, the Unity packages a sentence needs), `ProjectSettings/ProjectVersion.txt` at 6000.4.8f1, `.gitignore`, `.gitattributes` with Saboteer's LFS patterns scoped to `Assets/_Project`, `.editorconfig` from the studio's Rider settings, `CODEOWNERS`, the root `AGENTS.md`, `line-text-address.txt`, `managed-files.txt`.
- **Verified (2026-10-24):** Saboteer's `.gitattributes` holds 32 LFS patterns, none scoped; Corsairs' `.editorconfig` is the studio's; every dev project's root is a Unity project that is not a repository, with the Unity template's `TutorialInfo` and `Readme.asset` still in `Assets`.
- **Rules:** PackageCheck's files (`Identity.asset`, `Surface.txt`, `Documentation~/index.md`, `Bootstrap`, the ledger) are not in the template; `skeleton-version.txt` records `none` until PackageCheck exists. The PackageCheck manifest line is added by LV2.
- **Rules:** the template ships no `.meta` file; Unity writes them on first open.
- **Regression contract:** none.
- **Done:** the folder exists beside the other repositories with every file above; the report lists the tree.

### LV1b-2 The restructure script

- **Outcome:** `scripts/adopt-repository.sh <Name>` in the template moves a package repository from today's layout (the repository root inside the dev project at `Assets/<Name>`) to the settled one in place: the `.git` folder moves to the dev project root, the package moves to `Packages/<Name>`, `Assets/Scenes` and `Assets/Settings` move under `Assets/_Project`, the shell files are added, everything is staged on a new branch and committed with a title in the studio's form, and the next lines (push, pull request with the line text's address in the body, the new manifest line for every consumer) are printed for a person.
- **Verified (2026-10-24):** Core, Inventory and Decals each have their repository at `Assets/<Name>` with a Unity project `.gitignore` inside it and no `.gitattributes`.
- **Rules:** file identities are kept (every `.meta` moves with its file; `Assets/<Name>.meta` is deleted because the folder leaves `Assets`); the script refuses to run on a dirty working tree, on a root that is already a repository, or when `Packages/<Name>` exists.
- **Rules:** the script is verified on a throwaway copy of each pilot repository, never on the developer's; the developer runs it once per repository.
- **Regression contract:** on the copy, the package's GUIDs, package.json and asmdefs are byte-identical before and after; the project opens, compiles and its tests pass.
- **Done:** the script, and the three copies (Inventory, Decals, Core) opened and tested through the Unity CLI.

### LV1b-3 Inventory and Decals as pilots

- **Outcome:** Inventory and Decals are ready to move: the script has been run on a copy of each, each copy opens on 6000.4.8f1 at `Packages/<Name>`, compiles and passes its tests, and the developer has one line per repository.
- **Verified (2026-10-24):** both repositories are on `main` with clean working trees; Inventory has `Samples/` (not `Samples~`) and a `UITK` assembly; Decals depends on Core and URP.
- **Rules:** nothing in either package changes in this story (no `Samples~` rename, no asmdef edit); the move is a move. A game's manifest line (`?path=/Packages/<Name>`) is LM's and MV's and lands the hour the move merges, so the report prints the lines.
- **Regression contract:** the pilots' test counts match before and after; both games keep compiling against today's `main` until the developer merges.
- **Done:** the two lines for the developer and the test results on the copies.

### LV1b-4 The tag convention and the first tags

- **Outcome:** the tag convention of the line text is applied: Core takes its baseline tag `v1.1.9` on the commit that published 1.1.9, and every other repository takes no tag until its first release (`1.0.0-beta.1`, made by the release in WF4).
- **Verified (2026-10-24):** no package repository has a tag.
- **Rules:** a tag is the developer's act; the story finds the commit and hands the line.
- **Regression contract:** none.
- **Done:** the commit named with its evidence and the one line.

### WF2a-1 The package skeleton

- **Outcome:** the template's `Packages/<name>` holds the hand-written starting files of a package: `package.json` (id, display name, floor 6000.3, dependencies empty, author, samples entry), `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` with the six headings, `Runtime/Spellbound.<Name>.asmdef` with its `<Name>Kit` front door and the Core constraint, `Editor/`, `Tests/Runtime/`, `Tests/Editor/`, `Samples~/<Name>Sample/`, `Documentation~/boundary-sheet.md`.
- **Verified (2026-10-24):** no `OperationGroup` attribute exists yet (CL1, step 4); the initialiser leaves the line out and CL1 adds it to the skeleton.
- **Rules:** assembly references are by name; every `.cs` file starts with the copyright line; the front door compiles empty; `Tests` are two assemblies (edit and play) with one passing test each so the test runner shows the package the day it is born.
- **Regression contract:** none.
- **Done:** a package made from the skeleton opens and compiles in the shell with Core installed.

### WF2a-2 The initialiser

- **Outcome:** `bash scripts/initialise-package.sh <Name> "<sentence>" [--kind library|tool] [--requires burst,mathematics,urp] [--presentation]` renames the skeleton's placeholders, writes the sentence into `package.json` and the READMEs, declares the Unity packages named by `--requires` with the versions of `managed-unity-packages.txt`, adds `<Name>.Presentation` with `defineConstraints ["!UNITY_SERVER"]` on `--presentation`, makes no `Runtime` folder for a tool, and deletes itself.
- **Rules:** bash and POSIX tools only; the name must be a PascalCase identifier.
- **Regression contract:** none.
- **Done:** run on a copy of the template for a library and for a tool; both open and compile with Core from the local probe repository.

### WF2a-3 The engineer's setup

- **Outcome:** `bash scripts/setup.sh` sets `core.hooksPath` to `.githooks`, prints the editor version the project needs, and runs the agent context install when the operation exists (CL5, step 9) or says it does not yet.
- **Rules:** the `commit-msg` hook checks the title rule with the pattern of the workflow area; it is the one file of WF1 this story carries, because the setup is meaningless without it.
- **Regression contract:** none.
- **Done:** a bad commit title is refused on a scratch repository and a good one passes.

### WF2a-4 The callers

- **Outcome:** `.github/workflows/pull-request.yml` and `release.yml` are thin callers of the organisation's shared workflows at `@main`, and `.releaserc.yaml` names `beta`, `rc` and `main` with the package's paths.
- **Verified (2026-10-24):** the organisation's `.github` repository has no `.github/workflows/` yet; the shared workflows are WF3's and WF4's.
- **Rules:** the callers carry no logic; the shared workflow names are the ones the workflow area wrote (`check.yml`, `release.yml`).
- **Regression contract:** none.
- **Done:** the files exist and the report names the shared workflows they wait for.

### L2c-1 The section attribute

- **Outcome:** Core has `SectionAttribute`, how a package marks a type as savable state under a name, with no version and no migration step; Persistence discovers it later.
- **Rules:** one attribute, on a class or struct, not inherited, one per type, a required non-empty name; nothing else, because the Persistence pitch (step 3) designs its use.
- **Regression contract:** none beyond the step's.
- **Done:** the attribute and its tests (the name is kept, an empty name is refused).

### L2c-2 The ground vocabulary

- **Outcome:** Core has the surface source and the occupancy source: `ISurfaceSource.Schedule(in SurfaceRequest, NativeArray<SurfaceSample>, JobHandle)`, `SurfaceRequest` (origin, spacing, count, reference frame id), `SurfaceSample` (height, class byte), `IOccupancySource.Classify(in Bounds)` and `Occupancy` (empty, solid, mixed).
- **Rules:** engine types only (`Vector2`, `Vector2Int`, `Bounds`, `NativeArray<T>`, `JobHandle`); no Mathematics; the structs are blittable so a Burst job can read them; no default implementation holds a sea level or a sky.
- **Regression contract:** none beyond the step's.
- **Done:** the types, a test with a custom source for each seam, and a test that the structs are blittable.

### L2c-3 The reference frame noun

- **Outcome:** Core has `ReferenceFrameId` (64 bits, default is the world), `IReferenceFrame` (id, world pose, velocity at a point, angular velocity), `ReferenceFramePose` (a pose in a reference frame, with conversions to and from world space through the frame), and `ReferenceFrameDirectory` (per world, maps an id to its frame, register and unregister, the world for the default id).
- **Verify before building on it:** `ReferenceFrameChecks.RequireConstantUp` needs `UpField` (R0) and the guard (R1a); neither exists. The check is held for R0 and said so; the noun lands without it.
- **Rules:** no static directory; a directory is an instance a world owns; a duplicate registration is refused with a result, not an exception.
- **Regression contract:** none beyond the step's.
- **Done:** the types and tests (default id is the world, pose round trip through a moving frame, directory register, lookup, unregister, duplicate refused).

### R0d-1 The layout description of Core's packing

- **Outcome:** `CoreKit.Packing.Describe(Type)` returns the layout of a packed type as text: its instance fields in declaration order, each as name and type, nested value types expanded, so the surface writer and a saved section's header hash the same text.
- **Verified (2026-10-24):** Core has no `CoreKit`; packing is hand-written `IPacker` implementations over `Span<byte>`, so the description reflects the type's fields, not a schema.
- **Rules:** `CoreKit` is `public static class CoreKit` in `Spellbound.Core` with a nested `Packing` class; the text is deterministic (ordered by metadata token, culture-free), carries no hash itself, and names a type by its full name; a cycle is cut by naming the type once more without expanding.
- **Regression contract:** none beyond the step's; packing's bytes do not change.
- **Done:** the function and tests (field order, a nested struct expanded, a renamed field changes the text, a reordered field changes the text, a cycle terminates).

### The written result of the layout probe (LV1a, 2026-10-25)

Run on this machine with git 2.52, Git LFS 3.7.1, editors 6000.4.8f1 and 6000.3.10f1, on a scratch project holding a copy of Core at `Packages/Core`. Every row passed; the layout of decision 12 stands.

| Question | Result | Evidence |
|---|---|---|
| Unity accepts `Packages/Core` for `com.spellboundstudios.core` | pass | The package resolves as Embedded; Unity exposes it under its id, so asset paths read `Packages/com.spellboundstudios.core/...` while `PackageInfo.resolvedPath` is the short folder. `FindForAssetPath("Packages/Core/...")` answers null |
| `PackageInfo` found for the embedded package | pass | `FindForPackageName` and `GetAllRegisteredPackages` both list it as Embedded |
| A version define naming an embedded package | pass | `com.spellboundstudios.core` with `[1.1.9,3.0.0)` defines `SPELLBOUND_CORE`; an assembly constrained on it compiles and runs |
| A version define naming a Unity module | pass | `com.unity.modules.physics` defines; an absent package does not |
| File identities kept | pass | The GUID of a moved file equals its meta file's GUID in the moved project |
| `Samples~` import | pass | The sample is found by `Sample.FindByPackage` and imports into `Assets/Samples/Spellbound.Core/1.1.9/` |
| The test runner finds the package's tests | pass | 141 of 141 edit-mode tests pass in the scratch project |
| Git and Git LFS from the project root with the package inside | pass | 410 files committed, 353 under `Packages/Core`, none under `Library`; one LFS file under `Assets/_Project`, nothing under `Packages/Core` in LFS; git run from inside the package folder answers the project root |
| Install by `?path=/Packages/Core#main` from a repository | pass | A second project resolved Core as a Git package from a local bare repository at the probe's commit and ran its code; final compile clean |
| A nested clone (a package repository inside a project repository) | works in git, not as the layout | The outer repository records `Packages/Core` as an embedded repository pointer, not as files; Unity opens it. The one-repository layout stands |

The bootstrap probe (LV1a story 2): a throwaway package with a `Bootstrap` assembly (editor only, no references, one class, one address file) installed without Core into a clean 6000.3.10f1 project and a clean 6000.4.8f1 project. Both compiled with no error, the Core-constrained assembly stayed out, the bootstrap wrote one console line naming the install address, and Core then installed from its public GitHub address over https with no credentials in 17.7 s on 6000.4.8f1 and under about 30 s on 6000.3.10f1. The constrained assembly compiled after the install. The bootstrap assembly's warm compile cost 0.16 s plus 0.05 s of post-processing, against the audit's computed 0.2 to 0.8 s. The editor log shows no Git LFS call, and the package has no LFS file. One fact for UN4b: a clean 6000.4 project that installs today's Core logs 14 compile errors in Unity's serialization package on the first resolve, from Core's Entities 1.3.14 pin; the final compile is clean.

Facts the probe changed: the manual did not say whether a version define accepts an embedded package or a module name; both do. Settings taken: the skeleton's Core range is `[1.1.9,3.0.0)` until Core 2.0; the restructure branch is `layout/packages-folder`; the adoption script does not copy the workflow callers into a repository until the shared workflows exist.

