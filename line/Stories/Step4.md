## The stories of step 4: operations in Core, the reflection check first (CL1)

Step 4 gives Core its operations: the attributes a package marks an operation with, the catalog that finds them by reflection over marked assemblies, the tokenizer, the binder and the argument parsers, the host that runs a line through its gates, rendering, settings, trace, history and statistics, the built-in `core` operations and the front door, with the reflection check run first. Ten stories, CL1-1 to CL1-10, all succeeded in one pull request into Core's `dev`: Core pull request 103, merged on 2026-10-25 as e0ca89f, closing Core issues 93 to 102. The split is the planner's; the outcomes are the epic's. One repository changed, Core (the package `Packages/Core` in CoreDev); no game and no other package changed. The reflection check ran in a throwaway project outside every repository and nothing of it ships. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the design is `Areas/CommandLine.md` in the line folder of the organisation's `.github` repository and the rules are the line text there.
- **Rules:** the step is additive: nothing is removed; the old console under `Runtime/Console` is untouched and leaves in CL3 once UI's console view exists; the package version is not touched and the CHANGELOG gains an Unreleased entry.
- **Rules:** no `[Preserve]` is written anywhere; the three marker attributes carry it (CL1-1).
- **Regression contract:** Core's edit mode tests pass unchanged: 177 passed before the step, the suite now holds 252 and all pass (177 old, 75 new) through `run_tests --mode EditMode`.
- **Regression contract:** the old console (attributes, registries, router, `ConsoleLogger`, `HelpCommand`, `ListCommand`) behaves as before: no file under `Runtime/Console` changed and its tests pass.
- **Regression contract:** every type that was public stays public under the same name and namespace; the only existing files changed are `CoreKit.cs` (one property and one reset added) and the edit mode test assembly definition (two references added).
- **Regression contract:** Core's runtime assembly references the engine modules only: `Spellbound.Core.asmdef` is unchanged and the new code uses `UnityEngine.CoreModule` only (`CustomYieldInstruction`, `ScriptableObject`, `Resources`, `GameObject.Find`, `ColorUtility`, `GraphicsSettings`).
- **Regression contract:** logging, packing, hashing, registries, `SingletonManager`, weighted tables and assembly scanning behave as before: their files are unchanged and their tests pass; the catalog reads assemblies through the existing `AssemblyScanning.ScannableAssemblies`.
- **Regression contract:** no consumer changes; no game or package manifest was touched and none needs to be.
- **Regression contract:** no static state survives into play mode: `CoreKit.Operations` resets on `SubsystemRegistration`; the catalog, parsers and renderers live on the host and load lazily at first use.
- **Done, for each story:** compiles clean in the headless CoreDev editor on 6000.4.8f1 with no warnings from the new files in the console, 252 of 252 edit mode tests (`Spellbound.Core.Tests`) and 3 of 3 play mode tests (`Spellbound.Core.PlayModeTests`) pass, and the pull request's stories table records the story as succeeded.

### CL1-1 The reflection check

- **Outcome:** it is known from a player build which marked code survives stripping, so operations can be found by reflection over marked assemblies. Written go: the three marker attributes (`OperationAttribute`, `ArgumentParserAttribute`, `ResultRendererAttribute`) derive from `UnityEngine.Scripting.PreserveAttribute`, so the method or class they mark is kept at every stripping level and nobody writes `[Preserve]`; the source generator stays unused.
- **Verified (2026-10-25):** a class-level `[Preserve]` does not keep the static operation methods of the class at any stripping level, Low included; a method-level `[Preserve]` or an attribute derived from `PreserveAttribute` keeps them. Rule A8 ("`[Preserve]` on a class that holds operations") is wrong in both directions and goes.
- **Verified (2026-10-25):** a `link.xml` at the root of a local package under `Packages/` is not honoured; nothing relies on it.
- **Verified (2026-10-25):** `UnityEngine.Assemblies.CurrentAssemblies.GetLoadedAssemblies()` exists on 6000.4.8f1 (present in the 6000.3.10f1 engine module, absent on 6000.2) and lists the same set as `AppDomain.CurrentDomain.GetAssemblies()`; Core still lists through `AssemblyScanning.ScannableAssemblies`, so the switch is one edit.
- **Verify before building on it:** stripping under IL2CPP was not run (no Windows IL2CPP module and no Visual Studio C++ toolchain on this machine), nor Mono and IL2CPP on 6000.7.0b6 or the assembly listing on 7000.0.0a12 (UN9 installs them). It is the same linker and the same stripped assemblies, so the fact is expected to hold, but it is not observed; nothing waits for these rows.
- **Done:** the written result below, a go.

### CL1-2 A Play Mode test waits on an operation run

- **Outcome:** a Play Mode test waits on an operation run: `OperationRun` is a `CustomYieldInstruction`, and a `[UnityTest]` yields it and resumes when the operation's `Task` completes. Written go; the `WaitUntil` fallback is not needed.
- **Verified (2026-10-25):** a Play Mode `[UnityTest]` can `yield return` a `CustomYieldInstruction` that completes later, confirmed by test.
- **Done:** three play mode tests in `Tests/PlayMode`; the written result below.

### CL1-3 The attributes, the audiences, the effect and the catalog

- **Outcome:** a package declares an operation with `OperationGroupAttribute`, `OperationAttribute` and `ArgumentAttribute`, states its `OperationEffect`, `OperationAvailability` and `OperationAudiences`, and `OperationCatalog` describes what it found as `OperationGroupDescription`, `OperationDescription` and `ArgumentDescription`, through `MarkedAssemblyScan`.
- **Rules:** operations that need live state register an instance with `OperationCatalog.Register(instance)`, the group taken from the instance's assembly.
- **Rules:** dynamic assemblies are skipped by the catalog's default assembly listing, because two catalog tests build throwaway assemblies with Reflection.Emit that live for the editor session.
- **Rules:** the catalog's duplicate and clash findings are logged with `Log.Error`, because `Log.Warn` is compiled out unless `SPELLBOUND_LOG_WARNING` is defined and a warning would be silent.
- **Done:** succeeded; the discovery cost is measured under CL1-10.

### CL1-4 The tokenizer, the binder and the argument parsers

- **Outcome:** a line is tokenised and bound: quotes, `--name value`, `--name=value`, positional values, flags, and placeholders filled after tokenising; parsers through `IArgumentParser<T>`, `IArgumentTypeParser` and `ArgumentParserRegistry`, with the built-in parsers.
- **Verified (2026-10-25):** the vector, list and enum rules of `CommandParameterParser` were carried into the new parsers; the old class stays untouched for the old console until CL3.
- **Done:** succeeded.

### CL1-5 The host, the run, the result, the caller, the context and the gates

- **Outcome:** `OperationHost` runs a line and returns an `OperationRun` holding an `OperationResult` with its `OperationStatus` and `OperationSeverity`, for an `OperationCaller`, with an `OperationContext` and `OperationException`; the availability, audience and effect gates apply.
- **Rules:** an ambiguous short name answers `invalid: 'spawn' matches a spawn and b spawn; write the group`, because the grammar says `invalid:` is a line that did not bind; the failure table's `failed:` row contradicts it and the grammar wins. The table's word is one line in `OperationHost.TryResolve` if it is wanted instead.
- **Rules:** `OperationResult.Succeeded` is true for `Succeeded` and `Previewed`: a dry run is a successful call that changed nothing.
- **Rules:** `--dry-run` on a `Reads` or `Writes` operation answers `previewed:` too, one gate for every operation; the operation reads `DryRun` from its context.
- **Rules:** the `OperationContext` parameter may sit at any position in the signature, at most one.
- **Done:** succeeded.

### CL1-6 Settings, trace, history and statistics

- **Outcome:** `OperationSettings` is an optional asset with every field defaulted, the trace goes through Core's logger, and the host keeps `OperationHistoryEntry` and `OperationStatistic` records.
- **Rules:** `OperationSettings` loads from `Resources/OperationSettings` through a loader the host constructor can replace; the defaults are trace off, no disabled group, bridge audiences `developer`, 4,096 characters per line, 200 result lines and 1,000 history entries, so no asset is required.
- **Done:** succeeded.

### CL1-7 Rendering: tables, collections, progress lines and cut results

- **Outcome:** results render as `OperationTable`, through `IResultRenderer` and `ResultRendererRegistry`, with progress lines through `OperationContext.Report` and a cut result carrying the paging hint.
- **Verify before building on it:** whether the Pipeline envelope can stream progress lines is unchecked; it is CL2's.
- **Done:** succeeded.

### CL1-8 The built-in operations

- **Outcome:** Core declares `core help`, `core help --group`, `core help --all`, `core about`, `core history` and `core stats`.
- **Rules:** an optional argument in `help` reads `[--name <type> = default]`, the default omitted when it is null.
- **Rules:** `core about` gives the Unity version, editor or player, playing or not, the render pipeline, and the groups with their counts and assemblies; the package list with versions is CL5's `core about`.
- **Rules:** `core observations` and `core observation` are not declared; `core stats` reads the host's own tally of calls, failures and durations. The observation model is R1a, which waited on this step; step 17 shipped the observation doors, and the host reports its costs through them there.
- **Done:** succeeded; `core help` in CoreDev answers `succeeded: 2 groups, 28 operations` (the written result below).

### CL1-9 The front door, the group on Core, the invocation entry point and RunAll

- **Outcome:** `CoreKit.Operations` is the front door; `[assembly: OperationGroup("core", job)]` sits on `Spellbound.Core` and `[assembly: OperationGroup("core")]` on `Spellbound.Core.Editor`; `OperationInvocation`, `Run(invocation, caller)`, `Parse` and `RunAll` are the entry points, and Core.Editor adds the `asset:` reference form.
- **Rules:** `RunAll` stops only on a result that is not `Succeeded`, as the design says.
- **Rules:** the reference forms shipped are `scene:/Path` (runtime) and `asset:Path` and `asset:Name` (Core.Editor, two matches refused with the candidates); `world:3` and `player` wait, because Core has no world type until R1a and no player binding, and a game binds its own through `IArgumentTypeParser`.
- **Rules:** the second assembly of the `core` group, `Spellbound.Core.Editor`, carries the group attribute with no job; it holds the `asset:` parser, found by the same scan.
- **Done:** succeeded.

### CL1-10 The fixture assemblies, the tests, the measurements and the documents

- **Outcome:** the fixture assemblies and the tests prove the catalog and the host, the discovery and call costs are measured, and the README and CHANGELOG describe operations.
- **Verified (2026-10-25):** 75 edit mode tests and 3 play mode tests added; the fixture assemblies are `Spellbound.Core.Tests.OperationFixture`, `Spellbound.Core.Tests.OperationFixture.Second` and `Spellbound.Core.PlayModeTests`, and the README gains an Operations section.
- **Rules:** the test layout is `Tests/PlayMode` as `Spellbound.Core.PlayModeTests` with the fixtures in `Tests/OperationFixture` and `Tests/OperationFixtureSecond`, all under `UNITY_INCLUDE_TESTS`, and no migration of the existing flat `Tests/`, because the package layout note makes the migration its own task.
- **Verify before building on it:** `packagecheck check` was not run (PackageCheck is not built yet); the 6000.3 floor row was not run this step (the probe and the tests ran on 6000.4.8f1 only); consumers were not compiled, since nothing a consumer references changed; Corsairs' assembly set was not opened, so the discovery figure is for CoreDev's set.
- **Done:** the measurements below.

### The written result of the reflection check (CL1-1, 2026-10-25)

Run on this machine with Unity 6000.4.8f1 in a throwaway project outside every repository. A local package `Packages/ProbeOperations` holds an assembly marked by an assembly attribute and classes that only reflection reaches; the player's runner lists the loaded assemblies, finds the marked one by its attribute, reads its types, finds the marked methods and parser classes, invokes and constructs them, and writes a report. Four Mono players: stripping Low, Medium, High, and High as a development build.

| Question | Result | Evidence |
|---|---|---|
| A static operation method on a class marked `[Preserve]` survives stripping | fail at every level, Low included | The class is in the type list, its method is gone: `operation preserved-class: missing` in all four players |
| A static operation method marked `[Preserve]` itself survives | pass | Found and invoked at Low, Medium, High and High development |
| A method marked with an attribute that derives from `UnityEngine.Scripting.PreserveAttribute` survives | pass | `derived-attribute: found, invoked` at High and High development; the class survives with it |
| An unmarked class with an unmarked operation survives | fail | Stripped at every level |
| A parser class marked `[Preserve]` or with a derived attribute is created and its interface method runs | pass | `PreservedParser` and `DerivedParser` created and called at every level; the unmarked one is stripped |
| A `link.xml` at the root of the local package preserves a class | fail | `link-xml: missing` at High; the file was not honoured for a package under `Packages/` |
| `UnityEngine.Assemblies.CurrentAssemblies.GetLoadedAssemblies()` exists and lists the fixture | pass | Present on 6000.4.8f1, returns `IReadOnlyList<Assembly>`, 44 assemblies, the same set as `AppDomain.CurrentDomain.GetAssemblies()`, in 1.1 ms against 1.8 ms |
| The marked assembly is found and scanned in a player | pass | 1 of 44 assemblies marked; listing 1.8 ms, type scan and attribute reads 2.7 to 3.0 ms, cold |
| IL2CPP, Mono and IL2CPP on the 6.7 beta, the assembly listing on a Unity 7 alpha | not run | No Windows IL2CPP module and no Visual Studio C++ toolchain on this machine; 6000.7.0b6 and 7000.0.0a12 are not installed |

Go: operations are found by reflection over marked assemblies, on the condition that the marker attributes derive from `PreserveAttribute`. The IL2CPP row is the one open row; installing the module (about 240 MB) and the C++ toolchain was left to the developer's decision, now or with UN9's editor installs.

### The written result of the yield probe (CL1-2, 2026-10-25)

Three play mode tests in `Tests/PlayMode` pass through the Unity command line in the headless CoreDev editor. A `[UnityTest]` yields the run of `fixture wait --milliseconds 120`, an operation that returns a `Task<string>`; the test resumes when the task completes (1,044 frames later in the batch editor) with `succeeded: waited 120`. A completed run yields back within one frame. `WhilePlaying` and `WhileEditing` availability behave in play mode as designed. Go.

### The measurements of step 4 (CL1-10, 2026-10-25)

| Measured | Figure |
|---|---|
| Catalog discovery, CoreDev editor, 4 marked assemblies, 28 operations | 3.8 to 4.0 ms cold and warm alike (the cost is the type scan, not the listing) |
| One call, `fixture add 1 2`, tokenise, bind, invoke, render and record, 1,000 calls | 0.008 to 0.014 ms per call |
| Listing loaded assemblies in a Mono player | 1.8 ms through `AppDomain`, 1.1 ms through `CurrentAssemblies` |
| Scanning one marked assembly in a Mono player, cold | 2.7 to 3.0 ms |
| Probe player builds, empty project | Low 16.3 s (the first build after the editor opened), Medium 3.4 s, High 6.2 s, High development 6.2 to 6.7 s |
| A 120 ms operation yielded in the batch editor | 1,044 frames |

What `core help` answers in CoreDev:

```
succeeded: 2 groups, 28 operations
core: Gives every package one vocabulary: how to log, pack bytes, identify a thing, roll from a seeded stream, count steps of time, place a pose in a reference frame, measure a cost against a budget, declare an operation, and validate what a designer or an agent authors. (4 operations)
fixture: Operations that exist so the catalog and the host can be tested. (24 operations)
Run: core help --group <name>, or core help --all
```

The step's stop column was the written go of the reflection check, the yield probe's go, and the developer reading `core help`. No gap was raised in another package.
