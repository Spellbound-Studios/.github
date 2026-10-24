# What changes in Unity 6.7 and Unity 7, for the two games and the packages (2026-10-24)

Written by the Unity release-notes reader at checkpoint 4. Plain words first, the engine term once in brackets so an engineer can find it. Every claim names its page by number from the list at the end. Anything I worked out myself and Unity did not say is marked (inferred). Nothing the developer decided is reopened: the floor is 6000.3, no epic waits for 6.7, Entities is nowhere in the line, Instancing draws with BatchRendererGroup, and the probe installs the 6.7 beta in one dev project right after planning.

## Revision note

2026-10-24. First version. I read 22 Unity pages (list at the end, each with the date it shows). Unity's own release pages show no release date for any beta or alpha build, so build dates come from the forum posts that announce them. Unity 6.7 is in beta (first beta announced 2026-09-17; builds up to 6000.7.0b7 are named; notes read for b1 and b6). Unity 7.0 is in alpha (announced 2026-10-05; notes read for 7000.0.0a12). The 6.7 "what is new" page and its upgrade guide do not exist yet; Unity says both come when the release leaves beta (page 5).

## Three sentences for the executive brief

1. Nothing in Unity 6.7 or the first Unity 7 alpha forces Saboteer or Corsairs Isle to change anything before Saboteer's February 2027 demo, because both games stay on Unity 6.4 until they choose to move (inferred from the pages and from the decided floor).
2. The big change is under the hood: 6.7 is the last Unity that runs game code on Mono, Unity 7 runs it on CoreCLR (Microsoft's current .NET engine) with no Mono at all, Unity 7 drops the old built-in graphics pipeline (both games already use URP), and the Localization package that Saboteer uses is replaced (pages 4, 7, 9, 10, 14, 15).
3. For the packages the cost is a short list of checks that the 6.7 beta probe runs first, such as code that lists loaded assemblies, saved-object cycles, and Collections becoming part of the engine, and no announced change needs a decision or delays an epic.

## Changes that touch the two games

"When" is when the change reaches a game that moves to that Unity. Neither game moves before its own plan says so.

| What Unity changes | Game | What the game does about it | When |
|---|---|---|---|
| Windows builds use the Microsoft C++ runtime as separate files, and Unity copies those files into the build folder; the copying can be switched off (page 8) | Both | The Steam upload keeps those files in the upload, or the build turns the copy off and the Steam depot ships them another way (inferred: I did not read the BuildPipeline script) | First 6.7 build |
| Mono to CoreCLR: 6.7 is the last release built on Mono and carries an experimental CoreCLR desktop player; the 7.0 alpha editor runs on CoreCLR and the alpha removes the Mono desktop players (pages 9, 1, 14) | Both | Nothing until a game moves to Unity 7. Then its Windows build runs on CoreCLR, still limited in the alpha to C# 9 and the older .NET Standard 2.1 library set (page 9). The package-side checks are in the next table | Unity 7. No final date from engineering (page 9); Unity's blog targets release in Q1 2027 with a preview in December 2026 (page 12) |
| Domain reload (Unity restarting all game code on entering Play mode) is replaced in Unity 7 by a cheaper reload that keeps static variables alive; new Unity 7 projects start with fast Play mode on, existing projects keep their setting (pages 9, 1, 15) | Both | Static state that must reset on Play is reset on purpose. Saboteer has 2 files and Corsairs 1 file that list loaded assemblies or listen for the unload event (repo search, 2026-10-24) | Unity 7 |
| Localization: the package moves from 1.5.12 to 2.0.0 in the first 6.7 beta, and the b6 notes say a built-in module replaces the package, with migration support (pages 4, 7) | Saboteer (8 files use it, Smart Strings among them); Corsairs lists no Localization package (manifests, search 2026-10-24) | Stay on 1.5.12 on 6.4. At the move to 6.7 run Unity's migration once and fix what it flags. UI's Localization binding has to cope with the new shape (inferred) | 6.7 move |
| Ambient shadowing (SSAO) becomes a Volume setting; the old renderer-feature settings are no longer applied, so they are copied over by hand (page 7) | Both: each game's PC renderer asset names the SSAO feature (search; I did not check it is switched on) | Copy the settings into a Volume override after the move | 6.7 move |
| Entities: the managed-component calls Unity deprecated in 6.6 are compile errors from the first 6.7 beta (page 4); in the 7.0 alpha the Entities runtime ships inside the engine (page 1) | Corsairs (Entities 6.4.0 in its manifest); Saboteer only through the packages | Nothing new: the line removes Entities from the packages and Corsairs follows the line. The probe compile shows early if anything errors (inferred) | 6.7 move |
| URP gains real-time bounced light that needs no baking (Surface Cache GI), screen reflections (SSR) and a new AO option (GTAO). Unity describes the GI as working with changing geometry and procedural scenes (pages 3, 10) | Corsairs most, because its terrain is editable (inferred); Saboteer builds its board at runtime too (inferred) | Optional. A look at Corsairs' lighting during the probe, nothing required | 6.7 LTS |
| Unity 7 keeps one render pipeline, URP: the built-in pipeline is "obsolete and removed in Unity 7.0" and HDRP is deprecated in 7.0 (pages 10, 11) | Both already use URP (renderer and global settings assets exist in both) | Nothing | Unity 7 |
| The two-sided options "Back To Front" and "Front To Back" are removed from URP Shader Graphs; those materials draw front faces only (page 1) | Both: 24 Shader Graph files between them (search) | Look at any two-sided see-through material after a move to Unity 7 | Unity 7 |
| The a12 notes carry two entries on the version line of text-saved files: one says every such file now starts with a version line (`%UNITY 7.0`), so an older Unity refuses it with a clear error and all assets reimport on first open; a later entry says text files no longer start with that line, so Unity 6 can open them again. The page gives no order between the two (page 1, both entries) | Both | A person opens a game in a Unity 7 alpha only on a throwaway copy, never the shared working project, because two or more people work in each project; the probe's copy settles which entry holds (decided 2026-10-24) | Now, if anyone tries the alpha |
| Support dates: 6.0 LTS ends in October 2026 and 6.3 LTS runs to December 2027 (page 16); the built-in pipeline stays supported through the end of 2028 with 6.7 LTS (page 10) | Both | The floor of 6000.3 stands | Already decided |

## Changes that touch a package of the line

"Story" means the change adds work to an epic. "Probe" means the 6.7 beta probe looks and reports; no work is planned. "Nothing" means no action.

| What Unity changes | Package | Story, probe or nothing | Area key |
|---|---|---|---|
| Listing loaded assemblies is not recommended (use `UnityEngine.Assemblies.CurrentAssemblies.GetLoadedAssemblies`), the unload event stops firing, and statics survive a code reload (page 15). The March guide said Mono ends in 6.8; the June and October posts say 7.0 (pages 14, 15, 9) | Core (2 files), Persistence (1), Volumetrics (3) | Nothing new: this is epic U8 already; its date moves from 6.8 to 7.0 | unity |
| Self-referencing and cyclic saved fields (`UAC1005` to `UAC1008`) turn from warnings into compile errors in 6.7 (page 8); two more rules (`UAC1019`, `UAC1020`) flag saved references used as dictionary keys or values (page 6) | Modifiers (11 files use the saved-reference attribute), Core (3); also Corsairs (1) | Probe, first check | unity |
| Collections was moved into an engine module in the first 6.7 beta (page 4); Burst is a module since 6.6 (page 2). The line declares Collections as a package at the 6000.3 floor | WorldObjects, GeoForge, WorldForge, Navigation, Instancing, Volumetrics | Probe: does declaring the package still compile on 6.7 (inferred risk: duplicate types) | unity |
| Localization 2.0 and the built-in module (pages 4, 7) | UI (its Localization binding) | Probe now; a story only if the type names changed | ui |
| UI Toolkit keeps growing: backdrop blur and drop-shadow filters (6.6, page 2); box shadows (page 1); gradients, a `gap` property and experimental screen-reader support (page 7). In Unity 7 a theme style sheet outranks built-in styles regardless of detail unless "Legacy Theme Priority" is on (page 1) | UI | Story: add these four to the UI area's "must not reinvent" list. Probe for the theme rule when the kit's theme is first tried in Unity 7 | ui |
| Unity plans volumetric fog for URP in the 7.x cycle in 2027 (page 10). The ledger row says Unity's plans do not mention volumetric fog | Volumetrics | Nothing now. The ledger row changes from Keeps to Watch with a dated trigger; re-judge when it ships | unity |
| A new `PhysicsSceneLoadScope` controls which physics scene a loaded scene asset uses (page 6) | Networking, Runtime (one physics scene per world instance) | Probe: does it make giving a world its own physics scene simpler than the route the area designed (inferred; I did not read the API page) | networking |
| The Resident Drawer gets batch statistics in the Game view and a profiler chart (page 7). I found no BatchRendererGroup change in the notes I read (pages 4, 7) | Instancing | Nothing. The probe still checks the "Keep All" variants setting from the manual | unity |
| `AddObjectToAsset` no longer replaces an asset's main object in the 7.0 alpha (page 1). Callers: GeoForge `VoxelMaterialDatabase.cs:195`, VolumetricFog's editor setup, and the Heathen Steam asset in both games (search) | GeoForge, Volumetrics, the games' Steam asset | Probe on Unity 7, not 6.7 | world |
| Project Auditor adds code analysis built on MSBuild, and its rules package is 3.1.0 (page 1) | PackageCheck, the Studio tooling | Probe: feeds the existing go or no-go on compiled smell rules in batch mode | living |
| Unity's command-line tool and MCP server are free, in closed beta now, with general release "later this year", for Unity 6 and later (page 12) | Core (Pipeline bridge), the command line | Watch; the area reads the release when it lands (I did not read the tool's own page) | commandline |
| Unity's ECS packages are core packages that track the editor version, and the managed-component calls are errors in 6.7 (pages 17, 4) | Any package still naming Entities | Nothing, because Entities is nowhere in the line | unity |
| No new animation system in anything I read; the 7.0 alpha adds named animatable channels for MonoBehaviours (page 1); Animation Rigging has been a core package since 6.6 (page 2) | Character | Nothing | unity |
| AI Navigation 2.0.16 is the only navigation change in the 6.7 notes I read (page 7) | Navigation | Nothing | pathfinding |
| Floating-point results may differ from Mono on CoreCLR; Burst and IL2CPP are not affected (page 15) | World generation, Core's seeded stream | Probe on Unity 7: make a world from one seed on 6.7 and on the Unity 7 alpha and compare. I did not search the code for text hashing, which Unity also says is not stable between runs (page 15) | world |
| Unity ships its own Steamworks package, 1.0.0 in the 7.0 alpha (page 1) | Studio.Online | Watch. I did not read what it holds | networking |
| The built-in pipeline is removed in Unity 7 (pages 10, 11) | Decals, Horizon, Instancing, Volumetrics (URP is hard in their sentences) | Nothing; it confirms rule 5 | line |
| A text asset re-saved by a Unity 7 editor may start with a `%UNITY 7.0` line that the editors the line supports refuse (page 1, two entries, order unknown) | Every package that ships text assets (the identity asset, samples, presets) | Story: the release scan reads the first line of every shipped text file and stops the release when the directive names a Unity newer than the oldest supported editor (decided 2026-10-24; Living's release gate) | living |

## What the 6.7 beta probe should check first

In this order, cheapest and most likely to fail first.

1. Does every package compile on the 6.7 beta? Look for removed or now-error calls and the saved-field rules (Modifiers and Core first).
2. Does declaring Collections, Burst and Mathematics as packages still compile, or do they clash with the engine's own copies?
3. Does Core's assembly scan and unload code still run, and does it print warnings?
4. If the probe project is Saboteer's or any project with Localization: does Unity's migration convert 1.5.12, and what does it flag?
5. Does a Windows build ship the C++ runtime files, and does the Steam upload include them?
6. Open the PC renderer in each game: is the old SSAO setting still honoured, and where does it go?
7. Instancing: draw with BatchRendererGroup under the manual's "Keep All" and no-stripping settings and record the Resident Drawer statistics.
8. Does PurrNet compile and connect two players on 6.7? (PurrNet declares Unity 2022.3 as its floor; nothing I read says how it behaves on 6.7.)
9. Does the world instance's own physics scene work with `PhysicsSceneLoadScope`?
10. Only if a project with Entities is the probe: the managed-component compile errors.

## What is announced but not dated

- Unity 6.7 LTS final release: no date on any page I read; the beta was announced 2026-09-17 (page 20 in the extra list). The decided "end of 2026" is the developer's estimate, not Unity's.
- Unity 7.0 final: the July blog says preview in December 2026 and release targeted for Q1 2027, subject to change (page 12); the October engineering post gives no date and says it cannot commit to a public date for C# 14 and .NET 10 in the CoreCLR editor (page 9). I report both and do not choose.
- C# 14 and .NET 10 in the Unity 7 editor: planned, undated (pages 9, 12). The alpha is limited to C# 9.
- Mono removal: the March guide said 6.8; the June and October posts say 7.0 (pages 15, 14, 9).
- New animation system: no 2026 status on any page I read; Unity's staff said earlier that it ships first as an experimental package with no date (page 18).
- Entities for everyone (GameObjects as entities, one transform, one authoring path): Unity staff call it a one to two year future, not ditched, with no single release to point to (pages 19, 20).
- URP in the 7.x cycle (2027): volumetric fog, modern materials, ray traced direct light (page 10).
- HDRP removal after the first Unity 7 LTS, estimated end of 2027 (page 10).
- A new graphics backend (Unity Graphics Kernel) with its own post to come (page 3).
- Shader Interfaces for custom lighting without forking URP: a reader's note on the forum thread, details expected in early 7.x; not confirmed by Unity (page 3).
- Input System becoming a core package: not in 6.7, no migration there (page 8).
- Speed work on CoreCLR: left to the LTS after 7.0 (pages 9, 14).

## Decision for the developer

Should the probe also open one throwaway copy of a dev project in the newest Unity 7 alpha, once, to see what breaks?
- Recommended: yes. Example: copy the folder of one package's dev project, open the copy in the alpha, and write down every error and warning in one list; the working project is never opened in it, and the list says whether the Unity 7 move is a small or a large job.
- Alternative: no, wait for the Unity 7 beta. Example: nothing is opened until Unity publishes a beta, and the first look at Unity 7 comes with a later checkpoint's notes.

## What I could not read

- Unity's release pages show no date for any build, so no build is dated by Unity itself (pages 1, 4, 5).
- The 6.7 notes are partial: b1 first 100,000 of 383,126 characters; b6 first 400,000 of 436,976; nothing for b2 to b5 or b7 beyond fix mentions. The 7.0 notes are partial: a12 first 200,000 of 330,058 characters. A change could sit in what I skipped, so the tables say "in the notes I read".
- The 6.7 "what is new" page and upgrade guide are not published, and neither are the 7.0 ones (pages 5, 21).
- The page for 7000.0.0a13 returned 404; its number appears only in fix notes (page 1).
- The BatchRendererGroup manual page for 6.7 returned 404, so I have no 6.7 text on it.
- Unity's roadmap page is a video and a PDF; I could not read the PDF (page 22).
- I did not re-read the 2025 animation and Unite roadmap threads; the ledger quotes them.
- PurrNet on 6.7 or Unity 7: unknown; the sites I am allowed to read do not cover it.
- I could not use Sonnet subagents in this run (no such tool was available), so I read every page myself.

## Pages read, with the date each shows

1. Unity 7000.0.0a12 release notes, unity.com/releases/editor/alpha/7000.0.0a12 (no date shown; follows the 2026-10-05 announcement)
2. Unity 6.6 what is new, docs.unity.com/en-us/engine/6000.7/manual/whats-new/unity66 (no date)
3. Graphics updates with the Unity 6.7 Beta, discussions.unity.com/t/1737140 (2026-09-21, replies to 2026-10-05)
4. Unity 6000.7.0b1 notes, unity.com/releases/editor/beta/6000.7.0b1 (no date)
5. Unity 6.7 manual landing page, docs.unity.com/en-us/engine/6000.7/manual (no date; says 6.7 is a beta)
6. Unity 6000.7.0b6 notes, later part (changes, API changes), unity.com/releases/editor/beta/6000.7.0b6 (no date)
7. Unity 6000.7.0b6 notes, first part (features, known issues, packages), same page (no date)
8. Planned breaking changes in Unity 6.7, discussions.unity.com/t/1723293 (2026-06-16, later edits undated)
9. CoreCLR, Scripting, and .NET Update, October 2026, discussions.unity.com/t/1738338 (2026-10-05, replies to 2026-10-06)
10. The path to a single render pipeline in Unity 7, unity.com/topics/the-path-to-a-single-render-pipeline-in-unity-7 (undated page; says 6.7 was in beta)
11. The forum copy of page 10, discussions.unity.com/t/1737908 (2026-09-29)
12. Unite Seoul 2026 keynote recap, unity.com/blog/unite-seoul-keynote-2026-recap (2026-07-21)
13. Unity 7.0 alpha notes, third part (Unity 7 changes and removals), same page as 1 (no date)
14. CoreCLR, Scripting, and Serialization Update, June 2026, discussions.unity.com/t/1723299 (2026-06-16)
15. Path to CoreCLR, 2026: Upgrade Guide, discussions.unity.com/t/1714279 (2026-03-26, replies to 2026-04-08)
16. Unity 6 support page, unity.com/releases/unity-6/support (no date)
17. ECS Development Status for Unity 6.6, discussions.unity.com/t/1724480 (2026-06-29)
18. Web search of the Unity forums on the new animation system (no 2026 status found; earlier staff statements only)
19. 2026 ECS for all, discussions.unity.com/t/1732447 (2026, undated in the text I received)
20. Unity 6.7 Beta is now available, discussions.unity.com/t/1736830 (2026-09-17, replies to 2026-09-19); and Unity 7.0 Alpha is now available, discussions.unity.com/t/1738310 (2026-10-05, staff replies 2026-10-06)
21. Unity 7.0 alpha manual landing page, docs.unity.com/en-us/engine/7000.0/manual (no date)
22. Unity roadmap page, unity.com/roadmap (undated; the Unite Seoul 2026 roadmap PDF was not read)

Also read: unity.com/releases and unity.com/releases/editor/whats-new (6000.6.7f1 released 2026-10-21). Repo searches were run on 2026-10-24 over the Spellbound sibling folders (read only).
