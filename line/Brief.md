# The Spellbound package line: executive brief (2026-10-24)

For a person deciding whether to spend build time who has read nothing else. Five minutes. Every date below is an estimate the developer is not bound by, and every cost is computed from the plan, not measured (the first story of most epics measures it).

## What the line is

The line is every Spellbound package taken together as one family: twenty-three published packages that the studio's games are built from and that will be sold on the Asset Store once a listing exists (undated, after both games; until then each installs from its GitHub address), and five private Studio packages that hold the studio's own way of using them. A package is named for its one-sentence job, owns nothing outside that sentence, depends on another only when its sentence names it, and works for a stranger (a farming sim, a racing game, a card game) without editing it. Games are not part of the line; they install packages and extend them. Every package has the same layout, the same front door (`<Name>Kit`), one shared command line that a person and an AI agent both use, and its own tests.

| Package | Job in one line |
|---|---|
| Core | The one vocabulary every package shares: logging, packing bytes, ids, seeded rolls, reference frames, budgets, operations, validation. Engine only. |
| WorldObjects | A world's things: a preset per kind, plain instance data, change and consequence kept apart, a spatial index that wakes and sleeps by distance. |
| Inventory | Containers: slots, stacks, acceptance rules and the definition of an item. |
| Modifiers | Stats and what changes them: rolled affixes, grants, timed sets, conditions, resource pools. |
| StateMachine | Asset-defined states over a context, swapped in the inspector. |
| Character | A body that moves and stands on things (`Body`), plus sockets, worn pieces, animation and ragdoll (`Rig`). |
| UI | One kit of UI Toolkit widgets, one replaceable theme, screens with focus and cursor handled once. |
| Switchboard | Text between players: scopes, delivery, history, moderation, typed commands, over any transport. |
| Persistence | Saving and loading sections that any package declares, through a storage seam that never blocks the game. |
| Networking | The sync patterns every networked game repeats, over PurrNet, with who may write each thing set per thing. |
| Diagnostics | Collects what packages report, shows it live, records it, relays it from clients to a host. |
| GeoForge | Turns a density field into voxel terrain meshes with seamless detail changes. |
| GeoForge Pro | Paid editor sculpting and mesh voxelising over GeoForge. |
| WorldForge | Plans a world and generates its data from noise, authored data or places. |
| Horizon | Draws the world beyond the loaded terrain at any world size. |
| Places | Authored units of content built from typed layers, nested, validated, previewed and played alone in a gym. |
| Navigation | Paths for any mover through any space, including moving decks, with following and crowds. |
| Instancing | Draws very many copies of a few things from data (grass, trees at range). |
| Decals | Paints decals at runtime on any surface. |
| Volumetrics | Fog, clouds and the shadows through them under a quality budget. |
| TetherShop | Ropes and chains from full simulation down to a rope that only looks like one. |
| ArtPipeline | Checks and fixes an exported model or texture against the project's rules and sends it on with one button. |
| PackageCheck | Runs the line's bar against a package as one command. |
| Studio.Gameplay | Equipment, skills, talents and item tiers, built only on the public surfaces of Inventory and Modifiers. |
| Studio.Online | Networking setup, scene flow, the chat profile, telemetry, the Steam lobby. |
| Studio.Presentation | The studio theme, window chrome, HUD layout, art rules defaults. |
| Studio.Tools | Release audit, captures, the house operations, templates, the artist's send route. |
| Studio.Content | Places and generators both games share, named for neither, and the playable characters of the gym. |

## What it costs

- **Size:** 889 gates (one gate is one reviewed unit of work a person signs off) in 119 epics, about 148.0 million tokens, 167.3 million with the review rounds.
- **People:** two streams of one person each from 2026-11-02, one gate per person per working day beside their own work, 10 percent held in reserve.
- **Saboteer on the line:** estimated 2028-01-10. **Corsairs Isle on the line:** estimated 2028-04-25. **Saboteer's first Steam release:** estimated 2028-06-12. **The plan ends:** estimated 2028-10-11.
- **Sensitivity:** at 0.93 gates a day the four dates become 2028-04-10, 2028-08-21, 2028-10-20 and 2029-03-27; with a third person at the same rate, 2027-08-17, 2027-10-26, 2027-11-29 and 2028-02-28.
- **Verify before building on it:** the rates are the planning rate, and the first sprint measures and re-issues them.

## Where it stops

- **GeoForge Pro** is placed by its sentence and nothing more. Saboteer's manifest drops it when its floors come from the generators (estimated 2027-09-30), and from the day GeoForge drops the blob tables Pro compiles against (estimated March 2028) the catalogue holds Pro at the last GeoForge tag it works with, until Pro gets its own pitch.
- **A public release** (publisher enrolment, store listing) comes after both games and has no date. Core 2.0, the stable tag of the rewrite, and the first final tags of every package Saboteer installs are dated before Saboteer's first Steam release.
- **The MMO's structure** is later: the only rule now is that no library takes a Steam type or a PurrNet connection as a player key, and no capacity figure is claimed.
- **Prediction** is each game's choice at its own pitch; the line only makes it possible and costs a game that never predicts nothing.
- **Held for a spike or a probe:** the far-field renderer, Navigation's tile cost (spike estimated 2027-05-05 to 2027-05-11), what happens after a hitch when physics falls behind the clock, operation discovery by reflection, the test runner, Blender and Maya.
- **Networking's split** is settled: a protocol assembly plus the PurrNet adapter in one repo, every bridge targeting the protocol assembly; nothing waits on it.

## The two milestones

- **Saboteer on the line (estimated 2028-01-10):** the game plays the same or better on the new packages, is easier to extend, an artist gets a held prop into it without an engineer, and it has passed a soak and fault matrix. It keeps following the package branches.
- **Corsairs Isle on the line (estimated 2028-04-25):** today's Corsairs runs on the new packages with its own soak, and Saboteer sheds Entities and repeats its soak. It is not the launch: Navigation, ships and moving decks follow (estimated 2028-05-22 to 2028-08-29), because Corsairs Isle launches complete, and a sailing game does not launch without boats. The launch has no date.
- **Saboteer's first Steam release (estimated 2028-06-12):** after every change Saboteer still needs, Corsairs' soak and the first final tags of every package it installs, because from that day Saboteer follows a maintenance branch that refuses removals. The order is confirmed by the developer's note of 2026-10-24: Saboteer does not release until the packages are final.
- **Saboteer's Next Fest demo:** due before the press preview on 2027-02-11 (festival 2027-02-22 to 2027-03-01; the dates come from third-party sites, so check Steam's partner page before 2026-12-14). The plan meets it with no margin: the build is estimated 2027-02-03.
- **The demo contains** the new console with Saboteer's ten commands, the new chat window and settings with Saboteer's cut-over, the split UI package, input contexts and the layout section (a saved HUD layout shows the default once), Core on assemblies, and Persistence's first slice. **It does not contain** the networked chat bridge (estimated 2027-07-07), so the chat corruption above U+00FF stays until then, nor the artist's send button (estimated 2027-03-15).
- **The cut-over ends estimated 2027-01-14**, the first day of the code freeze (from 2027-01-14: bug fixes and media only), under the freeze's one exemption for manifest lines; its last Saboteer-tagged part ends the working day before. A slip costs the chat cut-over, not the console. Modifiers' one breaking change waits on a side branch and merges estimated 2027-03-02.

## The rules in plain words

**Shape**
- One sentence, one owner; two packages never own the same noun.
- A hard dependency only when the sentence names it; everything else is a bridge compiled only when the other package is installed.
- Bridges point down or sideways, never up, and live in the package whose data crosses.
- Core grows only when a second package needs a type; it holds vocabulary, never a behaviour a game would tune.
- Unity's own packages are allowed where the sentence needs them; one third party per package; Entities is nowhere in the line.
- UI Toolkit only: no uGUI, TextMeshPro or IMGUI for anything a player sees, and editor code that is new or touched is UI Toolkit too.
- Studio compiles against public surfaces only; a missing extension point is a package story, never a workaround.
- Anything that draws lives in its own assembly that never compiles on a server.
- No package relies on domain reload; no chain from Core to game code is longer than four links.

**Content and checks**
- Authored content is a ScriptableObject made through Unity's own pipeline, checked by Core's validation, never a second text format.
- A package adds its own check to another package's definition through `IDefinitionCheck<T>`; a stored field the type no longer has is an error.
- A designer's data stays in Unity's serialization; Core packing serves saves and the wire.
- Studio.Content is edited in StudioDev only, never inside a game.
- A draft an agent makes is approved by a person in the Spellbound window; an agent may approve only if one project setting grants it.
- Everything is called as one line, group then operation, and the answer starts with a status word; an operation that destroys data is refused without a confirm flag.

**Time, networking and saving**
- The network tick rate and the physics step are two settings read once (starting values 20 and 50), and nothing is derived from either; the clock takes its rate from its tick source, PurrNet's when PurrNet is present.
- Core holds the clock (`TickClock`), one per world instance; the predictor steps a predicted world; each world instance steps its own physics scene; everything in Networking belongs to one world instance.
- Who may write a replicated thing is set per thing; Saboteer is owner-authoritative, so a player's own inventory changes at once with no host answer.
- A line that changes something runs on the peer that decides; a move between two writers is two linked steps that never show as lag on a client.
- A save holds no tick rate (durations in seconds), carries a header per section, and refuses an old layout by name.
- The thing that moves and carries others is a `ReferenceFrame`; a gym character is a playable character, marked `IPlayableCharacter` on the controller.

**Releases and buyers**
- Before a package ships, nothing is kept for compatibility: no shims, no aliases, no migrations; a change means re-save, re-author, re-import. Nothing is pinned.
- After it ships, semantic versioning governs: a changed or removed stored-format line, and a renamed, retyped or removed serialized field, each need a major, and the release fails without it.
- No file a package ships is in Git LFS, and a buyer needs Git 2.14 or later on the PATH.
- A buyer installs a released tag; our games follow a branch; a shipped game follows the maintenance branch of its Core major and ships only after the final tags of every package it installs exist.
- The release promise to a buyer: a major about every 12 months, an upgrade offered at a reduced cost (whether the Asset Store offers that for a UPM product is unverified), and inside a major bug fixes and maintenance with no API break for a year, reaching a buyer on the previous major through the catalogue.
- After Core 2.0, Core is additive between majors; a release stops on a text file saved by a newer Unity than the oldest supported one.
- A game sold on Steam is a customer from its first release: its players' saves keep loading, the demo is exempt, and Persistence upgrades old saves by itself.
- Core ships the Spellbound window, which lists the line and installs from GitHub; shared workflows run at `@main`; every main branch is protected.

**Work and order**
- The studio never leaves GitHub; artists push branches and Send sends only the files they changed; the author runs the tests before review.
- Every package folder is its short name; the copyright line has no year; the game is Saboteer.
- The floor is Unity 6000.3, the studio edits on 6.4, and no epic waits for 6.7; a working project opens in a newer Unity only in a Move story, which a person runs.
- Navigation and ships come before Corsairs launches; the Places gym comes after Saboteer's milestone.
- No JSON, no new technology or dependency without the developer's say.

## What changes in Unity 6.7 and Unity 7 for the two games

1. Nothing in Unity 6.7 or the first Unity 7 alpha forces Saboteer or Corsairs Isle to change anything before Saboteer's February 2027 demo, because both games stay on Unity 6.4 until they choose to move.
2. The big change is under the hood: 6.7 is the last Unity that runs game code on Mono, Unity 7 runs it on CoreCLR (Microsoft's current .NET engine) with no Mono at all, Unity 7 drops the old built-in graphics pipeline (both games already use URP), and the Localization package that Saboteer uses is replaced.
3. For the packages the cost is a short list of checks that the 6.7 beta probe runs first, such as code that lists loaded assemblies, saved-object cycles, and Collections becoming part of the engine, and no announced change needs a decision or delays an epic.

- **Both games, at the move to 6.7:** check that the Windows build and the Steam upload still ship the C++ runtime files, and copy the old ambient shadowing setting into a Volume override by hand.
- **Saboteer:** run Unity's Localization migration once (8 files use it); reset static state on Play on purpose in the 2 files that list loaded assemblies.
- **Corsairs Isle:** its Entities package follows the line's removal of Entities; 1 file lists loaded assemblies; its editable terrain may gain from the new real-time bounced light, optional.
- **At the move to Unity 7:** look at any two-sided see-through Shader Graph material (24 files across both games), and open the alpha only on a throwaway copy of the Corsairs Isle project folder, never the shared working project.
- **Verify before building on it:** Unity gives no release dates for the betas; its blog targets Unity 7 in Q1 2027 with a preview in December 2026, and the 6.7 upgrade guide does not exist yet.

## How to read the other two files

- **Roadmap.md** is the plan: the epics grouped into build steps that each end with a report and a full stop, the gates and estimated dates, the pitches and spikes, the undated list, the backlog, and the stories of the first step. Read it to decide what to build next and to see what a slip costs.
- **Line.md** is the binding text for every session, person or agent: what a builder owns, the kinds, every package with its dependencies, bridges and limits, every rule above in full, the shared conventions, the accepted limits and the report a step ends with. Read it before touching any package.
- A session that builds loads the library-design and lead-engineer skills; a deeper pitch loads design-pitch; a review loads red-team. Every rule is settled and is not asked again; anything left open becomes a setting with a default named in the report. Each step's design lives in the area file the roadmap names for it, and the step's stories are written from it at the step's start.
- Nothing waits for the developer: every question of the pitch is answered, the last two on 2026-10-24 (Saboteer ships after the packages are final, June 2028 estimated; Switchboard is the final name).
