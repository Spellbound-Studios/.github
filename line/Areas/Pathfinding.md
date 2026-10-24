# Checkpoint 2 revisited, area 9: Pathfinding (2026-10-23, revised 2026-10-24)

Revision note, checkpoint 5, the hand-off (2026-10-24): the developer's 25 answers to the checkpoint 4 questions folded in one pass; nothing decided is reopened. (1) Ships and moving decks (N6) leave the backlog and are built after the Corsairs milestone and before Corsairs Isle launches, beside N2 to N5 and N9 (answer 21); Corsairs launches complete, so the epic table, section 8 and the text on what Corsairs plays without Navigation say so, and the backlog row for N6 is gone. (2) The gym walk-through skips its `navigation` lines until Navigation lands, and the report's `checks:` line has no Navigation entry until then (answer 20). (3) The unreachable-ore check lives in `Spellbound.Navigation.Places.Editor`, a Places-gated editor assembly beside the Places bridge (answer 22); its registered name is `navigation.reachable-deposits` and it does not run while a designer edits. (4) `ReachableDepositsCheck` implements `IDefinitionCheck<PlaceDefinition>` (answer 14) and every drawn line is respelled; the report's checks line reads `<name> (<Package>)` with the type's own validation first. (5) N6 is written as a path across a `ReferenceFrame`. (6) The follower's step names the two cadences in one sentence (answer 8). Open decisions: none. Epics: 67 stories, unchanged in size; N6's placement moved. Claims on this area answered in section 16 (four, from commandline, world and ui; all accepted, no epic changed).

Revision note, checkpoint 4 claims round (2026-10-24): seven claims answered in section 15. The check is internal with no door and has an assembly of its own (`Navigation.Places.Editor`, decided 2026-10-24); the loaded event names the place and its world instance; `RegionRows` is `PartitionRows`, and a door's state is read from its row for sleeping instances too. Epics unchanged.

Revision note, checkpoint 4 (2026-10-24): the developer's answers of 2026-10-24 folded in one pass; nothing decided is reopened. (1) Navigation ships before Corsairs Isle launches and after the "Corsairs on the line" milestone (question 29, section 9 "Decided"): N1, the spike, runs in the spike window and may run earlier; N2 to N5 and N9 (46 stories) are placed after that milestone and before any launch; section 8 says what Corsairs plays without Navigation at its milestone. (2) The check seam (question 11): `ReachableDepositsCheck` over `PlaceDefinition` is the worked example (section 3; its assembly is `Navigation.Places.Editor`, decided 2026-10-24), in area 2's report format with `failed` as the status word; it replaces the check that sat in `Navigation.Places` and adds one story to N5 (67 stories in all, N5 at 9). (3) The thing that moves and carries others is a reference frame everywhere here (`ReferenceFrame`, the field's reference frame); a gym character is a playable character of the game. (4) From RedTeam 7.7: a stable name for the spawned body is Studio.Content's and the place-loaded event is World's; both stay claims. (5) Nothing here assumes who is authoritative: the follower and the crowd advance in the world instance's own step wherever the game simulates the creature (owner, host or server, set per replicated thing in Networking with no default), and Navigation replicates nothing. (6) Nothing is pinned: the GeoForge version number is gone from N1; the package folder is `Packages/Navigation`. (7) The old open decision is decided and moved; the three decisions that followed from it are decided at checkpoint 5 (section 9). The self red team of this pass is in section 12, "Checkpoint 4".

Revision note, claims pass (2026-10-23): seven claims answered in section 14. The grammar was already applied and is re-checked (an `explain` query in the scenario is now `why`); the footprint fit is an operation, `navigation fit-footprint`, returning a ValidationReport (amended: it applies to a subject by what the subject carries, not by a piece-kind name); the reachability check is one public call in Runtime that Places and WorldForge both use (amended: Places does not host it); N1's go or no-go is a Decision issue that blocks N2; N9 carries its dependencies. Nothing contradicts the amended line.

Revision note, checkpoint 3 (2026-10-23): the developer's review applied in one pass. Decisions 1 to 3 are settled and moved to "Decided" (section 9). Every compatibility sentence is gone: profiles and footprints carry no version field and no migration, a changed asset is re-authored. Operations are spelled in area 2's grammar (`spellbound_run`, `navigation <operation>`, `NavigationKit` as the front door, status word first; `explain` is `why`, asset validation is `core validate`). The limits say Unity's NavMesh is the fallback for walkers only and say what is left for the spike. The epic table carries dependencies by area key and the review's effect on each epic (none added or removed). One new question for the developer, on where Navigation sits against the two game milestones. Floor 6000.3, with Burst, Collections and Mathematics as declared packages; the package at `Packages/Navigation` in its dev project after the probe.

Revision note, checkpoint 3 reader round (2026-10-23): the reach family now has one stated shape. `--profile` is optional when the field has a default profile and otherwise refused with the known profiles listed; `--from` and `--to` take a position or a reference to a scene object through a point parser Navigation owns; the field a gym needs is built by `Navigation.Places` when the place loads, and the operations find it through `NavigationKit.Fields`. Nothing in Navigation binds a name such as `player`. Finding 30 in section 12.

Owner of this file: the area 9 session. Binding inputs: `Requirements.md`, `Rules.md`, the library-design skill, `Corrections.md`, the approved `Revisited/Line.md` and `Revisited/Homes.md`. Everything that exists today is the Before. Revision 4's `Pathfinding.md` was opened only after sections 1 to 10 were written (section 11).

How the survey was done: I read the code myself (GeoForge, Core's `ObjectPreset`, both games, the package manifests) and Unity's AI Navigation 2.0 manual pages. No subagent tool existed in this run, so no Sonnet reader returned facts, and the red team in section 12 is a self red team, one lens per pass, run by me. The orchestrator is told so.

Naming. The Line names the package Navigation: "finds paths for any mover through any space described to it" (decision 2 adds: and moves it along them without stacking). I keep that name. Nouns I introduce are defined at first use and listed in section 3.

## 1. The scenario, walked

The scenario: in one Corsairs Isle world a humanoid walks the ground, a spider crawls on a cave ceiling, a bird flies over the terrain, a sand worm burrows through it; a raider walks into a base through its open front door, and a moat keeps raiders out at every level of detail.

Setup the game writes once: one navigation field for the world (a field is Navigation's picture of one world instance in one reference frame, the thing that moves and carries others, a ship deck for example; Core's noun), one source that reads GeoForge's voxels, one footprint module on every preset that is built or planted, and four movement profile assets.

| Step | What happens under the design | Where the cost is stated |
|---|---|---|
| 1. Humanoid walks the ground | The humanoid profile allows the Surface class (cells the terrain surface passes through) with a 45 degree cone around up. A* runs over those cells, 26 neighbours, cost per cell from the profile's tag table. The path comes back as waypoints with a position and an up vector each | Tile build and nodes per query are observations with budgets (section 8, N2) |
| 2. Spider crawls a cave ceiling | Same class, no cone, so ceiling cells (normal pointing down) are nodes. A step between two cells needs their normals within the profile's turn limit, which is how the path goes wall to ceiling. Clearance is open cells along the cell's own normal. Waypoints carry the normal so the body can orient | Same machinery as step 1; nothing extra is stored |
| 3. Bird flies over terrain | The bird profile allows the Open class (cells whose eight corners are all empty). Tiles that are entirely open are single nodes, so a long flight crosses few nodes. Walls, columns and ground are blockers because they are not Open | Uniform tiles cost no storage (section 3, how the field is stored) |
| 4. Sand worm burrows | The worm profile allows the Solid class (all eight corners full) restricted to the tags it can eat through (sand yes, bedrock no). It enters from a Surface cell and leaves through one, each crossing priced by the profile's transition table | Burrow cells come from the same samples; tags come from GeoForge's material index through a table asset |
| 5. Raider enters through the open door | The door preset carries a footprint: wall shapes that block, and a portal (a link between an outside point and an inside point) with named states. State Open is a free link; the path goes terrain, portal, built floor, target | The built level exists only under footprints (arithmetic in section 3) |
| 6. Door closed | The portal state Closed is a link with a price the owner sets (from the door's health, say). A profile that may pay prices of that tag takes it; one that may not gets no path. The path's Link waypoint carries the price and names the footprint; whether to attack is the creature's decision, not Navigation's | The cost is a number the owner updates, not a simulation |
| 7. Moat | A trench the walker's cone forbids (or a water tag its profile forbids) cuts the ground into two components. A reach query answers in constant time from component labels, with no flood fill. A `why` query names the boundary: "12 cells of tag Water between" | Labels are rebuilt per dirty tile |
| 8. At every level of detail | Navigation reads voxels, never meshes, and GeoForge keeps the finest voxels of every loaded chunk (section 2). The test matrix runs the moat scenario with the volume configured at 1 to 5 levels of detail and the camera at every range, and requires identical answers | Test matrix in N3 |
| 9. A player fills the moat | The GeoForge bridge reports changed voxel bounds; dirty tiles rebuild; labels merge; `IsPathValid` on an old path answers false for paths that crossed the change and true for the rest | Rebuild time per frame is an observation with a budget |
| 10. Forty raiders reach the door | One `Distances` search from the door's inside point. Each raider's `PathFollower` reads the gradient and `ILocalAvoidance` turns its desired move into one that leaves room for the neighbours registered in the field's crowd. The portal's width is the throughput limit, and the raiders queue at it instead of stacking | Neighbour query and avoidance cost are observations with budgets; the N9 test counts overlapping bodies and arrivals |

The area 1 scenario, as it applies here. A new engineer is asked six questions about pathfinding and answers from the line's map without asking anyone:

| Question | Answer | Why |
|---|---|---|
| Where does "spiders crawl on ceilings" go? | A `MovementProfile` asset in the game; the sample ships one as an example | A value of a type Navigation owns |
| Where does "the door is open" live? | WorldObjects instance data, saved by Persistence | Navigation reads it through the footprint state, never stores it |
| Where does "the raider attacks the door instead of walking round" go? | The creature's logic in the game, or Studio when two games share it | Navigation returns a Link waypoint with a price, no decision |
| Where does the water in the moat come from? | Whoever owns water (a game, a Places layer, WorldForge's rivers) as a tag volume | Navigation only knows the tag |
| Where does the code that moves the creature along the path go? | Navigation: `PathFollower` and local avoidance produce a desired move and a desired up, and the creature applies them (`Navigation.Character` does so for Character.Body) | A stranger's herd and the underwater swimmers need it; what a creature does at a Link stays theirs |
| Where does "is this voxel solid" live? | GeoForge. Navigation keeps derived tiles and never writes back | One source of truth per concept |

## 2. Before, faithfully

Pathfinding does not exist anywhere in the line today.

- A search of every `.cs`, `.asmdef` and manifest in `CorsairsIsleDev`, `SaboteurDev`, `CoreDev`, `WorldForgeDev`, `GeoForgeProDev` and `ControllerDev` for `NavMesh`, `Pathfind`, `AStar`, `NavigationSurface` and `NavMeshAgent` returns no code hit.
- `SaboteurDev/Packages/manifest.json` lists `com.unity.ai.navigation` 2.0.12. No `.unity` or `.prefab` in either game references `NavMeshSurface`, `NavMeshAgent` or `NavMeshLink`. It is installed and unused.
- Neither game has base building code: a search for building and placement terms in both games' `_Project` finds only unrelated matches (mastery UI, a hotbar, rope code, point of interest export). There is no Before for built things beyond the object preset below.

What exists that the design builds on, all read in source:

| Fact | Where |
|---|---|
| A voxel is `sbyte Density` plus `byte MaterialIndex`; solid means density at least zero | `GeoForge/Runtime/Scripts/DataTypes/VoxelData.cs:19-20`; `MarchJobs/GfMarchHelper.cs:85-92` |
| The marching case code is eight sign bits gathered from the cell's corners | `GfMarchHelper.cs:66-92` |
| The march reads corners at a stride of `1 << Lod`, so a feature narrower than the stride can fall between samples and vanish from a coarse mesh | `MarchJobs/MarchingCubeJob.cs:75,103` |
| Which level of detail a node uses depends on its distance to the volume's `LodTarget`, a camera by default; with no camera the property logs an error and returns null | `Chunks/OctreeNode.cs:289-298`; `Volumes/GeoVolume.cs` (`LodTarget` getter) |
| Every chunk keeps full-resolution voxels in run-length form (`NativeList<SparseVoxelData>`), whatever level of detail its mesh uses; the list is reachable through a public method | `Chunks/GeoChunkEngine.cs:44,294` |
| A single voxel read is a binary search over the runs; dense arrays come from a small pool of slots | `GeoChunkEngine.cs:335`; `Manager/GeoForgeManager.DenseCache.cs:14-25` |
| A chunk records whether all its densities are on one side of zero, so a uniform chunk is known without reading it | `DataTypes/DensityRange.cs`; used at `Chunks/OctreeNode.cs:213` |
| Edits notify through a per-store event with chunk-local indices; the store shipped is documented as "for samples and small projects" | `Edits/IGeoEditStore.cs:12`; `Edits/GeoEditStore.cs:9,19` |
| Terrain queries return one voxel or one surface material at a world position | `Volumes/GeoVolumeEngine.cs:91,121` |
| Corsairs' terrain volume: chunk 128 voxels, 1 voxel per metre, leaf 16, four levels of detail, so strides of 1, 2, 4 and 8 metres | `CorsairsIsleDev/.../VoxelVolumeConfigs/CorsairsIsleTerrain.asset` |
| Corsairs also configures `Moon` and `Moonlet` volumes, so a radial up exists in the games already | same folder |
| An object preset is a ScriptableObject with a bake prefab, an event surface prefab and a list of surfaces, each a bag of `PresetModule` subclasses held by `SerializeReference` | `CoreDev/Assets/Core/Runtime/Objects/ObjectPreset.cs:20-27`; `PresetSurface.cs:15` |

What Unity ships, from its manual (AI Navigation 2.0 package pages, version 2.0.16): agents are cylinders; a NavMesh stores walkable surfaces as convex polygons built by voxelising the scene; pathfinding is A* over polygons; links connect gaps and open doors, with a width, a cost override and an Activated switch; obstacles cut holes by carving; `NavMeshBuilder.UpdateNavMeshDataAsync` updates a NavMesh incrementally from a list of sources (mesh, terrain, box, sphere, capsule), and at runtime a mesh without read/write access is skipped. The pages say nothing of volumes, ceilings, flying or burrowing agents. I take that as "undocumented", not "impossible".

Valheim and 7 Days to Die. My own first search found only community pages (wikis and forum threads that give approximate costs and cannot be verified), so I relied on none of them for the draft. After the draft, revision 4 pointed me at two decompiled repositories, and I checked the claims I use against those sources through the GitHub API (section 11):

- 7 Days to Die (`HuitDR/AssemblyCSharp`): the path graph is a grid recalculated per (x, z) column when blocks change (`AstarVoxelGrid.cs`, `RecalculateCell(int x, int z, ...)` at line 755), not a marching cubes graph. Nodes carry a tag (`cTagOpen` 0, `cTagBreak` 1, `cTagLowHeight` 2, `cTagDoor` 3, `cTagLadder` 4, lines 378-386), a path may use only the tags its entity enables (`TraversalProvider.cs`: `(path.enabledTags >> (int)node.Tag) & 1`), and the penalty of a solid block is its health scaled, `(health + 10) * 20` (constants at lines 371 and 374, use at lines 829-886). Breaking is therefore a price on the same graph.
- Valheim (`m3talstorm/valhiem_server`): Unity NavMesh built at runtime in tiles of 32 units (`Pathfinding.cs:672`), tiles stitched by `NavMesh.AddLink` at cost 10 (`:678`, `:544-549`), water an area at cost 4 (`:676`), eleven agent types (`:731-743`); `BaseAI.cs` has no door logic.

Both repositories are decompiled by third parties and are evidence of how the games work, not of what they ship today.

## 3. After

### The design in one paragraph

Navigation reads samples (a signed density and a tag byte per voxel) from any source, keeps its own derived tiles of occupancy bits, and classifies each cell Open, Surface or Solid from its eight corner signs. A movement profile is an asset that says which classes a mover uses, in what orientation, how big it is and what each tag costs. Built things bring a footprint: blockers, tag volumes and portals with named states. Searches run on an implicit graph over tiles, with component labels for instant reachability and a hierarchy that is sound by construction. A follower, a crowd registry and a replaceable avoidance policy then move bodies along a path or a flow field without stacking them.

### The parts

| Part | What it is | Layer |
|---|---|---|
| `NavigationSample` | `sbyte Density`, `byte Tag`. The only thing a source must produce | Primitive |
| `CellClass` | Open, Surface, Solid: the three outcomes of splitting eight corners by sign. A fact about a partition, not a game word | Primitive |
| `NavigationTagSet` | A ScriptableObject naming tag ids (Ground, Sand, Water, DoorWood) | Primitive |
| `MovementProfile` | A ScriptableObject that implements Core's `IAuthoredDefinition` (so `core validate` and `core preview` serve it, with no format version and no migration step): allowed classes, cone and turn limit per class, radius and height, step and drop limits, the tags it may rest on or float on, tag cost table (including "forbidden" and "may pay a link price"), class transition costs | Primitive (data) |
| `INavigationSpaceSource` | `ReadSamples(box, stride, buffer)` returning a coverage (Full or Absent) for the box, a version per region, a changed-region event. Solid means density zero or more, GeoForge's convention. Implemented by the GeoForge bridge, a sparse voxel asset, a grid and a heightfield | Policy |
| `NavigationFootprint` | A ScriptableObject that implements `IAuthoredDefinition` like the profile: shapes (box, ramp, cylinder, capsule line) each with occupancy, tag, priority and the states it is active in; portals (two points, width, height, states); named states | Primitive (data) |
| `NavigationField` | One world instance in one reference frame: sources, footprints, derived tiles, labels, versions, a byte budget for tiles | Operations |
| `NavigationFieldBehaviour`, `NavigationFootprintComponent`, `NavigationTagVolumeComponent` | Scene front door: a MonoBehaviour that owns a field, and components that register a footprint or a tag volume with a field they reference explicitly (no singleton lookup), so a game without WorldObjects places footprints in a scene | Front door |
| `NavigationKit` | The front door: creates a field, attaches sources and footprints, and holds each operation as a public method that is also a line of text (`navigation path`, `reach`, `why`, `field`, `probe`, `fit-footprint`), and the two checks below | Front door |
| `NavigationPoint` | The type of a `--from` or `--to` argument, with its parser (an `[ArgumentParser]` class, found the way Core finds every parser). It reads `x,y,z`, or any reference Core's reference form resolves to a scene object (`scene:/Path/To`, or a name a game binds), and takes that object's position. Navigation binds no name itself | Primitive |
| `FitFootprint`, `CheckReachability` | Checks that return Core's `ValidationReport`, the report area 2 prints. `FitFootprint(asset)` tests a footprint, or a prefab or model that carries one, against the field's cell sizes: shapes and portal ends land on the ground cell or its refined cell, and every portal meets a walkable cell within one cell on both sides for a named profile. `CheckReachability(field, profile, from, targets)` reports each target the profile cannot reach and names the blocker (the `why` data). Each finding has a code Navigation owns, a subject (the asset path) and a location (the shape or portal). Neither needs a play-mode world: the first builds a field from the footprint alone | Operations |
| `ReachableDepositsCheck` | The worked example of the check seam (section 3, "The check seam, worked"): an `internal` `IDefinitionCheck<PlaceDefinition>` with no door, marked `[RegisteredDefinitionCheck]`, in the editor half of the Places bridge (`Spellbound.Navigation.Places.Editor`, compiled only when Places is installed; decided 2026-10-24), that builds an edit-mode field from the place through `Navigation.Places`, calls `CheckReachability` for the profile named in the place's rules, and adds one error finding per unreachable deposit and one preview line; registered as `navigation.reachable-deposits` and not run while a designer edits it (it builds a field). Places never learns Navigation's name | Policy (editor) |
| `FindPath`, `Reachable`, `Explain`, `Distances`, `LineOfSight`, `IsPathValid` | Queries on a field. Burst jobs, time sliced, with a node budget. A request is a struct handle over native storage: no managed allocation on the success path | Front door |
| `IPathAdmission` | What happens when requests exceed the budget: the default orders by priority then age and fails the oldest beyond a depth with reason Busy | Policy |
| `NavigationPath` | Waypoints: position, up, kind (Step inside a class, Transition between classes, Link through a footprint), a tag (which link or transition target), a price paid there, and the footprint id for a Link. Breach, ladder and teleport are tags and prices, not new kinds | Primitive |
| `INavigationCostLayer` | Optional managed layer that fills a tile-sized cost array (fire, a faction's territory) | Policy |
| `PathFollower` | A struct over a `NavigationPath` or a `Distances` field: given a body's position, up and radius it returns a desired move, a desired up, whether it arrived, whether the path went stale (`IsPathValid`) and, at a Link waypoint, a stop with the link's price for the owner to decide. It moves nothing | Operations |
| `NavigationCrowd` | The field's registry of moving bodies (position, radius, velocity, profile) over a native grid, queried for neighbours. Bodies register themselves; the field never finds them | Operations |
| `ILocalAvoidance` | Turns a desired move and the neighbours into a move that leaves room. Default implementation picked by measurement in N9; works in the tangent plane for Surface movers and in three dimensions for Open and Solid movers, using the field's up | Policy |

### How the field is stored

- **Tiles.** Occupancy is one bit per voxel corner in 16 by 16 by 16 cell tiles with a one-corner border: 17 cubed is 4,913 bits, 615 bytes (arithmetic). A tile that is all open or all solid stores one flag and no bits. GeoForge's chunk-level `DensityRange` already says this for a whole chunk (`DensityRange.cs`).
- **A 128-voxel Corsairs chunk** holds 512 tiles. A terrain surface crosses roughly one or two tiles in each of 64 columns, so 64 to 128 stored tiles, 39 to 79 kilobytes, against a dense voxel array of 131 cubed times 2 bytes, about 4.5 megabytes (arithmetic; the shell count is an assumption the first spike measures). A 512 by 512 metre window is about 0.6 to 1.3 megabytes of occupancy.
- **Clearance** is a dilation of the occupancy by the mover's capsule, done with bit shifts once per distinct size and shared by every profile of that size. Profiles do not each copy the world.
- **Normals** come from the density gradient across the cell, as the mesh normals do, so the slope a creature is allowed matches the slope the player sees at the finest level of detail.
- **Level of detail.** The tiles are built from the finest voxels. Coarser tile levels are derived with one rule: a coarse cell is blocked if any child is blocked, open only if all children are open, and a mixed one is refined. A moat therefore cannot vanish by being averaged away.
- **The resolution ladder.** The ground level has the source's cell size (1 metre for Corsairs' terrain). A door is narrower than that and a floorboard thinner. So footprints bring refined levels (default a quarter of the ground cell, a field setting) that exist only inside their bounds, where terrain is resampled from the density by trilinear interpolation and shapes are rasterised conservatively. A profile uses the coarsest level whose cell its radius allows: a bird uses the ground level, a humanoid the fine one under a roof. The coarse levels receive the same shapes rasterised conservatively, so a wall still blocks a bird and a column still blocks a walker that stays on the ground level. A built volume of 20 by 20 by 10 metres at 0.25 metre cells is 256,000 cells, 32 kilobytes of bits (arithmetic).
- **Portals are links, not holes.** A doorway is always modelled as a link between two named points with a width and a height, never as a gap in the raster, so a misaligned door can never be rasterised shut. The wall around it is solid.

### How the search runs

1. Find the start and goal cells (nearest valid node within a profile limit). A region whose source reports Absent is blocked until N7 turns Absent into a plan.
2. Look up their component labels. Different labels: return a failure at once, with the explanation data. Labels are union-find over tile portals, rebuilt per dirty tile, shared by profiles with the same classes, cone and clearance.
3. Search the abstract graph first (tile portals for Surface, a free-space octree of uniform tiles for Open, solid components for Solid), then refine only the corridor to cells. Every abstract edge exists only if a fine path exists inside its tiles, so a coarse path is always realisable (soundness), and a property test says so.
4. Smooth with line-of-sight over the bit tiles (a grid walk), which the same tiles answer for AI vision as `LineOfSight`.
5. `Distances(goal)` runs the search once from the goal and lets every follower read the gradient, which is how a raid of forty raiders costs one search.

### How a body follows

The field answers where to go; the follower turns that into a desired move each tick; avoidance adjusts it for neighbours; the body applies the result. Each step is its own type, so a game replaces one without the others. `Navigation.Character` applies the result to Character.Body's input seam (a desired move and a desired up); a body without Character (an animal moved by its transform, a swimmer on a rigidbody) applies the same two values itself. The crowd and the follower hold no creature words. They advance in the world instance's own step, wherever the game simulates the creature (the owner, the host or the server: a setting of the replicated thing in Networking, with no default), and replicate nothing. The tick rate and the physics fixed step are settings read once, two cadences that start at 20 and 50 a second, and nothing in Navigation is derived from either, so changing one changes no code here.

### The calling code

Before, with Unity's tool, for the one kind of mover it documents (a walker on a baked surface):

```csharp
agent.SetDestination(target);
```

After, in the game, the whole scenario's wiring and one spider query:

```csharp
var field = NavigationKit.CreateField(worldReferenceFrame);
field.AddSource(new GeoForgeSpaceSource(terrainVolume));
field.FollowWorldObjects(worldInstance);

var spider = field.Resolve(spiderProfile);
var request = field.FindPath(spider, spiderPosition, orePosition);

if (request.IsComplete && request.TryGetPath(out var path)) {
    for (var index = 0; index < path.Count; index++) {
        steering.Aim(path[index].Position, path[index].Up);
    }
}
else if (request.IsComplete) {
    Log.Info(request.Failure.Describe());
}
```

The door's owner, in a module on the door preset:

```csharp
var open = footprint.StateIndex("Open");
var closed = footprint.StateIndex("Closed");

handle.SetState(isOpen ? open : closed);
handle.SetLinkPrice(health * pricePerHealth);
```

A water volume from whoever owns the water:

```csharp
field.AddTagVolume(tags.Id("Water"), moatShape, priority: 10);
```

A raid of forty, per tick, in the game:

```csharp
var toDoor = field.Distances(raider, doorInside);

foreach (var body in raiders) {
    var step = body.Follower.Advance(toDoor, body.Position, body.Up, body.Radius);
    var move = avoidance.Adjust(step.DesiredMove, crowd.Neighbours(body.Id));
    body.Apply(move, step.DesiredUp);
}
```

The same capability from the command line, in area 2's grammar (one Pipeline command, a line of `<group> <operation> [arguments]`, the result starts with its status word):

```
$ unity command spellbound_run --line "navigation reach --profile Humanoid --from 412,18,-77 --to 430,18,-70"
succeeded: blocked at 418,16,-74 (component 31 to 7)

$ unity command spellbound_run --line "navigation why --profile Humanoid --from 412,18,-77 --to 430,18,-70"
succeeded: blocked by tag Water, 12 cells wide, between 418,16,-74 and 424,16,-72

$ unity command spellbound_run --line "navigation path --profile Spider --from 90,4,12 --to 96,9,14"
succeeded: reachable, 38 waypoints, length 21.4 m, Step 36, Link 2 (Door_03 price 120, Ladder_01 price 0), reference frame world

$ unity command spellbound_run --line "navigation fit-footprint --asset Assets/Pieces/Door_03.prefab --profile Humanoid"
failed: 1 error, 1 warning
navigation.portal-no-floor  error  Assets/Pieces/Door_03.prefab  portal Front: no walkable cell within 1 cell of the outside point (Humanoid)
navigation.shape-off-grid  warning  Assets/Pieces/Door_03.prefab  shape Casing: edge at 0.13 m is not on the 0.25 m cell
```

The arguments of `reach`, `why` and `path` are one shape:

| Argument | Meaning | When missing |
|---|---|---|
| `--profile <asset>` | A movement profile, by name or path | The field's default profile (a field setting; `Navigation.Places` sets it from the place's rules). With no default: `invalid: --profile is required; known: Humanoid, Spider` |
| `--from`, `--to` | A `NavigationPoint`: `x,y,z` or a scene reference such as `scene:/Prospector` | `invalid`, naming the argument |
| `--field <id>` | One field, by the id `navigation field` lists | The only live field. Two or more: `invalid: 2 fields, name one: world, ship-deck`. None: `refused: no navigation field; a place builds one when it loads, or add NavigationFieldBehaviour to a scene` |

Operations find fields through `NavigationKit.Fields`, the live fields that register on enable and leave on disable. When the tiles a query needs are not built yet, the operation is asynchronous (a `Task` the host awaits, as `places gym-start` is) and completes with the answer. In a gym, `Navigation.Places` creates the `NavigationFieldBehaviour` when Places' loaded event (it names the place and its world instance) arrives, with a GeoForge source over the place's volume, the place's tag volumes and the place's profile as the default. So the gym line is `navigation reach --from scene:/Prospector --to 14.2,4,3.1`; the body is a playable character of the game, and its name is the one the gym's character profile gives the spawned object (Studio.Content's profile offers the studio's playable characters; a game's own wins), or the buyer's own prefab name, and a buyer who binds `player` in Core can write that instead. Until Navigation lands, area 2's walk-through of the gym carries no `navigation` line, and the report's `checks:` line has no Navigation entry, which is how the report shows the check did not run (decided 2026-10-24). The gym itself (world's W4c) follows Saboteer's milestone, and the deposit check that world's W9b calls waits on W4c as well as on N4 and N5; that order is world's, and nothing here depends on it.

A validation that finds an error starts `failed:`, as area 2's grammar says, so a script or CI step stops on it. A subject that carries no footprint answers `succeeded: no footprint on Assets/Pieces/Rock_02.prefab`, which is how Navigation says what it applies to.

### The check seam, worked

Core.Editor holds one interface and one attribute and the lines that find and run registered checks; Navigation ships its own check in its own assembly, and Core never changes for it. Drawn from area 2's spelling of the seam (decided 2026-10-24: the interface is `IDefinitionCheck<T>`, the attribute `RegisteredDefinitionCheck`; the example is drawn and unrun):

```csharp
[RegisteredDefinitionCheck("navigation.reachable-deposits")]
internal sealed class ReachableDepositsCheck : IDefinitionCheck<PlaceDefinition> {
    public void Check(PlaceDefinition definition, ValidationReport report) {
        var field = PlaceFields.BuildForEditing(definition);
        var profile = definition.Rules.DefaultMovementProfile;

        foreach (var layer in definition.HarvestableLayers) {
            var unreachable = NavigationKit.CheckReachability(field, profile, definition.Entrance, layer.Deposits);

            foreach (var deposit in unreachable) {
                report.AddError("navigation.deposit-unreachable", definition.AssetPath, deposit.Location, deposit.Why);
            }
        }
    }

    public IEnumerable<string> PreviewLines(PlaceDefinition definition) {
        yield return PlaceFields.ReachabilitySummary(definition);
    }
}
```

The class is `internal`: it has no public surface and no door, because the runner finds it by its attribute, not by name. It sits in `Spellbound.Navigation.Places.Editor`, the editor half of the Places bridge, a Places-gated editor assembly compiled only when Places is installed (an assembly is compiled whole, so a class that names `PlaceDefinition` cannot share an assembly that every Navigation buyer compiles; decided 2026-10-24). The attribute leaves `RunsWhileEditing` at its default, no, because the check builds a field of the whole place; it runs on save, under `core validate` and from a button. `PlaceFields` is internal to the Places bridge and its editor half is a friend assembly inside the same package, so the bridge has no door either.

What `core validate --drafts` then prints, in area 2's format (status word first, then the `checks:` line as `<name> (<Package>)` with the type's own validation first), `failed` because the call was valid and found a fault:

```
$ unity command spellbound_run --line "core validate --drafts"
failed: 1 error
checks: PlaceDefinition (Places), navigation.reachable-deposits (Navigation)
navigation.deposit-unreachable  error  Assets/Drafts/Prospector.asset  deposits[2]  layer rare_ore: 11 of 14 deposits cannot be reached from the entrance by Humanoid (blocked by tag Water, 12 cells wide)
```

Before Navigation is installed, and so until Navigation lands, the `checks:` line has no Navigation entry and the report has no such finding; that absence is how the report shows the check did not run. A script or the scenario tells whether the check ran by looking for the token `navigation.reachable-deposits` in the `checks:` line; the steps that run `navigation` lines (7, 12 and 15 of area 2's scenario) are skipped until N2 and N5 land. Nothing else changes.

### What the field costs to keep current

Terrain edits arrive as changed voxel bounds from the bridge, batched per step of the world instance under a rebuild budget; only intersecting tiles rebuild; tiles no query and no awake footprint needs are dropped least recently used first when the field's byte budget is exceeded; labels for those tiles and their neighbours recompute; a version stamp per tile lets `IsPathValid` answer without a search. Footprints come from two places. Placement rows (preset index, pose, flags) are read from WorldObjects' public read-only `PartitionRows` view, for asleep and awake instances alike, and each row's footprint is looked up from its preset, so a base 300 metres from any player still blocks a path. The row's state column (one `ushort` per row, written by the one WorldObjects call that also raises the partition's version, so a state change always moves the version the tiles are stamped with) gives a door's state for asleep and awake instances alike, and the preset's footprint maps that value to a footprint state. A proxy (the live object WorldObjects creates only while an instance is awake) carries the footprint module, which is how the price of a link set by the door's owner arrives; a sleeping instance has no proxy, so its link carries the footprint's default price for that state, and a proxy never renders anything (the overlay is `Navigation.Debug`'s). The field's size follows the byte budget and the queries, not the world. Nothing is saved: fields are derived data and footprint states are instance data WorldObjects already owns and Persistence already saves.

Costs are budgets, not claims. Navigation reports tile builds per second, bytes held, nodes expanded per query, queue depth and rebuild time through Core's observation model, each with a budget the game sets. No timing figure is stated in this document because none has been measured; epic N1 measures them before the rest of the package is built.

## 4. What a buyer writes, gets for free, can replace, and what the editor gives them

| Package or assembly | Writes | Gets for free | Can replace | Editor gives |
|---|---|---|---|---|
| `Spellbound.Navigation` (Runtime) | Movement profile assets and a tag set; the call to `FindPath`; what a body does at a Link | The front door `NavigationKit`, cell classes, tiles, clearance, components, hierarchy, time slicing, observations, operations, the AI context file (operations, rules, what not to do), grid and heightfield sources, the scene components, `FitFootprint` and `CheckReachability`, the path follower, the crowd registry and a default local avoidance, two neutral profile assets (Grounded, Open) with no creature names | The space source, the cost layer, every profile, the tag set, the follower, the avoidance; nothing is a decree | Nothing runtime-only |
| `Spellbound.Navigation.Editor` | Nothing | A profile inspector with a live preview (pick a start and goal in the Scene view, see the reachable region and the path), footprint gizmos with "fit to colliders", a prefab-stage preview that builds a field from the footprint alone and tests each portal from both sides, a Scene overlay of tiles and components per profile, Core's validation report for every asset, and nothing that names Places | The overlay colours (USS custom properties) | These are the editor |
| `Spellbound.Navigation.GeoForge` (bridge, compiled when GeoForge is installed) | A reference to the volume | The space source over live volumes and over sparse voxel assets, a material-to-tag table, change forwarding. It reads GeoForge's public queries as `Character.GeoForge` does but implements Navigation's own `INavigationSpaceSource`; Character's containment space is another seam, so neither package references the other | The table asset; the source | An inspector on the table |
| `Spellbound.Navigation.WorldObjects` (bridge) | A `NavigationFootprintModule` on a preset, pointing at a footprint asset | Footprints from `PartitionRows` for every placed row, state from the row's state column for asleep and awake rows, price from the awake proxy's module; handles for owners | Which presets get footprints; how instance state maps to footprint state | The preset inspector shows the footprint and "fit to colliders" |
| `Spellbound.Navigation.Character` (bridge, compiled when Character is installed; hosted here because the path crosses into the body's input, line rule 3) | Nothing | Applies the follower's desired move and up to Character.Body's input seam and registers the body in the crowd | Both; the bridge is thin | A preview of a raid in the profile inspector |
| `Spellbound.Navigation.Places` (bridge) | Nothing | An adapter: reads a place's layers into an edit-mode field for the profile named in the place's rules, which is what `ReachableDepositsCheck` calls; in a gym it also builds the play-mode field when Places' loaded event names the place and its world instance, with that profile as the default | The profile | `Spellbound.Navigation.Places.Editor` (compiled with the bridge): `ReachableDepositsCheck`, internal, registered with Core.Editor's check seam, whose line appears in the place's report |
| `Spellbound.Navigation.Debug` (runtime, `!UNITY_SERVER`) | Nothing | Runtime drawing of the same overlay | Colours | A toggle on the field component |
| Samples `Four Creatures` and `Flat Field` (`Samples~`) | Nothing, they are the examples | Humanoid, spider, bird and worm profiles, a cave, a base with a door and a moat, a raid of forty at the door; and a heightfield farm with two animals for a game with no voxels | All of it | A scene that works |

## 5. Homes test and stranger test, in writing

Procedure from `Homes.md`: separate type from value, then Library, Studio, Game.

| Thing | Type or value | Library? | Studio? | Home | Stranger test |
|---|---|---|---|---|---|
| Cell classes Open, Surface, Solid | Type (a partition of eight signs) | Every stranger who has any sampled space | | Navigation | Underwater: Open is water, Surface is seabed, Solid is rock. Farming sim: Surface only. Card game: not installed |
| `MovementProfile` | Type | A stranger writes their own movers | | Navigation | No creature names in Runtime; the four creatures are sample assets |
| Humanoid, spider, bird, worm | Values | | Studio.Content if two games share them | The sample, then the games | The racing game uses none |
| `NavigationTagSet` | Type | | | Navigation | Tag names are the stranger's |
| Water, road, DoorWood as tags | Values | | | The game, or the owner of the thing (Places layer, WorldForge river) | Navigation never lists a tag |
| `NavigationField`, queries, tiles, labels | Mechanisms | Any stranger with creatures | | Navigation | Needs no GeoForge: grid and heightfield sources ship |
| `INavigationSpaceSource` | Seam | | | Navigation | A grid source for a board, a heightfield for a field of animals |
| Space source over GeoForge | Mechanism with a dependency | A GeoForge buyer | | `Navigation.GeoForge` (the composer hosts, line rule 3) | Not installed without GeoForge |
| `NavigationFootprint` | Type | Any game with built or planted things | | Navigation | Shapes, tags and states only; no "door" word. A door is a footprint with two states |
| `NavigationFootprintModule` | Mechanism with a dependency | A WorldObjects buyer | | `Navigation.WorldObjects` | Not installed without WorldObjects |
| Roads, rings and rivers from WorldForge | Values (shape, tag and priority) over a type Navigation owns | A stranger's generator emits polylines | | `WorldForge.Navigation` (W9), which converts a route to a chain of capsule-line tag volumes (the shapes a footprint uses); WorldForge emits shape, tag and priority and never navigation data; Navigation has no route sink type | WorldForge is a composer beside Navigation, and the package whose data crosses hosts the bridge (line rule 3) |
| Planning a road over a cost raster | Mechanism in WorldForge | | | `LineRouter` stays in WorldForge as its default. `FindPath` over a heightfield source with an `INavigationCostLayer` is the same search, so `WorldForge.Navigation` may offer it as an alternative router once N3 measures it; Navigation ships no separate grid A* | A second router API in Navigation would duplicate its field |
| Open and Closed as state names | Values | | | The footprint asset | Strings in an asset |
| A price and a tag on a Link waypoint | Type | Any game with destructible or toll barriers | | Navigation | It reports a price and an id, never an attack |
| Deciding to attack the door | Value, game rule | | Studio if two games | Game | Not in Navigation |
| Path following | Mechanism over the path and the flow field | Every stranger with creatures or swimmers writes it and wants it replaceable; homes question 1 answers library | | Navigation, `PathFollower`, replaceable | The farming sim's herd uses it with a transform; the underwater swimmers use it in three dimensions |
| Local avoidance among bodies | Mechanism with a policy seam | Forty raiders must not stack in one body; Unity's own avoidance serves Unity's NavMesh agents only, which direction B rejects | | Navigation, `ILocalAvoidance`, default replaceable | Needs no Character: it reads a crowd registry |
| Applying a desired move to Character.Body | Mechanism with a dependency | A Character buyer | | `Navigation.Character` (the path crosses into the body's input) | Not installed without Character |
| Formations, squad tactics, what to do at a Link | Values, game rules | | Studio if two games | Game | Not in Navigation |
| The scene overlay and preview | Editor mechanism | Every stranger authoring profiles | | `Navigation.Editor` | UI Toolkit overlay only |
| `ReachableDepositsCheck` over `PlaceDefinition` | Check on a definition another package owns | A Places buyer who also installs Navigation | | `Navigation.Places.Editor` (internal, no door), through Core.Editor's check seam (`IDefinitionCheck<T>`, `[RegisteredDefinitionCheck]`) | Not compiled without Places; a card game never sees it |
| Reachability check over a field | Mechanism | Any generator or level tool, with no Places | | Navigation, `CheckReachability` | A heightfield stranger checks that every farm gate meets the road |
| Reading a place into a field | Mechanism with a dependency | A Places buyer | | `Navigation.Places`, a thin adapter with no door that `ReachableDepositsCheck` and the gym call | Not installed without Places |
| Footprint fit check | Mechanism | Any building game | | Navigation, `FitFootprint`, registered in Core's operation registry as `navigation fit-footprint` | Applies to a subject by what it carries (a footprint asset, or a prefab or model with a footprint component), never by a piece-kind name, which is ArtPipeline's word |
| Flow-field query `Distances` | Mechanism | Raids, herds, crowds | | Navigation | |
| Line of sight over bit tiles | Mechanism | Any AI vision | | Navigation | Needs only a source |

## 6. Directions

**A. Cells over derived occupancy tiles, footprints and portals (taken).** One implicit graph model for all four movers and for terrain and built things. The developer's example, "GeoForge makes its case codes queryable and the pathfinding system queries them", is taken with one change: the seam returns signed samples, not case codes. A case code is eight sign bits Navigation derives in one line; the magnitude is needed for normals and for refined levels; and a heightfield or a grid can produce samples but has no case tables.

**B. Unity's AI Navigation built from GeoForge's meshes and the preset colliders (rejected).** The alternative to A for walkers. It costs almost no code and has Unity's tooling. It loses on the scenario: the manual documents cylinders on polygons, with no volume, ceiling, flying or burrowing agent; it builds from meshes, and the mesh at a coarse level of detail has lost the moat (`MarchingCubeJob.cs:75`); a runtime mesh without read/write access is skipped (Unity scripting reference, `NavMeshBuildSource`); and it would duplicate the voxel data as polygons. Valheim does this for walkers and swimmers (tiles of 32 units, eleven agent types, links at cost 10, `Pathfinding.cs:672,678,731`), which is evidence it works at that scale for surface movers. It stays the recommendation for a stranger whose world is a Unity Terrain (decision 1).

**C. A graph of build pieces (rejected).** The alternative to A for built things: each piece contributes nodes at its snap points and edges to its neighbours, so a door is an edge. It is exact and cheap for grid-snapped building. It cannot say "a wall blocks a flier, a column blocks a walker" because blocking is a property of occupancy, it does not join with terrain without a second mechanism, and free-placed pieces share no snap points. Its good half survives: portals are links.

**E. Following and avoidance left to the sample (the first draft, rejected).** It put the answer to homes question 1 in `Samples~` while the same row said a stranger would want it, and it left forty raiders stacked in one body. Following and avoidance are in Navigation as replaceable defaults (N9). Unity's own avoidance was never an option: it runs on Unity's NavMesh agents only.

**D. Pathfinding inside GeoForge (rejected).** The alternative to a Navigation package. It would use GeoForge's octree directly. That octree is a rendering structure: its levels are chosen by distance to the camera (`OctreeNode.cs:289-298`), so paths would change as the camera moved, the moat would depend on where the player looked, and a racing game or a flat farm would install voxels to find a path.

## 7. Ideas kept and cut

Kept, in the order they entered the design:

1. Three cell classes as the three kinds of movement.
2. Read voxels, never meshes, so level of detail cannot change an answer.
3. A seam of samples, not case codes.
4. Movement profiles as assets, no creature enum.
5. Tag volumes: water, roads, rivers, territory, one mechanism.
6. Portals as links with named states and an owner-set link price: an open door and a cost of breaking, as data.
7. A resolution ladder keyed by the mover's size.
8. Component labels for constant-time reachability, and an `Explain` query that names the blocker.
9. A hierarchy whose abstract edges exist only when a fine path exists (soundness), with a property test.
10. Fields per world instance and per reference frame, so a ship deck is a field riding its reference frame.
11. Clearance by dilation, shared across profiles.
12. `Distances` as a flow field: one search, many followers.
13. `LineOfSight` over the same bits, for AI vision.
14. Unknown space is optimistic: a path through an unloaded region is a plan, replanned when the region loads (N7).
15. A place validator: "every door of this place meets floor for a humanoid", run in edit mode.
16. A ship is a profile: nodes are open cells resting on a water-tagged cell, with draft as clearance below, using the "tags it may rest on or float on" field. Sailing is Corsairs' headline and needs no new class.
17. Beyond the brief, not proposed: an `Enclosed` query from the same labels (is this room sealed, for shelter and rain), and a raid preview that shows a player the cheapest way into their base from `Explain` and the link prices.
18. Following and avoidance over the same field: `Distances` gives the direction, a crowd registry gives the neighbours, one replaceable policy gives the move. A raid costs one search plus a neighbour query per body.

Cut:

- Pathfinding on a GPU: no measurement supports it, and a headless server has no GPU.
- Entities and DOTS components: Entities is not in the line (area 8).
- Baked path caches saved to disk: fields are derived data; revisit only if the spike shows rebuild is slow.
- Sound propagation through open cells: a good use of the field, recorded for "Beyond the brief" in 2c, not proposed.
- Formations, squad tactics and what a creature does at a Link: the game's. Avoidance is not cut: Unity's own avoidance serves Unity's NavMesh agents, which direction B rejects, so it never runs on a Navigation path.
- A mesh and Unity Terrain rasteriser as a default source: see decision 1.

## 8. Epics

Sizes are stories. Lines are my estimate by analogy: GeoForge's whole package is 9,369 lines (73 runtime files), and Navigation's runtime is planned at about 7,000. "Alone" says whether the epic delivers value if nothing after it is built. Other areas are named by key.

| Id | Outcome | Depends on | Alone? | Stories | Lines read / written | Placed |
|---|---|---|---|---|---|---|
| N1 | A throwaway spike in `NavigationDev` answers four questions with numbers: tile build time from GeoForge's run lists, bytes per tile and per chunk, nodes per millisecond for Surface and Open searches, and whether a mixed-resolution seam keeps paths sound. It ends in a written go or no-go filed as a Decision issue, which a person closes with text and which blocks N2's first story | `workflow` (WF2's first four stories: the repo is made by the template after the probe); `world` (the public run-list read exists today, `GeoChunkEngine.cs:294`), `living` (a repo from the template, the package at `Packages/Navigation` once the probe passes). The spike uses Burst, Collections and Mathematics, not Core | Yes: the numbers settle the go or no-go | 5 | 6,000 / 1,800 | Spike window; may run before the Corsairs milestone (estimated) |
| N2 | The ground field: the `UnderwaterGame` step (a swimmer profile paths through an open water volume over a grid source whose samples carry a water tag, with no sky and no fixed up), samples with coverage, tiles, cell classes, profiles, four movers, labels, `FindPath` and `Reachable`, `NavigationKit`, the GeoForge bridge and change forwarding with an oracle test that compares every sample with GeoForge's own `TryQueryVoxel` (its chunk indexing has an offset the bridge must match, `GeoVolumeEngine.cs:218-225`), the scene components, grid and heightfield sources, a minimal runtime overlay so the team can see tiles from the first story, admission and the byte budget, two neutral profiles, the `Four Creatures` cave and the `Flat Field` farm | N1 go (the Decision issue closed); `line` (L2: operations, observations, authoring contract, reference frame and up vocabulary); `world` (W2: the versioned run-list read, the volume change and residency event) | Yes: a spider crawls a cave and a swimmer crosses a flooded one | 13 | 5,500 / 7,800 | After the Corsairs milestone, before any Corsairs launch |
| N3 | The hierarchy: tile graph, free-space octree, solid components, time slicing, `Explain`, `Distances`, `LineOfSight`, stale paths, observations; the moat-at-every-level-of-detail matrix and the soundness property tests | `pathfinding` (N2) | Yes: fast, explainable queries | 8 | 3,500 / 4,500 | After the Corsairs milestone, before any Corsairs launch |
| N4 | Built things: footprints, resolution ladder, tag volumes, portals and states, the `Navigation.WorldObjects` bridge, handles for owners, the door and wall and column scenario in the sample | `pathfinding` (N2); `line` (L3, WorldObjects); `runtime` (awaken, sleep, state notifications); `unity` (`PartitionRows`) | Yes: a base with a door | 10 | 6,000 / 6,000 | After the Corsairs milestone, before any Corsairs launch |
| N5 | Authoring and agent surface: profile inspector with preview, footprint gizmos and fit, Scene overlay, operations `navigation path`, `reach`, `why`, `field`, `probe` and `fit-footprint` (a fixed-size run of the search hot loop that returns nodes per millisecond and bytes allocated, checked against the declared budget), asset validators that run under `core validate`, `FitFootprint`, `CheckReachability`, the context file, the `Navigation.Places` adapter, and `ReachableDepositsCheck` in the editor half of the Places bridge with its preview line, tested against a place whose deposit is unreachable (the worked example of the check seam) | `pathfinding` (N2, partly N4); `commandline` (CL4 story 10, the check seam); `world` (Places layer contract) | Yes: and the checks WorldForge's W9 and Art's footprint check call | 9 | 4,300 / 5,900 | After the Corsairs milestone, before any Corsairs launch |
| N6 | Fields in reference frames and joined fields: a ship deck as a field riding its `ReferenceFrame`, a path that crosses from the deck's field into the ground's through a gangplank link, a moving or spherical GeoForge volume through the reference frame and the up provider, a water world, a ship profile that floats on a water tag. The roadmap's NV6 | `pathfinding` (N4); `runtime` (reference frames); `line` (L2c, Core's half of the noun) | Yes: a crew paths across a moving deck | 5 | 2,500 / 2,500 | After the Corsairs milestone, before any Corsairs launch (decided 2026-10-24) |
| N7 | Strategic layer: unknown space is optimistic, a coarse source (a heightfield from WorldForge's plan or Horizon's shape source), replan on load | `pathfinding` (N3); `world` | Partly | 6 | 3,000 / 3,500 | Backlog behind N3 |
| N8 | Jumps, drops and ladders as generated and authored links | `pathfinding` (N3, N4) | Yes, per link kind | 5 | 2,000 / 2,500 | Backlog behind N3, N4 |
| N9 | Following and avoidance: `PathFollower`, the flow-field follower, the crowd registry, `ILocalAvoidance` with a default chosen by measurement, the `Navigation.Character` bridge, the raid of forty test (overlap count, arrival count, allocated bytes), a herd on the flat field and a swarm in open water in the samples | `pathfinding` (N2, N3 for `Distances`); `line` (L2; L4 for the bridge); `runtime` (Character.Body input claim) | Yes: a raid reaches a door | 6 | 1,500 / 3,000 | After the Corsairs milestone, before any Corsairs launch |

67 stories, the same as before the fold of 2026-10-24: only N6's placement moved, from backlog to the work after the Corsairs milestone and before any launch (no story added, removed or resized). Two areas depend on this one: `world`'s W9 (roads, rivers and water out, a reachability check through `WorldForge.Navigation`) waits on N4 (tag volumes) and N5 (`CheckReachability`), and `art`'s footprint check waits on N5 (`navigation fit-footprint`) and reports itself skipped without it. N9 depends on N2, N3, `line` (L2, L4) and `runtime`, and nothing waits on N9 except the games' raids. About 37,000 lines written including editor, tests and samples. The critical path through this area is N1, N2, then N3 and N4 in parallel, then N5, N6 and N9. N7 and N8 wait on N3 and N4 and are backlog. Everything here waits on L1 and L2; N2's last story waits on `world` returning the read API. Every date is an estimate the developer is not bound by; the roadmap prices the placement.

Against the milestones. Decided on 2026-10-24: Navigation ships before Corsairs Isle launches and after the "Corsairs on the line" milestone. N1 runs in the spike window and may run earlier. N2, N3, N4, N5, N6 and N9 (51 stories) are placed after the Corsairs milestone and before any Corsairs launch, in dependency order. Saboteer has no Navigation epic. N7 and N8 stay in the backlog behind N3 and N4.

What Corsairs plays without Navigation at its milestone. A search of `CorsairsIsleDev` for `NavMesh`, `Pathfind` and `AStar` in code, assembly definitions and manifests finds nothing, and `Assets/_Project` holds no class whose name contains Enemy, Creature, Monster, Npc, Mob, Wildlife or Animal (searched 2026-10-24). So at its milestone Corsairs has no creature that finds a path, the same as today. The playable character walks with Character, and the gym walks it through a place with its `navigation` lines skipped. `core validate --drafts` answers without the reachable-deposits entry, and its `checks:` line does not list it. The lines of this file that begin `navigation` (and area 2's scenario steps that run them) work when N2 and N5 land. Corsairs Isle launches complete: N2 to N6 and N9 land before launch, so creatures path on the ground and a crew paths across a moving deck.

## 9. Decisions

### Decided

1. Navigation serves a stranger's flat world with a grid source and a heightfield source. A walker on a Unity Terrain or mesh is sent to Unity's AI Navigation in the docs. Navigation does not write a mesh or Unity Terrain rasteriser and does not wrap Unity's NavMesh as a backend.
2. Navigation holds the path follower, the crowd registry and replaceable local avoidance, with a `Navigation.Character` bridge to Character.Body. The line's sentence is amended to say so.
3. N1 is a spike with a written go or no-go before N2. If the numbers fail, the fallback is Unity's NavMesh for walkers only, plus our own volume search for fliers and burrowers.
4. GeoForge's seam hands over signed voxel samples, not case codes (the line's amendment of 2026-10-23).
5. Navigation ships before Corsairs Isle launches and after the "Corsairs on the line" milestone (2026-10-24). N1 may run earlier; N2 to N6 and N9 follow the milestone and precede any launch.
6. The check seam is one interface, `IDefinitionCheck<T>`, and one attribute in Core.Editor; each package ships its own checks; `ReachableDepositsCheck` over `PlaceDefinition` is the worked example, reported in area 2's format with `failed` as the status word (2026-10-24).
7. The moving thing is a `ReferenceFrame`; a gym character is a playable character of the game; a stable name for the spawned body is Studio.Content's and the place-loaded event is World's (2026-10-24).
8. Nothing is pinned and no date is a commitment (2026-10-24).
9. The gym walk-through skips its `navigation` lines until Navigation lands, and the report's `checks:` line has no Navigation entry until then (2026-10-24).
10. Ships and moving decks (N6) are built after the Corsairs milestone and before Corsairs Isle launches, beside N2 to N5 and N9; Corsairs launches complete (2026-10-24).
11. The unreachable-ore check lives in `Spellbound.Navigation.Places.Editor`, a Places-gated editor assembly beside the Places bridge; it is registered as `navigation.reachable-deposits` and does not run while a designer edits (2026-10-24).

## 10. Limits

- No cost in this document is measured; memory figures are arithmetic and every time figure is a budget to be measured in N1.
- The ground level cannot represent a feature narrower than its cell, so doors are links and thin walls are conservative.
- The seam between the ground level and a refined level is untested; N1 tests it and its written go or no-go covers failure.
- Unity's NavMesh is the fallback for walkers only. It cannot serve a spider on a ceiling, a bird or a worm, so those would use our own volume search if N1 says no-go.
- Left for the N1 spike: tile build time from the run lists, bytes per tile and per chunk, nodes per millisecond, the seam between levels, and label memory per family of profiles. Nothing else in the package is blocked on a probe.
- The floor is Unity 6000.3 with Burst, Collections and Mathematics declared as packages; N1's numbers are taken on the studio's 6.4, and the 6.3 test row runs the correctness tests (soundness, the moat matrix), not the numbers.
- Slope is quantised by the voxel grid, so "about 45 degrees" is approximate by one cell.
- Avoidance is local, among bodies registered in the field: no formations, no group tactics, and no promise a crowd passes a gap faster than the gap allows. The default method is not yet chosen; N9 picks it by measurement.
- Determinism is promised for the same build and machine only.
- A path is a 3D polyline: no heading, turning radius or kinematics. A long ship is given a radius of half its length and its follower does the turning.
- a sleeping door's link carries the footprint's default price for its state, not the price its owner last set.
- Component labels are stored per family of profiles (same classes, cone and clearance); many distinct families multiply label memory, which N1 measures.
- The fit check measures a footprint against the grid and the portals against floor for a named profile; it cannot judge whether a piece looks right or whether a creature will choose to use it.
- Profile and footprint assets carry no version and no migration: a changed asset is re-authored.
- Profiles and footprints keep their data in Unity's own serialization; Core packing serves saves and the wire, and Navigation saves nothing (fields are derived data).
- Left for a spike or a probe by this fold: the tile cost stays N1's, run in the spike window with no date fixed (estimated, not a commitment); whether Unity 6.7 changes any call N1 or N2 uses is for the 6.7 beta probe and blocks no Navigation epic; the field of a moving `ReferenceFrame` and a path across a link between two fields (N6) are untested, and N6's first story proves a path across a moving deck before the rest is built.
- The check seam is drawn and unrun: whether `TypeCache` finds an attributed class that implements a generic interface is the first proof of CL4 story 10, and the cost of building an edit-mode field inside the check is unmeasured (N1 and N5's check story measure it); that cost is why the check does not run while a designer edits.
- The tick rate and the fixed step are settings; the follower and the crowd read neither, and the 20 and 50 a second are starting values, not limits of this package.
- Valheim and 7 Days to Die facts come from community pages; they shape ideas, not numbers.
- The strategic layer and jumps are backlog; until N7 a path through unloaded land is not available.
- Edit mode has voxels only for baked assets (sparse voxel assets, places); a live GeoForge volume exists only in play mode (`GeoVolume.cs`, `InitializeChunks` is a coroutine).


## 11. Against revision 4

Read after sections 1 to 10 were written. Revision 4's `Pathfinding.md` is an opinion; I checked the facts I use from it against the sources it names.

Verified by me through the GitHub API, and taken as evidence: the 7 Days to Die facts (tags, tag gating per entity, health-scaled penalty, per-column recalculation) and the Valheim facts (32-unit tiles, link cost 10, eleven agent types, no door logic in `BaseAI.cs`). Both are in section 2 with file and line. One correction the sources force: 7 Days to Die's path graph is a per-column grid over blocks, so the team's belief that its pathfinding rests on marching cubes is not supported by the pathfinding code. I did not check how its terrain is meshed and say nothing about that.

Not verified, so not relied on: revision 4's statements that Unity's NavMesh needs "a rotated surface each and hand-placed links" for walls and ceilings, and a community report of a 65,535 link limit in Valheim. Unity's manual pages I read are silent on both.

| Revision 4 | Taken | Rejected | Why |
|---|---|---|---|
| Cells as nodes at the finest level only | Yes | | Same answer: the moat survives because coarse data never decides |
| Profiles are assets, no creature enum | Yes | | Same |
| Entity-enabled tags decide which nodes a mover may use | Yes, as the profile's tag table | | The 7 Days to Die shape, verified |
| Cost of breaking a block read from its health | Yes, as a price on a link set by the owner | The cost formula and its numbers | The numbers are 7 Days to Die's tunables; Navigation stores a number the owner sets |
| Sparse, local, lazy graph around active agents | Yes, as tiles dropped by byte budget | | Same memory argument; mine adds the arithmetic for bit tiles |
| Footprint module on the preset: blockers, walkable surfaces, portals with state | Yes | "Walkable surfaces" as a separate shape kind | A floor is solid occupancy with a surface on top; one concept fewer |
| Jump and drop links generated between surface cells | Yes, as N8 | | Backlog, waits on N4 |
| Region graph for far movement | Yes, as N7 with an optimistic unknown | Region nodes from WorldForge connectors only | A world without a layout has no connectors; a coarse source works for any world |
| GeoForge gains `ClassifyCells` returning class, quantised normal and dominant material | | Yes | It makes GeoForge define Navigation's classes and push a second representation through its public API. A sample seam keeps GeoForge "voxels in, voxels out" and lets a grid or heightfield feed the same field |
| Fliers searched over a coarse stride grid of empty cells | | Yes | Uniform tiles give adaptive coarseness with no stride to tune and keep the soundness rule |
| `CellsChanged(bounds)` event on GeoForge | Yes, as a volume-level change event with a version | | The edit store event is per store and carries chunk-local indices |
| "Nothing else" is needed in GeoForge | | Yes | Navigation also needs a camera-free, version-safe read of the run list and chunk load events (claims on `world`) |
| Navigation is "A System" with `Paths.Find(profile, from, to)` | | Yes | A static entry point is a global; a field per world instance lets a server run many worlds |

Missing from revision 4 and added here: a door narrower than a ground cell (the resolution ladder and portals as links), constant-time reachability and an `Explain` query, a flow-field query for raids, line of sight from the same bits, a stranger with no GeoForge (grid and heightfield sources), scene components for a stranger with no WorldObjects, fields in reference frames, and a test matrix for the moat at every level of detail.

## 12. Red team

Mode: self, Sonnet 5.5, author me. No subagent tool was available in this run, so the lens passes were not run by separate readers on a different model; the developer's reviewer sessions at checkpoint 3 remain the independent attack. Lenses run: Ambition first, then Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap. Skipped: none. Each pass began by writing the strongest claim of the draft under that lens and then trying to break it.

### Ambition

Strongest claim: "one field serves all four movers and built things". Boldest version asked: what else does a field of occupancy bits answer that the page does not offer?

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 1 | Serious | A Corsairs raid boat's pilot, sailing to a beach | No profile can float on water: the three classes cover land, air and rock | The draft's section 1 has four movers and no sea | Fixed: profiles gain "tags it may rest on or float on"; a ship is a profile (idea 16) and the ship profile is part of N6 |
| 2 | Minor | A base builder who wants to know whether a room is sealed, and the player who wants to see the cheapest way into their base | Labels and prices already hold the answer; the page offers neither | Draft had no enclosure or raid preview | Recorded as idea 17, Beyond the brief for 2c, not proposed |
| 3 | Minor | WorldForge's generation, wanting proof that every generated place is reachable from spawn | No claim lets a generation pass call the validator | Draft claims only cover Places validation | Fixed: the Places validator is the same call WorldForge may make; claim added on `world` |

### Stranger

Strongest claim: "every stranger installs Navigation without the packages it does not need".

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 4 | Serious | A farming sim without WorldObjects placing a fence | The only way to add a footprint is the WorldObjects bridge's preset module | Draft section 4 lists `NavigationFootprintModule` only | Fixed: `NavigationFieldBehaviour`, `NavigationFootprintComponent` and `NavigationTagVolumeComponent` in Runtime, referencing a field explicitly |
| 5 | Minor | The same farming sim's first hour | Both samples were voxel scenes | Draft had one sample | Fixed: `Flat Field` sample in N2 |
| 6 | Minor | A buyer writing a source for their own world | "Solid" was never defined for a non-GeoForge source | Draft's seam row | Fixed: solid means density zero or more, stated on the seam |
| 7 | Minor | A buyer with a moving GeoForge volume (the Orbiting Planets sample, `IsMoving`) | A field in a reference frame is N6 | Draft N6 | Fixed: the moving or spherical volume is named in N6; the field takes a reference frame from its first release so N6 breaks no call |
| 8 | None | A buyer wanting a fourth cell class | Not a finding: the three classes are the whole partition of eight signs; other media are tags and the support rule | Section 5 row 1 | Answered |

### Scale

Strongest claim: "the field's size follows the players, not the world, and nothing replicates".

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 9 | Serious | A shard server with thousands of awake creatures all requesting paths in one tick | The draft says "node budget" and nothing about what is refused | Draft section 3, search | Fixed: `IPathAdmission`, priority then age, depth limit, failure reason Busy; queue depth is an observation |
| 10 | Minor | The same shard after hours of play | Tiles are only ever added | Draft, cost of keeping current | Fixed: byte budget, least recently used tiles dropped unless a query or awake footprint needs them |
| 11 | Minor | A world with many profile families | Label storage multiplies by family count | Draft labels sentence | Stated as a limit; N1 measures it |
| 12 | Minor | A sand worm digging every tick | A rebuild per edit | Draft change signal | Fixed: edits batched per world step under a rebuild budget |

### Agent

Strongest claim: "everything a person sees an agent can ask for". Tasks walked: add a cave with ore and test that it is mineable; find why a spider refuses a ceiling; find the cheapest way into a base.

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 13 | Serious | An agent testing a freshly authored cave in edit mode | A live GeoForge volume exists only in play mode, so `reach` has no field | `GeoVolume.cs`, `InitializeChunks` is a coroutine started on creation | Partly fixed: places and baked voxel assets give an edit-mode field through `Navigation.Places`. Not fixable here: a scene-authored volume that is not baked has no voxels in edit mode (see could not fix) |
| 14 | Minor | An agent asking for the cheapest way into a base | Output named no footprint and no reference frame | Draft transcript | Fixed: output lists Link waypoints with footprint names and prices, and the reference frame |
| 15 | Minor | An agent in a buyer's project | The AI context file was in an epic but not in what the buyer gets | Draft section 4 | Fixed: listed in Runtime |

### Designer and artist

Strongest claim: "a designer makes a base piece in one inspector".

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 16 | Serious | A designer fitting a footprint to a staircase made of a mesh collider | "Fit to colliders" can only box a mesh collider; a wrong footprint is invisible until a raider fails in play | Draft "fit to colliders" | Fixed: a prefab-stage preview builds a field from the footprint and tests each portal from both sides, and the validator reports a portal with no walkable cell within one cell |
| 17 | Minor | A designer placing a water volume in a scene | Only preset footprints existed | Draft | Fixed with finding 4 |
| 18 | Minor | An artist | Nothing asked of them | Draft | None; ArtPipeline may call the fit action (claim on `art`) |

### Performance

Strongest claim: "bit tiles make the boundary cheap". Tasks walked: tile build from run lists; one query at 60 queries a second; a thousand trees waking.

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 19 | Serious | A server running 60 queries a second | A class-based request handle allocates per query | Draft request type | Fixed: struct handles over native storage, zero managed allocation on the success path, with a test that asserts allocated bytes before and after |
| 20 | Serious | The boundary between GeoForge and Navigation | A copy of the run list per changed chunk plus a tile build on every change, unmeasured | `GeoChunkEngine.cs:44,294`, edits mutate the list | Not fixable by design: only a measurement settles it. N1 measures it, decision 3 holds the fallback |
| 21 | Minor | The bridge reading a chunk's border | Chunk indexing has an offset and a halo; a mismatch gives silent wrong samples | `GeoVolumeEngine.cs:218-225` | Fixed: an oracle test compares every sample to GeoForge's `TryQueryVoxel` |
| 22 | Minor | A bird near a building | Conservative stamping makes buildings up to one ground cell larger for ground-level profiles | Draft ladder | Accepted: stated under the conservative thin walls limit |

### Time

Strongest claim: "the seam and the three classes survive a changed voxel format".

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 23 | Serious | A game adding ladders, teleporters and swimming gates | Waypoint kinds were a closed list (Walk, Link, Breach, Dive, Emerge) a consumer would have to switch on and could not extend | Draft path row; library-design: "never an enum plus a switch" | Fixed: three structural kinds (Step, Transition, Link) plus an open tag and a price; breach, ladder and teleport are tags |
| 24 | Minor | A profile asset in year five | A field added to the profile changes what old assets mean | Draft | Fixed by rule: assets carry no version field and no migration before a package ships; a changed profile is re-authored; limit stated |
| 25 | Minor | A game with a 30 metre ship | A path has no heading or turning radius | Draft | Limit stated: a path is a 3D polyline; the follower does the turning |

### Roadmap

Strongest claim: "N1 first, N2 on the critical path, the rest waits".

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 26 | Serious | The N2 builder | Unknown space was treated as an N7 improvement but it decides the source seam's return type | Draft seam row and N7 | Fixed: `ReadSamples` returns a coverage; Absent is blocked until N7 changes the rule |
| 27 | Minor | The roadmap | N1 depended on L1 though the spike uses no Core | Draft N1 | Fixed: N1 depends on GeoForge's public run-list read and a repo only and can start in the first sprint |
| 28 | Minor | The N2 builder | The overlay needed to see tiles sat in N5 | Draft N5 | Fixed: a minimal runtime overlay is a story in N2; N5 holds the editor polish |

### Round 2: independent readers

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 29 | Serious | A Corsairs raid of forty (the `Distances` example) and the underwater swimmers | Navigation stopped at a path: following, steering and avoidance were unowned. The homes row sent following to the sample while saying a stranger would want it (homes question 1 sends that to a library), and avoidance was cut because Unity ships it, but Unity's avoidance serves NavMesh agents, which direction B rejects, so it never runs on a Navigation path. The limits confirmed it: no crowd avoidance | Draft section 5 path following row, section 7 cut list, section 10 | Fixed: `PathFollower`, `NavigationCrowd` and `ILocalAvoidance` are Navigation's replaceable defaults; `Navigation.Character` bridges to Character.Body; the homes rows, cut list, limits, decision 2 and a new epic N9 with a raid-of-forty acceptance test change to match. Part of the suggested fix rejected: the follower is not placed in Character.Body, because a swimmer or a herd without Character needs it too |

### Checkpoint 3: independent readers

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 30 | Minor | An agent following area 2's scenario at step 12, and the play mode test at step 15 that repeats `navigation reach --from player --to 14.2,4,3.1` | The line did not bind to this file: the examples took `--profile` and coordinates, nothing bound `player`, and no file said who builds the gym's field | `CommandLine.md:66,88,217`; this file's section 3 transcript and `NavigationFieldBehaviour` row | Fixed here: section 3 states the reach arguments (optional `--profile` with a default from the field, refused with the known list otherwise; `--from` and `--to` as a `NavigationPoint` that reads coordinates or a scene reference; `--field` defaulting to the only live field); `NavigationKit.Fields` is how operations find a field; `Navigation.Places` builds the gym field when the place loads. Not mine to change: the scenario's two lines in area 2, and the hook that tells a bridge the place has loaded, in area 5. Both are claims below. Navigation does not bind `player`: that is the buyer's prefab or Studio's gym profile, and the scenario can use a scene reference instead |

### Checkpoint 4: self pass on the fold (2026-10-24)

Mode: self, Sonnet 5.5, author me; no subagent tool existed in this run. Lenses run: Roadmap, Stranger, Time (and Stranger again after the claims round). Skipped: Scale and Performance (nothing in the fold touches the search or the store).

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 31 | Serious | The agent running area 2's scenario at the Corsairs milestone, and WorldForge's W9 | Step 7 expects a second error from the Navigation check, steps 12 and 15 run `navigation reach`, and W9 waits on N4 and N5, but Navigation now lands after the milestone | `CommandLine.md:64`; section 8 | Raised: claims on commandline, world and art, and open decision 1; the section 8 note says what Corsairs plays without Navigation |
| 32 | Serious | A game that installs Navigation but not Places | `ReachableDepositsCheck` in `Navigation.Editor` names `PlaceDefinition`, so the editor assembly would force Places on every buyer | Line rule 2 | Fixed: the check lives in an assembly compiled only when Places is installed (`versionDefines`), as every bridge is; at checkpoint 4 that is named `Spellbound.Navigation.Places.Editor` and decided by the developer on 2026-10-24 (answer 22) |
| 34 | Serious | The agent that registers a check, and a buyer with Navigation but not Places | An assembly is compiled whole, so "the part of Navigation.Editor compiled only when Places is installed" is not a thing; the check needs an assembly of its own, and the check must not be public, because the runner finds it by attribute | Line rule 2; area 2's check seam row | Fixed in the file: `internal`, no door, in `Spellbound.Navigation.Places.Editor`; the name was decided by the developer on 2026-10-24 (answer 22) |
| 33 | Minor | An agent reading the `checks:` line of a report | Area 2 calls the check `navigation.places` and registers it from `Navigation.Places`; the developer's thread puts it in `Navigation.Editor` | `CommandLine.md:342,662` | Claim on commandline for the spelling; the example is marked drawn |

### Checkpoint 5: self pass on the fold (2026-10-24)

Mode: self, Sonnet 5.5, author me; no subagent tool existed in this run. Lenses run: Roadmap, Time, Stranger. Skipped: Scale, Performance and Agent (the fold touches placement, a spelling and an assembly name only).

| # | Severity | Who and task | Where it breaks | Evidence | Answer |
|---|---|---|---|---|---|
| 35 | Serious | The roadmap, placing N6 before launch | N6 waits on N4 and on `runtime` for reference frames; if Core's half of the noun (L2c) or Runtime's binding slips, the sailing game cannot launch and nothing says which wait is the long one | N6 row: `pathfinding` (N4), `runtime`, `line` (L2c) | Fixed: the N6 row now names L2c as a dependency and its first story proves a path across a moving deck before the rest is built; a claim on `roadmap` and `runtime` carries the order |
| 36 | Minor | An agent reading `core validate --drafts` before Navigation lands | The absence of a Navigation entry in the `checks:` line could be read as the check passing | Area 2's rule: "a check that is not installed is absent from the line, never listed as passed" | Fixed: section 3 says the absence is how the report shows the check did not run, and the gym paragraph says the walk-through skips its lines |
| 37 | Minor | A farming sim buyer with Navigation and no Places | None found: the check sits in `Navigation.Places.Editor`, compiled only when Places is installed, and `Navigation.Editor` names no Places type | Section 4, `Navigation.Places` row | No finding under Stranger |

### Could not fix, said on the page

- No cost is measured. Findings 20 and 11 stay open until N1 returns numbers; the page says so and decision 3 holds the fallback.
- A scene-authored GeoForge volume that is not baked has no voxels in edit mode, so an agent cannot test it there. It needs GeoForge to generate or bake in edit mode, which is area 5's call; the claim is on `world`.
- No capacity figure for thousands of creatures on a shard exists; it needs a load test after N3 and area 6's networking numbers.
- The independent attack by a different model is still to come at checkpoint 3.
- The default avoidance method is not chosen or measured, and no crowd size per tick is promised; N9 measures both against the raid test.

Could not check: Unity's AI Navigation behaviour beyond its manual pages (no editor was opened), Unity 6000.4's own NavMesh documentation (the package manual 2.0.16 was read instead), and 7 Days to Die's terrain meshing.

## Claims on other areas

| Target | Claim |
|---|---|
| world | GeoForge publishes the versioned run-list read (a copy of a chunk's run list, finest resolution always, readable with no camera and no mesh) in W2 |
| world | GeoForge raises a volume-level change event with chunk coordinate, voxel bounds and version for every voxel change, including networked, procedural and load-from-save changes (today the event is per edit store, `IGeoEditStore.cs:12`) |
| world | GeoForge publishes the volume change and residency event (load and unload) in W2, so Navigation drops tiles |
| world | WorldForge emits shape, tag and priority for roads, rivers and water and never navigation data; `WorldForge.Navigation` (W9) may call `CheckReachability` |
| world | A Places layer may offer samples and tag volumes, so Navigation.Places can build an edit-mode field; a scene-authored volume can be baked or generated in edit mode (W2) |
| runtime | WorldObjects exposes awaken, sleep and state-change notifications with instance id, preset and pose, and presets accept a PresetModule from a bridge. Character's containment space and Navigation's space source stay separate seams |
| unity | `PartitionRows` is the read-only view I called `RegionRows`: preset index, pose, flags and the state column for every row, asleep or awake; the state is written by one call that raises the partition version (answered by unity at checkpoint 4); a proxy never renders |
| runtime | Core's `ReferenceFrame`, its id, its directory per world and the up provider let a field live in a moving reference frame |
| runtime | Character.Body accepts an externally supplied desired move and desired up |
| runtime | Navigation reports meters with budgets through Core's observation model |
| commandline | Operations `navigation path`, `reach`, `why`, `field` (as declared), plus `probe` and `fit-footprint` for the table to confirm; asset and place validation under `core validate`; results start `succeeded: reachable, 41 m` or `succeeded: blocked at 14.2,4,3.1`; parameters of kind vector3 and asset by name; table results; developer audience; the validation contract covers ScriptableObject profiles and footprints |
| unity | Navigation uses Burst, Collections and Mathematics only; Unity's AI Navigation is listed as the right tool for walkers on meshes and Unity Terrain |
| networking | Navigation, its follower and its crowd advance where the game simulates the creature (owner, host or server, set per replicated thing with no default) and replicate nothing; footprint states derive from replicated instance data; runtime debug drawing is `!UNITY_SERVER` |
| art | ArtPipeline's footprint check calls `navigation fit-footprint --asset <path>` through Core's operation registry and reads the `ValidationReport`; Navigation owns the finding codes; absent Navigation, the check skips itself |
| living | The package follows the six parts; soundness properties and the moat matrix are its regression contract |
| ui | The profile preview panel and overlay use UI Toolkit, with the kit when installed |
| workflow | N1's written go or no-go is a Decision issue that blocks N2's first story; N1 starts from a repo made by the template after the probe and WF2's first four stories |
| living | The package sits at `Packages/Navigation` in its dev project after the probe; `NavigationKit` is the front door and its operations are public methods that are lines of text |
| commandline | Step 12 and the step 15 test line read `navigation reach --from scene:/Prospector --to 14.2,4,3.1` (or the name the buyer or the gym profile binds), with no `--profile` because the gym field's default profile comes from the place's rules; the point argument is Navigation's own `NavigationPoint` parser, so Core changes nothing |
| world | `places gym-start` completes after the place's layers are loaded and raises a loaded event naming the place and its world instance, which bridges subscribe to; `Navigation.Places` uses it to build the gym field, with the place's rules naming the default profile |
| world | Studio.Content's gym profile spawns a playable character of the game, names the spawned object, and the name is stable, so a scene reference or a bound name finds it (RedTeam 7.7 item 5: the name is Studio.Content's) |
| roadmap | L7's "surface case query seam" reads "voxel sample read seam"; N1 is a spike in the spike window; N2 to N5 and N9 follow the Corsairs milestone and precede any Corsairs launch (decided 2026-10-24); no Navigation epic is on the Saboteer milestone |
| unity | Navigation depends on Burst, Collections and Mathematics, declared as packages; floor 6000.3; the 6.3 test row runs its correctness tests |
| commandline | `ReachableDepositsCheck` is `internal`, has no door, carries the registration attribute and implements `IDefinitionCheck<PlaceDefinition>`, is registered from the editor half of the Places bridge (`Spellbound.Navigation.Places.Editor`, compiled only when Places is installed; decided 2026-10-24), not from the runtime `Navigation.Places`; the report's `checks:` line names it `navigation.reachable-deposits (Navigation)` after `PlaceDefinition (Places)`, and `RunsWhileEditing` is no |
| commandline | The scenario steps that run `navigation` lines (7, 12, 15) and the `core validate --drafts` report with the reachable-deposits line work when N2 and N5 land, after the Corsairs milestone; before it they are skipped (decided 2026-10-24) |
| roadmap | Navigation: N1 in the spike window; N2, N3, N4, N5, N6 and N9 (51 stories) after the Corsairs milestone and before any Corsairs launch; N7 and N8 backlog; 67 stories in all, unchanged by checkpoint 5; dates are estimates |
| world | W9 (`WorldForge.Navigation`) and the deposit check wait on N4 and N5, so they land after the Corsairs milestone; Places exposes `PlaceDefinition`'s harvestable layers, entrance and rules (the default movement profile) on its public surface so the Places bridge's editor half compiles against it |
| art | The footprint check skips itself until N5 lands, after the Corsairs milestone; Art's own milestone work does not wait on it |
| runtime | The follower and the crowd advance in the world instance's own step; the field takes a `ReferenceFrameId` from Core's `ReferenceFrameDirectory` of its world, and the binding of a body to a reference frame stays in Character.Body |
| runtime | N6 builds a field per `ReferenceFrame` and a link between two fields (a gangplank); it needs Core's `ReferenceFrameId` and directory (L2c) and Character.Body's binding of a body to a frame (checkpoint 5) |
| roadmap | N6 (the roadmap's NV6, 5 stories) is placed after the Corsairs milestone and before any Corsairs launch, with its first story proving a path across a moving deck; the pre-launch Navigation work is N2 13, N3 8, N4 10, N5 9, N6 5, N9 6, 51 stories, plus N1's 5 in the spike window (checkpoint 5) |
| networking | Navigation reads neither the tick rate nor the fixed step; both are settings read once, starting at 20 and 50 a second, and nothing here is derived from either (checkpoint 5) |
| commandline | The report's checks line for this area is `PlaceDefinition (Places), navigation.reachable-deposits (Navigation)`; the check's `RunsWhileEditing` is no; the table row for `navigation.reachable-deposits` stands (checkpoint 5) |
| line | None: nothing here disagrees with the decided line |

## 13. Claims from other areas, answered (round 2)

| From | Claim | Verdict | Change |
|---|---|---|---|
| commandline | Path and explain operations | Accepted, amended | The operation is named `why`, the query stays `Explain`; a failed `path` prints the explanation. `probe` added with the living claim |
| runtime | Same GeoForge queries, separate seams | Accepted, amended | The seam is Navigation's own, not consumer-owned; Navigation shares no type with Character. Stated in the bridge row |
| world | A Navigation route sink; LineRouter adopts a grid A* | Amended | No sink type: a route becomes capsule-line tag volumes in `WorldForge.Navigation`. LineRouter stays; the shared search is optional after N3 measures it. A sink or a second A* would be a new system beside the field |
| living | UnderwaterGame step and a probe operation | Accepted | One story in N2 (60 stories); `probe` in N5 |
| unity | Footprints from `PartitionRows`; proxy consequence only while awake; proxy never renders | Accepted, amended | Rows give the footprint for every placed instance; the state is the row's state column, answered by `unity` at checkpoint 4 |

## 14. Claims from other areas, answered (checkpoint 3 claims pass)

| # | From | Claim | Verdict | Change |
|---|---|---|---|---|
| 1 | orchestrator, RedTeam 4 item 1 | Spell every operation in area 2's grammar | Accepted | Already applied in the review pass; re-checked line by line. Residue found and fixed: an "explain query" in the scenario table is a `why` query. Every example is `spellbound_run --line "navigation <operation> ..."` with the status word first; `Explain` stays the method name behind `why` |
| 2 | orchestrator, item 12, from art | The footprint fit is shaped as a ValidationReport | Accepted | `FitFootprint` returns Core's `ValidationReport`, with a Navigation-owned finding code, the asset path as subject and the shape or portal as location. Section 3 shows the output |
| 3 | orchestrator, item 11 | N9 is mine and the table carries it with dependencies | Accepted | N9 stays at 6 stories; its row and the note under the table name N2, N3, `line` (L2, L4) and `runtime`, and what waits on it |
| 4 | commandline | Definitions use the authoring contract with no version or migration; operations are `path`, `reach`, `why`, `field`; results start with the status word | Accepted, amended | Profiles and footprints implement `IAuthoredDefinition`. I keep `probe` (accepted at 2b, from living) and add `fit-footprint` (claim 5); both are listed as claims for the commandline table to confirm, since its set is a proposal each owner confirms. No `navigation validate`: `core validate` serves the assets |
| 5 | art, P1 | Register a fit-footprint operation in Core's registry returning a ValidationReport, naming which kind of piece it applies to | Amended | Registered as `navigation fit-footprint`. It does not name a kind of piece: that is ArtPipeline's word and Navigation has none (a stranger's racing game has no building pieces). It applies to a subject by what the subject carries, and says `succeeded: no footprint on <path>` when it carries none. If ArtPipeline needs the kind named, it names it in its own call |
| 6 | world | WorldForge emits shape, tag and priority and never navigation data; it may call Navigation's validator through `WorldForge.Navigation` (W9); GeoForge publishes the run-list read and the change and residency event in W2 | Accepted, amended | The validator is `CheckReachability` in Runtime, not in `Navigation.Places`, so `WorldForge.Navigation` calls it without referencing the Places adapter, and a heightfield farm with no Places uses it too. W9 waits on N4 and N5; N2 waits on W2 |
| 7 | workflow | N1's go or no-go stays a Decision issue that blocks N2; N1 starts from a repo made by the template after the probe | Accepted | N1's row says so; N1 depends on `workflow` (WF2's first four stories); N2 depends on the issue being closed |

None of these contradicts the amended line.

## 15. Claims on this area, answered (checkpoint 4)

| # | From | Claim | Verdict | Change |
|---|---|---|---|---|
| 1 | RedTeam 7.7 item 5, mine on Studio | A stable name for the spawned body | Stands, as a claim on Studio.Content | Section 12 claims: Studio.Content's gym profile spawns a playable character and names the object |
| 2 | RedTeam 7.7 item 5, mine on area 5 | A place-loaded event from the gym start | Stands, as a claim on World | Section 12 claims: `places gym-start` raises it; the gym is respelled as area 2 asked |
| 3 | RedTeam 7.7 item 10, from the developer | `ReachableDepositsCheck` over `PlaceDefinition`, reported with `failed` | Accepted, the assembly is `Navigation.Places.Editor` (decided 2026-10-24) | Section 3, "The check seam, worked"; N5 gains one story |
| 4 | Developer, question 29 | Navigation after the Corsairs milestone, before any launch | Accepted | Sections 8 and 9 |

### Claims of the checkpoint 4 round, answered

| # | From | Claim | Verdict | Change |
|---|---|---|---|---|
| 1 | orchestrator, RedTeam 7.7 item 5 | Confirm my text matches what I asked of area 2 and area 5 | Accepted, one amendment | Area 2's two lines read `navigation reach --from scene:/Prospector --to 14.2,4,3.1` and my text says so (section 3, the reach arguments). What I asked of area 5 was a loaded event with the place; world's answer also names the world instance, and a field is per world instance, so the claim now says both (section 12 claims, section 3 gym paragraph). The stable name stays a claim on Studio.Content |
| 2 | commandline | `ReachableDepositsCheck` implements `IDefinitionCheck<PlaceDefinition>` in Navigation's editor assembly, in the part compiled only when Places is installed, with the registration attribute; no public surface or door; confirm the assembly name | Amended | Class `internal`, attribute `[RegisteredDefinitionCheck("navigation.reachable-deposits")]` (area 2's attribute), no door, `Check` and `PreviewLines` as area 2's row says (section 3 code). One assembly cannot be partly compiled, so the name I confirm is a second editor assembly, `Spellbound.Navigation.Places.Editor`, beside the Places bridge; `Spellbound.Navigation.Editor` holds nothing that names Places. The thread's word was Navigation.Editor, decided 2026-10-24, not a change of the line |
| 3 | commandline | The scenario reach lines read `navigation reach --from scene:/Prospector --to 14.2,4,3.1`; the spawned body keeps a stable scene name | Accepted | Already the text of section 3. The point parser reads a scene reference, so the body's name must be stable: Studio.Content's gym profile names it (claim in section 12) |
| 4 | world | Places raises a place-loaded event naming the place and its world instance; `Navigation.Places` builds the gym field from it; the check produces the `failed:` finding in area 2's format | Accepted | Section 3 gym paragraph and the `Navigation.Places` row say the event names both; the finding format is the section 3 output |
| 5 | living | The check ships over `PlaceDefinition` through the seam and reports `failed:` first when deposits are unreachable | Accepted | Already so; the report's first word is `failed` because the call was valid and found a fault |
| 6 | unity | `RegionRows` is the `PartitionRows` view; the State column is written by one call that raises the partition version | Accepted | Renamed everywhere. Because the state is now a column, a sleeping door's state is exact and the limit about a door reverting to its default is gone; only the link price still comes from the awake proxy, so a sleeping door carries the footprint's default price for its state (section 3 cost paragraph, section 4 row, section 10) |
| 7 | ui | `ReachableDepositsCheck` is internal with no door; Places never imports Navigation | Accepted | Same change as claim 2. Places names no Navigation type; the editor half of the Places bridge references both, as every bridge does |

Epic table after this round: unchanged. 67 stories; the assembly split is inside N5's check story; nothing is added or removed.

## 16. Claims from other areas, answered (checkpoint 5)

| # | From | Claim | Verdict | Change |
|---|---|---|---|---|
| 1 | commandline (RedTeam 8.8 item 4) | Respell the report's checks line as `<name> (<Package>)` with the type's own validation first; confirm the registered name `navigation.reachable-deposits`; set `RunsWhileEditing` to no; the assembly is `Navigation.Places.Editor` | Accepted | Section 3 prints `checks: PlaceDefinition (Places), navigation.reachable-deposits (Navigation)`; the registered name is confirmed as proposed; the attribute leaves `RunsWhileEditing` at its default, no, because the check builds a field of the whole place; the assembly is `Spellbound.Navigation.Places.Editor`, decided on 2026-10-24 |
| 2 | commandline | `ReachableDepositsCheck` implements `IDefinitionCheck<PlaceDefinition>` in `Navigation.Places.Editor`; CL8 skips steps 7, 12 and 15 until N2 and N5 land and detects the check by the token `navigation.reachable-deposits` in the checks line | Accepted | Already the text of section 3. Added there: the token is how a script detects the check, and the three steps are skipped until N2 and N5 land. N2 and N5 are both after the Corsairs milestone, so the skip holds through it |
| 3 | world | The gym walk-through carries no navigation line until Navigation lands; `navigation.reachable-deposits` lives in `Navigation.Places.Editor`; W9b waits on W4c, which now follows Saboteer's milestone | Accepted | Section 3 gym paragraph says the walk-through carries no `navigation` line and that W4c and W9b order is world's. W9 and the deposit check already wait on N4 and N5, so a later W4c moves nothing in this area; no Navigation epic changes |
| 4 | ui | `ReachableDepositsCheck` is in `Navigation.Places.Editor`, registered as `navigation.reachable-deposits`; before Navigation lands the checks line has no Navigation entry and ReportView draws none | Accepted | Already the text of section 3 (the check example, the registered name, and the absence of the entry as the sign the check did not run); nothing in Navigation draws a report, so ReportView's behaviour is ui's |

Epic table after this round: 67 stories, unchanged in size. N6 moved from the backlog to the work after the Corsairs milestone and before any launch (51 stories there with N2 to N5 and N9); N7 and N8 stay in the backlog. Open decisions: none.
