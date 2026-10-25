# The Spellbound package line: the binding line text for people and agents (2026-10-24)

What this is: the rules, the packages and the conventions of the whole line, for any person or agent working in any repository of the organisation. Read it in full before you build, review or extend anything on the line. The executive brief and the roadmap sit beside it.

## Header

- Load the skills `library-design` and `lead-engineer` for a build session, `design-pitch` for a deeper pitch, `red-team` for a review.
- Every rule in this file is decided and not to be asked again. Nothing here is a proposal.
- Anything this file leaves open becomes a setting with a sensible default. The default is named in your report; you do not stop to ask. The exceptions are the stops this file names: a spike or probe that ends in a written go or no-go, and a listed job that breaks its budget in deterministic float mode, which goes to the developer as a decision with the figures and never into a check as an exemption.
- The game is Saboteer. Only the Unity project folder `SaboteurDev` keeps the old spelling.
- Nothing is pinned, ever. No plan, script or manifest line assumes a fixed package version. Two or more people work in a game project at once. Every date in the plan is an estimate the developer is not bound by.
- Where a fact below could have changed since it was read, or was never run, it says "verify before building on it".

## What a session building on the line owns

- Every line that ships, in the package and in the game it touches.
- Regressions: a step is not done until the behaviour the line had before still holds, walked against the step's regression contract.
- The look and the feel of anything a person sees or plays. A person judges them; you give them what to judge.
- A gap in a package is raised and never worked around. Name the gap, name the package, stop. Do not reimplement the missing piece in a game or in Studio.
- A game never edits a package. A package is edited only in its own dev project (`<Name>Dev`), then published, then the game updates its manifest.
- A new system is raised before it is written. If extending what exists cannot do the job, say which gap, then stop.
- No new technology, dependency, serialization format or third-party library without the developer's say. No JSON anywhere.
- Git belongs to the developer. You never add, commit, push, tag, reset or check out; reading status, log and diff is fine. When your work is done you say "ready to test" and stop.
- No comments, no XML docs and no summary blocks in code, except the one copyright line every C# file carries. No em-dashes anywhere. Names are spelled out. The opening brace of a C# block is on the same line as its declaration.
- Never edit a judgment field of `Identity.asset` or the ledger to make a rule pass: a code owner reviews every change to them. An agent may answer a lead, the answer is stamped as an agent's and a person confirms it at the tag. Only a person records a gate. A waiver ends at a version.
- Anything a person is told to run is bash.

## The kinds

| Kind | What it is | May depend on | Must not own | Count |
|---|---|---|---|---|
| Foundation | The one package every other package shares | The Unity engine modules only. No Unity package, no third party | Anything drawn, any scene object, any mechanism fewer than two packages need, any knowledge of connections | 1 |
| Library | One sold mechanism, usable by a stranger | Core; the Unity packages its sentence requires; the one third-party package its sentence names; another Spellbound library only when its sentence names it (hard) or through a bridge assembly compiled only when that library is installed (optional) | A second concern; a value a game tunes; a scene layout, bootstrap order or manager; anything the consumer cannot replace | 20 |
| Tool | An editor-only workflow with no runtime of its own | Core; a library only when its sentence names it, otherwise a bridge | Runtime code; the data format of a library it checks or authors for | 2 |
| Studio | Private, installed by our games: our one way of using the libraries | Anything, including Steam and PurrNet | A mechanism a buyer would want; a package's internals (`InternalsVisibleTo` is forbidden) | 5 packages in 1 repo |

Games are not a kind. A game installs what it needs and edits nothing.

## The line

Twenty-three packages the studio publishes (one foundation, twenty libraries, two tools) and five private Studio packages in one repo. A package is named for its one-sentence job; when the sentence changes, the name changes. The id is `com.spellboundstudios.<name lower-cased>` and the root namespace `Spellbound.<Name>`, for every package including Persistence.

The ten-minute test. A new engineer reads this section and answers these without asking anyone.

| Where does this go | The answer | Why |
|---|---|---|
| A ragdoll | Character | A body falling is a mechanism any game with bodies wants |
| The Steam lobby | Studio.Online | Glue for a service we chose, wanted by two games |
| "Whispers are pink" | Studio.Online, as a Switchboard profile asset | A value for a library seam: the studio's taste |
| The guild tab | Corsairs Isle, as its own profile | It names one game's world |
| A sync module base class | Networking, never Core | Core knows nothing of connections (rule 14) |
| A new voxel generation pass | WorldForge, never GeoForge or GeoForge Pro | One package owns generation; GeoForge turns data into meshes |
| An affix line in an item tooltip | The tooltip widget is UI's; an affix as text is Modifiers' UI bridge; which affixes show and in what words is Studio.Gameplay's | A mechanism and its value, separated first |
| A package for a new concern | A new repo from the template: one kind, one sentence, bridges pointing down only | Rule 1 |

### Foundation

**Core.** Gives every package one vocabulary: how to log, pack bytes, identify a thing, roll from a seeded stream, count steps of time, place a pose in a reference frame, measure a cost against a budget, declare an operation, and validate what a designer or an agent authors.

- Depends on: the Unity engine modules only.
- Must not own: anything drawn or spawned; a world-object framework; any console view; any Unity package (Entities, Mathematics, Burst, TextMeshPro, Input System and uGUI all stay out); anything that knows about connections or players.
- A type enters Core only when a second package needs it, it needs nothing beyond the engine modules, and it carries no opinion a game would replace. A game or Studio wanting it is not enough.
- What stays: the logger and its sinks, tallies, packing and the bit writer, FNV hashing, hash and resource registries with a provider seam instead of a fixed `Resources` path, `SingletonManager`, weighted tables, assembly scanning.
- What is new in kind, each because two packages need it and none may invent its own:

| Part | What it is |
|---|---|
| Operation registry (`[Operation]`) | The one way every package declares what an agent or a person can call. Each operation has an audience tag (anyone, authority (runs on the peer that decides), developer, or approver (held by the window, granted to an agent by one setting)); the tag is an open string with no connection knowledge behind it |
| Observation model | A package declares keys as immutable static fields and reports against an `ObservationContext` that the world instance owns. Every reporting front door takes that context as its last argument and never looks one up; a game that wants none passes `ObservationContext.Discard`. Core keeps no default context that records and no static reading. A key has a required description, a kind (counter, occurrence, gauge or cost) and, for a cost, a budget and a quality level; guards and the intent ledger belong to it |
| Simulation vocabulary | A tick, a seeded random stream with no engine call inside it, and an identity allocation seam whose default hands out ids locally (`Time.time` and `UnityEngine.Random` never appear in a simulation assembly). The seeded stream is Core's own and names its algorithm; the id zero means none; deterministic float mode applies only to the jobs the identity lists (WorldForge lists its generation and fingerprint jobs, never the awaken job), golden hashes are taken in default float mode, R0's measurement compares both modes, and a listed job that breaks its budget in the mode goes to the developer with the figures; world time is the restored seconds plus the ticks since load times the tick length |
| Tick clock | `TickClock` counts the ticks of a world. Each world instance starts its own with one call (`CoreKit.Time.StartClock(source)`, or `StartClock(TickRate.PerSecond(20))`, which builds the default source), in every game, networked or not. The clock takes its rate from its tick source (`ITickSource.Rate`) and keeps none of its own: PurrNet's tick rate when `PurrNetTickSource` drives it, the default source's own setting otherwise. The default, `GameTimeTickSource`, adds each fixed step's length to a total of game time and counts whole ticks at its rate, so the tick rate and the fixed step stay two independent settings; a rate that changes after the clock starts trips the guard `core.clock.rate_changed`. There is never a second clock |
| Reference frame vocabulary | A thing that moves and carries others is a `ReferenceFrame`, never a frame, because a frame is what Unity renders. Core holds the noun, `ReferenceFrameId`, a `ReferenceFrameDirectory` per world and an up field whose default is world up. The binding that remembers which reference frame a body stands on is Character.Body's |
| Ground vocabulary | A surface source and an occupancy query, so no package holds a sea level or a sky as a constant |
| Viewer source | Who is looking, for the packages that wake or draw things by distance |
| Authoring contract | A definition type in any package is a ScriptableObject that implements Core's validation contract. Core.Editor runs the validation and writes the one report an agent reads. Its check seam is one interface (`IDefinitionCheck<T>`), one attribute and the lines that find and run registered checks, so a package adds a check to a definition another package owns and Core never changes for a new package |
| Package identity | The `Identity.asset` every package ships, and the severity scale of a finding |
| Shared editor controls | Four controls in Core.Editor that every package's inspectors and windows share: type picker, report view, section card, header bar |
| Spellbound window | One window in Core.Editor that lists the line and installs it (rule 18) |
| Section attribute | How a package marks savable state; Persistence discovers it |

- The parse of a typed line into an operation call is pure and stays in Core; what draws the typed line is UI's.
- Compile cost, measured in the audit of 2026-10-19 (verify before building on it): no Spellbound assembly starts compiling until `Unity.Entities.Graphics` finishes, at 27.9 s of a 35.4 s wall in Corsairs Isle and 16.1 s of 20.4 s in Saboteer, because Core references it. A Core on the engine alone can start at the `UnityEngine.UI` mark, 6.4 s and 3.6 s. The gain is whole for every package project and every buyer without ECS; the games pay for about forty new bridge and presentation assemblies at 0.2 to 0.8 s of CPU each, spread across cores.

### Libraries

| Package | Job in one sentence | Hard dependencies | Bridges (compiled when the other is installed) | Must not own |
|---|---|---|---|---|
| **WorldObjects** | Gives a world its things: a preset describes a kind, an instance carries plain data, modules react to a change on every peer and resolve its consequence on the authority alone, and a spatial index wakes and sleeps instances by distance to viewers, partitioned into regions | Core, Burst, Collections, Mathematics | Networking, Places, Inventory (an item lying in the world); Instancing reads it from above | Presentation (it spawns nothing and reads no transform from a GameObject); a static world (a world instance is one of many, and each that owns a physics scene steps it once per fixed step, and a PredictionManager scene or the default scene is stepped by its owner); ids allocated locally (the authority allocates through a seam); a clock or random source of its own; a loop of instances times viewers; Entities (the store is native columns with an incremental awakening job); any game module |
| **Inventory** | Gives a game containers: slots, stacks, acceptance rules, and the definition of what an item is | Core | UI (grid binder, slot styles), WorldObjects, Networking | Equipment (Studio); what an item does when used (a module in the consumer); a protected slot writer (every change is a transaction) |
| **Modifiers** | Gives a game stats and what changes them: fixed-point stats, rolled affixes, grants, timed sets, conditions, and the resource pool | Core | WorldObjects (a stat block on an instance), UI (an affix as text spans for the detail tooltip) | Talents and skills (Studio); a combat context enum; sample assets under `Resources` |
| **StateMachine** | Gives any game asset-defined states: a machine over a context, states as ScriptableObjects swapped in the inspector, a registry that finds them | Core | none | A body, a camera, a HUD, input |
| **Character** | Gives a game a body in two assemblies. `Character.Body` is any body that moves and stands on things: it moves a capsule, finds support in any medium under any up, owns the binding to the reference frame it stands on, and is followed by a camera rig. `Character.Rig` holds things at sockets, wears pieces, animates through a seam and falls into a ragdoll, against a rig contract asset that artists export to | Core | StateMachine (the context and bindings only), Cinemachine (the rig), WorldObjects, Networking | Any concrete state (the sample has the neutral four, Studio the house set); input, which arrives through a seam. A prefab is playable when a component on its root implements the empty marker `IPlayableCharacter`; `CharacterKit.Body.IsPlayable(prefab)` answers from it |
| **UI** | Gives a game, and the editor that builds it, one kit of UI Toolkit widgets, one replaceable theme, and screens composed from them with focus, cursor and escape handled once | Core | none; the data packages bridge to it, never the reverse | Any data package's knowledge; game-shaped templates; Inventory's slot styles; uGUI or TextMeshPro |
| **Switchboard** | Gives a game text between players: scopes, delivery to the right receivers, history, moderation and typed commands routed from the text, over any transport. The name is final (confirmed by the developer 2026-10-24); the release checklist refuses the first final tag of any package whose name is still marked a placeholder | Core | UI (the text surface), Networking (the delivery bridge over the protocol assembly; the PurrNet adapter is Networking's) | A console; a second operation registry; the studio's colours, prefixes and tabs; window chrome. Moderation is a filter seam, a per-sender rate limit and a mute list, each switchable; no word lists. Where the router runs, and whether filters and the rate limit run at the sender, the router or both, is a profile setting with no default; Switchboard assumes no host answer, and Saboteer's profile runs both limits at the sender |
| **Persistence** | Saves and loads a game's state: sections any package or game declares, written as Core-packed bytes through a storage seam that never blocks the game's tick | Core | none | A static entry point; knowledge of any section's layout; a saved section without a header (name, layout fingerprint, length; an old layout is refused by name); a tick rate in a save (durations are seconds, converted to ticks at load); a migration path before the package ships to a customer; an id it cannot resolve (it reports the id and the consumer's policy decides) |
| **Networking** | Gives a networked game the sync patterns the studio writes three times today: dirty sets flushed per tick, routing a write to the peer that decides, late-join paging, a region as the unit of interest (per-player delta bookkeeping is deferred and built only if a measurement asks), sending pooled buffer views and never arrays, with ids as leases. Who may write each replicated thing (owner, host, server) is a configuration per thing. Everything in it is created by one world instance and serves only that world (the hub, the region streamer and its interest map, the lease issuer and table, the reference frame identity map, the clock schedule, the event link and the ledger): nothing is static and nothing covers the process, except the join and resync budgets, which are per world unless the server sets a process budget as the cap over the sum. A lease block's upper bound is written durably, outside the sliced world save, before any lease in it is granted, so a restarted shard never reissues an id a persistent world saved. It is a protocol (`Spellbound.Networking.Replication`) with no PurrNet type in its public surface, and PurrNet is the default adapter (`Spellbound.Networking`, a bridge in the same repo) | Core | PurrNet (the default adapter); the eight packages that bridge Networking (WorldObjects, Inventory, Character, Switchboard, Diagnostics, GeoForge, Decals, TetherShop) target the protocol assembly, never the adapter | Connection knowledge in Core; a default authority or a validator the owner mode requires; a second clock; the physics step; prediction (each game's choice); a Steam type or a PurrNet connection as a player key; a lobby service; what PurrNet owns (transport, RPCs, ownership, spawning, who observes an identity) |
| **Diagnostics** | Collects what every package reports through Core's observations, shows it while the game runs, records it to a session file, and relays it from clients to a host through a transport seam | Core | UI (the overlay), Networking | The studio's endpoint and credentials; the profiler dump path; any package's own meters |
| **GeoForge** | Turns a density field into meshes: octree chunks, marching cubes with Transvoxel seams, edits of any shape, materials, and queries of voxels, materials and surface cases | Core, Burst, Collections, Mathematics | Navigation (Navigation.GeoForge, hosted by Navigation, reads signed voxel samples through GeoForge's run-list read and change event), Networking (the voxel edit store), Places (a voxel layer, its stamper, and the editor that captures a scene region and bakes it) | A world plan or generation passes (WorldForge); sculpting (Pro); a demo controller; a fixed chunk presenter (the GameObject renderer and collider are a default a consumer replaces) |
| **GeoForge Pro** | Paid authoring over GeoForge: editor sculpting, voxelising any mesh, optimisation. The line places it by its sentence and does not redesign it. It requires Entities and compiles against GeoForge's blob tables, which W2c removes, so from W2c its catalogue line carries the status `held` and names the last GeoForge tag it compiles against: the window installs it only against that tag and says so, and the release train, the pair matrix and PackageCheck's line rules skip a held package. A Pro pitch is undated | GeoForge | none | Generation passes and point-of-interest carving, which are WorldForge's |
| **WorldForge** | Plans a world and generates its data from any source (noise, authored data, places) and hands each kind of data to the package that builds it | Core, Burst, Collections, Mathematics | GeoForge (density out), Places (places as a source), WorldObjects (placement records out), Navigation (roads, rivers and water out as tag volumes; the reachability check called through WorldForge.Navigation) | Meshing; distant terrain drawing; presentation; Entities; a sea level or a direction of up as a constant |
| **Horizon** | Draws the world beyond the loaded terrain from any shape source it is given, with a smooth configurable hand-over where near terrain begins, at any world size | Core, URP | GeoForge (implements the near-terrain extent) | The shape itself (a shape source seam with a heightmap default); meshing near terrain; a world plan |
| **Places** | Gives a game authored units of content: a place is a bag of typed layers each stamped by the package that owns the layer, composed from parts by adjacency rules or by hand, nested, duplicated with every reference updated, stamped into the world or into a named reference frame (an object layer as reference-frame-local records; a voxel layer cannot be, and that stamp is refused with a finding), validated and previewed through Core's authoring contract, and played alone in a gym | Core | GeoForge, WorldObjects and any consumer bridge to it to register a layer type, its stamper and its editor; Navigation, WorldForge and Instancing read it from above | Any layer's data format or editor (a layer whose owner is not installed is carried in the asset only, never in a pack, and is reported by the check `places.layer-owner-installed`; W4a's first story proves the data survives a save of the asset, and until it passes the place opens read-only; a pack of such a place is refused with `places.layer-not-installed` naming the layer); terrain generation; a stand-in character in the gym (Places ships a neutral default gym profile that spawns the prefab the project names, and refuses with "no gym character is set" when none is; Studio.Content's profile offers the studio's playable characters; a game's own profile wins inside its project); the upload route for player captures |
| **Navigation** | Finds paths for any mover through any space described to it: surfaces within a slope, any surface, open volume, solid volume, and the built things in it, with a path follower, a crowd registry and local avoidance as replaceable defaults | Core, Burst, Collections, Mathematics | GeoForge (the space source), WorldObjects (built things as blockers and doors), Places (a place read into a field, the gym field), Character (`Navigation.Character`) | A creature's decision what to do with the path; terrain data of its own (a grid and a heightfield are the default sources); a mesh or Unity Terrain rasteriser or a wrapper of Unity's NavMesh; a creature name in Runtime; anything saved or replicated. Its follower and crowd advance in the world instance's own step. Its check for unreachable ore lives in `Navigation.Places.Editor`, an assembly compiled when Places is installed |
| **Instancing** | Draws very many copies of a few things from data through Unity's BatchRendererGroup: grass, pebbles, trees at range, with culling, levels of detail and the hand-over to a live object nearby. It holds one small culling routine of its own (distance and view cone, level of detail by distance, no fade between levels, no occlusion culling at first) | Core, URP, Burst, Collections, Mathematics (no backend seam) | WorldObjects (a far representation of a sleeping instance), WorldForge, Places (a scatter layer) | Simulation; what an instance is when awake; Entities |
| **Decals** | Paints decals at runtime on any surface: a record store with a spatial index, an authority seam, and a render backend seam with a URP default | Core | URP (the default backend), Networking | Content |
| **Volumetrics** | Draws participating media: fog, clouds and the shadows through them as ordered stages under a quality budget, with the cost of every stage shown | Core, URP, Burst, Collections, Mathematics | Diagnostics | A sun that points up by default; a land world |
| **TetherShop** | Simulates ropes and chains: segments, attachments and sockets, rest and taut states, a tube renderer, and level of detail down to a rope that only looks like one | Core | WorldObjects, Networking | Game-named attachment kinds (Elevator, Winch, Load live in the sample); elevator rider tracking |

### Tools

| Package | Job in one sentence | Depends on | Must not own |
|---|---|---|---|
| **ArtPipeline** | Exports art, a model or a texture: checks the export against the rules a project declares (rig, sockets, worn pieces, materials, scale), fixes what it can, runs Character's ragdoll builder as a check so the artist sees the body fall, and sends the asset on through a destination the project declares with one button | Core; bridges Character | The rules' values (a game's own assets, with Studio.Presentation's as defaults); the destination (Studio.Tools: an artist pushes a branch and a GitHub Action opens the pull request; Send sends only the files the artist changed under the art folders); runtime code |
| **PackageCheck** | Runs the line's bar against a package: every rule a package must meet as one operation, `packagecheck check`, from the editor or the command line | Core | The rules' subjects (it checks, it never authors); runtime code |

### Studio, private

One repo, `StudioDev`, five packages by dependency cluster, ids `com.spellboundstudios.studio.<cluster>`. A Studio package is created only when its dependency set differs from every existing one. A cluster is opt-in per game: a game that writes its own skill system takes Studio.Online and leaves Studio.Gameplay out, and no library changes for it. Studio follows the same dependency rules as libraries and keeps presentation in a `!UNITY_SERVER` assembly, so a dedicated server installs Studio.Gameplay without UI and Studio.Online without Steamworks.

| Package | Holds | Depends on |
|---|---|---|
| **Studio.Gameplay** | Equipment (slots that grant modifiers while worn), skills, talents, the studio's item tiers; the talent tree window and the item tooltip lines in a UI bridge | Inventory, Modifiers, WorldObjects; bridges UI |
| **Studio.Online** | The PurrNet `NetworkManager` prefab, scene flow, the Switchboard profile (tabs, colours, `/r`), the telemetry endpoint and dump route, the upload route for player captures; the Steam bootstrap and lobby in a Steamworks bridge | Networking, Switchboard, Diagnostics; bridges Steamworks |
| **Studio.Presentation** | The theme, the window chrome, the HUD default layout and the menu chrome; the art rules asset in an ArtPipeline bridge | UI, Persistence; bridges ArtPipeline, and the art bridge also needs Character for the rig contract instances, so it compiles when both are installed |
| **Studio.Tools** | Release audit, profiler dump, game view capture, portrait rigs, Synty helpers, the house operation set, the art destination (git with LFS), templates, skills, and the text of the copyright line | Editor assemblies of anything |
| **Studio.Content** | Places both games share, named for neither; the gym profile offering the studio's playable characters; the studio character (a Studio.Content controller component over Character.Body carrying `IPlayableCharacter`, with the neutral four states imported from Character's sample, and the house set from Studio.Gameplay only through the bridge); the studio commands; the board generators (cave rooms, grids, ramps) that name no game, which Saboteer configures and Corsairs Isle nests inside one of its places. They are the studio's: a stranger that wants a grid generator writes its own over Places' public surface. A Corsairs Isle place or a Saboteer board stays in its game | Places, Character; Studio.Gameplay only through a bridge assembly that holds the ability-granting commands |

Studio.Content is edited in `StudioDev` and nowhere else. There is no embedded copy of a Studio package inside a game and no button that edits one; a game repository whose Packages folder holds a Studio package fails the shared check. A designer opens the place in `StudioDev` with the studio's playable character in the gym, pushes, and presses Update in the game. Until the window's Update exists (LV6m) a pushed Studio change reaches a game by re-adding the package line through the Package Manager, which is the same text; until the gym exists (W4c) a shared place is played in the game.

### Deleted, renamed and not packages

- WorldSystem and Stats are deleted. The `useWorldForge` toggle goes with WorldSystem.
- Four names changed because their jobs did: Chat became Switchboard, Controller became StateMachine and Character, VolumetricFog became Volumetrics, and Core's object folders became WorldObjects. Persistence keeps its name and takes the studio id.

| Candidate | Where it went | Why |
|---|---|---|
| The console | Registry and parser in Core, the text surface in UI, our commands in Studio.Tools and the games | A console is an operation registry plus a text view; both have an owner |
| The chat window | UI's text surface, fed by Switchboard through its UI bridge | A window is a widget; what it shows is Switchboard's data |
| Tooltips | UI (the widget, alt-hover detail, placement); Studio.Gameplay (the affix lines) | A mechanism and a value, separated |
| Equipment, skills, talents | Studio.Gameplay | Inventory and Modifiers sell the mechanisms; our use of them is Studio |
| Ragdoll | Character | A body falling is a body's concern |
| Culling | Instancing (drawn things) and WorldObjects (simulated things) | Two different things were called culling |
| Telemetry | Core reports, Diagnostics collects and relays, Studio.Online knows the endpoint | Three homes for one word |
| Items | Inventory owns the definition; WorldObjects owns an item as a thing in the world through its Inventory bridge | What an item is belongs with what holds it |
| Input | No package. Each package takes input through a seam; Unity's Input System is the consumer's | Nobody owning it is the cure |
| Vehicles and sailing | Nowhere until a game asks. A deck a body stands on is a reference frame (Core's noun, Character.Body's binding) | No game has asked for a vehicle package |
| The template repo, the CI workflows, the release scripts | Infrastructure repos, never packages | They ship nothing into a project |

## Rules of the line

1. **One sentence, one owner.** A package owns what its sentence says and nothing else. Two sentences never cover the same noun.
2. **Dependencies are named in the sentence.** A library depends hard on another Spellbound library only when its sentence names it (GeoForge Pro on GeoForge). Everything else is a bridge: an assembly inside the package, compiled only when the other package is installed, through `versionDefines` in the assembly definition. A bridge's `versionDefines` expression names the range of the other package it was written for, so a version outside the range compiles the bridge out, and the Spellbound window's Package page shows the bridge as inactive and names the range it was written for. PackageCheck's rule D3 checks in the dev project that every bridge has a bounded range equal to the range in its catalogue row. PackageCheck also installs every bridge pair at their latest versions, compiles them together and asserts that each bridge's version define is set there, so a dependency major that leaves the bounded range turns the test red instead of compiling the bridge out: that is the line's compatibility test. Installing a package never pulls in a package its consumer does not use. Networking follows the same rule: it depends on Core and bridges PurrNet, so its protocol assembly carries no PurrNet type, and all eight packages that bridge Networking target the protocol assembly.
3. **Bridges point down or sideways, never up.** The layers: Core; the mechanisms (WorldObjects, Inventory, Modifiers, StateMachine, UI, Switchboard, Persistence, Networking, Diagnostics, GeoForge, Places, Decals, Volumetrics, TetherShop); the composers, which read several mechanisms (Character, WorldForge, Navigation, Instancing, Horizon); the tools; Studio. A bridge lives in the higher package and references the lower, so no cycle can form. Between two packages of the same layer, the one whose data crosses hosts the bridge (`Inventory.UITK`, `GeoForge.Networking`, `GeoForge.Places`). UI, Networking and Persistence never host a bridge to a data package, so they never learn its name.
4. **Core grows only for a second package.** A type enters Core when two libraries need it, it needs nothing beyond the engine modules, and it carries no opinion a game would replace. Games and Studio do not count. Core holds vocabulary, never a binding or a behaviour a game would tune. Core's whole surface is reviewed against this rule at every Core major.
5. **Unity packages are allowed where the sentence needs them**, declared in `package.json` as floors. The floor is Unity 6000.3. The studio edits on 6000.4.8f1 and moves to 6.7 when it ships. A floor compile on 6000.3 runs now in the push gate and the local gate, and every package's tests run on 6000.3 and on the editor the studio uses. When 6.3 support ends (December 2027, before any package's first final tag), the floor moves to 6000.7 and the 6.3 row is dropped; after the first final tags the floor moves only at a Core major, never inside one, so an Update inside a major never asks a buyer for an editor they do not have. No epic waits for 6.7. A Unity feature newer than the floor is used only inside a bridge whose version define names that Unity package or module. Burst, Collections and Mathematics are declared packages for any library whose sentence has a hot loop (WorldObjects, GeoForge, WorldForge, Navigation, Instancing, Volumetrics). URP is a hard dependency of Horizon, Instancing and Volumetrics with no backend seam, and Decals' default behind its seam. Cinemachine is a bridge in Character. The Unity Pipeline package is a bridge in Core for the command line (`Spellbound.Core.Pipeline`, compiled when `com.unity.pipeline` is installed). Entities is nowhere in the line: WorldObjects' store is native columns and Instancing draws with BatchRendererGroup. The working project of a game or a package is never opened in a Unity newer than its `ProjectVersion.txt`, except in a Move story (MV, and each later LTS move), which a person runs and which updates `ProjectVersion.txt`; otherwise a newer Unity opens a throwaway copy, once.
6. **UI Toolkit only.** No package references uGUI, TextMeshPro or IMGUI for anything a player sees. Editor code that is new, or touched, is UI Toolkit; the two old-style inspectors (Core's log settings and GeoForge's material table) are rewritten in it, in UI7c1's first two stories; the identity asset's inspector is built new with the Core.Editor controls, not rewritten.
7. **One third party per package, named in the sentence.** PurrNet in Networking, Steamworks in Studio.Online. Nowhere else.
8. **A name is the job.** When a package's sentence changes before 1.0, its name changes and every consumer is updated in the same change, with no alias, shim or `MovedFrom`. After 1.0 a package whose sentence changes is retired: its catalogue line says retired with a plain note naming what replaced it, and a new package takes the new sentence.
9. **Every package ships the same parts**: `Runtime` where the kind has one, `Editor`, `Tests` (edit and play), `Samples~` (always), operations declared through Core, the AI context that reaches a consumer's project without copying (an `AGENTS.md` with generated operation blocks), an identity asset, a committed surface file, a documentation index, and the copyright line on every C# file. Every door that reports takes the observation context as its last explicit argument, and a caller that wants none passes `ObservationContext.Discard`. The front door is `<Name>Kit`; a bridge assembly with a public surface carries a second door, `<Package><Other>Kit`, which `core context` lists. A default a consumer needs to run the package lives in `Runtime` as a replaceable default; an opinion lives in `Samples~`. Core ships an operation that imports a sample. A package lives at `Packages/<Name>` in its dev project, an embedded package cloned and edited in place.
10. **Studio compiles against public surfaces only.** When Studio needs something a package does not expose, the package is missing an extension point. That is a package story, never `InternalsVisibleTo`. Studio.Content is edited in `StudioDev` only, and a game repository whose Packages folder holds any Studio package fails the shared check.
11. **Nothing predicts, everything allows it.** WorldObjects separates change from consequence and keeps no presentation; Networking carries ticks and sequence numbers; nothing in Core knows a connection. A game that never predicts pays nothing. PurrDiction's manager steps the physics of a world it predicts, and the world instance's driver leaves that scene alone; where a process holds one world on Unity's default scene, Unity steps that scene as usual and the driver steps nothing. If a process turns off Unity's automatic physics step, the driver steps the default scene, and the exact setting is verified before building on it.
12. **Presentation is its own assembly and never compiles on a server.** A package that both simulates and draws (WorldObjects, Character, GeoForge, Decals, TetherShop, Navigation through its Debug assembly, Switchboard through its UI bridge, the Studio packages) keeps the drawing in an assembly constrained `!UNITY_SERVER`. Every assembly that references one carries the same constraint.
13. **No package relies on domain reload.** Static state is reset explicitly on play mode entry and nothing scans `AppDomain` at static construction. Listing loaded assemblies goes through one internal call so Unity's replacement is one edit.
14. **Core knows nothing about connections.** Which players are connected, what each has received and any per-player bookkeeping live above Core, in Networking. Core offers pure operations networking code uses, such as packing a value or encoding a difference. No library takes a Steam type or a PurrNet connection as a player key; identity is Core's opaque id, and Steam resolution lives in Studio.Online's bridge.
15. **Before 1.0 and after.** Nothing is kept for compatibility until a package ships to a customer: no old packing reader, no `core migrate`, no section migration, no redirect table, no format version kept as a compatibility path, no `FormerlySerializedAs`. A breaking change means re-save, re-author, re-import. Until then a package releases from the `beta` branch as `1.0.0-beta.N`. Core, public already at 1.1.9, takes a baseline tag `v1.1.9` and releases the rewrite as `2.0.0-beta.N`; every other existing package is at `0.x` and its first release is `1.0.0-beta.1`. The day a package ships to a customer it is 1.0 (Core 2.0), and from then semantic versioning governs, full stop. A breaking change is a major. A renamed, retyped or removed serialized field of an authored type is a breaking change and a major, whether or not the old name is kept, and the release check fails a lower bump; the authored-key scan treats a key named by `FormerlySerializedAs` on a current field as known and reports it as information (`core.renamed-key`), never as an error. A changed or removed stored-format line is a major too. A game sold to players is a customer from its first release built on the line; the Next Fest demo is exempt. A game sold to players ships only after the final tags of every package it installs exist, so every removal the game still needs lands before that release (the plan dates Saboteer's first Steam release after Core's ECS, GeoForge's blob tables and Saboteer's Entities are gone, estimated June 2028). From that release a player's old saves keep loading: Persistence upgrades them on its own, and a customer may extend that for their own players however they like.
16. **The release promise to a buyer.** A buyer installs a released tag. The line makes a major about every 12 months. A buyer on the previous major is offered the upgrade at a reduced cost (verify before building on it: whether the Asset Store offers upgrade pricing for a UPM product). Inside a major there is a year of bug fixes and maintenance and no API break. Pull requests land on `beta`, before and after a package's first stable release; a person moves `main` to each release. A breaking change waits on `beta` for the next major and never reaches a maintenance branch. The maintenance branch of a major is `release-<major>`, named for the Core major, cut in every repository when that Core major's final tags are made and protected like `main`; a shipped game's manifest moves to it on the game's first release. A pull request into it runs the surface compare and fails any removed or changed public, stored or serialized line, and refuses a title carrying `!`. The tag gate compares a final tag with the `range` of its branch's entry in the release configuration, which is the package's own current major (Inventory at 1.x carries `range: 1.x` on `release-2`), never with the number in the branch name, and refuses a tag whose surface differs from the previous tag of that major by anything but additions; the branch name, the range and semantic-release's behaviour on them are verified by WF4's first story. A fix reaches a buyer on the previous major through the catalogue: the final tag cut from `release-<major>` becomes that package's known-good line for that Core major once the strangers pass on it, tag mode offers it to every buyer on that major, and the Matrix runs once for each supported Core major. The 12-month cadence is a target the release calendar shows; no check fails on it, and the reduced price is a term of the listing.
17. **How a project follows the line.** One project setting, committed, holds one of three modes. Tags (every buyer's mode): the Spellbound window installs the catalogue's known-good released tag for the installed Core major, written `#v<version>`. Branch (a project the studio works in while a game is in development): `#beta`, before and after a package's first stable release, because that is where pull requests land; `main` only moves at a release. Maintenance (a shipped game): `#release-<major>` for the Core major the game shipped on, never `main`. Update re-adds the line so Unity moves the lock file's commit. The previous major's branch is kept for one Unity LTS cycle; when its cycle ends, a shipped game moves to the current major's `release-<major>` in a Move story that runs Persistence's save upgrade against the new layouts.
18. **Core ships the Spellbound window.** Core.Editor holds one window, `Window/Spellbound`, with pages Line, Package, Operations and Drafts (PackageCheck adds Check, UI.Editor adds Console and Gallery, each found by an attribute). Once an Asset Store listing exists (undated, after both games), it also greys out a paid package the project does not own and links to its store page; until then every package installs from its git address and the catalogue has no store column. It lists every package, shows what is installed and at which version, installs or updates a free package in place through `PackageManager.Client.Add` from a git URL with a path and a ref, opens documentation and samples. It never opens a modal. It plans a Core major from the Core ranges of the installed packages and offers none until every installed package has a tag for it. The package list is one public text file, `Catalogue.txt`, fetched from GitHub: the studio never leaves GitHub and owns no address of its own. Every other package carries a `Bootstrap` assembly with no references that offers to install Core when it is missing, and every assembly that references Core is constrained on Core's define. Git 2.14 or later must be on the PATH; no file a package ships is in Git LFS.
19. **Core's clock and the two cadences.** The tick rate and the physics fixed step are two settings read once at start. Nothing is derived from either as a constant, and changing either changes no code. The starting values are 20 ticks a second (PurrNet's) and 50 fixed steps a second (Unity's). The tick rate lives in one place, the tick source: with PurrNet, `PurrNetTickSource` drives the clock at PurrNet's tick rate; without it the default `GameTimeTickSource` counts whole ticks of game time at its own setting, never one tick per fixed step, so a game with no network starts the clock at 20 and gets 20. Each world instance starts its own `TickClock`. What needs a tick (timed modifier sets, scheduled events, the ledger's grace time, a world's elapsed seconds, a flush) counts ticks; what needs a step (bodies, riders, reference frames) counts fixed steps. Each world instance that owns a physics scene steps it once per fixed step, passing `Time.fixedDeltaTime` to `Simulate`. With one world on Unity's default scene Unity steps physics and the clock still runs. A scene that holds a PredictionManager is stepped by the manager, and the driver leaves it alone. Networking steps nothing and only delivers messages. After a hitch physics may fall behind the clock; the lag is reported per world as `physics_behind_clock`. A forced catch-up is held for a later discussion and is not ruled out.
20. **Who may write is a configuration.** Owner, host or server is set per replicated thing, with no privileged default and no validator the owner mode requires. A policy left unset is an error in the audit. Owner mode asks for no validator; decode and size limits still apply in every mode. Saboteer is owner-authoritative: a player's own inventory changes at once and replicates from the owner, with no host answer and no escrow step; local feel and bandwidth come first and cheating is not a design concern. A game that wants a final say over a source binds it `Server`.
21. **Writes run on the peer that decides.** An operation line that changes something runs on the peer that decides for the thing it names, whichever face typed it (console, window, Unity command line, test). Reads run where they are asked. On an operation, the audience `authority` means "runs on the peer that decides"; nobody holds it as a role. A call cannot bounce between peers.
22. **A move across two writers never shows as lag.** An item moving between a container one peer writes and a container another peer writes goes as two linked steps under one intent key, the first step always on the source's writer, whichever peer that is. Each commits at once on its own side and a repeat changes nothing. On the click the mover's view draws the stack in its target slot at once (a presentation state, never a data state) and swaps it for the real item when the other writer's step replicates; input is never blocked; a client that observes both containers sees both halves on the same frame, held at most one tick. Taking from a chest the host writes into the player's own hotbar: the host commits the withdraw, the owner commits the deposit when the host's batch arrives; two takers of one stack resolve by the host's arrival order and the loser's drawing fades, no hotbar having held the stack; a use of the just-taken stack is held for at most one round trip plus 0.09 s (170 ms at an assumed 80 ms ping, computed). A refused second step returns the stack to its first slot by a third step under `link.returned`, counted as the same move; the refusals are the host's, the owner's or the owner leaving, never a timer's. No timer ever returns a stack, because the second step may still land and the item would exist twice. A link open past its warning time trips the unsettled guard and shows in the audit. A friend co-op game has no lag, period.
23. **Saves.** Every saved section carries a header: its name, its layout fingerprint and its length. An old layout is refused by name; that is detection, never compatibility. A save holds no tick rate: durations are written in seconds and converted to ticks at load, and nothing is refused for a rate. The fingerprint is the layout hash in the package's surface file, computed by one function in Core's packing.
24. **One form for content, one validation.** Every definition a designer or an agent authors is a ScriptableObject made through Unity's own asset pipeline (the inspector or the Unity command line), never a hand-written asset file and never a second text format. Every definition type implements Core's validation contract and Core.Editor reports for all of them. Authored data stays in Unity's own serialization; Core packing serves saves and the wire only, so a Place's layers are Unity fields. A package adds its own checks through the check seam, by implementing `IDefinitionCheck<T>` in its own editor assembly; findings use the one report format. A check declares `RunsWhileEditing`, default no. While a person edits, only the type's own `Validate` and the checks marked `RunsWhileEditing` run, after the asset has been still for the delay held in the operation settings, never on `EditorUtility.GetDirtyCount` alone and never inside a repaint; every other check keeps its last result marked stale and runs on save, on `core validate` or from a button. A field build such as `navigation.reachable-deposits` is never marked `RunsWhileEditing`. Validation reports a stored field the type no longer has as an error (`core.unknown-key`) carrying the stored value's text, cut at the length in the operation settings; nothing is written anywhere to keep a lost value.
25. **A prefab says it is playable with a marker.** `IPlayableCharacter` is one empty interface on the game's controller component. A gym character, a soak's body and the art check's reference figure are always a playable character of the game. Places' neutral default spawns the prefab the project names; Studio.Content's profile offers the studio's playable characters; a game's own profile wins inside its project.
26. **A release stops on a file saved by a newer Unity.** Before a final tag, and before a game's release build is uploaded, `packagecheck release-scan --path <folder>` reads the first line of every text file the release ships, Place assets included, and fails the release when it starts with a `%UNITY` directive newer than the oldest supported editor writes. An unreadable line is a `failed:`. The threshold is the value the Unity re-save test records for the floor editor; until it exists, any `%UNITY` first line fails.
27. **Every operation speaks one grammar.** See the conventions below. The only command the line adds to the Unity command line is `spellbound_run`; Pipeline's own commands stay as they are. Everything the line offers is typed as `<group> <operation> [arguments]` through it, with the status word first in the result.
28. **A depth budget.** No chain from Core to a game's code is longer than four links (Core, a mechanism, a composer or a bridge, Studio; the game is the longest the map allows), because every link is a serial compile. A package whose bridges would lengthen the chain is a line change.
29. **Core's majors.** After Core 2.0, the stable tag of the rewrite above the baseline `v1.1.9`, a change between majors is additive only. A Core major happens at most once per Unity LTS cycle and ships with the line's move to that LTS, so a buyer re-saves and re-authors at most once per cycle. A Core major is a release of the whole line, because every package holds one Core.
30. **Where the studio works.** The studio never leaves GitHub. Every main branch is protected. The release, catalogue and pull request Actions run as a GitHub App the organisation owns. Shared workflows are called at `@main`. The pull request title is `type(scope): what changed`; a `!` before the colon means it breaks someone; the version is made by the release and is never typed. A pull request is squash-merged with its title alone as the commit; commits on a branch are free. A pull request that edits the version in `package.json` fails the check. Saboteer is frozen from 2027-01-14 (an estimate pending Steam's partner page): bug fixes and media only, build scenes frozen. A change to a branch Saboteer follows that can break its build waits on a side branch inside the freeze and merges after the festival. The author runs the Unity tests through the Unity command line before asking for review; whoever merges an artist's pull request runs them first. Merging needs those passing tests; a hosted runner is a spike. The roadmap is priced in tokens and developer gates, never in hours.
31. **The milestones are the games, and a game launches complete.** Saboteer on the line, then Corsairs Isle on the line, each playing the same or better and easier to extend. A public release is not a goal until both run on the new systems. Navigation, ships and moving decks included, is built before Corsairs Isle launches.
32. **Player-facing text is styled text.** Only UI's renderer writes markup and it escapes every plain span, so a player's markup is text. System lines travel as a template id with arguments, never as text.

### Handover rules

- **One driver per body.** A body has one driver at a time through Character.Body's `MotionClaims`, and no system tests another system's state. Check: a write to a body's position outside the arbiter while a claim is active fails the soak.
- **A reference frame moves before its riders.** By execution order. Check: a validator reads the order values of every reference frame and rider in the project.
- **Velocity leaves a reference frame as relative velocity plus the frame's velocity at the point.** Only `ReferenceFrameBinding` does that arithmetic.
- **Prevent before rescue.** A body waits for its support (`SupportGate`); the rescue guard (`GuardPolicy`) is for what slips past.
- **A thing is moved, minted or burned, never merely set.** Each is counted under a reason, and a repeated intent changes nothing.
- **Everything that can go wrong is counted under a key, never only logged.** No new serialized trace boolean. Check: a lint on serialized `trace` booleans, and a package that declares keys has no front door without a context parameter.
- **A simulation assembly reads time from a `Tick`, rolls from a `SeededStream` passed in and takes ids from an allocator.** No `Time.time`, no `UnityEngine.Random`, no static mutable state. Check: an assembly scan, deterministic float mode on the jobs the identity lists, and a golden hash of the output.

## The homes procedure

For any thing X, in order, stopping at the first home.

0. **Separate the type from the value.** `ItemDefinition` is a type, `copper_ore` is a value of it. `SwitchboardProfile` is a type, the pink whisper is a value. A closed enum of kinds is a type that should be an open id set; its members are values. Run the questions on each half.
1. **Library.** Could a farming sim, a racing game or a card game use it without editing the package, and is it a mechanism rather than a value? Yes: the library whose sentence covers it. No sentence covers it: a new package or a new seam, raised to the developer, never invented in silence.
2. **Studio.** Would we want this identical in every game we ship, or is it glue for a service we chose? Yes: the Studio cluster whose dependencies it needs. A buyer would want it: back to step 1, it is a library gap.
3. **Game.** Everything else, in the game that wants it. A second game copying it sends it up.

In short: one game wants it, it is that game's; two want it as is, it is Studio; a stranger would want it, it is a library. A mechanism every game wants the same way, like a ragdoll, is a library and is replaced through its seams, never by forking.

Two rules for things between packages. A join between two libraries is an assembly compiled only when the other package is installed; it lives in the higher layer, and between two packages of the same layer in the one whose data crosses. A hard dependency is allowed only when one's sentence names the other.

What each home may know. A library knows nothing of Studio or any game: no assembly reference, no string, no version define. What it needs from the consumer arrives through a seam with a neutral default. Studio knows every library and no game, through public surfaces only. A game knows both and edits neither.

Smells a check can find. In a library: a string that is a scope, scene, tag, layer, key, URL or colour a game would change; a `Resources.Load` of a fixed path; a `const` a game would tune; an enum of kinds a game would extend; a reference to a Studio, game or un-named third-party assembly; a type named for one game; a sample under `Samples/` instead of `Samples~`. In Studio: an interface with no implementation in Studio (a seam in the wrong home); a reference to a game assembly; an asset one game loads. In a game: a package edited from inside it; a type that duplicates a library type; a `using` of a package's internals.

### The homes table

| Thing | Home | Why |
|---|---|---|
| Logging, packing, hashing, pooling, sampling, the operation registry, observations, the tick clock | Core | Every stranger wants them; no value inside |
| A preset, an instance of plain bytes, change and resolve handlers, awaken and sleep | WorldObjects | A farming sim's crops, a racing game's props |
| Spawning a GameObject when an instance awakens | WorldObjects, as a replaceable default component, never inside the simulation | A stranger replaces it or omits it on a server |
| Slots, stacks, acceptance rules, the item definition | Inventory | The farming sim is mostly this |
| `copper_ore`; tiers Common to Epic and their colours | The game for the ore; Studio.Gameplay for the tiers | Values; the tiers are our taste shared by two games |
| Equipment, skills, talents and the talent tree window | Studio.Gameplay | Our opinion, identical in every game we ship |
| Stats, affixes, rolls, grants, timed sets, the resource pool | Modifiers | The farming sim wants stats on crops, the card game on cards |
| A machine over a context with asset-defined states | StateMachine | Race phases, turn phases, crop growth |
| Capsule, support probe, sockets, ragdoll, worn pieces, held things | Character | The farming sim's farmer |
| Riding a moving platform (a deck, an elevator) | Character.Body, over Core's reference frame noun | Every stranger with a moving thing to stand on |
| A reference frame id, a directory per world, an up field | Core | Needed by Character, WorldObjects, Navigation, TetherShop |
| A tick, a seeded random stream, an identity allocation seam | Core | Needed by WorldObjects, Modifiers, WorldForge, Places, Networking |
| A cost against a budget, a quality level | Core declares; the game or Studio picks the policy | Four drawing packages degrade under one policy |
| A definition an agent may author | Core and Core.Editor (the contract, the importer path, the check seam) | Every package with definitions |
| The camera rig on Cinemachine | Character, as a bridge | A stranger without Cinemachine must not pay for it |
| Our socket names and rig conventions | Studio.Presentation (an ArtPipeline rules asset) | Values |
| The widget kit, the theme as a seam, labeled rows over Unity's own binding, the view stack, focus, cursor, escape | UI | The card game is mostly this |
| Window chrome, the menu styles, "ACTION" | A neutral default in UI's theme; ours in Studio.Presentation | Values and game shapes |
| The tooltip widget and alt-hover detail; the affix lines in it | UI; Studio.Gameplay | Mechanism; our rule |
| Scopes, delivery, history, moderation, typed-command routing | Switchboard | The card game chats |
| Tabs, pink whispers, `/r`, `/w` | Studio.Online (a Switchboard profile) | Our taste |
| The `guild` scope and tab | Corsairs Isle | Names one game's world |
| Sections, headers, a storage seam | Persistence | The farming sim and the card game both save |
| A game's settings values | The game; Persistence gives the pattern | Values on a pattern |
| Dirty set and flush, routing a write to the peer that decides, late-join paging | Networking | A PurrNet buyer is the stranger it names |
| Steam bootstrap, the `NetworkManager` prefab, scene flow, the lobby | Studio.Online | Glue for a chosen service |
| Observations collected, an overlay, a session file, relay to host | Diagnostics | Every multiplayer stranger playtests |
| The telemetry endpoint, credentials, dump path, capture upload route | Studio.Online | Ours |
| Marching cubes, Transvoxel, edits, queries, cases; the chunk presenter | GeoForge (the presenter replaceable) | The racing game's terrain, the underwater seabed |
| Generation passes, biomes, lines, a world plan | WorldForge | `seaLevel` as a constant fails the underwater game, so it is a surface among surfaces |
| The far field and its hand-over | Horizon, bridging to GeoForge | The racing game wants huge view distance and no voxels |
| A place as typed layers, parts by adjacency rules, nesting, duplication, validation, preview, a gym | Places | A pit stop, a village, a table layout |
| Capturing a scene region into a voxel layer and baking it | GeoForge's Places bridge | Any GeoForge game authoring places |
| A place both games share; the board generators that name no game | Studio.Content | Two games, named for neither |
| The gym profile (which playable character spawns, which commands load) | Studio.Content; Places' neutral default spawns the prefab the project names | Values |
| The art destination (git with LFS, which repo) | Studio.Tools | Ours |
| Path finding over cases and volumes, doors and blockers | Navigation | The underwater game's movers are all swimmers |
| Drawing many copies, culling by distance, far representations | Instancing | Grass for the farming sim, crowds for the racing game |
| A decal store and its backends | Decals | Tyre marks, mud, chalk |
| Fog, clouds, their shadows, stage budgets | Volumetrics | A sun that points up by default is a value |
| Rope segments, sockets, rest and taut, fake ropes | TetherShop | Mooring lines, tow ropes |
| Elevator, Winch, Load as attachment kinds | TetherShop's sample, then Saboteer | Game words |
| Export checks for rig, sockets, materials, scale | ArtPipeline | Any studio with artists |
| Release audit, profiler dump, capture, portrait rigs | Studio.Tools | A buyer builds differently |
| Add an item to a container, spawn a preset, place a body: the operations a test needs | Each package ships its own (rule 9) | Every stranger's agent tests with them |
| Give talent, spawn rum, build stress | Studio.Tools and the games | Values on Core's operation mechanism |
| House rules for agents, skills, templates, the commit convention | Studio.Tools and the template repo | Values |

## What each stranger installs

The acceptance test, written as the manifest each imagined game needs. It runs: `StrangersDev` holds one Unity project per row, installs only that manifest, and passes a scenario written against public surface.

| Game | Spellbound packages | Unity packages pulled | Never installed |
|---|---|---|---|
| Card game | Core, UI, Switchboard, Persistence, Networking, StateMachine | PurrNet, UI Toolkit (engine) | No voxels, no bodies, no world |
| Farming sim | Core, Inventory, WorldObjects, Persistence, StateMachine, Character, UI, Places, GeoForge or none | Cinemachine only if it takes the rig bridge | Modifiers; Networking if single-player |
| Racing game | Core, StateMachine, Horizon, Instancing, Volumetrics, Decals, Networking | URP, Burst, Collections, Mathematics | Character, Inventory, GeoForge: the view distance comes without a voxel |
| Underwater game | Core, WorldObjects, GeoForge, WorldForge, Navigation, Volumetrics, Character | Burst, Collections, Mathematics, URP | Horizon. It replaces Core's up provider and Volumetrics' sun; nothing it installs holds a sea level or a sky |
| Saboteer | Core, WorldObjects, Inventory, Modifiers, StateMachine, Character, UI, Switchboard, Persistence, Networking, Diagnostics, GeoForge, WorldForge (its floors come from the studio's generators through Places and WorldForge), Places, Decals, Volumetrics, TetherShop, ArtPipeline (through Studio.Presentation's bridge), and all five Studio packages. GeoForge Pro stays until the floors come from the generators, then leaves its manifest (W10aL). GeoForge then drops its blob tables and fillers (W2c), and Saboteer sheds Entities when Unity's blob epic (UN6), Core's ECS removal (UN4b) and that manifest story have all landed. Saboteer installs Diagnostics and the five Studio packages before its first Steam release (estimated 2028-06-06) | Burst, Collections, Mathematics, URP, Cinemachine, PurrNet, Steamworks | Horizon, Instancing: it has no open world. A shared place carrying a scatter layer opens there read-only until W4a's first story passes, with that layer carried in the asset only, never in a pack |
| Corsairs Isle | Everything but GeoForge Pro, plus every Studio cluster | | |
| The MMO server | Core, WorldObjects, Inventory, Modifiers, StateMachine, Character (the body, not the rig), Switchboard (routing, not the view), Persistence, Networking, Diagnostics, GeoForge, WorldForge, Places, Navigation, Studio.Gameplay, Studio.Online, Studio.Content | Burst, Collections, Mathematics, PurrNet | UI, Horizon, Instancing, Volumetrics, Decals, Cinemachine, Steamworks: no bridge to them compiles because they are not installed, and every presentation assembly carries `!UNITY_SERVER` |

Scale: every package on the MMO row compiles and runs without URP, a camera, UI or Steam. No capacity figure is claimed for a shard; that is a measurement Networking owns. A server running many worlds loads each as a PurrNet scene with its own physics mode, and Persistence's storage seam never blocks the server tick.

## Shared conventions

### Names

| Thing | Form | Example |
|---|---|---|
| Package id | `com.spellboundstudios.<name lower-cased>` | `com.spellboundstudios.inventory` |
| Studio package id | `com.spellboundstudios.studio.<cluster>` | `com.spellboundstudios.studio.gameplay` |
| Root namespace, assembly | `Spellbound.<Name>`, `Spellbound.<Name>[.<Part>]` | `Spellbound.Networking.Replication` |
| Package folder | `Packages/<Name>`, the short name, never the full id | `Packages/Core` |
| Dev project, repo | The clone is `<Name>Dev`; the repo carries the short name | `CoreDev` |
| Front door | `public static class <Name>Kit` in the root namespace. The suffix is forced: a class named like its package fails to compile inside any `Spellbound.*` namespace | `InventoryKit`, `CoreKit` |
| Bridge second door | `<Package><Other>Kit` | `ArtPipelineCharacterKit` |
| Operation group | The package name lower-cased with dots removed | `core`, `studiotools` |
| Operation name | `kebab-case`; list operations take `--offset` and `--limit`; a `<name>-start` has a `<name>-status` partner | `core sample-import` |
| Test names | `<Point>_CustomImplementation` for every extension point; `<Probe>_NoAllocation` for a hot loop | |
| Identity files | `package.json`, `Identity.asset`, `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` (headings Purpose, Front door, Rules, Not for, Gaps, Ledger), `Surface.txt`, `Documentation~/index.md`; a `Bootstrap` folder | |
| Surface file | Public surface, one line per stored-format type with its layout hash, and one line per serialized field of every authored type as `Type.field : fieldType` | |
| Copyright line | `// Copyright (c) Spellbound Studios. All rights reserved.` as the first line of every C# file, no year | |
| Reference frame names | `ReferenceFrame`, `IReferenceFrame`, `ReferenceFrameId`, `ReferenceFrameDirectory`, `ReferenceFrameBinding`, `ReferenceFramePose` | |
| Catalogue | `Catalogue.txt`, one tab-separated line per package and per supported Core major: id, name, kind, status (active, retired or held), note, job, install address, known-good tag, Core range; a package has two lines while two Core majors are supported; extra lines for starter sets, third parties and a `moved` pointer | |
| Check rules | A fact blocks, a lead is answered once by a person or agent, a gate only a person gives. In the window: "must fix", "please confirm", "needs a person" | |

### The operation grammar

| Part | Form |
|---|---|
| The one command the line adds to the Unity command line | `spellbound_run`; Pipeline's own commands (run_script, console, run_tests and the rest) stay as they are |
| A line | `<group> <operation> [arguments]`, for example `core help --group inventory`, `inventory add --container 12 --item copper_ore --count 3`, `packagecheck check` |
| Result status words, first word of every result | `succeeded`, `invalid`, `failed`, `refused`, `previewed` |
| A valid call that finds a fault | `failed:`, so a script stops. A bad call is `invalid:`. A call not allowed now or by this caller is `refused:` with the way forward |
| Destroying operations | Refused without `--confirm`; `--dry-run` answers `previewed:` and changes nothing |
| Target | The one parameter naming the thing acted on is marked as the target; `--world world:3` picks a world, and no operation reads a static world |
| Audiences | `anyone`, `authority` (runs on the peer that decides), `developer`; `approver` is held by the window and granted to an agent only by one setting; an open string, so a game adds its own |
| Failure text | Says what was wrong, the legal values, and a hint: `invalid: no operation 'inventory ad'. Did you mean 'inventory add'?` |
| Context for agents | `core context` lists the installed packages, their front doors and operations; `core help --group <name>` lists one group |

### Numbers

| Value | Number | Notes |
|---|---|---|
| Unity floor | 6000.3 | The studio edits on 6000.4.8f1 and moves to 6.7 when it ships |
| Tick rate, starting value | 20 ticks a second | PurrNet's tick (0.05 s). A setting read once |
| Fixed step, starting value | 50 steps a second | Unity's fixed step (0.02 s). A setting read once; 2.5 steps for each tick, neither a whole number of the other, and they need not agree |
| Unity maximum fixed step per frame | 0.3333 s in both games | Verify before building on it: read from each game's time settings |
| PurrNet normal-tick callbacks per frame | 5 | Read from source, not run: verify before building on it |
| Depth budget | 4 links from Core to a game's code | Rule 28 |
| Corsairs world budgets (the WorldForge brief's bars that W2's gate holds) | Worst frame about 8 ms while streaming, stamp and prep each under about 1 ms per chunk, plan build under about 100 ms, 60 frames a second while streaming, 20,000 objects on screen | From `WorldForge/CLAUDE.md` and the Heartland capture of 2026-10-05, editor play mode on the reference PC; verify before building on it. R0's default-mode run of today's WorldForge chain on the reference world is the before-number W2 compares with |
| The F2 capture | The developer's frame figures for Corsairs at the reference world's Heartland site on the reference PC, frame time, worst frame and memory, taken with the game's own frame cost trace | Taken once at W2b with the WorldForge-to-GeoForge bridge in place; compared with the figures above |
| Tick | 64 bits, not compared wrap-safe | At 20 a second that is about 2.9 x 10^10 years |
| Instance ids | 64 bits: 1 kind bit, 31 lease bits, 32 counter bits, never reused | Fixed from the first release to a customer. Sizes are arithmetic on assumed rates |
| The bar | 78 rules: 63 facts, 11 leads, 4 gates | Tiers: 56 read, 6 run, 12 line, 4 gate. The per-rule list is in `Areas/Living.md` and PackageCheck ships it; a builder of LV2 or LV3 reads it there |
| Git | 2.14 or later on the PATH | No package file is in Git LFS; LFS is scoped to `Assets/_Project` in a dev project |
| Release cadence | A major about every 12 months; a year of fixes inside a major | A target, never a gate |
| Compile cost per added assembly | 0.2 to 0.8 s of CPU | From the audit: verify before building on it |

### Tags and branches

| Form | Meaning |
|---|---|
| `v1.0.0-beta.N` | A release from the `beta` branch before a package's first stable release; Core's rewrite is `2.0.0-beta.N` after the baseline tag `v1.1.9` |
| `v1.0.0-rc.1` | A release candidate. The strangers that install the package run against it; green posts a status on the tagged commit |
| `v<version>` | A final release. It exists only on a commit with a green strangers status. A buyer's install line ends `#v<version>` |
| `beta`, `main` | Pull requests land on `beta` before and after a package's first stable release, and a project the studio works in follows `#beta`; a person moves `main` to each release |
| `release-<major>` | The maintenance branch of a Core major, in every repo of the line; a shipped game follows it, and the tag gate reads each package's own `range` entry on it |
| `art/<artist>-<slug>` | The only branch shape Send pushes. Main branches are protected, so a push cannot reach one; whether the server also refuses any other shape is proven by A5a's spike |
| `v<bundleVersion>` | A game's tag, made by the tag script. Infrastructure repos carry an integer a person moves, as a record only |
| Install line | `https://github.com/Spellbound-Studios/TetherShop.git?path=/Packages/TetherShop#v1.0.0`. The path comes before the hash. Studio packages follow the same form with their cluster name; verify the Studio folder name before building on it |

### Pull request titles

| Title type | After the first stable release | Before it (`beta`) |
|---|---|---|
| `fix`, `perf` | patch | next `-beta.N` |
| `feat` | minor | next `-beta.N` |
| `!` or `BREAKING CHANGE` | major | next `-beta.N` |
| `refactor`, `docs`, `test`, `build`, `ci`, `chore` | none | none |

After the first stable release a removed or changed line of the surface file needs `!`; an added line needs at least `feat`. Stored-format and serialized-field lines count like public lines.

## Known limits the developer has accepted

- Nothing in the plan has been run or measured except where a line says so. Every cost is computed or a target; the first story of most epics measures it.
- The compile gain is one clean rebuild per game, not an average, and the two games were measured under different conditions. Verify before building on it.
- Every boundary that adds a hop is measured in its own area, and its cost is unmeasured until those stories run: the presenter seam on awaken and Horizon's question to GeoForge in their areas' first stories; the place-stamp hop by W1g recording today's Saboteer floor build time per seed and W10a's gate comparing it.
- GeoForge Pro is placed by its sentence and nothing more, and is held in the catalogue from W2c until its own pitch.
- Counts the owners' tables state after the readers' round and the plan has not yet priced (Art's A5a at 6 and A4c, Runtime's third R6d story, Command line at 70, Workflow at 68, Unity at 56) are priced at the next re-run.
- Saboteer's first Steam release is estimated June 2028 because the rules above leave no other order, confirmed by the developer's note of 2026-10-24: Saboteer does not release until the packages are final.
- No assembly in the line is required to be free of engine references. The MMO is a Unity headless server, and rule 12 serves that. An engine-free tier for logic outside Unity (an economy service, tests under `dotnet test`) is raised as a possible line change and not taken.
- Three sentences are lists: Core, WorldObjects, Character. Core's is by design. Splitting Character is a line change if an engine change moves its halves on different clocks.
- Merging two same-layer packages is a line change if one proves too small to carry a repo.
- The 12-month cadence and the one-Core-major-per-LTS-cycle rule agree only while Unity ships an LTS about yearly; the cadence is stated as a target.
- A breaking change in one package waits on `main` for the next major, because inside a major no package breaks its API and the maintenance branch is named for the Core major.
- The control on `Identity.asset` and the ledger is a person reading a diff (a code owner), not a lock; no technology stops a person with merge rights.
- Unity facts, read from Unity's pages on 2026-10-24 (verify before building on them): 6.3 LTS is supported to December 2027; the 6.7 LTS date is the studio's estimate, since no Unity page gives one; 6.7 is the last Unity on Mono and Unity 7 runs on CoreCLR; Unity 7 removes the built-in render pipeline; the Unity 7 alpha notes carry two entries on the version line at the top of saved text files with no order between them.
- PurrNet's behaviour on Unity 6.7 is unknown. PurrNet declares 2022.3 as its floor.
- Unity runs one fixed loop for the process: one world whose physics overruns the fixed step slows every world in it. A game that pauses with a time scale of 0 stops physics while ticks and scheduled events go on.
- In owner mode two writers of one key within a round trip end in the host's arrival order; the loser sees its own value first and the winner's after. The 170 ms from click to real item for a linked move assumes an 80 ms round trip and is computed.
- Movement for a world at MMO scale is a gap: PurrDiction has one predicted world per scene, and owner-authoritative movement with server checks is the only built-in answer. Moving a player between processes is not designed.
- Once a package has shipped to a customer it keeps the bootstrap address it shipped with.
- The catalogue's host is GitHub for good; a lost host is accepted.
- Determinism of navigation is promised for the same build and machine only. Floating-point results can differ between Mono and CoreCLR; Burst and IL2CPP are not affected.
- The position of a creature that walks every tick is not carried by Networking's replication; which component carries it is each game's decision.
- Facts read from source and not run (verify before building on them): Core's tick follows PurrNet's tick through the reliable tick event; a client's tick never goes backwards through the adapter's hold rule; PurrNet's tick count wraps after about 6.8 years of one server session at 20 a second; a static RPC arrives with an authenticated sender.

## Held for a spike or a probe

Each is a setting with a default until its story closes with a written go or no-go, signed by a person. The default is used and named in your report; nothing waits for these, except that Navigation's NV2 starts after NV1 closes (last rows).

| Held | Default until it closes | Story that settles it |
|---|---|---|
| How operations are found | Reflection over marked assemblies; a source generator if the story is a no-go | CL1, story 1 |
| A package at `Packages/<Name>` with git and Git LFS inside, version defines, the `?path=` install, `Samples~` | `Packages/<Name>`, embedded | LV1a, story 1 |
| The bootstrap on clean 6000.3 and 6000.4 projects | The bootstrap as designed | LV1a, story 2 |
| `TypeCache` finding a check class that implements a closed generic interface | `TypeCache`; the marked-assembly scan as fallback | CL4, story 10 |
| Whether a Play Mode test can yield an operation run | A test waits with `WaitUntil` on the run's result | CL1, story 2 |
| How the Unity CLI reports a call made during the play mode reload | The caller retries until the status operation answers | CL2 |
| Whether the inspector header hook can host a UI Toolkit element | The banner is drawn by area 11's report view from the cached report | CL4, banner story |
| Whether `CopySerialized` keeps a managed-reference list | `core revise` of a type with a managed-reference list answers `failed:` naming the field | CL4, story 12 |
| Whether Unity keeps a renamed key until save | The stale-field scan reports that it could not see the key | CL4, story 11 |
| Project Auditor as a rule backend | Text scans stay | LV3a |
| The far-field renderer | None chosen. Candidates: today's tiles moved into Horizon, nested rings, Unity Terrain | W6p, then the measurement in W6a |
| The far layer | A planning story first, its own epic after the renderer is measured | W6n |
| Pro's generation passes and Saboteer's rooms | The plan in W10a stands | W20 |
| What a saved world stores, and the world fingerprint | The fingerprint only detects a change and repairs nothing; no old generator is kept | W70 |
| Navigation's tile cost | The spike ends in a written go or no-go that a person closes as a Decision issue, and NV2 starts only after it is closed. On a no-go the fallback is Unity's NavMesh for walkers only, plus our own volume search for fliers and burrowers | NV1 |
| The batch draw path against today's, and the pop between levels of detail | BatchRendererGroup; no fade between levels | UN3 |
| `PhysicsScene.Simulate` ordered from a latest-order fixed update | The order in rule 19 | Settled by the facts bench row in UN1a, run by the world-step order test in R3d and NW3s; the default stands until one of them closes it with a written go or no-go |
| Who steps the physics of a world that predicts | Rule 11 | NW10 |
| PurrDiction's packing, the black box in shipped builds, and its file | The recorder runs in development builds only and nothing leaves a machine | NW7 |
| Catch-up of physics after a hitch | Physics falls behind and the lag is reported | A later discussion once the games iterate |
| The test runner | Local Unity CLI test runs are the merge rule | WF3s |
| The 6.7 beta probe and one throwaway copy in the newest Unity 7 alpha | A throwaway copy of the Corsairs Isle project folder (it consumes every package, so PurrNet, WorldForge, GeoForge and UI checks all run), made by a plain folder copy that skips Library, Temp and Logs; `run-local-tests.sh` reuses the same exclusions once WF3a lands. Any check that still needs something the copy lacks is listed as "not run" with its reason; Entities errors are listed on their own rows | UN9 |
| The `%UNITY` threshold the release scan compares against | Any `%UNITY` first line fails | The re-save test in UN1 |
| Networking's two-assembly split | Protocol assembly plus PurrNet adapter in one repo | Discussed when the package is built |
| WorldObjects' store layout, the Persistence upgrade design | Native columns; Persistence upgrades old saves of a shipped game | The WorldObjects pitch (PWO) and the Persistence pitch (PP), each with a spike |
| Send's details and ArtPipeline's first prefab | One button. Default: ArtPipeline's Make playable makes the first prefab, as a variant of the model; a person judges at the end of A7 whether it is in the first release | A5a, then A7 |
| Blender and Maya export presets | None | Backlog |

## The report a build step ends with

End every step with this report, in plain words, then stop. Do not start the next step. Since 2026-10-25 the report has two homes: the full table below goes into the body of the pull request that carries the step, which is the record, and the chat message that ends the step carries three parts only: the decisions that need the developer, what changed against the plan (a design, a sizing, a rule applied, a fact that turned out otherwise), and the developer's move. The developer's merge of that pull request is the sign-off: no separate yes is asked for a story, a spike or a probe, and a story closes through the pull request's Closes lines. Before a decision reaches the developer it passes one test: would two different games answer it differently? If yes it is an extension point with a default, applied and reported, never asked. The decisions that remain are the library's own choices, two or three for a pitch and none for an ordinary build step. Steps whose waits are all merged may run side by side, one session per step, each on its own branch and its own dev project; two steps that edit the same repository never run together.

| Part | What it holds |
|---|---|
| Stories | Each story of the step with a status word: `succeeded`, `failed` or `refused` (blocked by a gap you raised) |
| Regression contract | Every line of the contract walked, one result each, with the evidence |
| Compile and tests | The editor's compile state, the console, the tests run in edit and play mode with counts, failures included, and the result of `packagecheck check` for every package the step touched (blockers, leads, whether it said `compiled: current`), or "not run" where PackageCheck is not yet built. Say which suites you could not run |
| Measurements | Each cost or capacity number the story was to measure, beside the computed figure it replaces |
| Settings taken | Every setting you took a default for, with the default and why |
| Gaps raised | Each gap in a package: the package, the missing extension point, what you did not do |
| Strings | Any user-facing string you believe must change, and why. You do not change it |
| Facts | Each "verify before building on it" fact you relied on: confirmed, changed or unchecked |
| Files | What changed, grouped by package or game |
| Evidence needed | What you need from the developer to continue: captures, numbers, a play session, a build |
| You need to do the following | A bulleted checklist of anything the developer must do by hand in the Unity Editor: inspector fields, assets to create, scene setup |

The last line is "ready to test".

## Where to read more

The executive brief (`Brief.md`) and the roadmap (`Roadmap.md`) sit beside this file in the organisation's `.github` repository. Read the brief if you have read nothing else. Read the roadmap to find your step. The design of each epic lives in the area file its id names (the list under the roadmap's build steps, in the `Areas` folder beside this file); a step's lead reads the sections of that file that name its epics and writes the step's stories from them. Read nothing else of the pitch: the rules, the packages and the conventions are all here, and where a fact is marked "verify before building on it", check the code.
