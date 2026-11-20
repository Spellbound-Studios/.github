# Step 36.4: weather by place, skies the story sets, falling weather, fog and clouds in a storm (W7-12, W7-13, W7-14, Volumetrics#13)

Built 2026-11-19 and 2026-11-20 by the step runner in two worktrees: `_probes/Corsairs36-4` of `Spellbound-Studios/CorsairsIsleDev` on `w7-weather-by-place` from `main` 11aa2618 (steps 36.2 and 36.3 merged), and `_probes/Volumetrics36-4` of `Spellbound-Studios/Volumetrics` on `volumetrics-storm-fog-clouds` from `beta` 5e63f60 (the commit Corsairs' lock installs). Forty-one tasks: two seams with their verifies, six builds with their verifies, ten fixes with their verifies, six design tasks (five Corsairs plays and one Volumetrics capture) and one human gate; around them a catalogue, a plan, the lead's rulings in `answers/` and two sign-off rounds. The plan and the sign-off ran on Fable; the catalogue, the seams, every build, fix, design and verify on Opus at high effort. Two pull requests: CorsairsIsleDev into `main`, eighteen commits, closing CorsairsIsleDev#216, #217 and #218; Volumetrics into `beta`, three commits, closing Volumetrics#13. The evidence is in `_probes/handoff-36-4/runner`: `plan.md`, `catalogue.md`, `questions.md` and `answers.env`, `stories/Step36.4.md`, `briefs/`, `answers/`, `results/`, `diffs/`, `verdict/` and `evidence/` (the Corsairs captures under `evidence/play-5/` with the earlier plays under `evidence/`, `play-2`, `play-3` and `play-4`; the Volumetrics capture under `evidence/volumetrics/`).

## The shape of the work

No stories file existed, so the plan wrote `stories/Step36.4.md` from the brief's section 6 (`artifacts/design/2026-11-17-sky-weather-look/brief.md`), the prompt and the catalogue, which fixed the Corsairs base suite at 407 passed (not the prompt's 134) and the Volumetrics suite at 217 on a graphics editor. The developer answered the plan's three questions with their recommendations (`answers.env`): the storm wall as a sky-dome layer in `CorsairsSky.shader` because the raymarched cloud layer measured 0.1625 ms GPU and the Sheet layer draws nothing below coverage 0.75 until Volumetrics#12; the cloud weather map applicator compensates the wind drift game-side under Corsairs' present lock through `compensatesWindDrift`, which step 36.5 removes; the late joiner's sky override is raised as a new system and not built. Two lanes ran side by side, one per repository, each on its own worktree and editor; inside a lane each task followed the one before it.

The lead ruled during the run (`answers/`): the test-support asmdef's `Unity.Mathematics` reference stands (13:58); a fixed five-point average steps at a border, so `SampleAt` publishes the viewer's sample following the pure `TargetAt` stencil at a bounded rate per metre, snapping on a teleport, and the map reads `TargetAt` (14:14); the Volumetrics bar checks read before against after on the base, the base's fourteen packagecheck findings raised as a bar story (14:58); the map applicator reads the table, the sky and the wrap through read-only properties on `SkyPresenter` and `VolumetricClockApplicator` (15:17); the flash constant is read across the compute and the cloud library together (15:34); `w712-present`'s COMMIT_PATHS widened after the lead's own miss left two properties uncommitted (16:25); every verify commit count is a floor (17:33).

After the first play (19:20) the lead ruled four fixes before the page: fix-1-1 (ring rows beat biome rows, the falling layer eased out before a switch), fix-1-2 (runtime material copies, the `WeatherField.Sample` marker, the per-frame caches), fix-1-3 (the storm wall as a dark mass with lit tops and rain shafts, the ash as grey flakes under a dim red sun in a brown haze, every number serialized, sighted in a windowed editor against band targets) and play-2 with the border peak measured on the weather alone. After the second play (23:58): fix-1-4 (soft rain shafts, the base in the mass's colour, the tops the wall's own), fix-1-5 (the ash sun a small dim red disc through a weather-published tint, dimming and radius), play-3. After the third play (02:30, amended 02:45 and 03:05): fix-1-6 (a billowed outline from smooth warped noise within the frame, lit along `rimDegrees`, the cause of the violet sky with stars named first), fix-1-7 (irregular ash flakes of many sizes, a pale share, an eroded disc), play-4. After the fourth play (05:05): fix-1-8 (one lump field at three sizes from a tiling noise texture, lit on the sun side, the wall's own GPU addition back under 0.1 ms), play-5. At the gate (09:20) his answer was that the look falls short on every picture and goes to the backlog one piece at a time, the mechanism merging: fix-wall-off set every shipped storm wall strength to 0. His second answer (13:20, amended 13:32) made that every look: fix-visuals-off set every shipped weather but Clear to Clear's cloud, fog, sun and ambient with storm wall 0, falling density 0, no sun tint, dimming or disc of its own. The sign-off that ran at 13:09 read a tree the pair changed and was set aside; the round-1 story readings and round 2 read the final tree.

## The stories and their checks

**Catalogue** (Opus, $7.96, 1 session). The Corsairs base compiles clean against its own lock (console 0 errors, 4 warnings), suite 407 passed, the three build scenes with 0 missing scripts; `SkyFrame`'s one 20-argument constructor at three sites; `ISkyReader`'s five members; `SkyPresenter.Sky` the only door; `IWorldSeedSource` present; `WorldModel` reached only through `NetworkedChunkManager._worldModel`; no synchronous land-or-sea query, only `WorldSampling.EstimateSurfaceHeight`; two biomes, one stratum, no sea, wall or wedges; `CloudLayer.WeatherMap` sampled at the wind-shifted position, Sheet mode empty below 0.75; `CloudLayerConstants.From(layer, float)` so Corsairs' hourly wrap jumps the drift 21.6 km; the Volumetrics clock and `Fog.Time` as `float?`; the Demo sample under `Samples~`; the editor traps (ProjectSettings rewrites on first open, `recompile_status` idle during import, the fresh-import `com.unity.serialization` errors, `Camera.main` null).

**W7-S the Corsairs seam** (`w7-seam`, Opus, $6.95, 2 attempts, 14 checks; `w7-seam-verify`, $1.72, 1 attempt, 16 checks). The six enums and structs, `IWeatherPlaceSource`, `WeatherTableRow` and `WeatherTableDefinition` with eight codes, `WeatherSample` with `From` and `Lerp`, `StormWall`, `StormWallDefinition`, the four new `WeatherDefinition` fields, `FallingKind`, `FallingLayerDefinition`, `SkyOverrideDefinition`, `SkyFrame`'s three members and `Lerp` (23 parameters, every call site), `SkySampler` on `WeatherSample`, `WeatherField` and `SkyOverrideBlend` as stubs, `ISkyReader.Override`, `SkyModel.UseWeather`, `SetOverride`, `ClearOverride`, the presenter's table and writing door, `ScriptedWeatherPlaceSource` in `PlaceSource/` joined by an asmref, `SkyAssemblyBoundaryTests` against the state machine and WorldForge. Red 6 error CS; after 538 passed (131 new). The verifier read the diff on a fresh editor, clean-cache recompile 0 error CS, no bar finding.

**W712-F the field** (`w712-field`, $3.67, 2 attempts, 11 checks; verified by `w712-verify`). `WeatherField` filled: rings, rows by specificity, seeded rolls cached per period, fronts from `Fork(periodIndex).Fork(0x4652)`, the period blend, the five-point `TargetAt`, the viewer follower (metres over the band plus seconds over the blend, snapping on a band or a blend), the spread storm scan with the longest circular run, the map painting, no allocation after the first call. Red 4 CS1061; after 565 (27 new).

**W712-G the game side** (`w712-game`, $4.32, 1 attempt, 14 checks). `NetworkedChunkManager.TryGetWorldModel`, `WorldForgeWeatherPlaceSource` (per-cell cache, `IDisposable` for edit-mode tests, open sea below `seaLevel`, 0.22 microseconds cached against 7.8), eight weathers and the seven-row Heartland table, the World scene wired. Red 1 CS0246; after 601 (36 new).

**W712-P the presentation** (`w712-present`, $7.36, 4 attempts, 14 checks; `w712-verify`, $4.58, 3 attempts, 20 checks on 3f7c521a). `CloudWeatherMapApplicator`, `CloudLayerApplicator`'s coverage rule, `StormWall.hlsl` in the dome shader with every look number a material property, `SkyboxMaterialApplicator.stormWall`, `HeartlandStormWall.asset`, the scene. The verify failed twice on a HEAD that did not compile (the two presenter properties uncommitted after the 15:17 ruling); the lead widened COMMIT_PATHS and the hand-back committed them. After 617 (16 new); three scenes 0 missing scripts; the shader 0 messages.

**W713-O the override** (`w713-override`, $4.51, 3 attempts, 13 checks; `w713-verify`, $1.94, 2 attempts, 16 checks). `SkyOverrideBlend` filled, `SkyOverrideState` in Presentation with the `Spellbound.StateMachine` reference, the two override assets, the late-joiner raise in `results/w713-override.raises.md`. Red 2 CS0246; after 650 (33 new). The build stands at 235175e0 by the 17:33 ruling.

**W714-L the falling layer** (`w714-falling`, $4.04, 1 attempt, 14 checks; `w714-verify`, $1.85, 1 attempt, 17 checks on d6c4590a). `Corsairs/Falling` with `FallingLayer.hlsl`, `FallingLayerApplicator` and `FallingLayerPass` through `RecordRenderGraph`, five layer assets, `AshFall.asset`, Rain, Storm and Snow wired, the World scene. Red CS0246; after 680 (30 new).

**W7-PLAY and the plays** (`w7-play` $10.93 over 3 attempts, `play-2` $5.54 over 3, `play-3` $2.87, `play-4` $2.97, `play-5` $2.74; Opus, design). Each play: a graphics editor in play mode in the World scene, the player camera posed by script, the noon pair, the border crossing, the storm wall, the ash fall, the override entering, held and leaving, the measurements by profiler recorders over three windows of 300 frames, the defects list. The first play found D2 to D9; the second closed D2, D3, D4, D5, D7 and D10 and named D11 to D13; the third closed D12 and named D14 and D15; the fourth closed D14 and named D16; the fifth closed D16 and kept D11 open by eye. Checks per play 8 to 14, every one passed.

**Fixes** (`fix-1-1` $3.25, 14 checks; `fix-1-2` $6.49, 17; `fix-1-3` $12.81 over 4 attempts, 24; `fix-1-4` $3.78, 23; `fix-1-5` $7.67, 23; `fix-1-6` $6.31 over 3 attempts, 27; `fix-1-7` $3.18, 24; `fix-1-8` $5.59 over 2 attempts, 31; `fix-wall-off` $4.45 over 3 attempts, 22; `fix-visuals-off` $2.20, 25; each with its verify at 17 to 20 checks, $1.09 to $2.15). Suite 680 to 690 (13 added, 3 removed), 698 (8), 716 (18), 723 (7), 750 (27), 767 (17), 783 (16), 792 (9), 792, 792. Every fix sighted in a windowed editor where the ruling asked, its band targets read back from captures by `bands.py`, its values in `values.md`, its rounds in `bands.md`.

**V13-S the Volumetrics seam** (`v13-seam`, $4.19, 2 attempts, 15 checks; `v13-seam-verify`, $1.16, 1 attempt, 16 checks). The clock in double, `CloudLayer`'s flash surface, `CloudLayerConstants.From(layer, double)` with fractional tile offsets, the shader constant names, `FogAtmosphere.darkening` through settings, blend and constants. Red 65 compile errors in the four test files; after 241 (24 new).

**V13-C the drift and the flash** (`v13-clock-flash`, $3.49, 1 attempt, 12 checks). The weather map at the unshifted world position, the noise at fractional tile offsets, `CloudLayerFlashLight` beside the sun term in the march and the sheet, the stages on the double clock, AGENTS.md's CloudLayer paragraph and Limits line. After 254 (13 new); shaders 0 messages.

**V13-D the darkening** (`v13-darkening`, $6.43, 4 attempts, 15 checks; `v13-verify`, $4.73, 2 attempts, 18 checks). `FogMediumScatteringAlbedoWithDarkening()` read by the froxel compute and the analytic path, AGENTS.md's sentence and A3 blocks, `DemoStormControls` and its sample tests, `check.sh` and the packagecheck job green against the base. After 258 package tests plus 13 sample tests, 271.

**V13-P the capture** (`v13-capture`, $2.84, 6 checks). The Demo with and without flash 1 and darkening 0.6: the darkening shows (far fog -10.8 percent), the flash does not in the Demo's own sky because no cloud is in view (at coverage 1 it brightens its region 23.7 percent); `volumetrics stats` in both states; the sample deleted, the worktree clean.

**Gate** (human). The page built from play-5. His answer: the look falls short, every picture; merge the mechanism with the look as backlog rows. His second answer: every look off by default.

## Final counts

| Reading | Before | After |
|-|-|-|
| Corsairs edit-mode suite | 407 passed, 0 failed, 0 skipped (11aa2618) | 538 (seam, 131 new), 565 (field, 27), 601 (game, 36), 617 (present, 16), 650 (override, 33), 680 (falling, 30), 690 (fix-1-1), 698 (fix-1-2), 716 (fix-1-3), 723 (fix-1-4), 750 (fix-1-5), 767 (fix-1-6), 783 (fix-1-7), 792 (fix-1-8), 792 (fix-wall-off), 792 (fix-visuals-off); 0 failed, 0 skipped at every step, each re-read on a fresh editor |
| Volumetrics suite (graphics editor) | 217 passed | 241 (seam, 24), 254 (drift and flash, 13), 258 package plus 13 sample tests (darkening); 0 failed, 0 skipped |
| `error CS` and `Shader error` | 0 | 0 after every build, fix and verify |
| `ISkyReader` | five members | the same five plus `Override` |
| The noon frame, Clear alone, held at 12 | sun colour `{1, 0.957, 0.839}`, intensity 1, exposure 1.3, ambient grey 0.7924528 | unchanged; the before and after grabs differ by 1 of 255 on 136 land pixels, equal to the before frame against its own repeat (137), 0 sky pixels differ (23:49 ruling) |
| Border crossing, held camera, GlassCalm into Rain | | peak 0.0766 of 255 per frame against 1; the falling layer stays Rain while its share eases |
| `WeatherField.Sample` main thread | | 0.0242 ms place source on, 0.0155 off, against 0.1; a repaint window 0.2508 (D13) |
| `SkyPresenter.Update` main thread | 0.6195 before fix-1-2 | 0.3521 to 0.4547 against 0.1 (D8, `SkyReflectionApplicator` 0.456 of it) |
| Falling pass (AshFall) | | 0.0067 ms main, 0.0254 GPU on; 0 off; against 0.5 and 0.1 |
| `DrawSkybox` GPU, 1920x1080 | | 0.1736 ms wall at 0, 0.2102 at 0.99 (D9); the wall's own addition 0.0366 against 0.1 (play-4 0.1053, D16 closed) |
| After fix-wall-off | | the wall adds 0.0000 ms within 0.0002 noise; the storm sky grabs move 0 pixels |
| After fix-visuals-off | | storm and ash sky grabs 0 pixels from Clear's; full grabs 0; no falling sprites; the dome's own sun at 2.50 degrees; weather work 0.0296 ms |
| Storm wall bands, play-5 | | outline p50 246.0, spread 95.2, top 0; rim p50 155.4; face p50 98.4, p90 165.4; shafts jump-share 0; base deviation 3.0; bumps 10, run share 0.1140; rim ratio 8.45, thin 0.0877; lit 0.2946, blobs 13, largest 0.1682 |
| Ash bands, play-5 | | disc luminance 141.9, ring ratio 1.1608, red to blue 2.3251, diameter share 0.0361; darker-share 0.7490, lighter 0.2471, area p50 12, p90 39, disc-share 0.3390 |
| Volumetrics Demo | | darkening: far fog 102.87 to 91.45, ground 78.69 to 78.01; flash at coverage 1: 84.79 to 104.90; CPU per camera 0.248 off, 0.242 on |
| Build scenes | | StartScreen, Loading, World open with 0 missing scripts |
| Column check | | prints nothing on every task |
| Files outside the stories' paths | | none committed; the editors' ProjectSettings rewrites restored or left uncommitted |
| Packages | Corsairs reads Core, WorldForge, the state machine and Volumetrics through its lock | none edited in Corsairs; `package.json` unchanged in Volumetrics |
| Commits | | Corsairs 18 on `w7-weather-by-place`; Volumetrics 3 on `volumetrics-storm-fog-clouds` |

## Findings and how each was resolved

The 13:09 sign-off read a tree the off-by-default pair changed and was set aside. Round 1 read the eighteen stories in sessions of their own (`verdict/round-1-story-*.md`) and ranked twenty-four findings; its one blocking finding was the shipped weathers' own looks against his second answer, closed by `fix-visuals-off` (read at the diff: nine weather assets at Clear's look, the two pin files, red first, 792 of 792, grabs 0 pixels from Clear's). Round 2 (`verdict/round-2-findings.md`) ranks the twenty-three that remain, none blocking:

1. `HeartlandSkyDome.asset:46` `starSkyBrightnessDimming` 3 to 12 (fix-1-6, D15) may fade twilight stars; no dusk read. Raised first with its check.
2. The CPU `MediaAt` returns the undarkened medium while the GPU scatters the darkened one (v13-darkening). Merged with the body saying so; the bar story fixes it.
3. `placeCellMetres` unread beside `cellMetres` (w712-game), the one ruling not held. Recorded; one home in 36.5.
4. The follower's time term beyond the 14:14 ruling (w712-field). Stands as an amendment; recorded.
5. `SkyModel.SampleWeather` moves the follower on foreign samples. Raised.
6. Fourteen shape constants in `FallingLayer.hlsl` (w714-falling). Technique of a layer particles replace; stay.
7. `sunDimming` darkens the haze (fix-1-5). Accepted at 0; row 7 gives the haze its own field.
8. `stormCloudHoldBackMetres` unwritten in the asset (fix-1-3). Inert at strength 0; row 1 decides.
9. The warp's two fetches beside one per octave (fix-1-8). Outcome met; recorded.
10. The GPU flash tests written after the shader (v13-clock-flash). Accepted, named.
11. The second public `TryGetPlace(WorldModel, ...)` (w712-game). Accepted as a test seam; `internal` raised.
12. The 0 sentinel of `sunDiscRadiusDegrees` (fix-1-5). Raised.
13. Grouped validations naming the first field, bounds named for other fields. Raised.
14. Build-stage words in three test files (w7-seam). Raised for the sky bar story.
15. `AGENTS.md:156` wording (v13-clock-flash). Raised.
16. `SpellboundLine.asset` with Core's copyright line (v13-darkening). Raised to the bar story.
17. Tests pinning less than their names, including the eight identical TestCase rows after fix-visuals-off. Raised.
18. Procedure records (copied before counts, unnamed green tests, an elided command, a misplaced red reading, an overcounted values table, the flakes credited to fix-1-3 where fix-1-2 closed them, the seam carrying V13-D's constants test). Recorded.
19. `wall-base` band measuring solid mass after fix-1-4 moved the ramp below the base. Measurement note.
20. Fourteen nits across both repositories. Raised together.
21. Shape decisions, no change: nested `DrawData`, footprint weights on the first model, `reflectionFrameInterval: 4`, the sun lines the save adds.
22. Findings void after the check at the line: the midnight wrap (`TimeOfDay.FromHours` wraps), the density second source and the shared material writes (fixed in the step), fix-1-6's 0.121 ms (fixed by fix-1-8), the `answers/` folder (exists).
23. The stories file's W7-S text behind fix-1-1's `From` rule. The written-result section states the as-built rule.

Defects found by the plays and how each closed: D1 withdrawn (the harness); D2 fix-1-1; D3 fix-1-1; D4 fix-1-3; D5 fix-1-3 under ruling 3 (the nearest hour, 10.06 of day 5); D6 raised (Volumetrics#11); D7 fix-1-2; D8 raised (sky-wide); D9 raised (sky-wide); D10 the 23:49 ruling; D11 open at the gate, the look going to the backlog by his word; D12 fix-1-5; D13 raised (36.5); D14 fix-1-7; D15 stars closed by fix-1-6, the palette raised; D16 fix-1-8.

## Decisions

His three answers (`answers.env`), his two gate answers, the lead's rulings above. From the stories and the rules: the weather table keyed on `BiomeDefinition.BiomeName`, the ring from shares of `WorldRadiusMetres`, land or sea from `EstimateSurfaceHeight` against `seaLevel`, no field on `BiomeDefinition`; one roll per row per period from Core's `SeededStream`; the map `RGBAFloat`, repainted every 5 s and at period changes; the storm wall a dome layer, no lightning; `SkyOverrideState` in Presentation, bodies the running sky's under an override; the falling layer procedural quads from `SV_VertexID` through a render-graph pass, no particle system, VFX Graph or mesh; the Volumetrics clock in double with every call site and no shim; the flash a value on `CloudLayer`, the darkening one `FogAtmosphere` parameter; captures match the reference pictures' camera and sun, not their place; two peers agreeing is proven by the seeded roll's bit-identical tests, the peer play his at the weekend.

Settings left open, with their defaults: the table's eighteen (`periodSeconds` 300, `periodBlendSeconds` 60, `borderBandMetres` 500, `frontSpeedMetresPerSecond` 2, the four ring shares 0.15, 0.225, 0.6, 0.7, `placeCellMetres` 256, `cloudTop` 0.85, `cloudType` 0.5, `weatherMapResolution` 64, `weatherMapMarginShare` 0.1, `stormScanDistanceMetres` 5000, `stormScanAzimuths` 36, `stormScanSeconds` 2, `stormWallBlendSeconds` 5, `stormCloudHoldBackMetres` 2500); `repaintSeconds` 5, `compensatesWindDrift` true, `cellMetres` 256, `maximumDrops` 200000; the storm wall's values of `HeartlandStormWall.asset` as fix-1-8 left them, at strength 0 on every weather; the falling layers' values as fix-1-7 left them, at density 0; `starSkyBrightnessDimming` 12, `hazeDistanceMetres` 600, `hazeBrightness` 1; Volumetrics `FlashRadiusMetres` 3000, `darkening` 0.

## Raised

- CorsairsIsleDev backlog rows (the 09:20 and 13:20 rulings): the storm wall as volumetric cloud; rain as particles with shafts; ash fall as particles in a haze that reaches the land; lightning (W7-15); the sky's palette at a low sun (D15); snow and the other kinds against their references; the weathers' own cloud, fog and sun values restored (the values of `evidence/fix-1-5/values.md`, fix-1-6 and fix-1-8).
- CorsairsIsleDev, step 36.5: the repaint spread and the map applicator rewrite (D13, `PaintWeatherMap`'s 20,480 to 40,960 lookups per paint); `compensatesWindDrift`, `WrapSeconds` and the `_clock` lookup dropped when the lock moves; one home for the cell size.
- CorsairsIsleDev, the sky module: every file and line of the Corsairs body's raised list; `SkyReflectionApplicator` 0.456 ms inside `SkyPresenter.Update` (D8); the dome 0.1736 ms GPU at full HD (D9); a replicated story state for the late joiner (`results/w713-override.raises.md`).
- Volumetrics: the CPU and GPU medium split; the darkening on the atmosphere only; three float casts of the clock; `README.md:372`; `AGENTS.md:156`; the flash's cost and the sheet's middle point; the probe computes in `Tests/`; `SpellboundLine.asset`'s copyright line; the bar story from the base's fourteen findings; the Demo's sky without cloud in view; for Corsairs, `FogAtmosphere`'s range (#11), Sheet mode below 0.75 (#12), storm-cell shading.
- Runner: a verify fails twice when the lead's ruling adds a file without widening COMMIT_PATHS; the gate's second answer after a sign-off needs the stage set back by hand; a fix task that asks a question and gets no answer within the wait replays with the harness unchanged (fix-wall-off attempt 3); builders' editors die on low memory beside other projects' editors; the sign-off split by story at five stories.

## Cost by stage

| Stage | Model | Dollars | Sessions | Context median | Context max |
|-|-|-|-|-|-|
| plan | Fable | 10.91 | 1 | 97,794 | 240,251 |
| catalogue | Opus | 7.96 | 1 | 183,867 | 261,151 |
| seam (both lanes) | Opus | 11.14 | 4 | 115,684 | 239,145 |
| build and fix | Opus | 89.56 | 34 | 110,761 | 285,276 |
| design (plays and the capture) | Opus | 27.89 | 12 | | 248,418 |
| verify | Opus | 31.07 | 20 | 82,165 | 163,588 |
| triage | Fable | 0.00 | 0 | | |
| sign-off (story readings and round 1) | Fable | 55.48 | 19 | 96,718 | 192,709 |
| total before this session | | 234.01 | 91 | | |

By task: w7-seam 6.95, w7-seam-verify 1.72, w712-field 3.67, w712-game 4.32, w712-present 7.36, w712-verify 4.58, w713-override 4.51, w713-verify 1.94, w714-falling 4.04, w714-verify 1.85, w7-play 10.93, fix-1-1 3.25, verify-fix-1-1 1.30, fix-1-2 6.49, verify-fix-1-2 1.60, fix-1-3 12.81, verify-fix-1-3 1.79, play-2 5.54, fix-1-4 3.78, verify-fix-1-4 1.23, fix-1-5 7.67, verify-fix-1-5 1.55, play-3 2.87, fix-1-6 6.31, verify-fix-1-6 1.78, fix-1-7 3.18, verify-fix-1-7 1.51, play-4 2.97, fix-1-8 5.59, verify-fix-1-8 2.15, play-5 2.74, fix-wall-off 4.45, verify-fix-wall-off 1.10, fix-visuals-off 2.20, verify-fix-visuals-off 1.09, v13-seam 4.19, v13-seam-verify 1.16, v13-clock-flash 3.49, v13-darkening 6.43, v13-verify 4.73, v13-capture 2.84. The design row is the sum of the six design tasks; `summary.md`'s stage table carries no design row.

## Not run

A player build; a two-peer play (the seeded roll's bit-identical tests stand in; the peer play is his at the weekend); anything that starts Steam; the designed world's ice shelves, Frost Wall top and wedges (the forest and meadow of `main` stood in, the Storm Belt rolled on land); a sea surface for "calm glassy water" and "rain on the sea"; the mid-range PC; a dusk read of the stars after `starSkyBrightnessDimming` 12; the flash in the Demo's own sky (no cloud in view); the move of Corsairs' Volumetrics lock (36.5); a hand play by the developer.
