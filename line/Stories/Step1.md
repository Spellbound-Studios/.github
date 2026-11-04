## The stories of step 1: Core as assemblies (L1 with L1r)

Step 1 is the smallest slice that shows the shape: Core redrawn as assemblies and every consumer compiling against them, with no behaviour changed. L1 has seven stories and L1r three. Stories L1-1 to L1-6 and L1r-1 to L1r-3 are step 1; L1-7 waits for the layout probe and is the first story of step 2. The split of L1 into seven stories is the planner's; the outcomes are the epic's. Facts are marked **verified** with the date (checked in source or measured) or **verify before building on it** (a lead from a survey that another session may have changed since).

Applies to every story of the step:

- **Rules:** Core's assemblies depend on the engine modules and nothing else Spellbound; references point down or sideways, never up; names are spelled out, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, C# formatted to the studio's Rider settings (brace on the same line, 4 spaces, 120 columns, CRLF).
- **Rules:** a move changes no namespace and no public type; no alias, no `MovedFrom`, no parallel old and new path; every consumer of a moved type is updated in the same change.
- **Rules:** work only in the directories the kickoff names; a gap in a dependency or a change that belongs in another package is raised in the report and stops that story, never worked around; nothing merges to a branch the games follow.
- **Rules:** every consumer resolves Core from GitHub and the lead never touches git, so no branch exists for the working tree. Each consumer's project takes a temporary manifest line of the form `"com.spellboundstudios.core": "file:../../CoreDev/Packages/Core"` (the path as it is on this machine) that points at CoreDev's working tree; it is a local path and not a pin, it is listed in the report under Files, and the developer removes it when the branch exists and the work merges.
- **Regression contract:** Core's edit-mode tests pass unchanged (138, counted by attribute on 2026-10-22, not run: **verify before building on it**); the logger, packing, hashing, registries, `SingletonManager`, weighted tables and assembly scanning behave as before; every type that was public stays public under the same name and namespace.
- **Regression contract:** Saboteer and Corsairs compile against the branch once L1r's references are in; neither game's code, scene or prefab changes.
- **Done, for each story:** compiles clean in the dev project through the Unity CLI (`unity command recompile` with `--project-path`, then the console shows no error), the tests pass, and the report lists what moved and what was proposed.

### L1-1 The engine-only assembly

- **Outcome:** Core's runtime has one assembly that depends on the Unity engine modules alone and references no Unity package.
- **Verified (2026-10-22):** Core 1.1.9 on its development branch has 124 runtime files, 62 of them a world-object framework.
- **Verified (2026-10-22):** Core's assembly references Entities, Entities.Graphics, Entities.Hybrid, Burst, Collections, Mathematics, Transforms, TextMeshPro, Input System and uGUI, and Unity.Physics and Unity.Physics.Hybrid, which are referenced and unused.
- **Verify before building on it:** `ImmutableAttribute.cs` line 3 has `using UnityEditor;` outside the editor guard in the runtime assembly; check it in this story and fix it if a player build would not tolerate it.
- **Rules:** the engine-only assembly keeps the name every consumer references today (`Spellbound.Core`); the new assemblies take new names, default `Spellbound.Core.<Part>`, named in the report.
- **Regression contract:** the vocabulary Core keeps (logger and sinks, tallies, packing, FNV hashing, registries, `SingletonManager`, weighted tables, assembly scanning) compiles in the engine-only assembly unchanged.
- **Done:** the assembly definition lists no Unity package; the report holds the table of folder to assembly.

### L1-2 The world-object assembly

- **Outcome:** Core's world-object folders (Objects, ObjectData, ECS, ModuleContracts) sit in an assembly of their own, awaiting WorldObjects.
- **Verified (2026-10-22):** the framework pulls Entities, TextMeshPro, Input System and uGUI into every project that installs Core, a card game included; Core has no tests for the ECS systems, presets, `DeltaResolver` or console parsing.
- **Verify before building on it:** Modifiers' `StatData.cs` and 68 Corsairs files use the moved namespaces (searched 2026-10-24); WorldForge's assemblies reference only Core's main assembly.
- **Rules:** the Entities references stay inside this assembly until Entities leaves Core's manifest, which is another epic's last story (UN4b); nothing here removes a package.
- **Regression contract:** a type that moves keeps its name and namespace; with L1r in, both games compile and behave as before.
- **Done:** the engine-only assembly does not reference this one; the report lists the types per assembly.

### L1-3 The console assembly

- **Outcome:** Core's console folder sits in an assembly of its own, default `Spellbound.Core.Console`.
- **Verify before building on it:** `Core.Console` is used by 2 GeoForge files, 3 Chat files and 1 VolumetricFog file (searched 2026-10-24).
- **Verified (2026-10-22):** Core's console is a uGUI console over a registry; its views are deleted later by the UI work, not here.
- **Rules:** nothing is deleted or rewritten; the old console keeps working exactly as it does.
- **Regression contract:** the three console mechanisms (Core's registry, Chat's second registry, the views) run as before in both games.
- **Done:** compiles; the report names every consumer of the namespace so L1r can follow.

### L1-4 The folder cycles

- **Outcome:** the cycles between Core's folders are broken so every new assembly compiles with references pointing one way.
- **Verify before building on it:** the cycle list comes from an outside review and the survey, not from this plan; read the real references in source first and list them in the report.
- **Rules:** break a cycle by moving the shared type down into the assembly both sides reference, or by an interface in the lower assembly; do not merge assemblies back to hide a cycle.
- **Rules:** if the clean fix needs a change outside Core, say so and stop that cycle.
- **Regression contract:** no behaviour test changes; no public type changes its namespace.
- **Done:** zero cycles; the report lists each cycle found and how it was broken.

### L1-5 Packing and engine types

- **Outcome:** it is known whether Core's packing uses any engine type, and if it uses none, packing compiles with no engine references.
- **Verified (2026-10-22):** the same packing is the save format, the wire format and WorldObjects' instance data, so a change to packing itself is a Core major.
- **Rules:** packing's byte layout does not change; no format version; if it does use engine types, list them in the report and leave packing where it is.
- **Regression contract:** a round trip over every packed type, and a byte comparison of the output before and after the story, are identical.
- **Done:** a written result in the report, and the compile setting changed only when the result is "none".

### L1-6 The rebuild, measured again

- **Outcome:** the clean rebuild of both games is measured again against the survey's figures.
- **Verified (2026-10-22, one clean rebuild per game, Ryzen 9 9950X3D, 16 cores, 61.6 GB):** Corsairs' compile graph took 35.4 s and Saboteer's 20.4 s; Core started at 27.9 s and 16.1 s because it references Entities Graphics, which finished at 27.6 s and 15.8 s; Core's own compile and post-process took 0.44 s and 2.21 s in Corsairs, 0.38 s and 1.62 s in Saboteer.
- **Verified (2026-10-22):** the two runs were taken under different conditions (Corsairs in a windowed editor, Saboteer in a headless one); take both the same way this time.
- **Rules:** use the Unity CLI as the survey did (`CompilationPipeline.RequestScriptCompilation` with a clean build cache through `unity command eval`, then `unity recompile`), and read per-assembly times from `Library/Bee/fullprofile.json`.
- **Regression contract:** no project file changes for the measurement; no claim without the numbers.
- **Done:** the survey's table repeated, with the honest reading: a game still waits for Entities Graphics until Entities leaves Core's manifest, so a gain is expected for package projects and non-Entities consumers and not for the games yet.

### L1-7 Core's repository to the settled layout (first story of step 2)

- **Outcome:** Core's package folder sits at `Packages/Core` in CoreDev, arranged as the layout probe (LV1a) proved.
- **Verified (2026-10-22):** each package's repository sits inside its package folder today (for example under `Assets/Core`) and the dev project roots are not repositories.
- **Rules:** built only after the probe has passed; the lead never touches git, so moving a repository's root is the developer's act and this story prepares and verifies the move.
- **Regression contract:** file identities (the GUIDs in the meta files) are kept; Core compiles and its tests pass in the moved layout.
- **Done:** the dev project opens on the new layout and the report says what the developer must move.

### L1r-1 GeoForge, Chat and VolumetricFog follow

- **Outcome:** the assemblies of GeoForge, Chat and VolumetricFog reference the new console assembly wherever their files name the console namespace.
- **Verify before building on it:** `Core.Console` appears in 2 GeoForge files, 3 Chat files and 1 VolumetricFog file (searched 2026-10-24).
- **Rules:** edit each package in its own development project; change assembly definitions only, plus the temporary manifest line the step's rules allow.
- **Regression contract:** each package compiles and its tests pass against CoreDev's working tree; no public type of the package changes.
- **Done:** all three compile through the Unity CLI against the working tree; the report lists each file edited.

### L1r-2 Modifiers and every other package follow

- **Outcome:** Modifiers and any other package assembly that names a moved namespace references the matching new assembly.
- **Verify before building on it:** Modifiers' `StatData.cs` uses the world-object namespace (searched 2026-10-24); search every package for the others instead of trusting this list.
- **Rules:** assembly definitions only, plus the temporary manifest line; if a package needs more than a reference, raise it in the report.
- **Regression contract:** Modifiers' tests (196 plus the performance suites, counted 2026-10-22) pass; **verify before building on it**.
- **Done:** every Spellbound package compiles against CoreDev's working tree; the report lists the search and its results.

### L1r-3 The games' own assemblies follow

- **Outcome:** Corsairs' assemblies (WorldForge, WorldSystem, TalentSystem and the tests) and any Saboteer assembly that names a moved namespace reference the new assemblies.
- **Verify before building on it:** 68 Corsairs files use the moved namespaces and WorldForge's references name only Core's main assembly (searched 2026-10-24); the search for Saboteer was not run.
- **Rules:** assembly definitions only, plus the temporary manifest line, no scene, prefab or script change; WorldForge is edited in its own development project, the others in the game that owns them.
- **Regression contract:** both games open and compile against CoreDev's working tree and their existing test assemblies compile.
- **Done:** both games compile; nothing is merged to a branch they follow (that is the later step that also carries LS and LM).

