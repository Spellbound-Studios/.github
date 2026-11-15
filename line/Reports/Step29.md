# Step 29: flight recorder and riding (R1b, R3a)

Built 2026-11-15 by the step runner in three worktrees: `_probes/Core29` of `Spellbound-Studios/Core` (branch `r1b-flight-recorder-guards` from `dev` ba640f6), `_probes/Character29` of `Spellbound-Studios/Character` (`r3a-reference-frame-riding` from `beta` a2ed65d) and `_probes/Saboteur29` of `Spellbound-Studios/SaboteurDev` (`r3a-saboteer-riding` from `main` a9185bf). Networking was read and not changed. Forty-two tasks: two seams, thirteen build stories, five sign-off fixes, each with its own verifier, and two scripted plays the developer judged. Concurrency two, one editor per task, never two on one worktree. Plan, triage and sign-off ran on Fable; every seam, build and verify on Opus at high effort. The evidence is in `_probes/handoff-29/runner`: `plan.md`, `catalogue.md`, `questions.md`, `answers.env`, `briefs/`, `results/`, `diffs/`, `evidence/` and `verdict/`; the plays' pages and captures are under `evidence/human-play/` and `evidence/human-play-2/`.

## The shape of the work

Core's observation model finished: guards with a policy and per-context state, the flight recorder ring per context, the settings asset's validation with two Core checks, the native queue a job writes through with the profiler mirror, the ledger's departure soak and the measurements of the numbers table. Character.Body gained riding: the reference frame world seam, two source components, the rider, the collider check, motion claims, the measured probe cost and a gym with a moving platform. Saboteer deleted four of its five ride copies, kept the player's hierarchy reparenting by the developer's answer until step 38, put the sources on the cage and the well's platform and the rider on the player, the items and the projectiles, and wired Core's call-site tally beside its crew log relay. The developer answered the plan's three questions with its recommendations: the binding keeps seconds; the player's reparenting stays until step 38's bridge; the gate judges both the gym and the elevator through scripted play.

Two rounds. Round 1 read sixteen stories, ranked 37 findings, sent two fixes back (`fix-1-2` Saboteer, `fix-1-3` Core) and ruled finding 11 fixed rather than accepted (`fix-1-4`); the first play's step-off defect became `fix-1-1`; the kinematic velocity lag the fix-1-4 stop triages uncovered became `fix-1-5`. Round 2 read the five fixes, found six low findings, none in shipped behaviour, and signed off.

## Before

Core `dev` ba640f6 (1.1.9): edit mode 1004, play 9, `packagecheck check` "16 must fix, 3 to confirm, 1 waived, 27 passed, 6 not applicable, 3 not run" exit 6; `ObservationKind` four members; no `Guard`, recorder or `ReferenceFrameChecks` type. Character `beta` a2ed65d: edit 208, play 4, packagecheck 46 passed with P1 waived; `ReferenceFrameBinding` with 14 tests, no rider, source or claim. Saboteer `main` a9185bf: edit 246; five ride paths; `CrewLogRelay` with a `TallyingLogSink` only.

## The stories and their checks

**Core seam** (`seam-core`, Opus, $5.14, 3 attempts, 11 checks, commit a250fc0; `verify-seam-core`, $3.52, 2 attempts). Guard, policy, verdict, state, recorder cell and record types, settings fields, the context rate; 46 shape tests red on CS0246 before the types, then green; edit 1050 (1042 passed, 8 skipped) = 1004 + 46; play 9; packagecheck line unchanged; column check clean. Triage: `ObservationRegistry.cs` and `ObservationDeclarationScan.cs` admitted; the em-dash check reads the diff's added lines (14 em-dash lines were already on `dev`). Attempt 2 stopped blocked on the two files; attempt 3 rechecked under the rulings.

**R1b-1 Guards** (`build-r1b-1`, $3.05, 1 attempt, 10 checks; verify $1.40). `Guard.Check` with per-context state, `GuardTripping`, `RequireConstantUp`, `CoreKit.Observations.FindGuard`. Red 17 guard tests; the three `ReferenceFrameChecksTests` were never run red (check 1's filter missed the class). Green edit 1070 (+20), play 9. Spot-checked: `RecordOccurrence` returns early for a guard at `ObservationContext.cs:322`.

**R1b-2 Flight recorder** (`build-r1b-2`, $3.11, 1 attempt, 10 checks; verify $1.81). Red 13 of 16, 5 of 8, 8 of 8; green edit 1102 (+32), play 9; `Guard.cs:82-83` holds the one `FlagWindow` call; `FlightRecorder.cs:98` writes `(uint)tick.Value`; the C10 to-confirm count rose 52 to 58 inside the unchanged status line. The ring costs 17 bytes a cell (the 16-byte cell plus a byte mark): 557,056 bytes at 32,768 cells.

**R1b-3 Settings and checks** (`build-r1b-3`, $3.01, 1 attempt, 10 checks; verify $1.38). Red six CS0246 for the two check types; green edit 1130 (+28), play 9; `grep -rn "RegisteredDefinitionCheck(\"core\."` prints two lines. The verifier's two warnings: declared-twice has no location (as the brief asked); budget plus quality level on one key was an Error (round 1 finding 2, fixed by `fix-1-3`).

**R1b-4 Native queue and mirror** (`build-r1b-4`, $4.07, 3 attempts, 10 checks, commit aaa70a2; verify $2.97, 2 attempts). Red nine CS0246; green edit 1146 (+16: 12 queue, 1 Burst, 3 mirror), play 9; the runtime asmdef still `"references": []`. Attempts 2 and 3 and the verifier's first attempt stopped on check 5's `using Unity.Collections;` term, the engine namespace the seam's `FlightRecorder.cs` already used; the triage dropped the term and kept the Profiling.Core terms; aaa70a2 stood.

**R1b-5 Soak and measurements** (`build-r1b-5`, $1.68, 1 attempt, 11 checks; verify $1.16). Soak 1 of 1 in 1.79 s (verifier 1.61 s) at the full 300 s grace: 20,000 actors, 15,000 departures, `windows_dropped` 15,000, 5,000 actors and 5,000 x 384 bytes at the end. Measurements 3 of 3: occurrence write 710.3 ns (737.7), counter add 502.9 ns (426.3), guard check 159.4 ns (136.2); `GuardState` 32 bytes, `RecorderCell` 16. Edit 1150 (1142 passed, 8 skipped) = 1138 + 4, play 9. Both files test code that existed, so the first run was green. The builder deleted two editor-generated untracked files outside `Packages/Core` to pass check 9.

**fix-1-3** (`fix-1-3`, $0.99, 1 attempt, 10 checks; verify $0.98). `SetsTheOtherCostDefault` and `IsCostDefaultList`; `ACostKeyWithABudgetAndAQualityLevelReportsNothing` red ("named in budgets and again in qualityLevels"), then 12 of 12; edit 1151 (1143 passed, 8 skipped), play 9; packagecheck line unchanged; six in-memory attacks by the verifier each an Error at the list named. The builder's first full-suite run had `AnOccurrenceWriteIsUnderOneMicrosecond` at 1,251 ns beside a second editor; the rerun 663 ns.

**Character seam** (`seam-character`, $3.24, 1 attempt, 12 checks; verify $1.38). World seam, source and rider shells, motion claim types, riding settings, the observation, the P1 waiver removed; 24 tests red on CS0246; edit 232 = 208 + 24, play 4; packagecheck status line unchanged with P1 passing and `waivers: []`. The builder's check 3 count (0) was an interpretation of a log with 14 first-import errors; the verifier's literal run printed 0. Files admitted by ruling: `Surface.txt` (V3), three test doubles, `BodyContextMotionTests.cs`.

**R3a-1 Binding** (`build-r3a-1`, $1.10, 1 attempt, 10 checks; verify $1.04). `Turn` and `WorldVelocity`; red 10 of 10 on `NotImplementedException`; edit 242 (+10), play 4. Spot-checked: `WorldVelocity_AddsTheTurningFramesVelocityAtThePoint` expects (7, 0, 2) and the arithmetic holds.

**R3a-2 Sources** (`build-r3a-2`, $2.26, 1 attempt, 10 checks; verify $1.14). Red a compile failure; edit 251 (+9), play 11 (+7); `DefaultExecutionOrder(-100)` on the base and both sources; the resolution order code-set, serialized, parent; the id Fnv1A32 of the path widened, zero becoming 1. `CHANGELOG.md` and `Surface.txt` admitted by the R3a-4 triage's precedent.

**R3a-3 Rider** (`build-r3a-3`, $2.15, 1 attempt, 10 checks; verify $1.31). Red 7 of 7 with `FixedUpdate` absent; edit 251, play 18 (+7); the mover grep empty; the sleep skip applies only while unbound (declared departure, accepted). The subject is `EntityId.ToULong(GetEntityId())` (the brief's `(ulong)GetInstanceID()` is CS0618); the builder's "used elsewhere" precedent did not exist, recorded.

**R3a-4 Collider check** (`build-r3a-4`, $2.67, 2 attempts, 10 checks; verify $1.33). Red 15 compile errors then a stub failing 4 of 7; edit 258 (+7), play 18; packagecheck D9, A1, C10, V4 as the seam with V3 passing. Attempt 1 stopped on `Surface.txt`, a CHANGELOG line and `Spellbound.Core.Editor` in the tests asmdef; the triage admitted them; `Spellbound.Core` by name in the editor asmdef admitted at sign-off (references are not transitive).

**R3a-5 Motion claims** (`build-r3a-5`, $1.96, 1 attempt, 10 checks; verify $1.05). Red 11 of 11 on the throwing shell; edit 269 (+11), play 18; `ClaimAndRelease_NoAllocation` green; packagecheck byte-identical to R3a-4.

**R3a-6 Gym** (`build-r3a-6`, $4.92, 1 attempt, 12 checks; verify $1.40). Red 2 of 2 ("travelled (0,0,0) while the platform travelled (3,0,0)"); sample play 11 (9 + 2), edit 270 (+1), package play 18; probe 1.46 us (1.41), binding observation 27.5 ns (26.0), `probeStride` stays 1; 16 captures; the verifier's `WorldVelocity` mutation turned both ride tests red. `ReferenceFrameRider.ProbeOnce` and `AssemblyInfo.cs` admitted (asked for by the brief's own "What to build"). The builder reported the 14 cm reversal slip at -60.

**R1b-6 Call-site tally** (`build-r1b-6`, $2.93, 2 attempts, 9 checks; verify $1.89, 2 attempts). `StartRelaying` and `StopRelaying`; edit 248 = 246 + 2. The red run failed at the reflection helper ("has no StartRelaying"), not the counter assertion, recorded. Attempt 2 removed a blank line the verifier found.

**R3a-7 Saboteer's ride copies** (`build-r3a-7`, $8.51, 2 attempts, 11 checks; verify $2.49). Red 10 run, 8 failed on the unchanged prefabs (the brief's filter `Saboteur.RidingPrefab` matched nothing; `Saboteur.Tests.RidingPrefab` is the form); edit 258 (+10); the deletion grep and the old GUIDs print nothing; Ragdoll untouched; the ride bound to `Cage` throughout at 0.121 m top, middle and bottom, 0.112 to 0.130 over the ride, bound count 1; `SetSoftParent` only in `ReferenceFrameSoftParent.cs:38` and `PlayerRagdoll.cs:443,1007`. Attempt 1 failed; session 2 added `SaboteerWorld.ReferenceFrames` keeping its first directory after a `NullReferenceException` at play exit. `GettingUpLocoState.cs:42` admitted (one line forced by the deletion). The verifier's warnings: release after leaving became 0.5 s (fixed by `fix-1-1`); `NetworkedScene.unity:303` keeps the dead marker name; a teleport binds on the next step.

**The first play** (`human-play`, scripted by an Opus worker, judged by the developer; `evidence/human-play/page.md`, 46 captures). Gym: bound at step 205; feet at 1.343 right and 0.556 toward the camera from step 222 to 397 over 5.25 m of travel; 1.487 after the reversal at 422 (14 cm); 2.3 m across with 9 cm drift; left at 487, released at 513 (0.52 s), carried 0.8 m on still ground; bound count 1. Saboteer: UDP host, player and two treasures on the cage, 300 m down in about 30 s, player 0.121 m above the cage at top, middle and bottom, items 0.020 and 0.120 with no sideways move, three binds. The lead ruled the step-off a regression (the old Saboteer let go at once) and added `fix-1-1`.

**fix-1-1** (`fix-1-1`, $1.71, 1 attempt, 14 checks; verify $1.45). `FindFloorBelow` returns the nearest collider; `Probe` releases on a floor with no registered source (`ReferenceFrameRider.cs:83`) and holds only with no floor. Red 9 ran, 1 failed (`Rider_SteppingOffOntoAStaticFloor_ReleasesOnTheNextProbe` at line 216), green 9 of 9; edit 270, package play 20 (+2), sample 11; Saboteer edit 258 with `RidingPrefabTests` 10; every solid collider of `ElevatorHoist.prefab` under the `Cage` source.

**The second play** (`human-play-2`; `evidence/human-play-2/page.md`, 48 captures). Run 1: bound at 206, left at 488, released on 489, coasted 6.7 cm, no movement along the platform's direction from 499 to 518 while the platform moved 60 cm; bound count 1. Run 2: jump at 293, last sighting at 305, no floor from 306 to 331, released at 331 (0.52 s), one step before the ground came into view; carried 3.3 cm a step while held; landed at 350; bound count 1.

**fix-1-2** (`fix-1-2`, $1.29, 1 attempt, 10 checks; verify $1.03). `Grenado.Start` attaches the rider (`Grenado.cs:205`); the `ThrowingState` call gone. Red 13 ran, 3 failed ("has no Start"), green 13 of 13; edit 261 (+3); `AttachRiding` callers all allowed; no leaked world after the suite. The `Invoke` helper walks `BaseType` because the subclasses are sealed.

**fix-1-4** (`fix-1-4`, $5.35, 4 attempts, 15 checks; verify $1.93). Attempt 1 (-40 alone) stopped blocked at 0.1440: the slip was the kinematic velocity lag, not the order. Stop triage: the developer chose `RigidbodyReferenceFrameSource.Move(Pose)` recording the step's velocity, the gym platform at -90 calling it, and a Saboteer follow-up. Attempt 3 stopped at 0.0840: `MoveTowards` capping the frame's reversal at the character's acceleration. Stop triage 4: `LocomotionContext.CarriedVelocity` carries the frame's change in full, the tolerance stays 0.02. Attempt 4: red 0.0840, green 3 of 3; edit 270, play 36 (24 + 12), sample 12; `Move(UnityEngine.Pose)` the one new Surface member; twelve ruled paths. The verifier's mutations: the `Move` line red at 0.0600, the carry red at 0.0840; gym rows gym-09 and gym-10 both 1.380, -0.549 against the first play's 1.343 and 1.487.

**fix-1-5** (`fix-1-5`, $5.21, 2 attempts, 12 checks, commits 139764f and a8f4dda; verify $4.08, 2 attempts). Before ride on today's drivers, every fixed step: offset 0.1210 m, lag +0.0085 m at step 4417 (start), -0.0086 at 5843 (stop), -0.0086 at 5523 (whole). Attempt 1: red 18 ran, 4 failed (cage source 0 for a commanded -15.0002, well source 0 for 2.5000, the reversal body at 3.200 with 5.200 m/s slip), green 18 of 18; edit 266. The verifier's first attempt failed: a state change carried a frame change that did not happen. Round 1: `StateData.PreviousFrameVelocity` keeps the raw bound velocity and both steps resolve through the current state; red 19 ran, 1 failed, green 19 of 19; edit 267. The verifier's ride: lag +0.0000 m in every window, 0 rows past 0.02, bound `Cage`, player vy within 0.0004 of the source's, three captures.

## Final counts

| Reading | Before | After |
|-|-|-|
| Core `error CS` | 0 | 0 |
| Core edit mode | 1004 | 1151 run, 1143 passed, 8 skipped, 0 failed |
| Core play mode | 9 | 9 |
| Core packagecheck | 16 must fix, 3 to confirm, 1 waived, 27 passed, 6 n/a, 3 not run | identical |
| Core runtime asmdef references | none | none |
| Character edit mode | 208 | 270 |
| Character play mode | 4 | 36 (24 package, 12 sample) |
| Character packagecheck | 46 passed, P1 waived | 46 passed, P1 passing, 0 waived, same 14 findings |
| Saboteer edit mode | 246 | 267, `RidingPrefabTests` 19 |
| Saboteer ride paths | 5 | 1 kept by the developer (`ParentToPlatform`) |
| Gym reversal slip | 0.144 m | 0.000 m |
| Gym step-off carry on still ground | 0.8 m over 26 steps | 6.7 cm coasting, release on the next step |
| Cage lag at start and stop | 8.5 mm and 8.6 mm | 0.0 mm |
| Occurrence write, counter add, guard check | | 710 to 776 ns, 426 to 503 ns, 136 to 188 ns |
| Rider probe, binding observation | | 1.41 to 1.46 us, 26 to 28 ns |
| Column check | | nothing on every task |

## Findings and how each was resolved

Round 1 (`verdict/round-1-findings.md`, 37 findings from sixteen story readings): findings 1 and 2 became `fix-1-2` and `fix-1-3`; finding 11 (the sample at -60) was ruled fixed, not accepted, and became `fix-1-4`; findings 3 to 16 are rulings recorded (the fifth ride path kept by the developer's answer 2 over the plan's misquote; `GettingUpLocoState.cs:42`, `ProbeOnce` and `AssemblyInfo.cs`, the seam's five files, `CHANGELOG.md` and `Surface.txt`, `Spellbound.Core` by name admitted; `protected virtual` enable and disable with the override-and-call-base rule; the rider's entity id as the subject; the never-red `ReferenceFrameChecksTests` and the R1b-6 red at the reflection helper recorded; the seam's check 3 interpretation; the missing precedent; `RecordOccurrence`'s early return right); 17 to 19 are lines for the written result (17 bytes a cell, the window restart rule, the measurement margin); 20 to 37 are raises.

Round 2 (`verdict/round-2-findings.md`, 6 findings from the fix readings, none sent back): `BaseLocoState.cs:256` the carry's call site untested, accepted on the after ride, raised; `ReferenceFrameRiderPlayTests.cs:274` proves one error in ten probes rather than at the first, raised; `RidingPrefabTests.cs:66,82` expected velocity from the post-move position, raised; `:236-238` backing-field reflection, folded into the `InternalsVisibleTo` raise; fix-1-5 landed as two commits under one title, read as ab2e874..HEAD and squashed at publish; the fix-1-5 result omitted three items the evidence files carry.

The plays' defect: the step-off carry (first play sentence 25) ruled a regression against the old Saboteer and fixed by `fix-1-1`, shown on the second page.

## Decisions

The developer's three answers (`answers.env`): seconds; keep the reparenting until step 38; the gate on both scenes. The plan's twenty answers held, with answer 12 corrected by the developer's answer 2. Triage: the seam's two files; R3a-4's three files; R1b-4's check 5 wording; fix-1-4's four rulings (the world setter after enable and the error at the first probe; the `Move` door, -90 and a Saboteer follow-up, by the developer at the second stop; the carry and the 0.02 tolerance at the fourth). Sign-off rulings: finding 11 fixed, not accepted; the duplicate-key literal rule wrong; the fifth path kept as the player's hierarchy parent; the `fix-1-5` diff read as one range.

## Raised

- Core: `Guard.Declared` into `ObservationRegistry` with a reset; the fresh-repairs rule tested; the trip itself recorded in the ring; `HeaderMark` dead; the under-four-cells record uncounted; `FlagWindow`'s whole-ring walk; the 12-value limit in three places and the `Record` overloads' Discard shapes; the rate cap's credit bucket; `IsTime`, `DefaultRecorderCells`, the int message, the twice-written rate-cap rule; the queue's `Drain` guard, writer lifetime, refused-key rescan, mirror duplicates and zero first reading; the declared-twice home, the editing-time assembly scan, `SlowestTicksPerSecond`; the Measurement category inside the gate; `RecorderCellSizeTests` holding other subjects; `AGENTS.md` "Gaps"; `core sample-import`.
- Character: a hit on a bound body should count as that body's frame; `World` on a source registered through the other rungs; the silent serialized-world fallthrough; the derived id across scenes; `WorldPose` in the `Move` step and `Move` outside `FixedUpdate`; the transform source's first-step zero; the stale claim release and re-entrancy in `MotionClaims`; `HitCapacity`; the stride release; the three test shapes (first-probe error, reflection to `OnEnable`, the empty-string hash) and the two missing source tests; the sample's `CarriedVelocity` staleness, planar-only carry, `WorldVelocity` without a caller, the null clock, the every-layer probe, the README orders; the measurement budgets in the gate; the repeated path walk and the untitled scene's message; the frame id argument after the Core lock.
- Saboteer: the carry's call site untested; the velocity tests' expected values; the backing-field and lifecycle reflection with no `InternalsVisibleTo`; the two world builders; `NetworkedScene.unity:303`; the teleport's bind on the next step; `GroundState.cs:120`'s comment; `PreviousFrameVelocity` in states that skip the probe and `HandleInput`'s add-and-subtract; two ride mechanisms until step 38; the projectile owner; the directory cache; the tally under the relay level; the editor's `link.xml` and ProBuilder rewrites.
- Runner and briefs: red-run filters over every named class; the em-dash check over added lines; `W/` expanded in commands; `Saboteer.Tests.<Class>` as the filter form; `Spellbound.Core` named with `Spellbound.Core.Editor`; a two-attempt fix read as one range; the Core29 editor's `EntitiesClientSettings.asset` and `SceneTemplateSettings.json` in check 9's wording; Character29's `packages-lock.json` rewrite against check 8.

## Cost by stage

| Stage | Dollars | Calls | Context median | Context max | Attempts |
|-|-|-|-|-|-|
| plan (Fable) | 11.42 | 18 | 160,043 | 255,732 | 1 |
| catalogue (Opus) | 7.53 | 104 | 195,409 | 290,878 | 1 |
| seam (Opus) | 8.37 | 160 | 87,071 | 158,899 | 4 |
| build (Opus) | 55.96 | 1,084 | 86,660 | 232,496 | 27 |
| verify (Opus) | 34.74 | 746 | 71,878 | 141,611 | 24 |
| triage (Fable) | 3.94 | 12 | 45,564 | 95,838 | 2 |
| sign-off (Fable, before this session) | 38.42 | 121 | 61,914 | 275,168 | 17 |
| total before this session | 160.38 | | | | |

## Not run

A hand play by the developer (he judged the two pages); a Steam session (the plays forced UDP); a client peer throwing a grenado onto the cage (fix-1-2 is proved by the edit-mode tests); a play of the well's platform (proved by the edit-mode tests and the cage ride); Corsairs against the new Core or Character (its locks have not moved); a player build.
