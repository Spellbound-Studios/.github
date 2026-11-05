## The stories of step 18: GeoForge's presenter seam and the start of the world model (W1g, L7a, W1a, UI7d-10)

Step 18 freezes what the world generates today, opens GeoForge's chunk presenter and its surface case query, moves GeoForge and WorldForge to the settled layout, builds the first half of the world model behind `WorldForgeKit`, and puts GeoForge's material table inspector on the editor look. Sixteen stories, one gate each: W1g one, L7a seven, W1a seven, UI7d-10 one. The split is the plan's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Three repositories change: GeoForge (into `dev_1.0`, its layout move as one pull request and the stories as a second), WorldForge (into `main`, the same two) and the organisation's `.github` (this section and the golden hashes' record). Saboteer is read on `main` and not changed; Corsairs' own clone of WorldForge is not touched; Core is read at `dev` 70f6b4e and not edited.

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 17 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows without the developer's hand). A library knows no game: no noun of Saboteer or Corsairs enters either package, a value a game would tune is a field with a default, and a decision a game would take differently is a seam with a default.
- **Rules:** a move changes no namespace, no public type and no file identity (every `.meta` moves with its file); a deleted type is deleted, with no alias and no `MovedFrom`, and every consumer in the workspace is named in the report.
- **Rules:** WorldForge's output is frozen first (W1g) and every later story of the step reproduces it bit for bit at footprint 1 in the default float mode; a story that would change a golden hash stops and says so.
- **Verified (2026-10-29):** GeoForge `dev_1.0` is at decc9c2 (the squash of UI7c1); the nested checkout sits on the story branch at f1dd5f6, whose tree differs from the squash in 21 files, so the step builds from the remote head. WorldForge `main` is at 62337c8, clean. Both indexes store every text file with LF already (373 and 313 files), so the renormalise commit of the text rule stages nothing and the report says so. GeoForge's remote still names `Spell-Bound-Studios`; GitHub redirects.
- **Verified (2026-10-29):** GeoForge's runtime is one assembly over 60 files plus `Spellbound.GeoForge.Editor` and `Spellbound.GeoForge.Editor.Tests` (4 tests). The leaf and transition objects are pooled by `GeoForgeManager.GetPooledObject` from the `internal` serialized field `octreePrefab`, which Saboteer's scene and Corsairs' `WorldManager.prefab` both set; `OctreeNode` sets the mesh, the collider, the renderer's property block and `LeafBehaviour.OnMeshUpdated` on that object itself. `BasicWasdController` is referenced by nothing in the workspace; `OldMaterialRenderingProfile` is the script of Corsairs' `CorsairsIsleJobAndRenderProfile.asset` and of GeoForge's own `OldMaterialRenderingProfile.asset`; the two old march jobs are read only by that profile. `GfMarchHelper.GatherRegularCornersAndComputeCaseCode` is the one place the march computes a case code.
- **Verified (2026-10-29):** WorldForge's runtime is four assemblies (the model, `.Decoration`, `.GeoForge`, `.Meshing`) over 115 files; 35 of them use `Unity.Entities` (the layout blob and its builder and seeding, `ChunkGenerationSystem` over `SystemBase`, the static `WorldQuery` over the default ECS world, `WorldPlanProvider`, and `Entity` inside `ObjectPlacement`); the three registries wrap Core's `ResourceRegistry` over `Resources/{Biomes,Lines,Locations}`; four stampers keep static scratch lists; `ObjectPreset` from `Spellbound.Core.WorldObjects` is the type of every preset field and `EntityPrefabRegistry.PrefabLookup` resolves it to an entity; 124 edit-mode tests, none of which creates an ECS world, 82 of which build the layout blob by hand, 6 of which assert on `Entity` indices and 16 of which assert on the blob builder's output.
- **Verified (2026-10-29):** Saboteer's floor is `SaboteurProcGenPipeline` (six Pro passes: surface cap, base fill, shaft features, thorium vein, the point-of-interest pool, bedrock shell) run by `NetworkedChunk.Generate` through `VoxelGenerationPipeline.FillDataArray(coord, configBlob, voxels, seed)` for every chunk of the scene's three spawn regions (64 of the volume's 176 chunks of 128 voxels at 0.5 units), with `MatchSettings.WorldSeed` rolled at random per match; boundary overrides are applied by the chunk engine after the fill.
- **Verified (2026-10-29):** Core `dev` 70f6b4e holds `Spellbound.Core.Testing` (`GoldenHash`, `DeterminismAssert.GoldenHash`), the ground vocabulary (`ISurfaceSource`, `SurfaceRequest`, `SurfaceSample`, `IOccupancySource`, `Occupancy`), `HeaderBar.State` with `HeaderStates`, `SectionCard`, `EditorLook.Dress` and `HashedScriptableObject`; `HeaderBar.Severity` is gone, which is why GeoForge's inspector stopped compiling at step 15.1.
- **Verify before building on it:** that Saboteer's floor passes read nothing from the scene or from `Resources` beyond the assets the pipeline references, so a fill in edit mode equals a fill in a match; that `WorldLayoutBlobBuilder`'s validation order can be kept exactly by the plain builder; that a `[Serializable]` field typed `HashedScriptableObject` accepts an `ObjectPreset` in the inspector.
- **Regression contract:** GeoForge compiles in GeoForgeDev and its edit-mode tests pass; a GeoForge volume with the shipped prefab still marches, draws and collides as before through the default presenter; terraform commands, the edit store, save and load, `TryQueryVoxel` and `TryQuerySurfaceMaterial` are unchanged; a material side table still shows its database, entries and fallback with Sync and Validate; Saboteer's four tables keep their data, since no runtime type or script GUID changes.
- **Regression contract:** WorldForge's 124 tests pass before and after each story (ported where the record or the table shape changes, never deleted), and the golden hashes of W1g hold through every W1a story; the Meshing and Decoration assemblies compile; Corsairs' clone is byte-identical before and after; neither game's manifest, lock, scene or code changes.
- **Done, for each story:** compiles clean through the Unity command line in the dev project named, its tests pass, `packagecheck check` runs over the package before and after, and the pull request's report lists what landed.

### W1g-1 Golden hashes of today's world output and today's floor build time

- **Outcome:** WorldForge's test assembly holds a reference world built in code (two strata under rules, biomes with object tables, a planned and a scattered location, a route and a ring, the biome field, heightmap, underground, location, line, edge, candidate and placement passes) and a test that runs today's chain over a region of chunks for several seeds and asserts one golden hash per seed over the plan, the heights, the biome field, the surface overrides, the voxels and the placements; the hashes are recorded in this file. Beside them the record holds Saboteer's floor per seed: the hash of the pipeline's voxel output over the 64 spawned chunks and the time to fill them, median and worst of ten builds on the reference PC, taken from a copy of Saboteer's `main` with nothing changed in it.
- **Rules:** default float mode; the hashes are `Spellbound.Core.Testing.GoldenHash` over the bytes in a fixed order, and a placement is hashed by its preset hash, pose and scale, never by an entity index, so the same bytes exist after W1a; the golden pipeline holds the passes and the placement job, not the four content stampers, whose output the hashes do not cover; the test replicates the driver's per-chunk site and segment filtering until W1a-1 lets it call the driver; the floor seeds are fixed and named in the record.
- **Regression contract:** none beyond the step's; Saboteer is not changed.
- **Done:** the test passes against today's code, the record is in this file with the seeds, the chunk region, the machine and the date, and W10a's gate reads it.

### L7a-1 The chunk presenter seam

- **Outcome:** GeoForge's runtime has `IChunkPresenter` (a leaf is acquired under a parent for a level of detail and released) and `IChunkLeaf` (takes a mesh, a transition mesh, the volume's world-to-local matrix and a visibility flag, and exposes its transform), and `OctreeNode`, `GeoChunkEngine` and the manager's march apply path talk to leaves only through them; `GeoForgeManager.Presenter` is the seam's slot, set by a consumer or found on the manager's object, and a volume marched with no presenter keeps its voxels, its octree and its queries and draws nothing, reported once through Core's logger.
- **Rules:** the march, the edit store, the LOD rules and the transition masks stay in the runtime assembly untouched; the seam carries no `MeshRenderer` or `MeshCollider` in its signature.
- **Regression contract:** a volume with the default presenter marches, draws and collides as before.
- **Done:** edit-mode tests with a recording presenter (`ChunkPresenter_CustomImplementation`) over an engine that receives march results, and the manager's two pool methods gone.

### L7a-2 The default presenter under the server define and the prefab field opens

- **Outcome:** `GameObjectChunkPresenter`, a component in the new assembly `Spellbound.GeoForge.Presentation` constrained `!UNITY_SERVER`, is the default: it pools instances of the manager's leaf prefab, sets the mesh filter, the mesh collider, the renderer's property block and `LeafBehaviour.OnMeshUpdated`, and sits on the shipped `GeoForgeManager.prefab`; the manager's `octreePrefab` keeps its serialized name and opens as `GeoForgeManager.LeafPrefab`.
- **Verified (2026-10-29):** Saboteer's scene and Corsairs' prefab set `octreePrefab` on their own manager objects and neither carries the new component; both take it when their GeoForge lock next moves, named in the report.
- **Rules:** the runtime assembly never references the presentation assembly; the presentation assembly references the runtime, the engine's modules and Core (for logging) only.
- **Regression contract:** the shipped prefab draws and collides; the sample scenes keep their leaf prefab.
- **Done:** compiles with and without the define; an edit-mode test acquires and releases a leaf from the default presenter.

### L7a-3 The surface case query

- **Outcome:** `SurfaceCase` (the cell's origin in voxel space, its eight corner voxels in the march's corner order and the case code the march would use, with `IsEmpty`, `IsSolid` and `HasSurface`), `SurfaceCases.Compute` over a chunk's voxel array, `GeoVolumeEngine.TryQuerySurfaceCase(worldPosition, out SurfaceCase)` on the cell enclosing a point from the chunk that owns its nearest voxel, the same way `TryQuerySurfaceMaterial` resolves, `IGeoVolume.TryQuerySurfaceCase` and `GeoForgeManager.TryQuerySurfaceCase` over the primary volumes.
- **Rules:** the case code's bit order is the march's (`GatherRegularCornersAndComputeCaseCode`) and the test proves it against that function; a query outside loaded data answers false, never a default.
- **Regression contract:** none beyond the step's.
- **Done:** edit-mode tests over a hand-built voxel array for an empty, a solid and a crossing cell, and the parity test with the march's case code.

### L7a-4 The demo controller goes

- **Outcome:** `BasicWasdController` and its meta file are deleted; the samples and the games keep their own controllers.
- **Verified (2026-10-29):** no prefab, scene or script in the workspace references its script GUID.
- **Regression contract:** none beyond the step's.
- **Done:** compiles; the report names the deleted files.

### L7a-5 The legacy jobs go

- **Outcome:** `OldMarchingCubeJob`, `OldTransitionMarchingCubeJob`, `OldMaterialRenderingProfile` and the `OldMaterialRenderingProfile.asset` are deleted with their meta files; `BarycentricMaterialRenderingProfile` is the one profile that ships.
- **Verified (2026-10-29):** Corsairs' `CorsairsIsleJobAndRenderProfile.asset` is an `OldMaterialRenderingProfile`; it must take the barycentric profile's script before Corsairs moves its GeoForge lock, raised in the report with the one-line change.
- **Regression contract:** none beyond the step's.
- **Done:** compiles; the report names the deleted files and the consumer.

### L7a-6 GeoForge to the settled layout, then the bar

- **Outcome:** GeoForge's repository root is the dev project and the package is `Packages/GeoForge`, moved by the Template's `adopt-repository.sh` with the editor closed and merged as its own pull request into `dev_1.0`; the text rule arrives with the template's `.gitattributes` and `git add --renormalize` is run once; after the move the package adopts the bar: `Identity.asset` (library, the line's sentence, front door `GeoForgeKit`), the generated blocks in `AGENTS.md`, and a baseline waiver per rule today's code fails, so a new hit fails and a removed one shrinks the waiver.
- **Rules:** the move is the developer's act through one script that checks its preconditions (editor closed, clean tree on `dev_1.0` at the remote head), runs the adoption, pushes and opens the pull request; the dev project's lock moves to Core `dev` 70f6b4e in the stories' pull request, because the inspector of UI7d-10 compiles only there.
- **Regression contract:** file identities kept; the project opens, compiles and its tests pass at the new paths.
- **Done:** the two pull requests, the bar's before and after, and every consumer's new manifest line (`?path=/Packages/GeoForge#dev_1.0`) printed in the report.

### L7a-7 WorldForge to the settled layout

- **Outcome:** WorldForge's repository root is the dev project and the package is `Packages/WorldForge`, moved the same way and merged as its own pull request into `main`; the package keeps its own files and `package.json`; the dev project's manifest takes GeoForge by `?path=/Packages/GeoForge#dev_1.0` once L7a-6 has merged, and its Core lock moves to 70f6b4e in the stories' pull request.
- **Rules:** as L7a-6; WorldForge does not adopt the bar in this step (its identity and baselines follow the world model, W1b).
- **Regression contract:** the 124 tests pass at the new paths; Corsairs' clone is untouched.
- **Done:** the pull request, and the bar run over the moved package before and after the stories.

### W1a-1 No Entities and no statics

- **Outcome:** WorldForge's runtime references no `Unity.Entities` and no `Spellbound.Core.WorldObjects`: `WorldLayout` is plain structs over native arrays (strata, biomes, object tables, rule order, radial bias, wedge anchors and permutations) built and seeded by the same validation and the same salts; `WorldModel`, made by `WorldForgeKit.Build(definition, seed)`, owns the seeded layout, the plan and the registries it is given, and answers what `WorldQuery` and `WorldPlanProvider` answered statically; `WorldGeneration` is a plain driver the host advances (requests in, voxels and placements out through `IWorldForgeChunk`), replacing `ChunkGenerationSystem`; a placement carries a preset hash, never an entity; the four stampers' static scratch lists become instance state; a preset field is a `HashedScriptableObject` reference read by hash.
- **Rules:** every sampling, planning, routing and stamping function keeps its arithmetic and its random draws, so W1g's hashes hold; the Meshing assembly reads the model through the same functions; no `Resources` folder is demanded (as built: the three registries are deleted, `WorldForgeKit.Build` takes the location and line lists and the pipeline, and no loader exists).
- **Regression contract:** the 124 tests pass with their setup ported to the plain tables and the preset hash; the golden hashes hold.
- **Done:** zero `using Unity.Entities` in the runtime, zero static mutable fields, the asmdefs reference Core, Burst, Collections and Mathematics only, and the W1g test runs through the driver.

### W1a-2 Surfaces with the union rule

- **Outcome:** a `WorldDefinition` carries an ordered list of surfaces (a ground, then a floor and a ceiling per air layer) in place of the five fixed height fields; a column's open space is the union of what lies above the ground and every layer whose ceiling is above its floor, a layer closes where its floor meets its ceiling and a layer thinner than a configurable minimum is dropped; the voxelizer and the passes read surfaces by index, and today's underground layer is one layer of the list.
- **Rules:** with one ground and one layer the voxels equal today's, which W1g proves; the minimum thickness and the blend width per surface are fields with today's values as defaults.
- **Regression contract:** the golden hashes hold; `HeightMaps` consumers in Meshing read the ground surface.
- **Done:** tests for the union of two layers, a closed layer, a dropped thin layer and the one-layer equality.

### W1a-3 Operators with influence bounds

- **Outcome:** every pass and content stage declares `InfluenceBounds` (the world-space radius of data it reads around a chunk and the surfaces it writes), the driver gathers a chunk's sites and segments from the declared bounds instead of its own margins, and the model can answer which operators touch a box.
- **Rules:** the shipped passes declare the margins the driver carried as literals (20 units for a site, the segment's half width plus blend plus 4) so the gathered sets are unchanged and the hashes hold.
- **Regression contract:** the golden hashes hold.
- **Done:** tests that a declared radius widens the gathered set, that the shipped defaults equal the old margins, and that the touching query answers from the bounds.

### W1a-4 Footprint sampling

- **Outcome:** `FractalNoise` and every surface sample take a footprint, the spacing at which the reader will use the answer; octaves whose wavelength the footprint cannot represent fade out with a weight that is continuous in the footprint, so a coarse reader sees the low-pass of what a fine reader sees and a renderer can blend between levels; a footprint of one keeps every octave.
- **Rules:** the fade is a parameter with a default; the chunk chain samples at footprint 1 and the hashes hold.
- **Regression contract:** the golden hashes hold; the per-column sample rate is measured for 262,144 points beside the earlier pitch's 8 ms.
- **Done:** tests for the weight continuity, the full sum at footprint 1, the low-pass at a coarse footprint, and the measurement in the report.

### W1a-5 Occupancy

- **Outcome:** `WorldModel.Classify(in Bounds)` answers `Occupancy.Empty`, `Solid` or `Mixed` for a box, conservative in both directions, from the surfaces' bounds over the box and the operators whose influence bounds touch it; it implements Core's `IOccupancySource`.
- **Rules:** never wrong in the conservative direction: a box that any surface could cross or any operator could touch is mixed.
- **Regression contract:** none beyond the step's.
- **Done:** tests for a box above every surface, a box below the ground, a box across the ground, a box a layer could open, and a custom source swapped in through Core's seam.

### W1a-6 Derived ids

- **Outcome:** a placement record carries the rule's id, the cell, the ordinal within the cell, the seed and a 64-bit id derived from them by Core's stable hash, so a placement's identity never depends on its position in a list; the content stages and the placement job write it.
- **Rules:** the id is deterministic per seed and definition and stable when another rule's output changes; the ordinal counts the same rule's earlier placements in the chunk's list, so removing one of those shifts the later ids of that rule; nothing else about a record changes.
- **Regression contract:** the golden hashes hold, the id excluded.
- **Done:** tests that two runs give equal ids, that a removed earlier placement leaves a later id unchanged, and that two rules never collide on a cell.

### W1a-7 The bridge-facing sampling entry

- **Outcome:** `WorldModel` implements Core's `ISurfaceSource` (a height and a class byte per sample over the request's grid at its footprint) and offers `ScheduleChunk(in ChunkRequest, ChunkProducts, JobHandle)`, the one entry a bridge calls to fill a chunk's columns and placements; `WorldForgeKit.Build(definition, seed, locations, lines, pipeline)` is the front door and the sample scene, once WorldForge ships one (a filed WorldForge story, Backlog), calls only it.
- **Rules:** a request naming a reference frame other than the world is refused, since the model is a height field over one frame's plane (as built: `WorldModel.TrySchedule` answers false, and Core's `ISurfaceSource.Schedule` throws because the seam carries no result form, raised against Core); the class byte is the biome's surface material.
- **Regression contract:** the golden hashes hold through the entry; a direct call and the seam give the same samples.
- **Done:** tests with a custom source beside the model's, the refused frame, and the seam compared with the direct call.

### UI7d-10 The material table inspector takes the look

- **Outcome:** `MaterialTableInspector` dresses its root with `EditorLook.Dress`, its status is a `HeaderBar` whose `State` is `passed` when the table is in sync, `error` with the count when it is not and `neutral` before a validation, and its problem rows carry the kit's classes with no colour of their own; the editor assembly and its tests compile against Core `dev` 70f6b4e.
- **Rules:** no stylesheet asset in GeoForge; the look is UI's or Unity's.
- **Regression contract:** the inspector's four tests pass with `State` in place of `Severity`; Sync and Validate behave as before; the two menu items stay.
- **Done:** the tests pass and the inspector is captured on both skins for the developer's page.

### The written result of step 18 (W1g, L7a, W1a, UI7d-10, 2026-10-29)

Built on this machine in two copies of the moved layout under `_probes` (`GeoForge18` from GeoForge `dev_1.0` decc9c2, `WorldForge18` from WorldForge `main` 62337c8), each driven by its own headless editor through the Unity command line against Core `dev` 70f6b4e, with Saboteer's floor record taken from the step 17 copy of Saboteer's `main` (428c857) and the bar run from PackageCheckDev. The session was led on Fable and finished on Opus 5.5. Every story's code, GeoForge's and WorldForge's, was drafted by Opus workers, and both cold reviews of the step ran on Opus, so neither was a review by another model; the developer chose not to add a Fable review inside the step. The cold review on Fable of 2026-11-05 (`Planning/PackageLine/Reviews/steps-15-4-and-18`) is that review, and its corrections to this record are marked below. GeoForge: 20 edit-mode and 3 play-mode tests passed. WorldForge: 193 edit-mode tests passed, the golden tests among them (134 before the world model stories, 124 of them from before the step). The two layout moves merged first, as GeoForge#113 (72a6f2a on `dev_1.0`) and WorldForge#3 (8e0f3eb on `main`); renormalising staged nothing in either repository, because every text file was already stored with LF.

**The golden hashes of today's world output (W1g).** WorldForge's reference world is built in code by `GoldenWorldFixture` (two strata, the surface one under rules with three wedges, a radial bias curve, a centre boost, a peak and wedge anchors; four surface biomes with object tables of two presets each and two deep biomes under cells; a planned camp and a scattered cairn; a route and a ring; the biome field, heightmap, underground, location, line, edge and candidate passes, with the placement job after the voxels), with every definition an in-memory instance whose hash is pinned to `StableHash.Fnv1A32` of its name, because a `HashedScriptableObject` restamps its hash from the asset GUID on every apply. `GoldenWorldChain` reproduces the system and the driver without Entities: the seeded layout, the plan, the driver's own site and segment filtering, the reset, the pipeline, the voxelise job and the placement job. The region is 48 chunks of 16 (x and z from -2 to 1, y from -1 to 1) plus two edge chunks straddling the falloff band of a world of radius 600. The record covers the plan, then each chunk's biome field, surfaces (the ground three times and the cave's ceiling and floor, the 20-byte column record of the day the hashes were taken), overrides, voxels and placements by preset hash and pose, in that order, through `Spellbound.Core.Testing.GoldenHash`; the hashes hold only with Burst-compiled jobs (a managed run differs), so the test asserts Burst is on, recorded with Burst 1.8.29 in its default float mode. The record is two hashes per seed: the region hash over the plan and the 48 region chunks, and the edge hash over the two edge chunks, appended in the same order and over the same bytes as the single hash the step took first (the two states appended reproduce it). The region hashes held through every story of the step. The edge hashes moved once, at W1a-2, for one reason: at the world edge the cave's ceiling sits above the ground the edge falloff lowered in some columns (312 in chunk (37, -1, 0), 133 to 142 in (0, -1, -37)), the old fill left a solid lid there, and the union rule opens those columns from the cave floor up. No region chunk has such a column; the smallest gap there is 11.5 voxels.

| Seed | Region hash (plan and 48 chunks) | Edge hash before W1a-2 | Edge hash after W1a-2 | Single hash the step took first | Placements |
|---|---|---|---|---|---|
| 42 | `0014b84ad333dda7` | `d3c967609181c617` | `1ae7b204affb024b` | `fde32f5fca3a6871` | 465 in 24 of 50 chunks |
| 7 | `99e97f43327e61a1` | `25aec6cc2053eb91` | `af4a78c665e1f2d9` | `7dbb472eb2393c55` | 491 in 18 |
| 123456789 | `703effb001edfadf` | `c94da6b4e57d05d8` | `acb49e8369792fc1` | `7c4484c740055a46` | 424 in 23 |
| 20261029 | `370d1568ca7acccd` | `4d7fba9e144c948e` | `5462b8e8b250615d` | `0f77de9d6158f086` | 419 in 18 |

**Today's Saboteer floor per seed (W1g).** Taken from a copy of Saboteer's `main` at 428c857 with nothing changed in it, in a batch editor without graphics with Burst's synchronous compilation on: the scene's `TerrainVolume` spawns 64 of the volume's 176 chunks (three regions read from `NetworkedScene.unity`: (-2, -1, -2) to (1, 1, 1), (-1, 2, -1) to (0, 4, 0) and (-1, 5, -1) to (0, 5, 0)), each 128 voxels at 0.5 units, filled by `SaboteurProcGenPipeline` (base fill, surface cap, thorium vein, the point-of-interest pool, shaft features, bedrock shell) through `VoxelGenerationPipeline.FillDataArray` in the volume's own x, y, z order. The hash is FNV-1a 64 over every chunk's voxel bytes in that order, the same bytes `GoldenHash` hashes, before the chunk engine's boundary overrides; the time is the sum of the 64 fills, ten builds after one warm-up, on the reference PC (AMD Ryzen 9 9950X3D, 63 GB). Every build of a seed gave the same hash. W10a's gate reads these.

| Seed | Floor hash | Median ms | Worst ms | Best ms | Warm-up ms |
|---|---|---:|---:|---:|---:|
| 1 | `99d3f059d6360545` | 2914.5 | 2958.3 | 2891.4 | 3257.5 |
| 7 | `84b676dd69a8196f` | 3088.7 | 3189.2 | 3080.1 | 3093.8 |
| 42 | `7397e1aa665e8c8b` | 3077.0 | 3096.0 | 3058.5 | 3085.4 |
| 1337 | `263a03f71d1ba66c` | 2898.8 | 2916.0 | 2884.4 | 2883.2 |
| 123456789 | `66ec5f0748e4e50d` | 3012.3 | 3161.9 | 2987.7 | 2999.3 |

The raw files are under `_probes/Step18` on the reference PC (`floor-record.md`, `golden-worldforge.md`, `FloorRecord.cs`, `w1a1-notes.md` with every decision of the world model stories).

| Question the step settled | Result |
|---|---|
| Whether `Spellbound.Core.Testing` reaches a consuming package's tests | Not from the package cache: its assembly is constrained on `UNITY_INCLUDE_TESTS`, which Unity sets only for packages listed under `testables`, so WorldForge's dev project lists Core there and Core's own tests compile and run in it too (raised against Core) |
| Whether the golden hashes depend on Burst | Yes: the same chain run with managed jobs gives different plan and chunk hashes for seed 42, so the golden test asserts Burst compilation is on and the fixture forces it synchronous |
| Whether a hashed definition can be a temporary asset in a golden test | No: `HashedScriptableObject.Restamp` rewrites the hash from the asset GUID on every serialized apply, so the fixture pins hashes on in-memory instances |
| Whether UI's look can be shown on GeoForge's inspector in a project on Core `dev` head | Not yet: UI `beta` (ab1b53a) compiles against Core fc4d288 and not against 70f6b4e, whose doors take the observation context, so the capture ran with Core at fc4d288 and UI installed, then the copy returned to 70f6b4e without UI (raised against UI) |
| Whether GeoForge's console helper still needs its scoped sink | No: Core keeps one `UnityConsoleSink` registered outside play mode since step 17, so the scoped sink logged every problem twice and is gone |
| Whether a sparse chunk can answer the surface case without unpacking | Yes: the engine reads the cell's eight corners through the chunk's own voxel lookup, which binary-searches the sparse data, so a query costs eight lookups and checks out no dense array |
| What the bar said before and after | GeoForge before (from PackageCheckDev, outside the project): 12 must fix, 3 to confirm, 15 passed, 4 not applicable, 5 not run. After, inside the project with the studio values: 0 must fix, 3 to confirm, 6 waived, 28 passed, 2 not applicable; from PackageCheckDev: 0 must fix, 3 to confirm, 6 waived, 26 passed, 2 not run. WorldForge before: 9 must fix, 4 to confirm, 16 passed, 4 not applicable, 6 not run; after: 8 must fix (V1 passed, the changelog exists), 2 to confirm (C10 leads, V4), 20 passed, 4 not applicable, 5 not run; C8 passed, no mutable static is left. WorldForge adopts the bar at its own step |
| Whether the union rule reproduces today's voxels | Everywhere but the world edge: the old fill was the union rule for every column whose layers sit below the ground, and the one-layer equality test proves the formulas; at the edge the old fill's solid lid between the cave and the lowered ground was an artefact of the pass order (UnderDark places the cave from the ground before the edge falloff lowers it), so the edge hashes moved and the record carries both |
| Whether a pass can bound its own writes from its arithmetic | Not alone: UnderDark, the location, line and edge passes write from the ground they are given, and the location and line passes need the plan's sites, so the hook folds in place over the bounds so far with the plan's sites and segments in its context (`WriteBounds(in SurfaceBoundsContext, SurfaceBounds)`), and the model gathers them for the box as it does for a chunk |
| What bounds Unity's `noise.cnoise` | 1.571 in magnitude (2.3 times a gradient length of at most 0.966 times a fade-weighted offset sum of at most 0.7071), carried as 1.6 and checked over 160,000 samples |
| What the per-column sample rate is at footprint 1 | 512 by 512 positions through `WorldSampleJob` with Burst: 11.0, 11.1 and 9.6 ms over three runs (24 to 27 million samples a second) beside the earlier pitch's 8 ms |
| Whether the footprint weight can move a voxel hash | No: at footprint 1 every octave's weight is exactly 1 (`saturate(2 - 2 / max(wavelength, 2))` with a wavelength of at least 2 gives 1 before any rounding), so the region hashes held |
| Whether Burst serves stale native code after a failed compile | Yes: after a compile round that fails in the test assembly Burst kept the old compiled jobs through a clean rebuild; `BurstCompiler.SendCommandToCompiler("$dirty_all_assemblies")` and a recompile cleared it (recipe in `_probes/Step18/w1a1-notes.md`) |

Facts the step changed: GeoForge's `SimpleVolume.prefab` stored its values under field names `GeoVolume` no longer read, so the shipped sample volume switched itself off before this step; the values are stored under the current names now. The nested GeoForge checkout sat on the story branch of step 14 whose tree differed from the merged `dev_1.0` in 21 files, so the step built from the remote head. Settings taken are listed in the pull requests. Raised: see the GeoForge pull request. The developer judged GeoForge's inspector on the look by eye and signed it off. The developer also took two decisions as recommended: the edge hashes move under the union rule, and the occupancy hook folds in place with the plan's sites in its context. Two story lines were not built as written and now read as built above: W1a-1's registries were deleted and the model takes the location and line lists, which meets the story's intent and needs no story; W1a-7's sample scene does not exist because the package ships none, which the filed WorldForge story covers. Not run: the 6000.3 floor row; the look inside a live Inspector window, which a batch editor cannot open (the inspector's root was hosted in a window for the capture).

**Corrections from the cold review of 2026-11-05.** GeoForge#120's Facts row says that a `[Serializable]` field typed `HashedScriptableObject` accepts an `ObjectPreset` in the inspector was confirmed; it was not tried (WorldForge#12 says read in the code, the batch editor opened no Inspector, and no test references `ObjectPreset`), so the fact stays under verify before building on it. GeoForge#120 says the sample assemblies' missing Core constraint is waived with I5; I5 waives the sample names, and no waiver covers the constraint, which is a filed GeoForge story. GeoForge#120's 'no runtime type, serialized field or script GUID changed' holds for Saboteer's material tables only; the pull request deletes four types with their script GUIDs. GeoForge#113 and WorldForge#3 say the moved files sat under `Assets/<Package>`; they sat at the repository root. WorldForge#12 says the chunk generator owns corner weights it is given and tells Corsairs to copy them; the generator's constructor takes none and the model builds its own, as the changelog says. The golden-hash record is accurate: the eight values in `GoldenWorldHashes.cs` equal the region and after-W1a-2 cells of the table, and the before-W1a-2 and single hashes are the record's alone; the hashes cover the passes and the placement job, not the content stampers, and the W1g test runs through the model's `ScheduleChunk` and `StampChunk`, which the driver also calls. The review's page and evidence are under `Planning/PackageLine/Reviews/steps-15-4-and-18`; its findings are filed as stories in each repository under the step's epics.

