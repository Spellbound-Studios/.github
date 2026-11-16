# Step 30: containment and the audit (L6, R4)

Built 2026-11-15 and 2026-11-16 by the step runner in four worktrees: `_probes/Character30` of `Spellbound-Studios/Character` (branch `r4-containment-and-support-gate` from `beta` 68495c9), `_probes/Corsairs30` of `Spellbound-Studios/CorsairsIsleDev` (`r4-corsairs-containment` from `main` 39e36ecd, built against the Character worktree through an uncommitted `file:` line), `_probes/Inventory30` of `Spellbound-Studios/Inventory` (`l6-inventory-audit` from `main` c092406) and `_probes/Modifiers30` of `Spellbound-Studios/Modifiers` (`l6-modifiers-audit` from `main` 1e9cdb7). GeoForge `dev_1.0` ec03f09 was read and not changed; Saboteer is out of the step by the developer's answer 1. Twenty-nine tasks: one seam, eight build stories, one search, five fixes, one mechanical edit, each with its own verifier, and one human task (the audit read and the rescue play). Concurrency two, one editor per task, never two on one worktree. Plan, triage and sign-off ran on Fable; every seam, build, search and verify on Opus at high effort; `fix-1-2` on Sonnet at low effort. The evidence is in `_probes/handoff-30/runner`: `plan.md`, `catalogue.md`, `questions.md`, `answers.env`, `answers/`, `briefs/`, `results/`, `diffs/`, `evidence/`, `verdict/` and `audit.md`; the captures are under `evidence/gym/` and `evidence/gym-verify/`. The audit is `line/Reports/Step30Audit.md`.

## The shape of the work

Character.Body gained body containment: the seams (`ISupportProbe`, `IContainmentSpace`, `IRescueTarget`, `IMoveSource`), the settings asset with eight validation codes, three observation keys (two guards, one occurrence), `SupportGate` holding a body over ground that is not ready, `RescueLadder` and `Rescuer` moving a body inside one fixed step under a motion claim, `Containment` reading floor, embedding and sustained fall on a stride, the move source on `BodyContext`, the `Spellbound.Character.GeoForge` bridge with its measured query cost, the UI Toolkit inspector and gizmos, a swim and fly sample that compiles without StateMachine, and the Locomotion gym's four rescue cases with captures. Corsairs deleted its falling fix and put the gate and containment on the player's prefab, handed at spawn. Inventory and Modifiers were conformed to the bar; Inventory gained the item definition and its set; Modifiers moved `StatData` into a WorldObjects bridge, moved its samples out of `Resources`, and gained `ResourcePool`; the audit measured both against the games, red-teamed their surfaces and confirmed the seams PG and R6a build on.

The developer answered the plan's two questions with its recommendations (Saboteer's floaters stay for the consumer row; Corsairs' terrain-ready freeze stays beside the gate) and the audit page's four homes (findings 1, 2, 7, 11, 12 and gap 5 to R6a; 3, 4, 5, 8, 9 and gaps 1 to 4 to PG; 6 waived; 10 and 13 fixed in this step). Two sign-off rounds. Round 1 read eleven stories, ranked 24 findings, sent three fixes back (`fix-1-3` Character, `fix-1-4` Modifiers, `fix-1-5` Inventory) and recorded eleven decisions. Round 2 read the three fixes, found two low findings in test teardown and changelog wording, neither in shipped behaviour, and signed off.

## Before

Character `beta` 68495c9 (0.0.0): edit 270, play 36 (24 package, 12 sample); `IMotionDriver` without a teleport; no containment type. Corsairs `main` 39e36ecd: edit 69; `BaseFallingState.PerformFallingThruMapCheckAndFix` at `:42-48`, called at `:25-26`, field at `:11`, serialized 12 in `loco_falling_default.asset:17`. Inventory `main` c092406 (0.2.0): edit 68; `packagecheck` "14 must fix, 3 to confirm, 0 waived, 17 passed, 15 not applicable, 7 not run"; `Samples` not `Samples~`; no versionDefines; no item definition. Modifiers `main` 1e9cdb7 (0.2.5): edit 218; `packagecheck` "15 must fix, 4 to confirm, 0 waived, 18 passed, 10 not applicable, 9 not run"; `Spellbound.WorldObjects` a hard reference of the runtime used only by `StatData`; 42 `Resources` sample assets; no resource pool.

## The stories and their checks

**Character seam** (`seam-character`, Opus, $3.76, 2 attempts, 13 checks, commit 06803c1; `verify-seam-character`, $1.43, 5 checks). Eleven containment types, `ContainmentSettings` with seven codes (the eighth, `supportReachMetres`, added by the gym triage), the three keys, four doubles in `Tests/Runtime` reached by the editor tests through the existing assembly reference, GeoForge `#dev_1.0` in the manifest, the Core lock entry at `dev` 0ea31e5 by triage with no other entry moved. Red 4 `error CS` (the doubles without their types); edit 299 (+29), play 39 (+3); `Vector3.up` grep, comment grep and em-dash grep empty; column check clean. Attempt 1 stopped blocked on the lock entry; the triage moved it.

**R4-2 and R4-3 Gate and ladder** (`build-r4-gate-ladder`, $3.76, 2 attempts, 10 checks, commit 3a1660b; verify $2.25, 2 attempts). `SupportGate` at -45, `HoldDriver`, `RescueLadder`, `RescueClaimDriver`, `Rescuer`. Red 1 `error CS` (`SupportGate` not found); edit 312 (+13), play 45 (+6). Attempt 2 and the verifier's second attempt were the stale `Temp/UnityLockfile` a graceful close left; no code changed. The verifier re-ran the package play suite (33) and not the 12 sample tests, since importing the sample writes `Assets`; the sample was untouched by the diff.

**R4-4 and R4-5 Containment and move source** (`build-r4-containment-move-source`, $3.34, 1 attempt, 10 checks, commit ebb76d7; verify $1.36). `Containment` at -30 with the allocation-free filter first, `BodyContext.MoveSource` and `DesiredUp`, `LocomotionCharacter : IMoveSource`. Red 12 `error CS`; edit 319 (+7), play 54 (+9); `RideTests` 3 and `LocomotionStateTests` 8 green. Both reports raised the guard count and the silent world-less containment, which became round 1 findings 14 and 2.

**R4-6 GeoForge space** (`build-r4-geoforge-space`, $1.71, 1 attempt, 10 checks, commit 32f8724; verify $1.19). Bridge asmdef with both defines and ranges, `GeoForgeContainmentSpace`, `TestGeoVolume`. Red 2 CS0246; edit 319, play 64 (+10). Measurement: 40,000 corner queries over the double in 0.782 ms (verifier 0.773; later runs 0.752 and 0.732), 19.3 to 19.6 ns a query, 0.155 ms a step spread over the stride; `checkStride` stays 5. GeoForge's `PlaneWorld`, `PlaneDensitySource` and `GeoChunkDouble` are internal and `GeoForgeManager.McTablesBlob` has a private setter, so no real volume could be built; the figure is labelled the bridge's own cost.

**R4-7 and R4-8 Editor and swim and fly** (`build-r4-editor-swimfly`, $4.32, 1 attempt, 11 checks; verify $1.42). `ContainmentSettingsEditor`, `ContainmentGizmos`, `Samples~/SwimAndFly` with its asmdef, three drivers, the character, prefab, scene, settings asset, material and four tests; `package.json` samples entry; eight CHANGELOG bullets. Red 3 `error CS`; edit 325 (+6), play 65 (+1). The stranger project (Core `#dev`, Input System, test framework, `file:` to the package) compiled with 0 `error CS`, no `SPELLBOUND_STATEMACHINE` define and no StateMachine assembly, on build and on a clean rebuild by the verifier; the first import logged 14 `com.unity.serialization` errors outside Character, gone on reopen. `packagecheck` over Character exits 6 with four must-fix items outside this task's files and no before reading (raised).

**R4-9 Gym** (`build-r4-gym-rescue-cases`, $9.03, 6 attempts, 10 checks, commits 8271072 and fe40862; verify $3.66, 2 attempts). `GymContainmentSpace`, `GymWorld.Admit`, the pit, the block, `GymContainmentSettings.asset`, both components on the prefab, `RescueCaseTests` 5, eight captures. Three stop triages: the reach (Body gains `supportReachMetres`, default 1, replacing a 0.1 m constant and a 0.05 m sphere with a ray), the pit test (bounded by standing height minus the ride height, the 0.1 m dip at an edge is the float's `ProbeRadius`), the nested double (moved to `Tests/Editor/StateMachine/ContextMoveSource.cs`). The verifier's first round found a game noun in a test name and the nested type; the fix round renamed `Defaults_HaveTheShippedValues` and moved the type. Edit 326 (+1), play 70 (+5). Captures retaken by the verifier: pit `BelowFloor` to (19.946, -0.049, -0.064) settled supported; embedded `Embedded` to (-8, 3.951, 4) on the block top; hold held at 1.996 then fell to -0.049 with no record; timeout `SupportTimeout` to (0, 0.05, -6). The red count for `RescueCaseTests` is in the attempt reports, not the final result (round 1 finding 24).

**R4-10 Corsairs** (`build-r4-corsairs`, $3.29, 1 attempt, 9 checks, commit dd4fc047; verify $1.34). The falling fix, its call, field, asset line and two usings gone; `SupportGate` and `Containment` on penguin_01's prefab root over `CorsairsContainmentSettings.asset` (`hasFloor` 0); `SpawnRescueTarget`; `CorsairsWorld : IReferenceFrameWorld`; `GameManager.HandContainment` at spawn. Red 3 of 3; edit 72 (+3). `TerrainReady` and `UnconstrainPlayerRigidbody` untouched; `Packages/` in no commit; the Modifiers line and entry intact. The World asmdef gained `Spellbound.Character.Body` outside the file list (accepted).

**L6-1 and L6-2 Inventory** (`build-l6-inventory`, $5.42, 4 attempts, 13 checks, commit 2e59fbf; verify $2.18, 2 attempts). The bar's items, `Samples~/Demo`, `InventoryKit` and `InventoryUIToolkitKit`, `ItemDefinition` and `ItemDefinitionSet`, `Tests/UITK`. Red CS0246 and CS0103 before the types; edit 84 (+16). Bar 14 to 5 must fix (I4, D1, D3, D9, C7, A3, V1, V2, V3 cleared), nothing that passed fails. Three attempts stopped on check 10's wording (URL lines matched the comment grep); the triage dropped `://` lines. The lock re-resolved Core to 0ea31e5 and dropped `com.unity.physics` (accepted as the editor's re-resolve).

**L6-3 and L6-4 Modifiers** (`build-l6-modifiers`, $5.47, 2 sessions through a hand-off, 13 checks, commit 9cb9e16; verify $1.49). The WorldObjects bridge with `StatData`, the Core-only runtime, `Samples~/CombatDemo` (166 files R100), five `test_*` fixtures under `Tests/Resources`, `ResourcePool` with 13 tests, the label read from the type, six metas regenerated, two test lines wrapped to 120 columns. Red CS0234; edit 231 (+13). Bar 15 to 11 must fix (D1, D6, C5, C7 cleared; D2 now runs and passes; A1 1 to 2 for the bridge, raised).

**L6-5 Audit** (`search-l6-audit`, $1.25, 1 attempt, 5 checks). `audit.md`, 88 lines, five sections: the bar before and after, the games' reach (Corsairs 32 Inventory files and 3 `TryTransferItem` sites today against the catalogue's 33 and 2), thirteen ranked red-team findings with `path:line`, the seam table (8 confirmed, 5 gaps: `Roll`, `RollAndApply`, `Parent`, `GetValue`, `TryTakeItem`), the raises.

**fix-1-1** (audit finding 10; $0.89, 12 checks; verify $0.80). `ResourcePool` clamps every read and write through one `ClampToRange` with `Min` winning, starts at the clamped `Max`, fires `Depleted` once when a reset lands on `Min`. Red 16 ran, 13 passed (4 vs 10, 0 vs 80, 5 vs 10); green 16 of 16; edit 234; no `Mathf.Clamp` left; public surface unchanged.

**fix-1-2** (audit finding 13; Sonnet, $0.31, 12 checks; verify $0.94). 26 runtime files: 156 `///` lines, four trailing comments and five em dashes gone, 26 lines added, 175 removed, every added line equal to the brief's; edit 234. The build's bash-form `-logFile` wrote no log, so one part of check 7 did not run and was recorded as passed (round 1 finding 24); the verifier's Windows-form path wrote the log and its grep printed 0.

**fix-1-3** (round 1 findings 1 to 9; $1.77, 18 checks, commit f433a0a; verify $1.55). Two ray-branch probe tests at radius 0 (0.9, 0.1, normal up; the mask misses); `Containment.ReportMissingWorld` in `SupportGate`'s shape, red (9 ran, 8 passed, "Expected log did not appear") then green; `Rescue_KeepsTheBodysFacing` with `Physics.SyncTransforms()` in the test; three renames; `Handles.color` and `SpawnMarker` removed; the measurement reads `checkStride` from a settings instance. Edit 327 (+1), play 73 (+3); eleven paths.

**fix-1-4** (round 1 findings 12 and 13; $0.77, 13 checks, commit b6ec759; verify $0.98). The test renamed `WithMaxBelowMin`, `WithMaxEqualToMin` added (green from the first run, a case the pool already met); the bridge asmdef one item per line, JSON identical. Pool 17 of 17; edit 235.

**fix-1-5** (round 1 findings 10 and 11; $0.74, 14 checks, commit 88ed1f9; verify $0.89). `ItemDefinition.Id` answers 0 for a blank name; two tests red ("Expected: 0 But was: 2982523533", "Expected: False But was: True") then green; the test asmdef carries the runtime's constraint and versionDefine. Definition 14 of 14; edit 86 (+2).

**The human task** (`human-audit-and-rescue-play`, passed, $0). The developer read the audit page and answered the four homes (`evidence/human-play/audit/answers.md`, 2026-11-15 22:04 Central); the rescue cases' captures are the gym verifier's eight pictures.

## Final counts

| Reading | Before | After |
|-|-|-|
| Character `error CS` | 0 | 0 on every build and verify |
| Character edit mode | 270 | 327 of 327 |
| Character play mode | 36 (24 package, 12 sample) | 73 of 73 |
| Character corner queries, 40,000 over the double | | 0.732 to 0.782 ms; `checkStride` 5 |
| Character stranger compile without StateMachine | | 0 `error CS`, no StateMachine assembly |
| Corsairs edit mode | 69 | 72 of 72 |
| Corsairs falling fix grep | 4 sites | nothing |
| Inventory edit mode | 68 | 86 of 86 |
| Inventory packagecheck | 14 must fix, 3 to confirm, 17 passed | 5 must fix, 2 to confirm, 28 passed |
| Modifiers edit mode | 218 | 235 of 235 |
| Modifiers packagecheck | 15 must fix, 4 to confirm, 18 passed | 11 must fix, 4 to confirm, 23 passed |
| Modifiers runtime `///` lines, em dashes | 156, 5 | 0, 0 |
| Column check | | nothing on every task |

## Findings and how each was resolved

Round 1 (`verdict/round-1-findings.md`, 24 findings from eleven story readings): 1 to 9 became `fix-1-3` (the untested ray branch, the silent world-less containment, the facing decision stated in a test, three test names, the dead `Handles.color`, the dead `SpawnMarker`, the measurement's constant); 10 and 11 became `fix-1-5` (the whitespace id, the test asmdef's constraint); 12 and 13 became `fix-1-4` (the at-or-below name, the inline asmdef arrays); 14 to 24 are decisions recorded: Core's guard count stands (two repairs then hold on the third failing check, Core raised on the meaning of `Repairs`); Corsairs' World asmdef reference, dead usings and split string accepted, the `GameManager.cs:306` warning text reworded in the consumer row; Inventory's lock re-resolve and the two kits accepted and named; `Drain`, `TryConsume`, `Broadcast` and `Vector2 _lastFired` are the games' shape (the vector raised for PG); one copy of the doubles; the gym red count and the fix-1-2 check record are reporting defects.

Round 2 (`verdict/round-2-findings.md`, 2 findings from the three fix readings, none sent back): `CHANGELOG.md:8` reads as if `LastRescues` logs the missing-world error (the release writes the entry from pull request titles; the consumer row rewords it if still there); `ContainmentPlayTests.cs:244` destroys the body after the asserts (matters only once the test fails; raised with the file's teardown).

## Decisions

The developer's two answers (`answers.env`): Saboteer's floaters stay for the consumer row; Corsairs keeps the freeze beside the gate. The audit page's four homes. The plan's sixteen answers held. Triage: the Core lock entry to 0ea31e5 (seam); check 10's `://` lines (Inventory); `supportReachMetres` in Body, the pit test's bound, the double's own file (gym, three stop triages). Sign-off rulings: Core's guard count stands; a rescued body keeps its facing; `worldUp` as the parameter name; one copy of the doubles; the two low round-2 findings recorded, not sent back.

## Raised

- Core: `Guard.Repairs` meaning (repairs before the hold, or failing checks including the held one); `Guard.Check` on `ObservationContext.Discard` answers `Holds`, so a guard with no context is inert.
- Character: `IReferenceFrameWorld` renamed to a body world seam; states as drivers; `MotionClaims` beginning from a literal up; `HoldDriver` and `RescueClaimDriver` both at `rescuePriority` so a rescue under a held gate never becomes the active driver; a `NeedsSupport` driver above `rescuePriority` keeps driving a held kinematic body; `Rescuer.Rescue` under a higher driver moves the body without telling it; seconds through `context.Rate` in the gate and `Time.fixedDeltaTime` in containment; `GymWorld` with no up; `BodyContext.DesiredMove` ignored under a source; `AGENTS.md`'s `BodyContext` line; colliders captured at enable; the swim and fly prefab's missing world and its asset's missing `supportReachMetres` line; the gym block's open sides; `GymContainmentSettings.asset`'s anchor duplicating the spawn marker; the Locomotion float's 0.1 m edge dip; `packagecheck` over Character (d9 on four test asmdefs, a1 on the GeoForge bridge) with no before reading; test asmdef reference lines over 120 columns; `ContainmentPlayTests` teardown; `Physics.SyncTransforms()` in the test recipe; one changelog rule between the stories and the template; `SettingsRescueTarget.Fallback` with identity rotation; `MoveToFallback` resetting `HeldSince`.
- GeoForge: a public volume fixture, then the measurement over a real volume; `Unity.InputSystem` referenced and undeclared.
- Corsairs: remote player copies carrying both components unhanded; the space resolved once at spawn; the regression line "a player inside terrain is rescued above it" proven only in play; the consumer row's lock moves, Modifiers url, `StatData` using and `ResourcePool` copy.
- Inventory: per-lookup hashing in `ItemDefinitionSet`; `AGENTS.md:21`'s depends line and the id line; null and empty names untested; two test assembly shapes; the test asmdef's LF; A7, P1, I1, A1, V6; the audit's findings for R6a.
- Modifiers: `Tests/Resources` fixtures shipped to consumers; the tests assembly unconstrained on WorldObjects; the WorldObjects floor at 0.0.0; `ResetToMax` firing on every reset under `Max <= Min` and a depleted birth with no event; `#region` in five runtime files; `///` and em dashes in the sample and the released changelog entries; Core by GUID in one asmdef and by name in another; the stale `m_EditorClassIdentifier`; the remaining must-fix items; the audit's findings for PG.
- Runner and briefs: the stale lockfile after a graceful close; bash-form `-logFile`; fix-round commit titles; briefs paraphrasing outcome lines; unescaped dots in grep checks; two-line metas from the generator; a grep over `Assets/**/*.cs` for a name a test must assert absent; URL lines in the comment grep; the gym's red count missing from the final result.

## Cost by stage

| Stage | Dollars | Calls | Context median | Context max | Attempts |
|-|-|-|-|-|-|
| plan (Fable) | 10.04 | 20 | 111,268 | 225,025 | 1 |
| catalogue (Opus) | 8.85 | 129 | 207,076 | 295,841 | 1 |
| seam (Opus) | 3.76 | 71 | 96,738 | 112,816 | 2 |
| build (Opus) | 40.50 | 791 | 93,122 | 175,644 | 22 |
| verify (Opus) | 21.47 | 465 | 71,075 | 119,542 | 17 |
| search (Opus) | 1.25 | 20 | 72,456 | 97,689 | 1 |
| mechanical (Sonnet) | 0.42 | 20 | 44,999 | 55,592 | 2 |
| triage (Fable) | 5.98 | 24 | 63,064 | 87,663 | 3 |
| sign-off (Fable, before this session) | 33.72 | 101 | 71,474 | 238,423 | 12 |
| total before this session | 125.99 | | | | |

## Not run

A hand play by the developer (the gym's pictures were the gate's record); the Corsairs embedded-player play (edit mode only; the containment hand-off at spawn is proven by the prefab tests and the code); a Steam session; a player build; Saboteer against the new Character (out of the step by answer 1); Corsairs against published Character or Core (its locks have not moved); the measurement over a real GeoForge volume (no public fixture).
