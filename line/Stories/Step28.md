## The stories of step 28: Art on characters (A2, A3)

Step 28 puts the Character bridge into ArtPipeline and ends with the hold and wear tests and the verdict picture judged by the developer. Fifteen stories: A2 ten, A3 five. The split into three parts is the planner's and follows the repositories: part one builds the bridge assembly and its eight checks at import in ArtPipelineDev; part two builds the two definition checks and brings Character and the figure into the art registry project, after part one merges; part three builds the hold test and the wear test and the picture, after part two merges. Facts are marked **verified** with the date or **verify before building on it**. Repositories: ArtPipeline (clone `ArtPipelineDev`, package at `Packages/ArtPipeline`, base `beta`) in parts one and three, ArtRegistry in part two. Character, Core and UI are read only through ArtPipelineDev's lock; a door the bridge needs that one of them lacks is raised with the exact type or member missing and that story stops.

Applies to every story of the step:

- **Rules:** a Tool: editor only. The bridge is one assembly `Spellbound.ArtPipeline.Character` at `Editor/Character`, namespace `Spellbound.ArtPipeline.Character`, door `ArtPipelineCharacterKit`, compiled only when Character is installed (versionDefines on `com.spellboundstudios.character`, range `[0.0.0,2.0.0)`), referencing the host editor assembly, Core, Core.Editor, UI.Widgets and Character's `Spellbound.Character`, `.Body`, `.Rig`, `.Presentation` and `.Editor`; its tests are `Spellbound.ArtPipeline.Character.Tests` at `Tests/Editor/Character` under the same define. Names spelled out, one type per file, explicit access modifiers, no comments or XML docs, the copyright line `// Copyright (c) Spellbound Studios. All rights reserved.` on line 1 of every new C# file, logging through Core's `Log`, the studio's Rider formatting (brace on the declaration's line, 4 spaces, 120 columns, CRLF). Tests first: red on the base, then the code. No value a game tunes is a constant: every tolerance, height and severity is a field with a default, and a check's severity is its kind's field (`ArtCheck<TSubject>`'s serialized `severity`). Finding codes are `artpipeline.<kebab-name>`, because Core's `ValidationFinding.IsCode` allows only `a` to `z`, `0` to `9`, `.` and `-` (the pitch's `held.grip_missing` is a sketch, not a code). Inside the bridge's namespace a bare `Character.X` resolves to `Spellbound.ArtPipeline.Character.X`, so Character's types are named through `using Spellbound.Character.Rig;` lines or `global::`.
- **Rules:** a game's rules are its own assets; no file of the package's code names a game, a folder or a socket id (`MainHand` and its kin are the registry's values, part two's). The base's tests already name `Saboteer` (`Tests/Editor/ArtSerializedFilesTests.cs:108`, `Tests/Editor/RopeRecord.txt:32`) and `grip_MainHand` (`Tests/Editor/ModelSubjectTests.cs:69, :73, :87`); the rule for this step is that no new line does. `package.json` gains no dependency and no version bump; Character reaches the bridge through ArtPipelineDev's manifest alone. Nothing the step adds writes JSON. The host's types are used as they are: `ArtCheck<ModelSubject>`, `IArtFix`, `[ArtFinding]`, `ArtHint`, `ModelSubject`, `ArtRule`, `ArtRuleRow`, `ArtKind`; Character's doors as they are: `CharacterKit.Rig.ResolveSockets`, `CharacterKit.Rig.DryRunRagdoll`, `RigBones.Resolve`, `WornPieceRebinding.Rebind`, `RigKindMapping`. The rig type is Character's `RigKind` mapped by `RigKindMapping`, never `ModelImporterAnimationType` named in a rule; the change marker is `RigContract.ContentHash`, not `GetVersion` (no host postprocessor has one).
- **Regression contract (part one):** ArtPipeline's edit-mode suite passes at its count before the change with none lost; the bridge compiles out with Character absent from the manifest and in with it present; with Character absent nothing outside the bridge's folders changes behaviour and the Reference sample audits as on the base commit; with the bridge compiled in the sample's audit is read again and every change named; `packagecheck check` over `Packages/ArtPipeline` reads no worse after than before, moved paths normalised; ArtPipelineDev's manifest gains only Character's line, its lock only Character's entry and the moved Core entry (UI's only if the compile asks); no edit to CharacterDev, CoreDev or UIDev.
- **Done, for each story:** compiles clean in the worktree's headless editor through the Unity command line, the edit-mode suites pass, and the pull request's report lists what landed.

### Part one, built now (ArtPipelineDev, eight stories)

### A2-1 The bridge and its door

- **Outcome:** the assembly `Spellbound.ArtPipeline.Character` at `Editor/Character` with its asmdef, its test assembly at `Tests/Editor/Character`, the door `ArtPipelineCharacterKit`, and the rule reading every bridge check shares: `ArtRuleRow` and `ArtKind` each gain one serialized `ScriptableObject` field named `rigContract`, the row's winning over the kind's; the bridge reads it as Character's `RigContract` through `ArtPipelineCharacterKit.ContractFor(ArtRule)`, which also yields the reference figure (the contract's own, else the row's) and the one-sentence skip when none is set: "This project has not named its playable character. Ask an engineer to set Reference figure on the rule set row", written as an Information finding `artpipeline.no-reference-figure` by the checks that need a figure, never an error or warning on the artist's model. A check whose rule names no contract reports `artpipeline.no-rig-contract` as Information and runs nothing else. ArtPipelineDev's manifest gains Character `#beta`, its lock Character's entry and Core moved to the dev head; `AGENTS.md` names the bridge and its door.
- **Verified (2026-11-19):** the Template's bridge range `[1.0.0-beta,2.0.0)` compiles a bridge out against a 0.0.0 package, so the range is `[0.0.0,2.0.0)`; Core fc4d288 lacks the reference frame types Character.Body builds on, so the Core lock moves to 0ea31e5 with Character's entry in one act.
- **Done:** the host's suite at its base count, the bridge's first tests red on the base and green after, a compile with Character absent and one with it present.

### A2-2 The humanoid rig check with hips and facing

- **Outcome:** `HumanoidRigCheck : ArtCheck<ModelSubject>, IArtFix`: `artpipeline.rig-not-humanoid` (Error by default) when the contract's kind is Humanoid and the root's `Animator.avatar` is null or not human, fixed by A2-3; `artpipeline.rig-bone-unmapped` (Error) for each required bone the avatar does not map, listing the unmapped ones in one message; for a Generic contract each required bone path absent as the same code; `artpipeline.hips-height-off` (Warning) when the hips bone's height above the root differs from the contract's by more than the check's `heightToleranceMetres` field (default 0.1), and `artpipeline.facing-off` (Warning) when the model's facing differs from the contract's axis by more than `facingToleranceDegrees` (default 10). Hints name the DCC's avatar configuration.
- **Done:** a passing and a failing case for each code against the Y Bot fixture; the hips and facing tolerances read as fields.

### A2-3 The humanoid repair

- **Outcome:** the fix of A2-2's `artpipeline.rig-not-humanoid`: `Repair` sets `importer.animationType = RigKindMapping.ToAnimationType(contract.Kind)` and nothing else; `ArtChecker.Fix` saves and reimports as it does for every fix; a dry run names the change.
- **Done:** a Generic-imported copy of the fixture goes Humanoid through `ArtChecker.Fix` and the finding clears; a dry run changes nothing.

### A2-4 The socket check

- **Outcome:** `SocketCheck : ArtCheck<ModelSubject>`: through `CharacterKit.Rig.ResolveSockets(root, contract)`, each socket in `Missing` (parent bone unresolved) is `artpipeline.socket-parent-missing` (Error); each in `Defaulted` is `artpipeline.socket-defaulted` (Information, the file has no node and the contract's default pose stands); resolved from the file passes. Never run on a null root.
- **Done:** three cases: from the file, defaulted, parent missing.

### A2-5 The socket step at import

- **Outcome:** `SocketImportStep : AssetPostprocessor` in the bridge, `OnPostprocessModel(GameObject root)`: looks the rule up as `ArtImportWatcher` does (`ArtRuleBook.Project.For(assetPath, assetImporter)` inside try and catch, errors logged through Core), and for a rule with a contract adds every missing socket node as a plain `Transform` child of its resolved parent bone, named by the socket's `NodeName`, at the contract's default local pose; no component is added. Where the node exists it is left as it is.
- **Verified (2026-11-19, 6000.4.8f1):** the root's `Animator` carries its human avatar inside `OnPostprocessModel`, so a human parent bone resolves there; a node added there survives into a prefab variant and a regular prefab made from the model and a forced reimport, so the degrade-to-finding path of `Art.md:594` is not needed. A new model hook reimports every model once when it first appears.
- **Done:** after import a `socket_<id>` transform sits under the parent bone and `SocketCheck` reports it from the file; a model whose rule names no contract gains nothing.

### A2-6 The grip check

- **Outcome:** `GripCheck : ArtCheck<ModelSubject>`: for a prop kind, each grip of the contract whose `SocketId` the check's `socketIds` field names (empty field: every grip) must have a node named `grip.NodeName` on the model, else `artpipeline.grip-node-missing` (Error) with a hint to add the locator in the DCC.
- **Done:** a prop fixture with and without `grip_<socket>`.

### A2-7 The wear check

- **Outcome:** `WearCheck : ArtCheck<ModelSubject>`: every bone of every `SkinnedMeshRenderer` of the model exists by name on the reference figure's rig, read through `WornPieceRebinding.Rebind` on an instance of the piece (destroyed after) against the figure's root, so the asset is never written; each name in `RebindMap.Missing` is `artpipeline.wear-bone-missing` (Error). With no figure the check writes the skip sentence and nothing else.
- **Verified (2026-11-19):** `Rebind` on an instance leaves the asset clean; the fixture writer `FbxText` writes no skin, so the worn fixture is Y Bot itself (its two skinned renderers, bones `mixamorig:*`) against a figure that is Y Bot, and the missing case is a figure that lacks a bone (a renamed copy).
- **Done:** complete and missing cases.

### A2-8 The ragdoll check at import

- **Outcome:** `RagdollCheck : ArtCheck<ModelSubject>`: for a character model the body is the model's own root, for a prop or worn piece the reference figure's root; `CharacterKit.Rig.DryRunRagdoll(body, contract.RagdollProfile)` runs in memory, and when `WouldBuild` is false `artpipeline.ragdoll-would-not-build` (Error) carries `Error` as its message, so the verdict card shows it; a contract with no profile is `artpipeline.ragdoll-no-profile` (Information). With no figure for a prop the skip sentence stands.
- **Done:** a profile that builds, one that misses a bone, and the audit of the Reference sample read before and after with every change named.

### Part two, built after part one merges (ArtRegistryDev, two stories and the registry's setup)

### A2-9 The contract check

- **Outcome:** `artpipeline.rig-contract (ArtPipeline)`, a Core.Editor `IDefinitionCheck<RigContract>` with `RegisteredDefinitionCheckAttribute` in the bridge: every required bone and each socket's parent bone exists on the contract's reference figure; the figure's playability is Character's own `Validate` and is not read twice.
- **Done:** a contract an artist brings fails in `core validate` before Send.

### A2-10 The row-figure check and the registry's setup

- **Outcome:** `artpipeline.rule-set-figure (ArtPipeline)`, an `IDefinitionCheck<ArtRuleSet>`: a row's figure passes `CharacterKit.Body.IsPlayable`. The registry project installs Character, names the Character sample's `LocomotionCharacter` prefab as the figure on its rows, gains the character kinds with the studio's socket names (`MainHand`, `OffHand`, `Back`, `Head`) and a rig contract, and the Animation role of items joins.
- **Done:** the registry's audit with the bridge's checks running.

### Part three, built after part two merges (ArtPipelineDev and ArtRegistryDev, five stories)

### A3-1 Reference poses

- **Outcome:** the contract's poses sampled onto the reference figure for the previews.

### A3-2 The hold test

- **Outcome:** the prop placed in the figure's hand through `CharacterKit.Rig.HoldPose` for each pose, in the registry against the figure its rules name.

### A3-3 The wear test

- **Outcome:** the worn piece rebound onto the figure and shown through the poses.

### A3-4 The verdict picture with sockets

- **Outcome:** `ArtPicture` draws the sockets and the held prop beside the figure and `artpipeline preview` writes it to a file.

### A3-5 The developer's judgment

- **Outcome:** the hold alignment picture on a page for the developer, built from captures; the merge is the sign-off.

### The written result of step 28, part one (A2-1 to A2-8, 2026-11-19)

Built on this machine in one worktree by the step runner: `_probes/ArtPipeline28`, a worktree of `Spellbound-Studios/ArtPipeline` on `a2-character-bridge-checks` from `beta` 1853567. A catalogue, a seam and four build stories in one chain, each build followed by a fresh verifier, no developer gate, no triage stop and no sign-off fix. Each task drove its own headless editor through the Unity command line and never two on the worktree. The plan and the sign-off ran on Fable; the catalogue, the seam, every build and every verify ran on Opus at high effort. The step prompt's four questions took the recommended line and the plan's fifteen answers held; three lead rulings during the run settled the Core call site, the wording of two seam checks and the editor's own residue in the status check. Character 88f2b11, Core 0ea31e5 and UI a292ff2 were read through ArtPipelineDev's lock and never edited. The part merged into `beta` by one pull request closing no issue, because no A2 story is filed; the long report is `line/Reports/Step28-part-one.md`. The outcomes above hold as written; what was built is below.

**What the package gained.** `Spellbound.ArtPipeline.Character` at `Editor/Character`, Editor only, compiled only with Character in `[0.0.0,2.0.0)` and Core in `[1.1.9,3.0.0)`, referencing the host editor assembly, Core, Core.Editor, UI.Widgets and Character's five assemblies; `Spellbound.ArtPipeline.Character.Tests` at `Tests/Editor/Character` under the same defines. `ArtRuleRow` and `ArtKind` each gained a serialized `ScriptableObject` field `rigContract` with a property; `ArtRule.RigContract` is the row's, else the kind's; the host names no Character type. The door `ArtPipelineCharacterKit` (`ContractFor`, `FigureFor`). `CharacterCheck`, the base of every bridge check, declaring `artpipeline.no-rig-contract` and `artpipeline.no-reference-figure` once, both Information through the report, the second carrying the skip sentence word for word. `HumanoidRigCheck : CharacterCheck, IArtFix` (`rig-not-humanoid` with its repair setting `animationType` through `RigKindMapping` and nothing else, `rig-bone-unmapped` in one message for Humanoid and Generic contracts, `hips-height-off` and `facing-off` as Warnings with `heightToleranceMetres` 0.1 and `facingToleranceDegrees` 10 as fields). `SocketCheck` (`socket-parent-missing` Error, `socket-defaulted` Information) and `SocketImportStep : AssetPostprocessor` adding a plain transform for each defaulted socket under its resolved parent bone at the contract's default local pose, no component, no `GetVersion`, nothing for a missing parent, the rule looked up as `ArtImportWatcher` does. `GripCheck` (`grip-node-missing`; `socketIds` empty meaning every grip). `WearCheck` (`wear-bone-missing` through `WornPieceRebinding.Rebind` on an instance destroyed in `finally`). `RagdollCheck` with `RagdollBody` (`ModelRig`, `ReferenceFigure`) running `CharacterKit.Rig.DryRunRagdoll` in memory, `ragdoll-would-not-build` carrying the builder's `Error` and the missing names, `ragdoll-no-profile` Information. Every Error through the kind's severity field; every hint in plain, Blender and Maya forms. `HumanoidFixture` copies Character's Y Bot as bytes with a fresh guid into `Assets/_Project/TestScratch` and deletes it in teardown. `AGENTS.md` gained the bridge paragraph, the rewritten "Not for" line, a socket-step rule, a Gaps line for part two and the regenerated Bridges and doors blocks. ArtPipelineDev's manifest gained Character `#beta`; its lock Character 88f2b11, Core moved fc4d288 to 0ea31e5 and UI ab1b53a to a292ff2 because UI's `ConsolePanel.cs:180` failed against the moved Core; `package.json` unchanged.

**What the step settled.**

| Question the step settled | Result |
|-|-|
| Where the contract lives | On the row and the kind as a `ScriptableObject` field the bridge casts, the row's over the kind's; the rule set check that reports a wrong type is part two's |
| The humanoid fixture | A byte copy of Y Bot and its meta with a fresh guid, imported, deleted in teardown; props are `FbxText` fixtures with a `grip_<socket>` node; the worn piece is Y Bot itself against a Y Bot figure, the missing case a figure prefab with one bone renamed |
| Severities | Error through the kind's field for the six rig, socket, grip, wear and ragdoll errors; Warning through the report for the two hips findings; Information for the four skips |
| The Core call site | Core 0ea31e5 dropped the two-argument `OperationHost.Run`; the seam mended the host's one call site (`ArtPipelineOperationsTests.cs:499`, `ObservationContext.Discard`) under a ruling, because the lock move was its act |
| Two seam checks as worded | Two base lines of `ArtKind.cs` rewrapped to 120 columns with no other change; the skip sentence split over two lines with the same text; `/**` glob strings left out of the comment grep |
| The status check | The editor's own residue (a line-ending diff on the manifest, the untracked `EntitiesClientSettings.asset`) is read out of every status check |
| The socket step's degrade path | Not built: the catalogue's probe shows the node survives into prefabs and reimports, so Art.md:594's path is not needed |
| The "Not for" line on the studio's socket names | Left as it is; Studio.Presentation holds no art rules asset, the registry project gains the studio's kinds and socket names in part two, and the line is rewritten there |
| The bar | 0 must fix, 1 to confirm (D4), 34 passed, 4 not applicable before and after; D4 moved to the bridge asmdef with the same UI-layer cause |

**Tests.** Edit mode 1,139 at the base, 1,158 after the seam (red 13 `error CS1061` then 2 `error CS0246`), 1,178 after A2-2 and A2-3 (red 11 of 32, then 1 of 34 on the second attempt), 1,187 after A2-4 and A2-5 (red 6 of 43), 1,199 after A2-6 and A2-7 (red 7 of 55), 1,207 after A2-8 (red 4 of 63), every run 0 failed and every count reread in the verifier's own editor. With Character absent the bridge assembly was absent, the compile clean and the suite 1,144; with it present the assembly compiled. The Reference sample's audit read 3 red, 4 amber, 2 passing with the same seven codes before and after, absent and present. Nothing under `Packages/ArtPipeline` outside the bridge's folders, the three Rules fields, the mended test line, `AGENTS.md` and the two folder metas; `package.json` unchanged; no new line names a game, a folder or a socket id. The seam took four attempts (two blocks for rulings, one fail on check wording), A2-2 and A2-3 two (the verifier's two nits: an unresolved-hips test that never reached its branch, a blank path listed as missing), the rest one. The sign-off found four nits, all accepted: `else` and `finally` on the closing brace's line in three files, `SocketImportStep` unbackticked in `AGENTS.md` because PackageCheck's A4 fails an internal type, a private helper beside the one allowed fixture method, an unreachable null guard. Cost before the sign-off $41.49 over 17 sessions (plan 7.92, catalogue 4.44, seam 8.46, build 10.21, verify 10.46, triage 0).

**Facts that changed.** Character's `beta` is 19c7d3f and Core's `dev` 1325cd2 since the run started; the worktree's lock stays at 88f2b11 and 0ea31e5, so part two's seam reads the lock. A `Client.Remove` then `Add` in a checkout rewrites the lock to the branch heads, so the compiled-out reading ran on a byte copy. `packagecheck check` refuses a path outside the project (`W/...`). `unity command eval` prints `"result":false` in lower case. A stray `unity command` into a running editor fails one test under "Unhandled log message". The runner commits every attempt of a build.

**Raised.**

- PackageCheck: A4 fails a backticked internal type name; A1 reads a test assembly with a define constraint as a bridge; D4 cannot place `Spellbound.UI.Widgets` in the layer order.
- Bridge, for part three: `else` and `finally` placement at `RagdollCheck.cs:46,48`, `WearCheck.cs:43`, `HumanoidFixture.cs:66`; the unreachable guard at `HumanoidRigCheck.cs:77`.
- Runner: attempts committed one by one; a verifier's package-client re-add leaves a re-sorted manifest for the next task; check wording a base line cannot clear costs an attempt and a ruling; the `W/` placeholder in an operation line.

**Not run.** Play mode; a player build; Steam; the bar from PackageCheckDev's editor (refused by the session's permission check); the bridge against a sample row that names a contract; the contract and row-figure checks (part two); the hold test, the wear test and the picture (part three).
