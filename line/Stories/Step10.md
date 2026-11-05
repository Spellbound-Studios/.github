## The stories of step 10: probes and the Studio shell (NW10, NW2g, UN9, L11t)

Step 10 answers three questions by running them and makes the home the Studio packages grow in. Eight stories: NW10 one, NW2g one, UN9 four, L11t two. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Nothing in a game, in Core or in any shipping package changes in this step; the probes live in NetworkingDev and in throwaway copies, and the Studio shell is a new repository.

Applies to every story of the step:

- **Rules:** the rules of steps 1, 2 and 5 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, the copyright line on every new C# file, logging through Core, the studio's Rider formatting; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows).
- **Rules:** a probe ends in a written result, a table of question, result and evidence, in this file; the developer's merge of the pull request that carries it closes the probe. A probe's code ships nowhere: NW10's and NW2g's probe assemblies stay under NetworkingDev's `Assets/Tests`, beside the probes that are already there, and UN9's copies are deleted when the note is written.
- **Rules:** the working Corsairs Isle project is never opened in another editor. UN9 works on a plain folder copy that skips `Library`, `Temp`, `Logs`, `.git` and the generated solution files; the copy keeps the working tree's uncommitted edits and its `packages-lock.json`, so it compiles the same package commits the game does.
- **Rules:** every decision put to the developer is one plain question with the recommendation first; a question a standing rule answers is applied and recorded, not asked.
- **Verified (2026-10-25):** NetworkingDev is a plain Unity project on 6000.3.10f1 with no git repository and no Networking package; it holds PurrNet 1.25.0-beta.4 from `#dev`, PurrDiction 1.4.0 from `#release`, Core 1.1.9 from `#dev` at an older commit, and four probe assemblies under `Assets/Tests`. No `Networking` and no `Studio` repository exists in the organisation; `Template` is at the step 11 state (pull request 4 of its repository). The Corsairs Isle working tree has five uncommitted edits and locks Core `#dev` at a commit before step 4's operations.
- **Regression contract:** NetworkingDev's existing test assemblies (NetworkModules, Prediction, PredictionHost, WireFormat) compile and their edit-mode and play-mode tests pass as before; the Corsairs Isle working project is untouched, byte for byte; no file of any other repository changes.
- **Done, for each story:** compiles clean through the Unity CLI in the project named, its tests pass, and the written result stands in this file.

### NW10-1 Who steps a world that predicts

- **Outcome:** it is known, from one process in NetworkingDev, what PurrDiction's `PredictionManager` does to the process when it wakes and starts (`Physics.simulationMode`, `Time.fixedDeltaTime`), that the scene holding a manager is stepped by the manager alone, that a local physics scene without a manager is stepped once per fixed step by a driver and not at all without one, and that the default scene is stepped by Unity in automatic mode and by the driver alone once the process is in script mode. The rule for the world instance's driver is written from the readings and filed to Runtime and WorldObjects for L3's driver story.
- **Verified (2026-10-25):** `PredictionManager.Awake` sets `Physics.simulationMode = Script` when its physics provider includes 3D (`PredictionManager.cs:133`), `OnEarlySpawn` sets `Time.fixedDeltaTime = tickDelta` (`:563`) and the physics pass calls `gameObject.scene.GetPhysicsScene().Simulate(delta)` (`:1899`); `OnDestroy` restores neither; the provider defaults to none, so a manager without the provider set steps no physics. PurrNet registers a scene only through its own scene module, so a manager in a scene of its own is spawned into a scene loaded through `ScenesModule.LoadSceneAsync` with `PurrSceneSettings.physicsMode`.
- **Rules:** the driver of the probe implements the rule under test: it steps the physics scene of its own scene with `Time.fixedDeltaTime` at the latest execution order, leaves a physics scene alone when a manager's scene uses it, and steps the default physics scene only in script mode. The step count is read from a body with no gravity whose velocity is set each fixed update to one unit per step, so distance travelled equals steps taken.
- **Done:** the play-mode tests pass in NetworkingDev; the written result and the rule are in this file.

### NW2g-1 The PurrNet gate, proved as a probe

- **Outcome:** it is known on 6000.3 that an assembly constrained on a symbol a `versionDefines` entry defines over a bounded range of `dev.purrnet.purrnet` compiles when the installed PurrNet is inside the range and is skipped with no error when it is outside; that a prerelease version is accepted in the range expression; that an ungated editor assembly reads the installed version through `PackageInfo` at each domain reload, logs an error through Core naming the version and the range when PurrNet is installed outside the range, and stops a player build with that message through `IPreprocessBuildWithReport`; that a build passes when the installed PurrNet is inside the range; and that with PurrNet absent the gated assembly is skipped, the project opens with no error, and a menu item offers `Client.Add` of PurrNet's address, after which the gated assembly compiles.
- **Verified (2026-10-25):** no Networking package exists yet (NW1 creates it in step 21), so the gate is proved as probe assemblies under `Assets/Tests/PurrNetGate` in NetworkingDev, shaped as the package's assemblies will be: a gated adapter, an ungated editor assembly, and tests. Core 1.1.9's logger registers its sinks at `RuntimeInitializeOnLoadMethod` only, so an error logged through Core at domain reload in edit mode reaches no sink.
- **Rules:** the tested range is written once in the probe (`[1.25.0-beta.1,2.0.0)`), the out-of-range case uses a second expression (`[2.0.0,3.0.0)`) against the same installed PurrNet, so both cases are proved against one install; the absent case runs in a throwaway project outside every repository.
- **Done:** the edit-mode tests pass in NetworkingDev, the two player builds give the expected results, the absent-case project behaves as written, and the written result is in this file.

### UN9-1 The 6.7 beta copy opens and compiles (checks 1 to 4)

- **Outcome:** a plain folder copy of the Corsairs Isle project opens in the newest Unity 6.7 beta, and it is written against the ledger rows which packages compile, which calls are removed or now errors (the saved-reference rules on Modifiers and Core first), what Unity does with Collections, Burst and Mathematics declared as packages, whether Core's assembly scan and the unload code still run and warn with play mode entered twice without domain reload, and whether the experimental CoreCLR player installs; the Localization migration is written down as not run, because Corsairs holds no Localization package.
- **Rules:** the copy is opened by the beta editor in batch mode from the command line and driven through the Unity CLI; the editor is installed by the developer, because the Windows installer asks for administrator rights that only a person can grant.
- **Done:** the written result per check.

### UN9-2 A Windows build, the renderer and the importer (checks 5 to 7b)

- **Outcome:** a Windows player built from the copy on 6.7 lists its shipped files and whether the C++ runtime files are among them (the Steam upload half is BuildPipeline's and is written down as not run); the PC renderer asset's ambient shadowing setting is read after the beta's upgrade and the console's words about it recorded; Instancing's batch draw and Art's importer behaviours are written down as not run because neither package exists, with the Resident Drawer setting of the copy's URP asset recorded.
- **Done:** the written result per check.

### UN9-3 PurrNet, the physics scene scope and Entities, then the ledger lines (checks 8 to 10)

- **Outcome:** whether PurrNet compiles on 6.7 and a host and a local client connect (NetworkingDev's module tests copied into the throwaway copy); what `PhysicsSceneLoadScope` offers against the route of a scene created with `LocalPhysicsMode`; which Entities calls are errors in the copy. Then one line per ledger row 6.7 changes: changed, unchanged or unsure, with the quote, and the note for the executive brief.
- **Done:** the note.

### UN9-4 The Unity 7 alpha copy

- **Outcome:** a second plain copy of the Corsairs Isle folder opens once in the newest Unity 7 alpha, every error and warning is written into one list that says whether the Unity 7 move is a small or a large job, the first line of a text asset re-saved by the alpha is recorded, and the checks that need packages the copy lacks (the theme fixture, the seed compare, the discovery probe) are written down as not run; `VoxelMaterialDatabase` is baked where the copy's GeoForge allows it.
- **Rules:** the working project never opens in the alpha; the copy is deleted when the list is written.
- **Done:** the list.

### L11t-1 The Studio repository shell

- **Outcome:** `StudioDev` exists beside the other dev projects, made from the template's working tree as `gh repo create --template` would make it: the dev project at the root, the template's scripts, workflows, hooks and managed files, a manifest that installs Core from GitHub and the Pipeline package, and the convention for five packages by cluster under `Packages/`. The developer initialises the repository and pushes the template commit first, so the Studio.Tools shell is a reviewable pull request on top of it.
- **Rules:** managed files are not edited, so the template's sync keeps working; the manifest points Core at `#dev` until Core has a `beta` branch, because the template's `#beta` line resolves to nothing today.
- **Done:** the folder opens in 6000.4.8f1 through the Unity CLI with no compile error.

### L11t-2 The Studio.Tools package

- **Outcome:** `Packages/Studio.Tools` is the first Studio package, id `com.spellboundstudios.studio.tools`, shaped as a tool: one editor assembly `Spellbound.Studio.Tools.Editor` constrained on Core's define, the front door `StudioToolsKit` holding the text of the copyright line, an edit-mode test assembly whose test reads every C# file of the package and fails on one that does not open with that line, a sample folder, and the identity files the template ships (`package.json`, `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` with its headings, the boundary sheet).
- **Rules:** the folder is `Packages/Studio.Tools`, the short name with its dot, as the line text's package folder rule says; the namespace is `Spellbound.Studio.Tools`, the operation group `studiotools`, the front door `StudioToolsKit`.
- **Done:** compiles in StudioDev and its tests pass through the Unity CLI.

### The written result of the stepping probe (NW10-1, 2026-10-25)

Run on this machine in NetworkingDev (Unity 6000.3.10f1, PurrNet 1.25.0-beta.4, PurrDiction 1.4.0, fixed step 0.02 s, the manager at 30 ticks a second): five play-mode tests through the Unity command line, all passing, with the readings written to `Temp/stepping-ownership.txt`. Each step count is a body's distance in units at one unit per step; a window is 50 fixed updates or 60 ticks.

| Question | Result | Evidence |
|---|---|---|
| What the manager does to the process when it starts | `Physics.simulationMode` becomes `Script` for the whole process and `Time.fixedDeltaTime` becomes the tick step | Read after `OnEarlySpawn`: mode `Script`, fixed step 0.0333 s, tick step 0.0333 s; the process was at `FixedUpdate` and 0.02 s before |
| A manager in a scene with its own physics scene steps that scene, once per tick | pass | The scene loaded through PurrNet's scene module with `LocalPhysicsMode.Physics3D`: 60 steps in 60 ticks; the driver placed there stepped 0 times and skipped 60 |
| A local physics scene is stepped once per fixed step by a driver and not at all without one | pass | Driven scene 50 steps in 50 fixed updates (60 in 60 beside the manager); the idle scene 0 |
| The default scene in automatic mode is Unity's, and the driver stays out | pass | 50 steps in 50 fixed updates with the driver's `skipped automatic default` at 50 and its own steps at 0 |
| The default scene in script mode is stepped by nobody until the driver steps it | pass | 0 steps in 25 fixed updates without a driver, then 50 in 50 with one; beside a manager in its own scene the default scene took 60 driver steps in 60 fixed updates |
| A manager in the default scene owns the default physics scene | pass | 60 steps in 60 ticks, the default-scene driver stepped 0 and skipped 60; a driven local scene beside it kept 60 in 60 |
| What the manager leaves behind when it is destroyed | finding | The process stays in `Script` mode at the tick step (0.0333 s) after the manager and its host are gone; nothing restores `FixedUpdate` mode or the 0.02 s step |
| How a driver knows a scene holds a manager | finding | `PredictionManager.TryGetInstance(scene.handle)` answers from a static dictionary filled in `Awake` and cleared only when play mode starts; it keeps destroyed managers and prefab templates whose `Awake` ran. The probe's driver counts a manager only when it is alive and spawned |

**The rule for the world instance's driver (filed to Runtime and WorldObjects for L3's driver story):** the driver steps the physics scene of its own scene with `Time.fixedDeltaTime` at the latest execution order; it leaves a physics scene alone when a live, spawned `PredictionManager` sits in a scene that uses that physics scene (its own scene, or any scene when the physics scene is the default one); it steps the default physics scene only while `Physics.simulationMode` is `Script`, because a manager anywhere in the process switches the whole process to script mode and Unity then steps nothing on its own. Two consequences the games carry: once a world has predicted, physics in every world of that process runs at the tick step until something sets the fixed step back, and the mode and the step are not restored when the predicted world unloads, so a game that predicts one world and keeps others decides at its prediction pitch who restores them. Rule 11 of the line text stands as written; the two consequences are additions for L3's driver story and the first prediction pitch.

### The written result of the PurrNet gate probe (NW2g-1, 2026-10-25)

Run on this machine in NetworkingDev (Unity 6000.3.10f1, PurrNet 1.25.0-beta.4 installed from `#dev`): eight edit-mode tests through the Unity command line, all passing, with two player builds; and a throwaway project outside every repository (6000.3.10f1, Core `#dev` at `e0ca89f`, no PurrNet) opened once in a batch editor. The probe assemblies stay under `Assets/Tests/PurrNetGate` in NetworkingDev; the Networking package takes the same shape when NW1 creates it.

| Question | Result | Evidence |
|---|---|---|
| A prerelease version is accepted in a `versionDefines` expression | pass | `[1.25.0-beta.1,2.0.0)` defines `PURRNET` with 1.25.0-beta.4 installed; the asmdef imports with no error |
| An assembly constrained on the symbol compiles when the installed PurrNet is inside the range | pass | `NetworkingDev.PurrNetGate.Adapter` is in `CompilationPipeline.GetAssemblies` and references a PurrNet type |
| The same constraint skips the assembly with no error when the range excludes the installed PurrNet | pass | `[2.0.0,3.0.0)` leaves the symbol undefined; `NetworkingDev.PurrNetGate.OutOfRange` is absent from the compilation, its asmdef is still reported by `GetAssemblyDefinitionFilePathFromAssemblyName`, and the console shows no error |
| An ungated editor assembly reads the installed version at domain reload | pass | `PackageInfo.FindForPackageName("dev.purrnet.purrnet").version` answers `1.25.0-beta.4`; the same assembly carries the range as its own `versionDefines` entry without a constraint, so `#if PURRNET` tells it whether the range held |
| Outside the range an error through Core names the version and the range | pass | One `Error` entry on a recording sink: "PurrNet 1.25.0-beta.4 is installed but outside the tested range [2.0.0,3.0.0), so the adapter is compiled out and nothing that references it compiles. Install a PurrNet inside the range." Inside the range nothing is logged |
| A player build stops with that message when the gate fails | pass | `IPreprocessBuildWithReport` throws `BuildFailedException`; `BuildPlayer` returns `Failed` after 0.9 s with the message in the report |
| A player build passes when the gate holds | pass | Windows 64 player of the sample scene: `Succeeded`, 111 s the first time and 3.8 s warm, 0 errors |
| With PurrNet absent the project opens clean, the gated assembly is skipped and the install is offered | pass | The throwaway project compiled only the editor probe assembly, with 0 errors; `Spellbound/Networking/Install PurrNet` was offered |
| The offer installs PurrNet and the gated assembly then compiles | pass | `Client.Add` of `https://github.com/PurrNet/PurrNet.git?path=/Assets/PurrNet#dev` installed 1.25.0-beta.13; after the resolve the adapter compiled, the out-of-range assembly stayed out, the offer disappeared |
| Core's current `dev` head compiles on 6000.3 | pass | Core `e0ca89f` (the step 4 state) resolved and compiled in the throwaway project |

Facts the probe changed: `#dev` of PurrNet moves (beta.4 in NetworkingDev's lock, beta.13 on a fresh install), so the catalogue row's tested range and the games' lock files are what hold a version, never the address. A gap for Core: `LogBootstrap` registers sinks at `RuntimeInitializeOnLoadMethod` only, so an error logged through Core from an `InitializeOnLoadMethod` in edit mode reaches no sink; the editor gate's error is proved on a sink the test registers, and the gate that ships needs Core to give editor code a sink (raised below). Settings taken: the probe's tested range is `[1.25.0-beta.1,2.0.0)`, the install address is the one both games already use, a project with no PurrNet logs nothing and only offers the menu item.

### The written result of the Unity 6.7 beta probe (UN9-1 to UN9-3, 2026-10-25)

Run on this machine on Unity 6000.7.0b6 (the newest beta the Unity command line offers; b7 is named in Unity's notes but not offered), installed by the developer, on a plain folder copy of the Corsairs Isle project: the working tree of 2026-10-25 with its five uncommitted edits and its lock file, with `Library`, `Temp`, `Logs`, `.git` and the generated solution files left out. The copy holds Core 1.1.9 at the lock's commit, PurrNet 1.20.0-beta.216, GeoForge 0.6.24, UI 0.2.7, Chat 0.3.11, Controller 1.1.4, Modifiers 0.2.5, Inventory 0.2.0, Persistence 0.1.2 and Entities 6.4.0 declared. Every opening was headless through the Unity command line; the working project was never opened. The copies were deleted after the note.

| Check | Result | Evidence |
|---|---|---|
| 1 Every package compiles | fails on Core's Entities folder and on two Corsairs files; clean after four one-line stubs | Core `ObjectPresetAuthoring.cs:26` (`IBaker.AddSharedComponentManaged`) and `ObjectParent.cs:580` (`EntityManager.GetSharedComponentManaged`) are errors CS0619 ("Managed ISharedComponentData support is deprecated and will be removed... First deprecated in 6.6"). With those stubbed in the copy, Corsairs' `NetworkedChunk.cs:77` fails on the same call and `TalentTreeAssetOpener.cs:15` fails on the `EntityId` from `int` cast ("EntityId will not be representable by an int in the future"); `EditorUtility.InstanceIDToObject(int)` is an error too, so the fix is the `OnOpenAsset(EntityId, int)` signature. With all four stubbed, every package and every Corsairs assembly compiles on 6.7 with zero errors |
| 1 The saved-reference rules | no error | Modifiers' and Core's `SerializeReference` uses raise none of UAC1005 to UAC1008, UAC1019 or UAC1020. The analyzer reports UAC1001 (a field skipped by serialization), UAC1002 (an incomplete serialized hierarchy) and UAC1010 as warnings in Corsairs' game code, the Heathen Steam asset and Steamworks.NET; UAC0005 names Core's `AssemblyScanning.cs:10` and `LogConfigEditor.cs:189` for `AppDomain.GetAssemblies()`; UAC0023 names `BinaryFormatter` in Heathen; UAC0008 and UAC0009 say `UNITY_64` and `DEVELOPMENT_BUILD` are no longer defined (PurrNet's UTP transport, Steamworks.NET) |
| 2 Collections, Burst and Mathematics declared as packages | compile; the beta replaces them | The lock's Collections 2.x, Burst 1.8 and Mathematics 1.3 resolve as built-in `com.unity.collections 6.7.0`, `com.unity.burst 2.0.0`, `com.unity.mathematics 1.4.0`; Entities 6.4.0 resolves as built-in 6.7.0; URP as 17.7.0. No duplicate-type error |
| 3 Core's assembly scan and unload code | runs; one analyzer warning | Play mode entered and left twice with domain reload off (`DisableDomainReload`, set on the copy): `SmartPackerRegistry` registered its nine packers on both entries, the console shows no error, and the only words about the scan are the compile-time UAC0005 warning on `AssemblyScanning.cs:10` |
| 3 The experimental CoreCLR player | not run | It is a separate module, `windows-coreclr` (347 MB), which the editor install did not include; installing a module asks for administrator rights like the editor |
| 4 Localization migration | not run | Corsairs holds no Localization package; Saboteer's 6.7 move runs it. The beta ships `UnityEngine.LocalizationModule` and `UnityEngine.LocalizationRuntimeModule` as engine modules |
| 5 A Windows build ships the C++ runtime files | yes | A Windows 64 player of an empty scene built on 6.7 (`Build Finished, Result: Success`); the build folder holds `concrt140.dll`, `msvcp140.dll`, `msvcp140_1.dll`, `msvcp140_2.dll`, `msvcp140_atomic_wait.dll`, `msvcp140_codecvt_ids.dll`, `vcruntime140.dll` and `vcruntime140_1.dll`, plus `dstorage.dll`, `dstoragecore.dll` and a `D3D12` folder, beside `UnityPlayer.dll` and `MonoBleedingEdge`. Whether the Steam upload includes them is BuildPipeline's and not run; switching the copy off is MV's choice |
| 6 The old ambient shadowing setting | still honoured, unchanged | `PC_Renderer.asset` opens on 6.7 as a `UniversalRendererData` with two renderer features, `ScreenSpaceAmbientOcclusion` active and `DecalRendererFeature` active; nothing moved it to a Volume and the console says nothing about it. Art's verdict picture render is not run (ArtPipeline does not exist) |
| 7 Instancing's batch draw and the Resident Drawer | not run | Instancing does not exist; the copy's `PC_RPAsset` has `GPUResidentDrawerMode: InstancedDrawing` |
| 7b Art's importer behaviours | not run | ArtPipeline does not exist |
| 8 PurrNet compiles and connects | yes | PurrNet 1.20.0-beta.216 compiles on 6.7 (two warnings about removed symbols); a play-mode test starts a host over `LocalTransport` and its local client connects: `isServer True isClient True isHost True localPlayerReady True serverState Connected clientState Connected` |
| 9 `PhysicsSceneLoadScope` | read | A struct in `UnityEngine.PhysicsModule` with one constructor taking a `PhysicsScene`, a `scene` property and `Dispose`: a `using` scope that makes scenes loaded inside it use the given physics scene. It does not replace the world instance's route (a scene created or loaded with `LocalPhysicsMode.Physics3D` owns its physics scene); it adds a way to load an authored scene asset into an existing world's physics scene, which the world instance can offer later without a design change |
| 10 The managed-component compile errors | confirmed | Check 1's three CS0619 errors are exactly the managed-component removal; two are in Core's ECS folder that UN4b deletes, one in Corsairs' chunk code that the Corsairs rewire removes |

**The ledger rows 6.7 changes:**

| Row | Changed, unchanged or unsure | The quote |
|---|---|---|
| Editor floor | unchanged | The floor stays 6000.3; 6.7 opens the copy and compiles it after four one-line edits, none in a package the line keeps |
| Rule 12, the `AppDomain` scan and `DomainUnload` | unchanged on 6.7, with a warning | "warning UAC0005: AppDomain.GetAssemblies() in Unity may return already unloaded assemblies and result in errors or leaks. Use Unity APIs instead"; the scan still runs with domain reload off |
| Burst and Mathematics declarations | changed | Both resolve as built-in modules (`com.unity.burst 2.0.0 BuiltIn`, `com.unity.mathematics 1.4.0 BuiltIn`) whatever the manifest declares; Collections too (`6.7.0 BuiltIn`) |
| Core packing against `com.unity.serialization` | unsure | The copy pulls `com.unity.serialization` through Entities only; Core's packing does not reference it. Nothing to read in this copy |
| Dedicated Server 3.0 and Multiplayer Play Mode 3.0 | unsure | Not in the copy's manifest; not read |
| Cinemachine and Performance Testing | unchanged | Cinemachine 3.1.6 and the performance test framework resolve and compile |
| Project Auditor | unsure | Not in the copy; not read |
| The batch renderer, Mesh LOD and the Resident Drawer | unsure | `GPUResidentDrawerMode: InstancedDrawing` is honoured; no Instancing code exists to draw |
| ArtPipeline's model hooks | unsure | No ArtPipeline code exists |
| The Pipeline package | changed in words | Pipeline 0.8.0-exp.1 runs on 6.7 and drives the copy; the Unity command line says "This project's com.unity.pipeline uses the old command names. Run unity pipeline upgrade" on every project |
| GameObjects-are-Entities and `EntityId` | changed | `EntityId` from `int` is an error (CS0619), `EditorUtility.InstanceIDToObject(int)` is an error, `OnOpenAsset(EntityId, int)` is the signature |
| Localization | changed | Engine modules `UnityEngine.LocalizationModule` and `UnityEngine.LocalizationRuntimeModule` exist in the beta; the package migration is not run |
| Collections | changed | Built-in 6.7.0 |
| The saved-reference rules | unchanged | No UAC1005 to UAC1008, UAC1019 or UAC1020 in the copy |
| `PhysicsSceneLoadScope` | changed, additive | A struct scope over a `PhysicsScene`; the world instance's route stands |
| Animation Rigging | unsure | Not in the copy |

### The written result of the Unity 7 alpha copy (UN9-4, 2026-10-25)

Run on this machine on Unity 7000.0.0a12 (the newest alpha the Unity command line offers), on a second plain copy of the same folder. The story asks for one opening; the copy was opened once as it was and then three more times with the same four one-line stubs as the 6.7 copy, to read what lies behind the first errors. The working project never opened in it. The copy was deleted after the list.

The list, every error and warning of the first opening and what the later openings added:

| Kind | Where | What |
|---|---|---|
| error | Core `ObjectPresetAuthoring.cs:26`, `ObjectParent.cs:580` | `AddSharedComponentManaged` and `GetSharedComponentManaged` no longer exist (CS0103, CS1061); the same two lines 6.7 refuses |
| error, second opening | Corsairs `TalentTreeAssetOpener.cs:15` | `EntityId` from `int` is an error; `InstanceIDToObject(int)` too; `OnOpenAsset(EntityId, int)` compiles |
| error, third opening | Corsairs `NetworkedChunk.cs:77` | `AddSharedComponentManaged` no longer exists |
| clean compile, fourth opening | every package and every Corsairs assembly | Zero errors; the same warning set as 6.7 (UAC1001 x4, UAC1002 x8, UAC1010 x4, CS0067 x4 in Corsairs' code) |
| warnings, first opening | the Heathen Steam asset, Steamworks.NET, PurrNet, Core, UI, Chat, GeoForge | UAC1002 x238 (incomplete serialized hierarchies, nearly all Heathen), UAC1001 x57, UAC0023 x24 (`BinaryFormatter` deprecated), CS0618 x20 (`PlayerSettings.GetScriptingDefineSymbolsForGroup` obsolete, in Steamworks.NET's installer), UAC0005 x10 (`AppDomain.GetAssemblies()` in Core and Persistence), UAC0008 x6 and UAC0009 x2 (`UNITY_64` and `DEVELOPMENT_BUILD` removed, in Steamworks.NET and PurrNet's UTP transport), CS0067 x4, CS0414 x2 |
| runtime, play mode | the editor | "Initialize CoreCLR" in the log; `enterPlayModeOptionsEnabled` stays false on the copied project, as Unity said an existing project keeps its setting; play mode entered and left twice with no error from Core, and Core's packers registered both times |
| runtime error, play mode | PurrNet 1.20.0-beta.216 | `MethodAccessException: Attempt by method 'PurrNet.CodeGen.Serializers...Serializer.Register()' to access method 'PurrNet.Packing.PackCollections.RegisterQueue<...>'`, then `InvalidOperationException: [Hasher] Type 'PurrNet.Modules.TickManagerRequestLocalTick' is not registered`; the host and client connect test fails. PurrNet's generated serializers call a method CoreCLR refuses them access to, which Mono allowed |
| runtime error | Steamworks.NET | "Failed to load types from assembly com.rlabrecque.steamworks.net ... Unable to load one or more of the requested types" |
| dialog | URP | "URP Material upgrade: The Materials in your Project were created using an older version of the Universal Render Pipeline" is raised as a dialog the batch editor cannot show |
| warning | DOTween | Two `.dll.meta` files hold a `PluginImporter` below the supported minimum version and want a re-save |
| text assets | `Assets/NetworkPrefabs.asset` re-saved by the alpha | The first line stays `%YAML 1.1`, the second `%TAG !u! tag:unity3d.com,2011:`; 7000.0.0a12 writes no `%UNITY` line and neither does 6000.7.0b6. Of the two a12 entries, the later one holds: text files do not start with a version line |
| `AddObjectToAsset` | GeoForge `VoxelMaterialDatabase.BuildTextureArrays` on `CorsairsMaterials.asset` | The bake ran, two texture arrays sit under the asset and the main object is still the `VoxelMaterialDatabase`; the alpha's change (no replacement of the main object) does not break this caller |
| not run | the theme fixture, the seed compare, the discovery probe, Legacy Theme Priority | UI's fixture is on UI's `beta`, which the copy does not follow; W1's compare and Core's discovery record do not exist yet; no member named for a legacy theme priority exists on `PlayerSettings`, `EditorSettings` or `PanelSettings` in a12 |

**Small or large:** the compile side of the Unity 7 move is small: four one-line edits, three of them in Entities code the line deletes anyway (UN4b and the Corsairs rewire) and one `EntityId` signature. The runtime side is not ours to size: PurrNet's generated serializers and Steamworks.NET fail to load on CoreCLR, so the move waits for a PurrNet release that runs on CoreCLR, which the catalogue row's tested range gates, and for a Steamworks.NET that loads. The alpha writes no `%UNITY` line into text assets, so the release scan's threshold stays "any `%UNITY` first line fails" with nothing yet to compare against.

Facts the probes changed: Corsairs' `packages-lock.json` pins Modifiers at `d3348df`, a commit GitHub no longer holds; the copy resolved it from the lock all the same. Settings taken: the probe copies skipped `.git` as well as `Library`, `Temp` and `Logs`; the stubs are `#if UNITY_6000_7_OR_NEWER` guards in the copies only, and nothing in a repository changed.

