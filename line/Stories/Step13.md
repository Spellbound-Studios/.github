## The stories of step 13: simulation vocabulary and editor controls (R0, UI7a, UN1a)

Step 13 gives Core the vocabulary a simulation assembly reads time, randomness and identity from, the four editor controls every package's inspectors share, and the ledger that notices Unity moving. Seventeen stories: R0 nine (its tenth, the layout description, was R0d-1 in step 2), UI7a four, UN1a four. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** Core's runtime assembly depends on the engine modules only; Burst is referenced in the test assembly alone. Names are spelled out, one type per file, no comments or XML docs, logging through Core, the studio's Rider formatting. No value a game tunes is a constant: the tick rate is a `TickRate` the game passes, and the games' 20 and 50 appear only in tests.
- **Rules:** work only in CoreDev; a change that belongs in another package or repository is raised in the report and stops that story.
- **Regression contract:** Core's edit-mode and play-mode tests pass; `core validate`, `core context` and `core ledger` behave as before; the inspector banner still shows the selected definition's report with its Run checks button; a `[SerializeReferenceDropdown]` field still picks a concrete type; `ObjectPresetEditor` still renames, removes and adds modules.
- **Done, for each story:** compiles clean in CoreDev through the Unity command line, the tests pass, and the pull request's report lists what landed.

### R0-1 The tick

- **Outcome:** `Tick` (64 bits, compared plainly), `TickSpan` and `TickRate` (`PerSecond`, `StepSeconds`, `FromSeconds` rounding to the nearest tick and never to zero for a positive duration, `ToSeconds`) in `Spellbound.Core.Simulation`.
- **Done:** tests for comparison, `Plus` and `Until`, the rounding rules, and a round trip within half a step.

### R0-2 The tick source seam and the game-time default

- **Outcome:** `ITickSource` answers the rate with the tick; `IFixedStepTickSource` is fed each fixed step; `GameTimeTickSource` adds each step, rounded to the nearest whole microsecond, to a total of game time and answers the whole ticks in it at its own rate, so the tick rate and the fixed step stay two independent settings.
- **Rules:** the total is whole microseconds and the division is exact (`decimal`), because fifty float steps of 0.02 sum to 0.99999997 s and a floor in `double` reads 19 ticks where a second has passed.
- **Done:** 50 steps of 0.02 at 20 a second give exactly 20 ticks and 600 s give 12,000; the same with the step at 0.01 and 0.025 and with the float value of 0.02; one test runs the same code at two rates and two steps.

### R0-3 The clock in Core with its driver

- **Outcome:** `TickClock` reads its rate from its source once at start, follows a higher tick, holds a lower one (counted in `HeldSteps`, never backwards), counts a changed rate and logs the first, and raises `Stepped`; the driver is a hidden object whose earliest-order component feeds a fixed-step source and advances the clock and whose latest-order component raises `Stepped`; `CoreKit.Time.StartClock(source)`, `StartClock(TickRate)` and `StopClock(clock)`.
- **Rules:** the guard keys `core.clock.rate_changed` and `core.clock.held` arrive with the observation model (R1a); until then the clock counts them itself.
- **Done:** edit-mode tests with a custom source; a play-mode test in a scene with no world instance where 50 fixed steps give 20 ticks and `Stepped` fires each step; the time scale 0 case recorded.

### R0-4 The seeded stream

- **Outcome:** `SeededStream`, Core's own code: SplitMix64 seeds the state, xoshiro256** draws, `Algorithm` names the pair, `Fork(key)` depends on the seed and the key alone.
- **Done:** golden vectors fixed by tests, the published reference vectors for a raw state, a frequency, runs and chi-square sanity battery; the published battery (PractRand) recorded as not run on this machine.

### R0-5 The instance id and its allocation seam

- **Outcome:** `InstanceId` (one kind bit, 31 lease bits, 32 counter bits; zero is none and never issued), `IIdentityAllocator`, `ILeaseIssuer`, `LocalLeaseIssuer` (first lease 1, its next lease the one number a save keeps) and `LocalIdentityAllocator` (a fresh lease on a full counter, so an id is never reused).
- **Done:** tests for the zero rule, the first id, a full counter, a placement id, and a custom issuer and allocator swapped in.

### R0-6 The up field

- **Outcome:** `UpField` with its three forms (constant, radial from a centre, sampled grid as the open form), `UpDirection`, `UpGrid`, `IUpProvider` with `ConstantUpProvider` as the world-up default, in `Spellbound.Core.ReferenceFrames`.
- **Verify before building on it:** `ReferenceFrameChecks.RequireConstantUp` still waits for the guard (R1a); the field lands without it.
- **Done:** a Burst job in the test assembly evaluates each form over 4,913 cells and logs the time as a measurement; a custom provider swaps in.

### R0-7 The determinism harness

- **Outcome:** the assembly `Spellbound.Core.Testing` with `GoldenHash`, `DeterminismAssert.GoldenHash(expected, actual, region)` and `DeterministicFloatModeScan.Check(jobNames, sourceRoot)`.
- **Rules:** the scan takes its list as an argument until `Identity.asset` and its `machineMatchedJobs` exist (LV2, step 14).
- **Done:** tests for the hash, the assertion message and the scan over a fixture source folder.

### R0-8 The float-mode measurement

- **Outcome:** today's WorldForge job chain and the awaken job run in both float modes on the reference world, the golden regions hashed in both, any difference printed for the developer.
- **Rules:** it runs in the Corsairs Isle project and nowhere else; a lead never drives another project's editor.

### R0-9 The seconds round trip

- **Outcome:** a duration is written in seconds and converted at load through the loading world's rate; nothing is refused for a rate; no saved type holds a `Tick`, `TickSpan` or `TickRate`.
- **Done:** the round trip test across two rates and a test over every `[Section]` type in the loaded Spellbound assemblies.

### UI7a-1 HeaderBar and SectionCard

- **Outcome:** `HeaderBar` (title, optional severity as a token class, an actions slot) and `SectionCard` (a header bar over a content slot) in `Spellbound.Core.Editor.Controls`; `ObjectPresetEditor`'s hand-built card becomes a `SectionCard`.
- **Done:** edit-mode tests on the classes and slots.

### UI7a-2 ReportView

- **Outcome:** `ReportView` binds a `ValidationRun`: the `checks:` line, one row per finding with its severity class, code, the check's name when the runner stamped one, the message, the preferred named hint or the plain hint, and up to two action buttons from `ActionsFor` on a finding with a `FixCode`; a compact banner form that expands on click. `DefinitionInspectorBanner` draws the compact form.
- **Rules:** the check's name on a finding is set by the runner, never by a check; the text format of a report is unchanged.
- **Done:** tests binding a sample report.

### UI7a-3 TypePickerField

- **Outcome:** `TypePickerField`, a field whose value is a `Type` chosen among the concrete types derived from a base, with `DisplayName` and `Filter` seams, and `TypePickerDrawer` for `[SerializeReferenceDropdown]`, replacing `SerializeReferenceDropdownDrawer`.
- **Done:** tests on the choices, the seams and the value change.

### UI7a-4 The controls' tests and the skin seam

- **Outcome:** every control is plain UI Toolkit with `sb-` classes and no stylesheet asset, so UI.Editor's stylesheet on `.sb-theme` skins them and Unity's defaults show otherwise.
- **Done:** the edit-mode tests of the three stories above pass.

### UN1a-1 The ledger format and the rows

- **Outcome:** a ledger is a Markdown table with ten columns; a package carries its rows under the `Ledger` heading of its `AGENTS.md`, a project under `Assets/_Project/Ledger`; Core's `AGENTS.md` carries Core's rows and CoreDev's project ledger carries the studio's rows for the rest of the line.
- **Rules:** a code owner reviews every change to a judgement (`CODEOWNERS` already names the folder); the studio's rows move to Studio.Tools when a Studio story takes them.
- **Done:** every row of the Unity area's table has a home; the developer judges them at the merge.

### UN1a-2 The check

- **Outcome:** `core unity-ledger` resolves each `Ours (type)` against the loaded assemblies (a Moved row whose type still resolves, or a Keeps or Builds on row whose type no longer does, is wrong), compares each `Judged at` entry with the running editor and the installed packages, lists the editor versions passed with a documentation search address, and the `CHANGELOG.md` lines between a watched package's judged and installed versions that carry a watch word; `failed:` makes the Unity command line exit nonzero.
- **Done:** tests over fixture rows with fake resolvers; the operation read once in CoreDev.

### UN1a-3 The script, the CI job and the Move form

- **Outcome:** `scripts/unity-ledger.sh` runs the check through the Unity command line against a resident or a fresh headless editor; `.github/workflows/unity-ledger.yml` runs it on the runner a repository variable names when the editor version, the manifest, the lock or a ledger file changes, and is skipped where none is named; the check's `--move-form` lines paste into the Move issue form, which already carries the ledger's steps.
- **Done:** the script run once here; the workflow not run.

### UN1a-4 The facts bench

- **Outcome:** Core's bench rows as tests that record a fact with the editor version: a `LocalPhysicsMode` scene owns its physics and nothing steps it; `PhysicsScene.Simulate(Time.fixedDeltaTime)` from a latest-order `FixedUpdate` steps that scene after the earlier scripts; a text asset re-saved by this editor starts with `%YAML 1.1` and no `%UNITY` line. `ExtractAsset` with `AddRemap` is ArtPipeline's row and is written down as not run.
- **Done:** the tests pass on 6000.4.8f1 and each logs its line.

