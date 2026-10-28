# The Spellbound package line: the roadmap

What this is: the plan for building the line, for a person or an agent who needs the order of work, the dates, the costs and the first stories. For: anyone starting or leading a build session on the line, in any repository of the organisation. Date: 2026-10-24. Read `Brief.md` first if you have read nothing else; the binding rules, the packages and the shared conventions are in `Line.md` beside this file. Every rule in those files is decided and is not asked again. Anything a story leaves open becomes a setting with a sensible default, named in that step's report. Nothing is pinned, every date is an estimate the developer is not bound by, and the game is Saboteer.

A "gate" is one story that a person reviews and signs off. The planning rate is one gate per person per working day, beside their own work, with two people (two streams) from 2026-11-02. Sprints are 14 days from 2026-11-02.

## The result in six lines

- **889 gates in 119 epics**, 148.0 million tokens, 167.3 million with the red-team rounds (15.7 million for 49 epics of eight stories or more, 3.6 million for four milestone rounds). Re-priced on 2026-10-24 with the owners' counts after the readers' round: A5a 6 and A5b 4, A4c (2 gates, new), R6d 3, and UI4c (2 gates, new), five gates more than the 884 of the hand-off. Outside the dates: 14 undated gates (1.9 million tokens) and 21 backlog gates (3.3 million), priced and not scheduled.
- **Two milestones measured by the games, and one release.** Saboteer on the line, estimated **2028-01-10** (538 gates finished; its soak ends 2028-01-04 and the make-playable loop closes it). Corsairs Isle on the line, estimated **2028-04-25** (676 gates). Saboteer's first Steam release, estimated **2028-06-12** (736 gates): it waits for every Saboteer-tagged part, for Corsairs' soak and for the first final tags, because from the day it ships Saboteer follows a maintenance branch that refuses removals. The plan ends, estimated, 2028-10-11. With leave and public holidays priced in (0.93 gates per person per day) the estimates are 2028-04-10, 2028-06-12 becomes 2028-10-20, 2028-08-21 and 2029-03-27.
- **Capacity decides the dates.** The longest chain is 100 gates to Saboteer's soak, 111 to Corsairs' and 124 to the first release. With unlimited streams and no freeze Saboteer would land 2027-04-13 and Corsairs 2027-04-29. Two streams at the planning rate carry 885 gates in about 443 working days each.
- **Saboteer's Next Fest demo is due before 11 February 2027 and the plan meets it, with the new UI and chat in it and no margin.** The cut-over (44 gates, Corsairs' compile-only cut-over included) ends estimated 2027-01-14, the first day of the code freeze: the train's two manifest lines are the freeze's one exemption and UI4c is not Saboteer-tagged, so nothing runs in the freeze that the rule forbids. The five gates of the re-price cost two working days on Saboteer's milestone and four on Corsairs'.
- **Navigation, ships and moving decks included, runs after the Corsairs milestone and before any Corsairs launch**: 51 gates in six epics (estimated 2028-05-22 to 2028-08-29) plus a 5-gate spike that runs early (estimated 2027-05-05 to 2027-05-11). The plan refuses any earlier start of the Navigation epics.
- **Nothing waits on a decision.** Saboteer goes on sale in June 2028, after the removals and the first final tags, confirmed by the developer's note of 2026-10-24: Saboteer does not release until the packages are final. The one thing the plan cannot do is hold a margin: the cut-over's last Saboteer-tagged part ends the working day before the freeze, and a loss of two days anywhere in the first ten weeks moves it behind the festival.

## The two milestones and what each means

A milestone is the day the last part of its class finishes. "Gates so far" counts every gate finished by that date, whatever its class. Every date is an estimate.

| Milestone | Estimated date | Gates so far | What it means |
|---|---|---|---|
| Cut-over before the freeze | 2027-01-14 | 86 | Core on assemblies with its consumers' references, the layout and shell template, the first slice of Persistence, the operations, Saboteer's ten commands on the new console, the UI kit split from Chat and Core, widgets, input contexts, the HUD layout section, Switchboard with Saboteer's cut-over, and Corsairs' compile-only cut-over of its console view and chat glue. Nothing else rewires Saboteer before the freeze; the train lands on the freeze's first day under the manifest-line exemption |
| Saboteer's demo build (the developer's) | build due before 2027-02-11, assumed 2027-02-03 | 114 | Today's Saboteer on the branches it follows, with the cut-over in it. The Steam deploy is the developer's act |
| Foundation round (a waypoint, not a milestone) | 2027-04-19 | 206 | Operations, the Pipeline bridge, the shipped agent context, the observation and simulation vocabularies, the runner, the baseline soak, the authoring contract, the first stranger. A round of eight readers runs here |
| **Saboteer on the line** | **2028-01-10** (2028-04-10 at 0.93) | 538 | Saboteer plays the same or better on the new packages and is easier to extend. Core with operations, observation and the authoring contract, the old console gone; WorldObjects, StateMachine and Character with reference frames, riding and containment; Networking in place of its terrain module and chat glue, its crew log relay kept; UI as a kit with one console, Switchboard over the wire, tooltips and settings rows; GeoForge's density seam; Places with Saboteer's solver, captures and boards, GeoForge Pro out of its manifest; prefabs on contract nodes; inventory transactions with the linked move on the owner's authority; Persistence with both games' stores converted and the upgrade of old saves; the make-playable loop (a held prop into the game without an engineer); the soak and fault matrix. It still compiles Entities through Core and still follows the branches |
| **Corsairs Isle on the line** | **2028-04-25** (2028-08-21 at 0.93) | 676 | Today's Corsairs on the new packages: the world model and density seam, objects out, Places in the world, Horizon and near-meets-far, seed preview, lines and scatter, the store and the Instancing seam with Core free of Entities, its network modules replaced, its commands converted and the old console gone, its inventory on transactions, its saving on the new Persistence, the shared studio content, a board nested in a place, and its own soak. Saboteer sheds Entities and its soak is repeated once, before it ships. It is not the launch |
| **Saboteer's first Steam release** | **2028-06-12** (2028-10-20 at 0.93) | 736 | The act of shipping, not a gate. It follows every Saboteer-tagged part, Corsairs' soak, Diagnostics and Studio.Online, Core's audit and Core 2.0, the tag gate, the release checklist and the candidate tag; LV6m (the window's maintenance mode) and WF5m (the maintenance branch cut and protected in every repository) land that day. From this day Saboteer follows `release-<major>` and a removal can no longer reach it. The date is confirmed by the developer's note of 2026-10-24: Saboteer does not release until the packages are final |
| Navigation window | 2028-05-22 to 2028-08-29 | | The ground field, the hierarchy, built things, the authoring and agent surface, ships and moving decks, path following, and World's tag volumes with its story that runs Navigation's reachability check against a place (ends 2028-09-20), after the Corsairs milestone and before any launch. The Places gym (W4c) runs 2028-05-23 to 2028-06-13 beside it |
| The line complete | 2028-10-04 | | Every package with operations, the racing and underwater strangers and the matrix, the rest of Send, Navigation, Diagnostics and the editor face |
| Plan ends (audit and its fixes) | 2028-10-11 | 889 | The audit pass of every package that is not Core and its fixes |
| Undated, after Corsairs on the line | none | 14 | Selling, the test runner spike, the provisional far layer |

Each milestone is followed by an eight-lens red-team round (0.91 million tokens) and its fix gates, and this plan is re-issued with the measured gate rate and token rate.

### Saboteer's Next Fest demo

Steam Next Fest runs 22 February to 1 March 2027, the press preview is 11 February and registration is about 10 January. Those dates come from third-party sites. The developer checks Steam's own partner page before 14 December 2026, and the freeze moves with whatever it says.

- **Contains:** the new console with Saboteer's ten commands, the new chat window and settings page with Saboteer's cut-over to Switchboard (a thin chat network, local transport), the split UI package and widgets, input contexts, the layout section (a HUD layout saved in an earlier build shows the default once; the demo is exempt from the saves rule), Core on assemblies with the manifest edits, and the first slice of Persistence.
- **Does not contain:** the networked chat bridge (UI4b, estimated 2027-07-07 to 2027-07-13, so the chat corruption above U+00FF stays), the minimal Send and artist ruleset (A5a 2027-03-15 to 2027-03-23, WF1r 2027-03-24), the demo tag script and template files (WF7a 2027-03-30 to 2027-04-01, so the demo is tagged by hand), and any rewire beyond the cut-over (the first, L3, starts 2027-04-20).
- **Side branch:** Modifiers' move onto the authoring contract (inside CL4, built estimated 2027-02-11 to 2027-02-25 on `definition-contract`, with `beta` merged into the branch at the end of each sprint) merges estimated 2027-03-02, after the festival's last gate. It is the one change that could break Saboteer's build. Nothing waits for it.
- **Freeze:** no Saboteer-tagged part runs from 2027-01-14 to 2027-03-01 (bug fixes and media only, build scenes frozen); manifest lines (LS, W10aL) are exempt. The four festival gates are fixed days: ship the demo build 2027-02-03, defects 2027-02-09, festival fixes 2027-02-24, wrap up and re-test 2027-03-02.
- **Exposure:** nothing is pinned, so the packages Saboteer follows keep changing under the demo (Core on its dev branch, GeoForge on its 1.0 development branch, nine packages on their default branch). Core's assemblies, the references that follow them (L1, L1r, LM, LS) and the cut-over reach those branches as one train on 2027-01-14, the first day of the freeze, under the exemption for manifest lines: LM and LS wait for the console and the chat (UI4a, UI6b, CL3a) and LM for Corsairs' compile-only cut-over (UI4c, 2027-01-12 to 2027-01-13), so Corsairs keeps compiling on the branches it follows. Persistence's first slice (L8a) is a new slice under the new package id, installed beside the old `com.spellbound.persistence` that Saboteer still uses in 10 files, so nothing is renamed under the demo. Parts that run inside the window and are not Saboteer-tagged are additive or on the side branch.
- **Margin:** none. The last Saboteer-tagged part of the cut-over (UI6b) ends one working day before the freeze and the train lands on the freeze's first day. At 0.93 gates per person per day the train lands 2027-03-29, after the festival; with one person away in sprints 3 and 4 it lands 2027-03-17. The console is first (UI3 ends estimated 2027-01-06) and the chat cut-over last, so a slip costs the chat cut-over and keeps the new console in the demo.
- **Exception to the context rule:** the shipped agent context (CL5, then LV4a) normally stands before any rewire; the cut-over is the one exception because its sessions run on the studio's own skill files. Every later rewire waits for both.
- **Not met, and not meant to be:** the line itself cannot be in the demo (114 gates are finished by the build date and Saboteer on the line needs 534). Steam's own steps (store page review, demo app, build review, registration) are in no gate count.

## Build steps with hard stops

The epics are grouped into 70 steps in dependency order. A lead-engineer session takes one step at a time. **Each step ends with the report below and a full stop.** The next step starts only when the developer has sent the evidence the last column names and has said to continue. A step never starts before the steps in its "Waits for steps" column. Where that column shows no link between two steps the two streams may take them side by side; the epics table below carries the plan's dates, and steps follow dependency order, not calendar order. A step whose last column names a pitch, a spike or a probe stops at the written result, and the developer's answer is part of the evidence.

The gates in the step rows add up to 885, the plan's 889 dated gates less the 4 festival gates (row F), which are the developer's own. The design source of a step is the area file its epic ids name (below the table); the step's stories are written at its start, in the format of step 1's stories, and the developer approves them before the first is built.

| Step | Epics and parts (gates) | Gates | What it delivers | Waits for steps | Stop and wait for |
|---|---|---|---|---|---|
| 1 | **Core on assemblies**: L1 stories 1 to 6 (6), L1r (3) | 9 | Core drawn as assemblies with an engine-only part, the world-object and console folders in assemblies of their own, the folder cycles broken, the rebuild re-measured, and every consumer's references updated against CoreDev's working tree through a temporary local manifest line. | none | Evidence of a clean Core-only compile, the new rebuild numbers and each consumer compiling against the working tree. Nothing is merged to a branch a game follows; the developer makes the branch and removes the local lines. |
| 2 | **Layout, templates, Core's first vocabulary**: LV1a (2), LV1b (4), L1 story 7 (1), WF2a (4), L2c (3), R0d (1) | 15 | The one package layout proved by a probe, Inventory and Decals moved to it, Core's own move to it, the shell templates, Core's ground vocabulary, section attribute and reference frame noun, and the layout description of Core's packing (`CoreKit.Packing.Describe(type)`), which the section header's fingerprint and the surface writer both call. | 1 | The probe's written result. If git or Git LFS misbehave inside the package folder, or Unity rejects the short folder name, stop and ask. |
| 3 | **Persistence pitch**: PP (4) | 4 | The Persistence pitch with its spike: storage seam, section header, capture contract, database seam, and the upgrade of a shipped game's old saves. | 2 | The developer reviews and approves the pitch and judges the spike. Nothing in Persistence is built before. |
| 4 | **Operations in Core**: CL1 (10) | 10 | The operation attributes, catalog, parser, host, result type and audience tag, the built-in operations, and the reflection check first. | 1, 2 | The written go or no-go of the reflection check (a no-go moves discovery to a source generator) and the developer reading `core help` in a test project. |
| 5 | **The UI kit**: UI1 (10), UI2 (9) | 19 | UI split into Widgets, Screens and Tests with a truthful package, Unity's own TabView, theme variants, and the styled text, log, entry and window frame with a Gallery sample. | 1, 2 | The developer opens the Gallery and judges the widgets; the 10,000-line log flush figure is reported. |
| 6 | **Console, Saboteer's commands, layout**: UI3 (6), CL3a (2), L8a (2), UI6a (2), UI6b (2) | 14 | The new console over the operation list, Saboteer's ten commands converted and its old console views deleted, input contexts, and the first slice of Persistence (a new slice under the new id, beside the old package) with the HUD layout saved as a section. | 2 (with R0d), 3, 4, 5 | The developer plays Saboteer on the branch: console works, ten commands run, a HUD layout saved earlier shows the default once. |
| 7 | **Switchboard and Saboteer's chat**: UI4a1 (5), UI4a2 (5), UI4a (1) | 11 | Switchboard's library, its UI and settings page, and Saboteer's cut-over to it with a thin network layer and the local transport. | 2, 5, 6 | The developer plays a two-player session in Saboteer and judges the chat window and settings page. The networked bridge is not part of this step. |
| 8 | **The train reaches the games**: UI4c (2), LM (1), LS (1) | 4 | Corsairs' console view and chat glue take a compile-only cut-over onto the new console and Switchboard, then the manifest lines in both games follow the layout move, and Core's assemblies, the references, the console and the chat reach the branches the games follow together, on one day. | 1, 2, 6, 7 | The developer opens both games once on the followed branches and confirms they resolve and compile. The train lands on the first day of the freeze, under the exemption for manifest lines. |
| | *Cut-over before the freeze complete, estimated 2027-01-14, the first day of the freeze; its last Saboteer-tagged part ends 2027-01-13.* | | | | |
| F | **Festival, the developer's own gates**: SF (4) | 4 | Ship the demo build 2027-02-03, defects 2027-02-09, festival fixes 2027-02-24, wrap up and re-test 2027-03-02, all estimated and moved with Steam's partner page. Steps 9 onward run beside them | 8 | The developer chooses the build, runs the Steam deploy and the tag |
| 9 | **The agent route**: CL2 (6), CL5 (7) | 13 | The Pipeline bridge and the `spellbound_run` command, Volumetrics' commands as the first converted package, and the shipped agent context with generated operation blocks. | 4 | The developer sees an agent run a Core operation through the Unity CLI in a fixture project and reads the context file once. |
| 10 | **Probes and the Studio shell**: NW10 (1), NW2g (1), UN9 (4), L11t (2) | 8 | Who steps a world that predicts, the networking gate and its install offer (it also proves the error and player-build stop when PurrNet is installed outside the tested range), the Unity 6.7 beta and Unity 7 alpha notes from a throwaway copy of the Corsairs Isle project folder (a plain folder copy that skips Library, Temp and Logs), and the Studio.Tools shell. | 1, 2 | The developer reads and closes the written rule, the gate result and the Unity note. |
| 11 | **One convention, one board**: WF1a (2), WF1b (10), WF2b (4) | 16 | The board fields and report script, the commit subject rule, issue forms, the pull request Action, the organisation's GitHub App, protected main branches, and the template files. | 2 | The developer creates the GitHub App the organisation owns, stores its key as an organisation secret, and tries `setup.sh` on a clean Windows machine and a Mac. |
| 12 | **Authoring contract**: CL4 (10) | 10 | The authored-definition contract, the check seam (`IDefinitionCheck<T>` and one attribute), drafts and approve, and Modifiers adopting the contract on a side branch. | 4 | The TypeCache proof, and the developer merging the side branch after the festival (estimated 2027-03-02). The branch is never merged earlier. |
| 13 | **Simulation vocabulary and editor controls**: R0 (9), UI7a (4), UN1a (4) | 17 | The tick, seeded stream, instance id, the clock with the tick source seam that answers the rate, and the seconds round trip in Core; the four shared editor controls; the Unity ledger and its check. | 1, 2, 4, 11, 12 | The developer confirms that the tick rate and the fixed step read as two independent settings (50 steps give 20 ticks on the default source), and judges the ledger rows. |
| 14 | **Runner, window shell, first inspectors**: LV2 (10), LV4a (3), UI7c1 (2), UI7c2 (1) | 16 | PackageCheck's read tier and the Spellbound window shell, the agent context contract and generators, and three inspectors rewritten in UI Toolkit. | many, latest 13 | The developer judges the three inspectors and the first run of the check page. |
| 15 | **Minimal Send and demo files**: A5a (6), WF1r (1), WF7a (3) | 10 | The artist's minimal Send with the branch-point rule, stacked sends and Get latest, the artist ruleset switched on in each game repository, and Saboteer's template files and tag script. | 10, 11 | A pushed art branch of the shape art/<artist>-<slug> opens a pull request from the commit subject, the clone's sign-in covers the push, and a branch of another shape is reported as refused or not; the developer reads the template files in Saboteer's repository. |
| 16 | **Readiness for Unity 6.7**: UN8 (5), MV (7) | 12 | CoreCLR and domain-reload readiness, then every project moved to Unity 6.7 LTS once it ships. | 4, 13, 14 | The developer opens each project on the new editor, reads the beta results, and decides whether the C++ runtime files go in the Steam upload. |
| 17 | **Observation, WorldObjects pitch, baseline soak**: R1a (5), PWO (4), R7a (4) | 13 | Observation declarations and per-world context, the WorldObjects pitch with its spike, and Saboteer's baseline soak figures. | 1, 2, 4, 13 | The developer approves the WorldObjects pitch, judges the spike, and captures the frame figures on the reference PC. Then run the foundation round (eight readers over the whole). |
| | *Foundation round (a waypoint), estimated 2027-04-20.* | | | | |
| 18 | **GeoForge presenter seam, world model start**: W1g (1), L7a (7), W1a (7) | 15 | Golden hashes of today's world output, taken in default float mode with today's Saboteer floor build time per seed recorded beside them, GeoForge's replaceable presenter and surface case query, and the first half of the world model. | many, latest 17 | The developer checks the golden hashes equal today's output and plays Saboteer on the branch. |
| 19 | **WorldObjects package**: FX1 (3), L3 (10) | 13 | The foundation round's fixes, then WorldObjects as a package with a world instance stepping its own physics scene. | many, latest 18 | The developer plays both games after the rewire. |
| 20 | **Navigation spike, packing slice**: NV1 (5), PK (5) | 10 | The Navigation spike with its written go or no-go, and Core's wire half (caller-owned buffers, bit writer, pure delta). | 2 | The developer closes the Navigation go or no-go in writing. On a no-go the decided fallback applies (Unity's NavMesh for walkers, our own volume search for the other movers) and NV2 onward are re-sized from the numbers. |
| 21 | **Replication protocol**: R1k (3), NW1 (12) | 15 | The intent key and ledger, then the engine-only replication protocol with its simulator. | 2, 13, 17, 20 | The developer reads the simulator's hostile-command and join-race results. |
| 22 | **Density out**: W20 (1), W2a (14) | 15 | Pro's nine generation passes planned (go or no-go), then GeoForge's density source seam, run-list read, change event and chunk interest. | 18, 20 | The written go or no-go of the Pro spike and the developer's check that the Corsairs budgets still hold. |
| 23 | **Places core**: W4a (15) | 15 | The Place asset with typed layers, owners, adjacency composition from Saboteer's solver, nesting, validation and preview. | 2, 12, 19 | The solver convergence result on Saboteer's real parts, and the developer judging a composed place. |
| 24 | **StateMachine and Character**: L4 (10), R5a (5), R4p (1) | 16 | Controller split into StateMachine and Character, the rig contract asset and edit-mode surface, and the playable marker on the controller. | 1, 2, 9, 14, 17 | The developer plays both gyms and judges feel. |
| 25 | **ArtPipeline core**: A1a (9), A1b (8) | 17 | The art rules as game assets, checks, importer repairs, the docked verdict window, the folder audit, the reference sample and Keep as new material. | 2, 4, 12, 13 | The developer judges the verdict picture and the Maya and Blender hint wording in the applications. |
| 26 | **Networking on PurrNet, Saboteer's chat bridge**: NW2 (12), NW4a (4), W6n (1), UI4b (4) | 21 | The replication hub on PurrNet with Saboteer's terrain module replaced, the event channel, the far layer planning story, and Switchboard's networked bridge that retires the chat corruption. | many, latest 21 | A two-process test watched by the developer, who also defines the telemetry-off symbol and makes the region prefab. |
| 27 | **Places layers**: W4b (14) | 14 | GeoForge.Places capture and bake as operations, the voxel layer, the edit-mode brush; the voxel layer's size and import time measured on one converted capture; the 51 captures stay Saboteer's only copy until W10a (step 32). | 2, 18, 21, 22, 23 | The developer sculpts a cave in edit mode. |
| 28 | **Art on characters**: A2 (10), A3 (5) | 15 | The Character bridge checks and the hold and wear tests with the verdict picture. | 12, 24, 25 | The developer judges the hold alignment picture. |
| 29 | **Flight recorder, riding**: R1b (6), R3a (7) | 13 | Guards, flight recorder and measurements, and reference frames with riding and four deleted ride copies. | 2, 13, 17, 21, 24 | The developer plays the gym on a moving platform. |
| 30 | **Containment and the audit**: L6 (5), R4 (10) | 15 | The Inventory and Modifiers audit, and containment with the support gate and rescue ladder. | many, latest 29 | The developer reads the audit's report and plays the rescue cases. |
| 31 | **Persistence finished**: L8 (4), L8c (4), L8u (4) | 12 | Persistence rewritten under the studio id, both games' store files converted, and the upgrade of a shipped game's old saves. | 3, 6 | The developer saves and loads in each game and opens a save written by today's Saboteer in a build from the line. |
| 32 | **Boards and generators**: L11d1 (1), W10a (12), W10aL (1) | 14 | The studio character and hold pose in Studio.Content, the board generators with no game's name, Saboteer's floors through Places, and GeoForge Pro removed from Saboteer's manifest. | many, latest 27 | The developer judges that the generated rooms match the old ones, the golden floors equal the default-mode hashes of step 18 (unless R0's both-modes comparison showed a difference and the developer re-took them), and the floor build time per seed is no slower than the figure from step 18. |
| 33 | **Checks, rules and strangers begin**: LV3a (6), LV5a (2), LV5s (1), WF3a (4), CL4b (3) | 16 | Operations and the Project Auditor probe, the stranger harness and card game, the title check and local gate, and the authored-key scan. | many, latest 14 | The Project Auditor go or no-go and the developer's post-status line; merge blocking on private repositories is agreed. |
| 34 | **Releases from commits, release gates**: WF4a (6), LV3b (5), LV7a (3), WF5a (3), LV7d (2) | 19 | Semantic release in CI with beta branches, compiled rules and the Studio.Tools story, the push gate and floor compile, the release train, and the stored-format and release scan gates. | 10, 31, 33 | A person merges the beta branch into the release candidate at the first release rehearsal. |
| 35 | **Studio.Gameplay, transactions**: PG (3), R6a (3), L11a1 (3), LV5b1 (1), LV5b2 (2) | 12 | The Studio.Gameplay pitch, Inventory's public transaction surface, equipment and talents in Studio, and the stranger projects for them. | many, latest 33 | The developer reviews and approves the Studio.Gameplay pitch. |
| 36 | **Decals, Volumetrics, tooltips**: L12 (8), UI5 (7) | 15 | Volumetrics renamed, Decals' URP default behind a bridge, TetherShop in its own repository, and the tooltip host with bound settings rows. | 1, 2, 5, 30 | The developer judges the fog and rope look and the tooltip look in both games. |
| 37 | **Inventory transactions**: R6b (5), R6c (5), R6d (3) | 13 | Raw writers closed and the chest, world item take and hotbar swap on transactions in Saboteer; Corsairs converted; the linked move across two writers, in both directions (the owner writes the source, the host writes the source), with its two-viewer test. | 26, 35 | The two-viewer latency test, and the developer playing the linked move: it must never show as lag. |
| 38 | **Networked riding and operations**: CL1b (3), NW4b (5), NW3s (1), R3b (3), R3c (1), R3d (1) | 14 | The router seam, the operation gateway and the networked clock, the physics-step order test, and riding over the network and with WorldObjects. | many, latest 29 | The developer watches the two-build test. |
| 39 | **Prefabs on contract nodes, readiness**: A4 (5), UI1b (1), FL (2), LV5b3 (1), LV5c0 (1) | 10 | Saboteer's two player prefabs rebuilt by hand on contract nodes, the Studio.Presentation folder, the floor move when 6.3 support ends, and two more stranger parts. | many, latest 38 | The developer judges the rebuilt prefabs; an engineer rebuilds them by hand. |
| 40 | **Make playable**: R8a (3), R8b (2), A7a (4) | 9 | WorldObjects' preset, spawn, find, inspect and remove operations and the object layer validator; the two authoring operations that write drafts; the prefab variant of a model, its preset and definition drafts, and Approve in the window, so a held prop reaches the game without an engineer. | 12, 19, 25, 30 | The developer runs scenario step 9 on a new prop and approves its drafts. |
| 41 | **Saboteer's soak**: R7b (4) | 4 | The full soak and fault matrix on Saboteer. This closes the Saboteer milestone; Saboteer keeps following the branches until its first Steam release, so removals can still reach it. | many, latest 40 | The developer captures the frame figures on the reference PC and watches the hull test. Then run the Saboteer round. |
| | *Saboteer on the line, estimated 2028-01-10.* | | | | |
| 42 | **Objects out, batch measurement**: FX2 (3), W3 (8), W9s (1), UN3 (5) | 17 | The round's fixes, WorldForge's placement records into WorldObjects, the 20,000 instance benchmark scene, and the batch path measurement with a written go or no-go. | many, latest 21 | The developer runs the measurement on the reference PC and reads a no-go if it comes. |
| 43 | **The world model and WorldForge pitch**: W2b (12), W6p (1), PW (3) | 16 | The bridge from WorldForge to GeoForge for Corsairs, Pro's pipeline retired for Corsairs, and the WorldForge internals pitch. | 1, 2, 18, 22, 26 | The developer captures the Corsairs F2 numbers with the bridge in place and approves the pitch. |
| 44 | **World model, second half**: W1b (12) | 12 | The rest of the world model: estimates, rasters and the compare story that prints one seed's golden hashes. | 18, 42 | The developer reads the compare output. |
| 45 | **Horizon**: W6a (6), W6b (5), W70 (1) | 12 | Horizon on URP with a height source, palette and handover, the far-field candidates measured, and the chosen renderer. | 2, 17, 18, 42 | The developer judges the seam by eye in the test scene. |
| 46 | **WorldObjects store and Instancing**: UN4a (5), UN5 (8) | 13 | The native-column store with the awakening job and region release, and the Instancing seam with its small culling routine. | many, latest 41 | The benchmark with 1, 20 and 200 viewers. |
| 47 | **The world in Corsairs**: W2c (2), W7 (10), UN6 (8) | 20 | Blob tables as plain structs, near meets far, and Entities leaving the games' manifests; UN6 waits for Saboteer's soak and W2c only, and Saboteer's own edits land before it ships. | many, latest 45 | The developer judges the seam in the test scene. |
| 48 | **Region streaming**: NW3a (7), NW3b (3) | 10 | World scope end to end with a capacity report, then WorldObjects.Networking and Corsairs' modules retired. | 19, 38, 45 | The developer measures a thousand colliders in a real dedicated-server build. |
| 49 | **Places, scatter, labels, nesting**: W5 (6), W9a (6), W8 (5), W10b (2) | 19 | Places in the world, carve and scatter rules, seed preview and labels, and a board nested in a place. | many, latest 45 | The developer plays a place in context at a real seed's site and judges the colour ramp. |
| 50 | **Corsairs conversion**: WF7b (5), L11a2 (1), L11d2 (1), UN4b (3), A4c (2), CL3b (4) | 16 | Corsairs on the template files with the pre-deploy hook that runs the release scan, the ability commands, Core's ECS deleted and Entities removed from Core's manifest, Corsairs' prefabs onto the rig contract, and Corsairs' commands converted with the old console types gone. Until A4c lands a prop sent to Corsairs sits at its pivot. | many, latest 46 | The developer plays Corsairs after the rewire. |
| 51 | **Corsairs' soak**: R7c (3) | 3 | Corsairs' own soak and one repeat of Saboteer's. This closes the Corsairs milestone. | many, latest 50 | The developer captures the figures and plays both games. Then run the Corsairs round. |
| | *Corsairs Isle on the line, estimated 2028-04-25.* | | | | |
| 52 | **Places gym**: W4c (14) | 14 | The gym over a Place or a prefab with the game's playable character, the cell grid with reroll-seed preview and checks, and Studio.Content's gym profile that offers the studio's playable characters. | 51, and every Saboteer-class part has ended | The developer plays a place in the gym and judges the cell-grid inspector. |
| 53 | **Navigation, the ground**: FX3 (3), NV2a (7), NV2b (6) | 16 | The round's fixes, then the ground field, tiles, profiles, four movers, grid and heightfield sources, and the GeoForge bridge with its oracle test. | 12, 17, 20, 22, 29 | The developer judges the spider and swimmer samples. |
| 54 | **Navigation, built things and hierarchy**: NV4 (10), NV3 (8) | 18 | Footprints, doors and portals, handles for owners, then the tile graph, free-space octree, why, distances and line of sight. | 19, 46, 53 | The developer judges the door, wall and column scenario. |
| 55 | **Navigation, authoring and reachability**: NV5 (9), W9b (3) | 12 | The profile inspector, gizmos, operations and the context file, then World's tag volumes and its story that runs Navigation's reachable-deposits check, built in NV5, against a place. | many, latest 54 | The developer judges the authoring surface. |
| 56 | **Navigation, following and ships**: NV9 (6), NV6 (5) | 11 | Path following, the crowd registry and avoidance chosen by measurement, then ships and moving decks. | 2, 24, 29, 53, 54 | The developer judges a path across a moving deck and the raid-of-forty test. |
| 57 | **Diagnostics, Studio.Online, Studio.Presentation, guards**: R2a (4), R2b (3), L11b (2), L11c (1), NW5 (7) | 17 | The collector, black box and overlay, the counter relay, Studio.Online, the Studio.Presentation remainder, and the networking audit and journal seam. Diagnostics and Studio.Online are new repositories, so they exist before the first release cuts its branch in every repository. | many, latest 41 | The developer judges the overlay and the window. |
| 58 | **Instancing internals**: PIN (3), UN7 (5), IN1 (4) | 12 | The Instancing internals pitch, mesh LOD and golden images, and grass and impostors. | 42, 46 | The developer approves the pitch and judges the grass and golden images. |
| 59 | **Command line and UI surfaces**: CL6a (6), CL7 (4), UI7b (5), UI8 (4) | 19 | Operations for Persistence, Character and the console, the editor face, UI.Editor's skin and Gallery, and the `ui` operations for agents. | many, latest 33 | The developer judges the skin in the Gallery. |
| 60 | **Release machinery**: WF4b (6), WF3b (5), LV4b (4) | 15 | The first release and final tag mechanism (estimated 2028-05-05 to 2028-05-15), the Unity jobs and local gate, and the rest of the context and first hour. | 14, 33, 34 | A person merges beta into the release candidate and moves main at the first stable release rehearsal. |
| 61 | **The window and rituals**: LV6 (8), UN1b (1), UN1c (1), WF8 (3) | 13 | The Spellbound window's Line and Package pages (the catalogue reader picks the known-good line whose Core range admits the installed Core), the ledger's Editor job and player bench, and the rituals. | many, latest 60 | The developer runs the drift report by hand. |
| 62 | **ArtPipeline finished**: A5b (4), A7b (1), A6 (2) | 7 | The setup check, the window and the check at Send, Open in gym, and the bridge docs and pair test. | many, latest 60 | The developer judges the open-in-gym step. |
| 63 | **Every package's operations**: CL6b (3), CL6c (5), CL6e (3), CL6d (2), CL6n (1) | 14 | One read-state operation per package, scheduled after the Corsairs milestone and before any launch. | many, latest 57 | The developer reads the operation list through `core help`. |
| 64 | **Persistence trade, Unity pool, far layer, prediction spike**: L8b (6), UN2 (6), NW9 (3), NW7 (1) | 16 | Durable trade and the database seam, Unity's pool and the registry asset, the far layer build, and the prediction packing spike. | many, latest 48 | The developer closes the prediction go or no-go in writing and moves Corsairs' presets out of Resources. |
| 65 | **Strangers and the matrix**: LV5m (1), LV5c (2), LV5d (2) | 5 | The Core-only compile without Entities, the racing and underwater strangers and the matrix with its drift report, which the release checklist waits for. | many, latest 53 | The developer reads the drift report. |
| 66 | **Saboteer's first Steam release**: AUc (3), CT (1), LV7b (2), LV7c (1), WF5b (2), LV6m (1), WF5m (1) | 11 | Core's audit and Core 2.0 (the stable tag of the rewrite above the baseline `v1.1.9`), the tag gate and the release checklist, the candidate tag that starts the strangers run and the pair matrix as a release artifact, the window's maintenance mode, and the maintenance branch `release-<major>` cut and protected in every repository. The release Action writes a package's known-good catalogue line for the major of the branch its tag was cut from. | 47, 50, 51, 57, 60, 64, 65 | Run `packagecheck release-scan` over Saboteer's project, then the developer runs the first Steam release act (estimated 2028-06-12). After it Saboteer follows `release-<major>` and no removal can reach it. |
| 67 | **The scenario in CI**: CL8 (3) | 3 | The cave-with-ore scenario scripted with the Unity CLI against a stranger project of five packages, run in CI, its navigation steps live once NV5 has landed. | 52, 55, 59, 63 | The developer reads the scenario's run. Then run the round that closes the line. |
| | *The line complete, estimated 2028-10-04.* | | | | |
| 68 | **Round fixes**: FX4 (3) | 3 | The fixes after the line is complete. | 67 | The developer reads the fixes. |
| 69 | **Audit**: AU (2), FX5 (6) | 8 | One audit pass of every package that is not Core, and its fixes. This ends the plan. If the audit finds a public line to remove or change in a package Saboteer installs, that change waits for the next major. | many, latest 68 | The developer reads the audit and its fixes. |
| | *The plan ends, estimated 2028-10-11.* | | | | |

The area file of an epic is named by its id: L, LM, LS, PK, MV, FL, IN1 and the pitches are `Areas/Line.md` and `Areas/Roadmap.md`; CL is `Areas/CommandLine.md`; R is `Areas/Runtime.md`; UI is `Areas/UI.md`; W is `Areas/World.md`; NW is `Areas/Networking.md`; UN is `Areas/Unity.md` and `Areas/UnityChanges.md`; NV is `Areas/Pathfinding.md`; A is `Areas/Art.md`; LV is `Areas/Living.md`; WF is `Areas/Workflow.md`; L11 and PG are the Studio sections of `Areas/Line.md` and `Areas/Homes.md`. L8a, L8, L8c, L8u and L8b read `Areas/Persistence.md`, the Persistence pitch's design, once the developer has approved it. Those files sit in the `Areas` folder beside this file; a step's lead reads the sections of its area file that name its epic, and nothing else of the pitch. Inside the area files a path of the form `Revisited/<Area>.md` names the same file under `Areas/`.

## The epics in order

Class says which milestone first needs an epic: **Cut-over and demo** (before the freeze and in Saboteer's Next Fest build), **Saboteer** (Saboteer on the line), **Corsairs** (Corsairs Isle on the line), **After Corsairs, before launch** (needed by neither game's milestone, built before any launch), and **the first release** (what Saboteer's first Steam release waits for). Every start and end is an estimate. An epic with several parts runs from its first part's start to its last part's end; the paragraphs name the parts. "Waits on" names parts by their ids, and a plan program checked every start against them.

| Epic | Name | Gates | Estimated start | Estimated end | Class | Waits on |
|---|---|---|---|---|---|---|
| L1 | Core as assemblies | 10 | 2026-11-02 | 2027-01-11 | Cut-over and demo | L1: none; L1r: L1 |
| LV1 | Layout and probes | 6 | 2026-11-02 | 2026-11-09 | Cut-over and demo | LV1a: none; LV1b: LV1a |
| WF2 | Templates | 8 | 2026-11-10 | 2027-02-10 | Cut-over and demo | WF2a: LV1a; WF2b: WF2a, WF1a |
| UI1 | UI split, truthful package, UIKit, theme validator, TabView | 11 | 2026-11-11 | 2028-01-07 | Cut-over and demo; UI1b Saboteer | UI1: L1, LV1b; UI1b: UI1, L11t |
| L2c | Core's ground vocabulary, section attribute and reference frame noun | 3 | 2026-11-17 | 2026-11-19 | Cut-over and demo | L1 |
| CL1 | Operations in Core | 13 | 2026-11-20 | 2027-11-01 | Cut-over and demo; CL1b Saboteer | CL1: L1; CL1b: CL1 |
| PP | Persistence pitch with its spike | 4 | 2026-11-26 | 2026-12-02 | Cut-over and demo | L2c |
| UI2 | StyledText, TextLog, TextEntry, WindowFrame | 9 | 2026-12-03 | 2026-12-16 | Cut-over and demo | UI1 |
| R0 | Simulation vocabulary in Core | 10 | 2026-12-07 | 2027-03-12 | R0d Cut-over and demo; R0 Saboteer | R0d: L1; R0: L1, L2c, R0d |
| L8 | Persistence rewrite | 6 | 2026-12-08 | 2027-08-30 | L8a Cut-over and demo; L8 Saboteer | L8a: PP, L2c, LV1b, R0d; L8: L8a |
| UI4 | Switchboard | 17 | 2026-12-10 | 2027-07-13 | UI4a1, UI4a2, UI4a Cut-over and demo; UI4c Corsairs; UI4b Saboteer | UI4a1: UI1, L2c, L8a, WF2a; UI4a2: UI4a1, UI2, UI6a; UI4a: UI4a2, UI3, UI6a; UI4b: UI4a, NW4a, CL4; UI4c: UI3, UI4a |
| UI6 | Input contexts, layout as a Persistence section | 4 | 2026-12-17 | 2027-01-13 | Cut-over and demo | UI6a: UI1, L2c; UI6b: UI6a, L8a |
| UI3 | ConsolePanel and ConsoleView over the operation list | 6 | 2026-12-18 | 2027-01-06 | Cut-over and demo | UI2, CL1 |
| CL3 | Retire the old console, convert Saboteer and Corsairs | 6 | 2027-01-08 | 2028-04-24 | CL3a Cut-over and demo; CL3b Corsairs | CL3a: CL1, UI3; CL3b: CL3a, L3, UI4a, R8a |
| LM | Corsairs follows the layout move | 1 | 2027-01-14 | 2027-01-14 | Corsairs | L1, L1r, LV1b, UI4a, UI6b, CL3a, UI4c |
| LS | Saboteer follows the layout move | 1 | 2027-01-14 | 2027-01-14 | Saboteer | L1, L1r, LV1b, UI4a, UI6b, CL3a |
| CL2 | Pipeline bridge and spellbound_run | 6 | 2027-01-15 | 2027-01-25 | Saboteer | CL1 |
| NW10 | Stepping ownership when a world predicts | 1 | 2027-01-15 | 2027-01-15 | Saboteer | none |
| NW2 | PurrNet adapter and first consumers | 13 | 2027-01-18 | 2027-07-30 | Saboteer | NW2g: L1; NW2: NW1, L7a, NW2g |
| L11 | Studio packages | 11 | 2027-01-19 | 2028-05-22 | Saboteer | L11t: L1, WF2a, LV1b; L11a1: PG, L4, L6, R6a; L11a2: L11a1, UI5; L11b: NW2, R2b, UI4b; L11c: L8, UI6b, UI1b; L11d1: W4b, L11t, L4, R5a; L11d2: L11a1, L11a2, L11d1 |
| UN9 | Probe: Unity 6.7 beta and a Unity 7 copy | 4 | 2027-01-21 | 2027-01-27 | After Corsairs, before launch (runs early, 2027-01) | none |
| CL5 | AI context | 7 | 2027-01-26 | 2027-02-03 | Saboteer | CL1, CL2 |
| WF1 | One convention, one board | 13 | 2027-01-28 | 2027-03-24 | WF1a, WF1b Cut-over and demo; WF1r Saboteer | WF1a: none; WF1b: WF1a; WF1r: A5a |
| SF | Saboteer festival gates | 4 | 2027-02-03 | 2027-03-02 | Cut-over and demo | fixed days: 2027-02-03, 2027-02-09, 2027-02-24, 2027-03-02 |
| CL4 | Authoring contract and check seam | 13 | 2027-02-11 | 2027-10-13 | Saboteer | CL4: CL1; CL4b: CL4 |
| UN1 | The Unity ledger | 6 | 2027-02-18 | 2028-09-28 | After Corsairs, before launch | UN1a: CL1, WF1b; UN1b: UN1a, WF3b; UN1c: UN1a, CL2, UI2 |
| UI7a | Core.Editor controls | 4 | 2027-02-26 | 2027-03-03 | Saboteer | CL4 |
| LV2 | Runner and read tier | 10 | 2027-03-04 | 2027-03-18 | Saboteer | L1, LV1b, UI7a, CL4 |
| A5 | Send and Get latest | 10 | 2027-03-15 | 2028-09-05 | A5a Saboteer; A5b After Corsairs, before launch | A5a: WF1b, WF2b, L11t; A5b: A5a, A1b, WF3a, A4 |
| LV4 | Context and the first hour | 7 | 2027-03-22 | 2028-08-10 | LV4a Saboteer; LV4b After Corsairs, before launch | LV4a: CL1, LV2, CL5; LV4b: LV4a |
| UI7c | Three inspectors in UI Toolkit | 3 | 2027-03-25 | 2027-03-29 | After Corsairs, before launch | UI7c1: L1, UI7a; UI7c2: UI7c1, LV2 |
| UN8 | CoreCLR and domain-reload readiness | 5 | 2027-03-25 | 2027-03-31 | After Corsairs, before launch | LV2, CL1 |
| WF7a | Saboteer's demo build files | 3 | 2027-03-30 | 2027-04-01 | Cut-over and demo | WF1b, WF2b |
| MV | Move to Unity 6.7 LTS | 7 | 2027-04-01 | 2027-04-12 | After Corsairs, before launch (runs early, 2027-03) | UN1a, UN8 |
| R1a | Observation declarations and per-world context | 5 | 2027-04-05 | 2027-04-09 | Saboteer | L1, CL1 |
| PWO | WorldObjects pitch with its spike | 4 | 2027-04-12 | 2027-04-15 | Saboteer | L1, R0 |
| R7a | Baseline soak | 4 | 2027-04-13 | 2027-04-19 | Saboteer | R1a |
| W1 | The world model | 20 | 2027-04-19 | 2028-02-29 | Saboteer for W1g and W1a; Corsairs for W1b | W1g: none; W1a: L1, L2c, R0, R1a, CL4, W1g; W1b: W1a, PW |
| FX | Findings fixed after each round | 18 | 2027-04-20 | 2028-10-11 | Saboteer | the round each part follows: foundation round, Saboteer round, Corsairs round, line complete, audit |
| L3 | WorldObjects package | 10 | 2027-04-20 | 2027-05-04 | Saboteer | L1, R0, CL1, R1a, WF2a, W1g, R7a, PWO, CL5, LV4a, NW10 |
| L7a | GeoForge presenter seam | 7 | 2027-04-23 | 2027-05-04 | Saboteer | L1, CL1, LV1b, CL5, LV4a |
| NV1 | Navigation spike | 5 | 2027-05-05 | 2027-05-11 | Saboteer | WF2a, LV1a |
| PK | Packing slice | 5 | 2027-05-12 | 2027-05-19 | Saboteer | none |
| R1b | Flight recorder, guards, intent key and ledger, measurements | 9 | 2027-05-17 | 2027-08-13 | Saboteer | R1k: R1a; R1b: R1a, R1k |
| W2 | Density out | 29 | 2027-05-20 | 2028-03-07 | Saboteer for W20 and W2a; Corsairs for W2b and W2c | W20: none; W2a: W1a, L7a, W20, NV1; W2b: W2a, NW2; W2c: W2b, W10aL |
| W4a | Places core | 15 | 2027-05-20 | 2027-06-10 | Saboteer | CL4, L3, L2c |
| L4 | StateMachine and Character | 10 | 2027-06-14 | 2027-06-28 | Saboteer | L1, WF2a, R7a, CL5, LV4a |
| NW1 | Replication protocol | 12 | 2027-06-14 | 2027-06-30 | Saboteer | PK, R0, R1a, R1k, L2c |
| A1 | ArtPipeline core | 17 | 2027-06-29 | 2027-09-22 | Saboteer | A1a: CL1, CL4, WF2a, LV1a; A1b: A1a, UI7a |
| NW4 | Events, operations and time | 9 | 2027-07-01 | 2027-12-06 | Saboteer | NW4a: NW1, NW2g, CL1, UI3, R0; NW4b: NW1, NW4a, CL1b, R0 |
| W6 | Horizon draws | 13 | 2027-07-13 | 2028-02-21 | Corsairs | W6p: L1, L2c; W6a: W6p, WF2a; W6n: NW1; W6b: W6a, R1a, W1a |
| W4b | Places layers | 14 | 2027-07-14 | 2027-08-03 | Saboteer | W4a, W2a, NW1, L7a, L2c |
| R5a | Character.Rig edit-mode surface | 5 | 2027-08-02 | 2027-08-09 | Saboteer | L4 |
| R4 | Containment and the outside move seam | 11 | 2027-08-04 | 2027-11-01 | Saboteer | R4p: L4; R4: R1b, R3a, L7a, W2a |
| A2 | Character bridge | 10 | 2027-08-10 | 2027-08-24 | Saboteer | A1a, L4, R5a, R4p, CL4 |
| L6 | Inventory and Modifiers audit | 5 | 2027-08-16 | 2027-08-23 | Saboteer | L3, CL4, UI1 |
| R3 | Reference frames and riding | 12 | 2027-08-24 | 2027-12-20 | Saboteer | R3a: L4, R1a, R0, L2c; R3b: R3a, NW2; R3c: R3a, L3, PWO; R3d: R3a, NW3s |
| L8c | Persistence: both games' stores converted | 4 | 2027-08-31 | 2027-09-06 | Saboteer | L8 |
| LV5 | StrangersDev | 13 | 2027-09-02 | 2028-06-06 | LV5a, LV5s, LV5b1, LV5b2, LV5b3, LV5c0 Saboteer (8 gates); LV5m, LV5c, LV5d with the first release (5 gates) | LV5a: L1, LV2; LV5m: LV5a, UN4b; LV5s: LV5a, UI1; LV5b1 to LV5b3 and LV5c0: the packages each stranger installs (L3, L4, L6, L8, NW2, NW4b, UI2, UI4a, R6a, W4a); LV5c: LV5b1, L12, W6b, NV2a, L7a, R2a, L11b, UI4b, W4b, NW3a, L11a1, W2a; LV5d: LV5c |
| PG | Studio.Gameplay pitch | 3 | 2027-09-07 | 2027-09-09 | Saboteer | L6 |
| R6 | Inventory transactions | 11 | 2027-09-07 | 2027-12-13 | Saboteer | R6a: L6, R1b, NW1, NW2; R6b: R6a, L11a1, LV5b2; R6d: R6b, NW2 |
| W10a | Boards and generators | 13 | 2027-09-13 | 2027-09-30 | Saboteer | W10a: W4a, W4b, W1a, W2a, W20, L11d1; W10aL: W10a |
| LV3 | Operations and compiled rules | 11 | 2027-09-23 | 2027-11-19 | Saboteer | LV3a: CL1, CL4, LV2; LV3b: LV3a, L11t, CL4b |
| WF3 | Checks, adoption and the local gate | 9 | 2027-10-04 | 2028-08-22 | Saboteer | WF3a: WF1b, WF2b, LV2; WF3b: WF3a, LV3a |
| A3 | Hold test and wear test | 5 | 2027-10-08 | 2027-10-14 | Saboteer | A2, R5a |
| WF4 | Releases from commits | 12 | 2027-10-19 | 2028-05-15 | Saboteer | WF4a: WF3a; WF4b: WF4a, LV5a |
| L12 | Decals, Volumetrics, TetherShop to the bar | 8 | 2027-11-02 | 2027-11-11 | Saboteer | L1, WF2a, LV1b |
| R6c | Corsairs onto transactions | 5 | 2027-11-09 | 2027-11-16 | Corsairs | R6b |
| UI5 | Tooltip host and bound settings rows | 7 | 2027-11-17 | 2027-11-25 | Saboteer | UI2, L6 |
| A4 | Rewire Saboteer's prefabs onto contract nodes | 7 | 2027-11-22 | 2028-04-17 | A4 Saboteer; A4c Corsairs | A4: A2, L4, A1b, A3; A4c: A4, A2, A3, L4, R5a |
| LV7 | Gates | 8 | 2027-11-29 | 2028-06-07 | LV7a and LV7d Saboteer (5 gates); LV7b and LV7c with the first release (3 gates) | LV7a: LV3a, WF3a; LV7b: LV7a, WF4b, LV5b2, LV5c0, R7b, LV5m; LV7c: LV7b, LV5d; LV7d: LV3b, L8, LV7a |
| L8u | Persistence: upgrade of a shipped game's old saves | 4 | 2027-12-02 | 2027-12-07 | Saboteer | PP, L8 |
| FL | Floor moves to 6000.7 when 6.3 support ends | 2 | 2027-12-13 | 2027-12-14 | After Corsairs, before launch | LV7a, MV |
| WF5 | The release train | 6 | 2027-12-14 | 2028-06-12 | WF5a Saboteer; WF5b and WF5m with the first release | WF5a: WF4a; WF5b: WF5a, WF4b, LV5b1; WF5m: WF5a, R7b, every Saboteer-tagged part, R7c, CT, LV7c, WF5b, R2b, L11b, L11c |
| NW3 | Region streaming and the capacity report | 11 | 2027-12-17 | 2028-04-12 | Saboteer | NW3s: NW2; NW3a: NW3s; NW3b: NW3a, L3, UN4a |
| R8 | WorldObjects operations, object layer validator, authoring operations | 5 | 2027-12-20 | 2028-01-04 | Saboteer | R8a: L3, CL1; R8b: R8a, L6 |
| R7b | Full soak, gyms, fault matrix | 7 | 2027-12-21 | 2028-04-25 | R7b Saboteer; R7c Corsairs | R7b: every Saboteer rewire and the rest of Saboteer's class (L8c, L8u, LV7d, A4, R3, R4, R5a, R6b, R6d, W10a, W4b, WF5a, UI4b, UI5, NW4b, L12, L11a1); R7c: R7b and every Corsairs-class part (UN6, UN4b, UN5, W2b, W7, W9a, W5, W8, W1b, NW3b, R6c, W10b, WF7b, L11a2, L11d2, A4c) |
| A7 | Make playable and open in gym | 5 | 2028-01-05 | 2028-09-26 | A7a Saboteer; A7b After Corsairs, before launch | A7a: A1b, R8b, CL4; A7b: A7a, W4c |
| W3 | Objects out | 8 | 2028-01-10 | 2028-01-19 | Corsairs | W1a, L3, NW1 |
| W9a | Lines, scatter, benchmark scene | 7 | 2028-01-20 | 2028-04-04 | Corsairs | W9s: W1a, W3; W9a: W9s, W1b, UN5 |
| UN3 | Batch path measurement | 5 | 2028-01-24 | 2028-01-28 | Corsairs | L1, R1a, W9s |
| PW | WorldForge internals pitch | 3 | 2028-02-01 | 2028-02-03 | Corsairs | W1a |
| UN4 | WorldObjects store and awakening | 8 | 2028-02-07 | 2028-04-17 | Corsairs | UN4a: L3, R0, CL1, NW1, UN3; UN4b: UN4a, UN5 |
| UN5 | Instancing seam | 8 | 2028-02-22 | 2028-03-02 | Corsairs | UN3, UN4a, CL1, W1a |
| W7 | Near meets far | 11 | 2028-03-01 | 2028-03-22 | Corsairs | W70: W1a; W7: W2a, W3, W6b, W70 |
| UN6 | Blobs and hosts leave the games | 8 | 2028-03-14 | 2028-03-24 | Corsairs | L7a, W1a, W2a, W10aL, W2c, R7b |
| W5 | Places in the world | 6 | 2028-03-23 | 2028-03-30 | Corsairs | W1a, W4a |
| W8 | Seed preview and labels | 5 | 2028-04-03 | 2028-04-07 | Corsairs | W1a |
| WF7b | Games ship the same way | 5 | 2028-04-05 | 2028-04-11 | Corsairs | WF1b, WF2b, WF7a, R7b, LV7d |
| W10b | A board nested in a place | 2 | 2028-04-18 | 2028-04-19 | Corsairs | W10a, W4a |
| R2 | Diagnostics | 7 | 2028-04-25 | 2028-05-04 | After Corsairs, before the first release | R2a: R1a, R1b, UI2; R2b: R2a, NW2 |
| UN2 | Unity's pool and the registry asset | 6 | 2028-05-02 | 2028-05-09 | After Corsairs, before the first release | L1, CL1 |
| AUc | Core's audit before Core 2.0 | 3 | 2028-05-15 | 2028-05-17 | The first release | L1, PK, L2c, CL1, CL2, CL4, CL5, R0, R1a, R1b, UN2, UN4b, UN5 |
| CT | Core 2.0, the stable tag of the rewrite | 1 | 2028-05-19 | 2028-05-19 | The first release | AUc, UN4b, UN2 |
| NV2 | The ground field | 13 | 2028-05-22 | 2028-06-21 | After Corsairs, before launch | NV2a: NV1, CL4, R1a, R3a, L2c, and the Corsairs milestone reached; NV2b: NV2a, W2a, L2c |
| W4c | Places gym and checks | 14 | 2028-05-23 | 2028-06-13 | After Corsairs, before launch; behind every Saboteer-class part | W4a, W4b, UI7a, L11d1, and every Saboteer-class part has ended |
| LV6m | Window maintenance and branch modes | 1 | 2028-06-08 | 2028-06-08 | The first release | LV2, WF5a, R7b, every Saboteer-tagged part, R7c, CT, LV7c, WF5b, R2b, L11b, L11c |
| NV4 | Built things | 10 | 2028-06-13 | 2028-06-27 | After Corsairs, before launch | NV2a, L3, UN4a |
| NV3 | Hierarchy, why, distances, line of sight | 8 | 2028-06-22 | 2028-07-04 | After Corsairs, before launch | NV2b |
| NV5 | Authoring and agent surface | 9 | 2028-06-28 | 2028-07-11 | After Corsairs, before launch | NV2b, NV4, W4a, CL4, UI7a |
| PIN | Instancing internals pitch | 3 | 2028-07-05 | 2028-07-10 | After Corsairs, before launch | UN3, UN5 |
| CL6 | Every package's operations | 20 | 2028-07-11 | 2028-09-27 | After Corsairs, before launch | CL6a: CL2, L8, L4, UI3, UI4a; CL6b: CL2, L12; CL6c: CL2, L6, L7a, W1a, UN5; CL6d: CL2, NW2, R2a; CL6e: CL2, W4a, W6a, A1a; CL6n: CL2, NV2a |
| CL7 | Editor face | 4 | 2028-07-12 | 2028-07-17 | After Corsairs, before launch | CL1, CL4, CL4b, LV2, UI3 |
| UN7 | Batch renderer and mesh LOD | 5 | 2028-07-18 | 2028-07-25 | After Corsairs, before launch | UN3, UN5, PIN |
| LV6 | The Spellbound window: Line and Package pages | 8 | 2028-07-19 | 2028-07-31 | After Corsairs, before launch | CL1, LV2, WF4a, UI1 |
| NW5 | Guards, context and journal | 7 | 2028-07-26 | 2028-08-03 | After Corsairs, before launch | NW2, CL4, LV2 |
| L8b | Persistence: durable trade, per-entity records, database seam | 6 | 2028-08-07 | 2028-08-14 | After Corsairs, before launch | PP, L8, R6a, NW2 |
| NV9 | Path following, crowd registry, avoidance | 6 | 2028-08-11 | 2028-08-21 | After Corsairs, before launch | NV2b, NV3, L4, R3a |
| NV6 | Fields in reference frames and joined fields: ships and moving decks | 5 | 2028-08-23 | 2028-08-29 | After Corsairs, before launch | NV4, R3a, L2c |
| UI7b | UI.Editor: skin, Gallery, validators, Console page | 5 | 2028-08-29 | 2028-09-05 | After Corsairs, before launch | UI2, UI3, UI7a, LV2, CL7 |
| IN1 | Grass and impostors | 4 | 2028-09-06 | 2028-09-11 | After Corsairs, before launch | PIN, UN7 |
| UI8 | ui operations for agents | 4 | 2028-09-06 | 2028-09-11 | After Corsairs, before launch | UI6a, UI3, CL1, CL2 |
| CL8 | Scenario on a stranger project in CI | 3 | 2028-09-12 | 2028-09-14 | After Corsairs, before launch | CL2, CL4, CL5, LV5a, CL6a, CL6e, W4c, R8a |
| NW9 | Far layer build | 3 | 2028-09-18 | 2028-09-20 | After Corsairs, before launch | NW3a, W6n, W6a |
| W9b | Tag volumes and reachability | 3 | 2028-09-18 | 2028-09-20 | After Corsairs, before launch | W9a, W3, W4c, NV4, NV5 |
| A6 | Bridge docs, AI context, pair test | 2 | 2028-09-21 | 2028-09-22 | After Corsairs, before launch | A2, LV4b |
| WF8 | Rituals | 3 | 2028-09-21 | 2028-09-25 | After Corsairs, before launch | WF1b, UN1a |
| NW7 | Prediction packing spike | 1 | 2028-09-27 | 2028-09-27 | After Corsairs, before launch | NW2 |
| AU | Audit pass of the other packages | 2 | 2028-10-02 | 2028-10-03 | After Corsairs, before launch | every dated part |

### What each epic delivers

One paragraph per epic, grouped by area. Gate counts and dates are in the table above.

#### Line and Core

**L1 Core as assemblies.** Core is drawn as assemblies inside its own repository. One assembly depends on the engine alone and carries no Unity package; the world-object folders and the console folder each get an assembly of their own, waiting for their new homes; the folder cycles are broken; Core's packing is checked for engine types; the clean rebuild is measured again against the figures taken on 2026-10-22 (in Corsairs no Spellbound assembly starts compiling until Entities Graphics finishes, 27.9 s of a 35.4 s wall). One story moves Core's repository to the settled layout. Three more, L1r, add the new assembly references to GeoForge, Chat, VolumetricFog, Modifiers and Corsairs, which name the moved namespaces. L1 reaches the branches the games follow only together with L1r, LS and LM. Worth having alone: yes, the compiler now enforces Core's boundary. The compile gain for a project without Entities arrives when Entities leaves Core's manifest, in the last story of UN4.

**LM Corsairs follows the layout move.** Core and Inventory and Decals move to the settled layout, so Corsairs' manifest lines for those packages, which follow branches, need the path form. One story edits them in Corsairs in the same sitting as the restructure merge. Worth having alone: yes, Corsairs resolves its packages. A person opens Corsairs once.

**LS Saboteer follows the layout move.** The same story for Saboteer's manifest lines. It edits a manifest line and no scene or code, so it is allowed inside the code freeze. A person opens Saboteer once.

**PK Packing slice.** Core's wire half, split out so Networking does not wait on the rest of Core: packing into a caller-owned or pooled buffer, decode limits, the bit writer with varints and quantisation, standard reads as fast as the bitwise path, and the pure delta pack and unpack. No reader for an old layout is kept: a changed layout means re-save. Worth having alone: yes, it closes the measured packing gaps.

**L2c Core's ground vocabulary, section attribute and reference frame noun.** What the line puts in Core that no area epic carries: the section attribute (no versions, no migration steps), the ground vocabulary (surface sample and occupancy source) and the reference frame noun (`ReferenceFrameId`, `IReferenceFrame`, `ReferenceFramePose`, the per-world `ReferenceFrameDirectory` and `ReferenceFrameChecks.RequireConstantUp`). World's surface request, WorldForge's guard, Networking's partition case and the Places stamp compile against it months before riding is built. Worth having alone: partly, each declaration is usable the day it lands.

**L3 WorldObjects package.** WorldObjects becomes a package: the folders leave Core, a world instance steps its own physics scene, a replaceable presenter sits under the server define, change and resolve are named and enforced, ids come through the allocation seam, and there are no statics. Modifiers' stat binding and WorldForge's twelve files are rewired and both games follow. One story is the collision part that compiles in every build. It waits for the probe of who steps a world that predicts (NW10) before its driver story is frozen. Worth having alone: yes, Core is engine-only once Entities is gone. A person plays both games after the rewire.

**L4 StateMachine and Character.** Controller becomes StateMachine and Character (Body and Rig assemblies, the rig contract asset); its five unused dependencies go; the ragdoll builder and both games' copied state bindings come home. Walk, run, jump and fall are a Character sample over StateMachine; the house set of states lives in Studio.Gameplay. One story restructures the Controller repository. Worth having alone: yes. A person plays the two gyms and judges feel.

**L6 Inventory and Modifiers audit.** An audit of Inventory and Modifiers: conform both to the bar, measure them against the games, red-team their public surface, and confirm the seams Studio.Gameplay and Inventory transactions build on. One of its five stories restructures Modifiers. Worth having alone: yes.

**L7a GeoForge presenter seam.** GeoForge gets a replaceable chunk presenter under the server define (the internal prefab field opens) and the surface case query seam; the demo controller and legacy jobs go; two stories move GeoForge and WorldForge to the settled layout. Worth having alone: yes.

**L8 Persistence rewrite.** Persistence is rewritten under the studio id over Core's section attribute: a storage seam, owners' sections, unknown ids reported, and a section header carrying name, layout fingerprint and length. Durations are seconds. One story restructures the repository. L8a, the first two stories, writes and reads one section with Core's header and is built early because the HUD layout and the chat settings need it; it ships under the new id as a new slice beside the old `com.spellbound.persistence` package, which Saboteer keeps using until L8c, so it is exempt from the pairing below. It waits for the layout description R0d. The other four follow. L8 reaches the branch the games follow only together with L8c. Worth having alone: yes, for every consumer that saves.

**L8c Persistence: both games' stores converted.** Saboteer's settings, progress and chat settings files and Corsairs' stores (characters, inventory, equipment, stats, UI layout, GeoForge edits) move from the old static entry point and package id onto the rewritten Persistence. L8 keeps no reader of the old layout, so L8 and L8c reach the followed branch together. Worth having alone: no, it is the games' own conversion. A person saves and loads once in each game.

**L8u Persistence: upgrade of a shipped game's old saves.** In a shipped game the upgrade of its players' old saves runs on its own, and a customer may extend Persistence for their own players however they want. Detection stays as it is (an old layout is refused by name); this is the part that carries a player's save across. A game sold on Steam is a customer from its first release, so this is built before Saboteer's first Steam release; the Next Fest demo is exempt. Sized by the Persistence pitch. Worth having alone: yes, for every shipped game that saves.

**L8b Persistence: durable trade, per-entity records, database seam.** One durable unit across two containers (a gift between two characters is written to both or to neither), per-entity records loaded on login, partial region loads, and a database implementation of the storage seam. It serves the MMO and any game with accounts, so neither game waits on it. Sized by the Persistence pitch.

**L12 Decals, Volumetrics, TetherShop to the bar.** VolumetricFog is renamed Volumetrics; Decals' URP default becomes a bridge under the server define; TetherShop gets its own repository with its game-named kinds moved to its sample; every manifest carries a floor of 6000.3 and every bridge a version range. One story restructures VolumetricFog. Worth having alone: yes. A person judges the fog and rope look after the rename.

**MV Move to Unity 6.7 LTS.** Every project and dev project moves to Unity 6.7 LTS when it ships (the studio edits on 6.4 until then), using the Move template from UN1, after UN8's canary shows what breaks. Nothing waits for it: if 6.7 is late, work continues on 6.4 and the move carries it. Seven stories: the four of the move itself, Unity's Localization migration in Saboteer's eight files, the saved-reference cycle rules that become compile errors (11 files in Modifiers, 3 in Core, 1 in Corsairs), and the ambient-shadowing settings copied by hand into a Volume together with the C++ runtime files in the Steam upload. It does not start before 2027-01-04. A person opens each project on the new editor.

**FL Floor moves to 6000.7 when 6.3 support ends.** The floor moves to 6000.7 when 6.3 LTS support ends in December 2027: the 6.3 test row is dropped, the floor compile moves up and every manifest's floor is raised. The first Unity cycle's floor-move story.

**IN1 Grass and impostors.** Instancing's mass drawing from non-interactive placements and the scrolling cover grid, culling and impostors, with the grass measurement first. A placeholder priced from an earlier plan until the Instancing pitch replaces it. A person judges the grass. Evidence (2026-10-26): a grass probe measured GPU-generated grass in Windows players on Unity 6.4, 6.7 and 7.0, with the developer's answers on its draw path, look and GeoForge height; `Planning/PackageLine/Evidence/GrassProbe.md` in the Spellbound workspace.

#### Command line

**CL1 Operations in Core.** The operation attributes, catalog (marked assemblies only), tokenizer and parser, host, run, result, caller, the built-in help, about, history, stats and observation operations, the effect gate and audience check, and tests. Its first story is the reflection check: operation discovery under build stripping on Mono and IL2CPP against Unity's notes for 6.7 and the next major, ending in a go or no-go (a no-go moves discovery to a source generator). Its second checks that a Play Mode test can wait on a custom yield instruction. CL1 is stories 1 to 10, which UI's console needs; CL1b is stories 11 to 13: state replay of lines, the target marker on an operation and the router seam, which only Networking's operation stories read. Worth having alone: yes, it replaces three console mechanisms with one that has tests.

**CL2 Pipeline bridge and spellbound_run.** The Pipeline bridge assembly and the `spellbound_run` command, the caller policy and settings, a development build proven with the runtime flag, a fixture project driven by the Unity CLI in a test, and Volumetrics' three commands converted as the first package on the registry. It also runs on the 6000.3 floor row. Worth having alone: yes, an agent can run every Core and game operation from the Unity CLI.

**CL3 Retire the old console, convert Saboteer and Corsairs.** The three old attributes, the command interface, the two registries, the router and the console logger leave Core; Saboteer's ten command classes and Corsairs' fifty-seven methods are converted; Chat's sample and registry are deleted. CL3a (2 stories) converts Saboteer's ten classes once the new console exists and stands before the freeze so the demo shows the new console; CL3b (4 stories) converts Corsairs' commands, removes the old types and waits for WorldObjects' preset and spawn operations, because only Corsairs' commands call them.

**CL4 Authoring contract and check seam.** The authored-definition contract, the report and runner with the inspector banner and previewer, the check seam in Core.Editor as one interface, `IDefinitionCheck<T>`, and one attribute (a package adds its own check to a definition another package owns, and Core never changes for a new package), the draft folder and approve (an agent may not approve its own drafts unless one setting grants it), validate and preview operations, and a package folder as a subject. The check seam opens with proof that `TypeCache` finds an attributed class implementing a closed generic interface, with a scan of marked assemblies as the fallback. Modifiers adopts the contract first, on a branch called `definition-contract`, built during the freeze and merged on 2 March 2027 (estimated): it is the one change that could break Saboteer's build inside the freeze. CL4b (3 stories) holds the authored-key scan with the stored value text, `core revise` and the banner path. There is no format version, no migration step and no written note of a lost value: a changed format means re-author. Worth having alone: partly, valuable for Modifiers alone; the agent flow needs CL2. A person approves drafts in the window.

**CL5 AI context.** The six agent-context headings, the generated operation blocks rendered through `core context` (LV4a writes them into AGENTS.md and the release check fails a stale hash), `core context`, `core context-install`, `core about` and `core ledger`, with Volumetrics' file as the pilot. The dangling-identifier check is Living's (LV4a) and runs right after, so a package's hand-written headings are verified before the first rewire. Both are scheduled early: the agents that do the rewires learn each package's front door, rules and operations from this context and not from its source. The cut-over before the freeze is the one exception, because its sessions run on the studio's own skill files.

**CL6 Every package's operations.** One story per package, each a read-state operation with tests: twenty stories in six parts (CL6a Persistence, Character and the console; CL6b the three small packages; CL6c Inventory with the world seams; CL6d Networking and Diagnostics; CL6e Places, Horizon and ArtPipeline; CL6n Navigation, which waits for the ground field). WorldObjects' operations are R8's. Each part is scheduled after the Corsairs milestone and before any launch, not with its package's first epic. Until its part lands, a package ships without its read-state operation and its AGENTS.md operation table is empty; the line's rule that every package ships operations is met by launch, not by the package's first release. `artpipeline fix --keep` needs the audience `approver`, which a person in the window holds and an agent does not; an agent gets `refused:` with the way forward. CL6e adds no ArtPipeline operation beyond A1a's (check, fix, explain, preview, audit, unmatched, rules, setup); its ArtPipeline part is the registry check that the group lists in `core help`. Each is worth having alone.

**CL7 Editor face.** The Operations tab and the Drafts tab content, the completion data the console draws from, and the form generator, inside the Spellbound window.

**CL8 Scenario on a stranger project in CI.** The cave-with-ore scenario scripted with the Unity CLI against a stranger project of five packages, run in CI. The three navigation steps (7, 12 and 15) run when the report's checks line lists `navigation.reachable-deposits`, which holds from NV5, and are skipped until then, so the scenario does not wait for Navigation. Worth having alone: no, it is the acceptance test.

#### Runtime

**R0 Simulation vocabulary in Core.** R0d, one story built first in the cut-over closure, is `CoreKit.Packing.Describe(type)`, the layout description of Core's packing that the section header's fingerprint and the surface writer both call. R0, nine stories: Core's 64-bit tick, the tick source seam that answers the rate with the tick, its game-time default that adds each fixed step's length to a total and counts whole ticks at its own rate (tested at 50 steps giving 20 ticks), the never-backwards test, the up field, the seeded stream with golden vectors and a battery run, the instance id with its allocation seam, the determinism harness in the testing assembly, the clock in Core with its driver (started with one call in a scene that has no world instance), the float-mode measurement, which also hashes the golden regions in both float modes and prints any difference for the developer to decide on, and the seconds round trip: a save holds no tick rate, durations are written in seconds and converted at load, and nothing is refused for a rate. The tick rate and the fixed step are settings read once, 20 and 50 as the starting values, and a test shows that changing either changes no code. Worth having alone: yes, a package can drop `Time.time` and `UnityEngine.Random`.

**R1a Observation declarations and per-world context.** Observation keys with required descriptions, counters, gauges, costs with budgets and quality levels, per-operation costs, the call-site log sink and the observation operations. The bridges of the line wait on it. Worth having alone: yes, every package can report, and how often stops depending on message text.

**R1b Flight recorder, guards, intent key and ledger, measurements.** R1k is the intent key and the ledger, one per world in Core, which Networking stamps; R1b proper is the flight recorder, guards with policy, a native queue for jobs, the profiler mirror, the settings asset and key validator, and the measurements of the numbers table. The ledger's grace time is a number of seconds, and a departure rule has its own soak. Worth having alone: yes.

**R2 Diagnostics.** The collector, the black box as text and as an editor window, the counter relay over Networking's hub, and the one overlay that replaces five. The shipped recorder, its file and its relay are held for the prediction spike. Diagnostics comes after Corsairs on the line and before any launch, Saboteer's frame cost trace goes when R2's overlay lands. Its crew log relay stays until the shipped recorder exists, which waits for the prediction spike. A person judges the overlay and the window.

**R3 Reference frames and riding.** In Character.Body the `ReferenceFrameBinding`, the rider, the frame sources and motion claims, with the probe cost measured and Saboteer's four ride implementations deleted; the Character.Networking bridge; the Character.WorldObjects bridge after L3's collision part; and the world-step order test, which waits for Networking's Simulate story. The test asserts the order of clock, scripts, one Simulate with `Time.fixedDeltaTime`, then Stepped. It includes a hitch case that asserts the lag is reported and no extra step runs, a PredictionManager scene left alone, and a default-scene game where the clock still advances. R3a is what Navigation's ships and moving decks wait for. Worth having alone: yes, four copies become one tested one. Designers add the frame sources in the inspector; a person plays the gym.

**R4 Containment and the outside move seam.** The support gate, containment on a stride, the rescue ladder over a claim, Character.GeoForge and GeoForge's readiness query, and the outside move seam; the base floater and Corsairs' falling fix are deleted. R4p, its first story, adds the playable marker (`IPlayableCharacter`, `CharacterKit.Body.IsPlayable`) on the game's controller, tested in edit mode; it needs only Character, so ArtPipeline's Character bridge does not wait for the containment stories. Worth having alone: partly, the guard and ladder work without the gate.

**R5a Character.Rig edit-mode surface.** The rig contract asset with hold pose, rebinding of worn items, the ragdoll dry run, sockets resolved by id once at spawn, and the character operations. The contract has no integer version and its reference figure is a playable character's prefab. ArtPipeline's bridge calls these.

**R5b Ragdoll driver on claims (backlog).** Knock-down, hips handoff, get-up and carry as a claim. Backlog; see the backlog list.

**R6 Inventory transactions.** R6a is the public transaction surface (receipts, commit, mint and burn, conservation guard and audit, intent replay), on which Studio.Gameplay's equipment is built. Saboteer is owner-authoritative, so there is no escrow step: a player's own inventory changes at once. R6b makes the raw writers internal and moves the treasure chest, the world item take and the hotbar swap onto transactions; it merges to Inventory's followed branch only together with R6c, which starts right after it. R6d, three stories, is the linked move across two writers in both directions: both halves under one intent key, the first step always on the source's writer, the return step on a refusal, and a test with two viewers under simulated latency and loss. When the owner writes the source, its step commits on the click and the host's receipt follows. When the host writes the source (a chest the player takes from), the host commits the withdraw and the owner commits the deposit when the host's batch arrives; the mover's view draws the stack in flight at once, two takers of one stack resolve by the host's arrival order and the loser's drawing fades, and a use of the just-taken stack is held for at most one round trip plus 0.09 s (170 ms at an assumed 80 ms ping, computed). The client never sees a half: the stack is drawn in its target slot at once and swapped for the real item when the host's step replicates. Worth having alone: yes.

**R6c Corsairs onto transactions.** Corsairs' own conversion, right after R6b: the player bag engine's sort and merge as moves in one transaction, the save load as a mint, equipment inventory, the crafting console commands and the player container's writer setting. Seven call sites in Corsairs write slots today. Worth having alone: no; without it Corsairs stops compiling the day the raw writers close.

**R7a Baseline soak.** The areas scenario run against today's Saboteer with R1a's counters, so every later epic shows a before and after number. The fourth story records Saboteer's frame cost, worst frame and memory on the reference PC through the game's own frame cost trace (its first check is whether the trace gives total memory). Worth having alone: yes, it counts the bugs that exist.

**R7b Full soak, gyms, fault matrix.** Saboteer's soak and fault matrix (withheld support, hitch, repeated intent, late joiner, linked move under latency, save and load with a growing crop and a timed modifier set, and a rider on a hull in a dedicated-server build), run headless through local Unity CLI test runs after every Saboteer rewire has landed; its fourth story reruns the frame figures against R7a's baseline. It also waits for the saves upgrade and the stored-format gate, because Saboteer on the line means its players' saves keep loading. R7c (3 stories) is Corsairs' run after its last rewire, plus one repeat of Saboteer's soak after UN6. The soak uses its own playable prefab field until the gym lands. A person watches the hull test.

**R8 WorldObjects operations, object layer validator, authoring operations.** R8a: WorldObjects' presets, spawn, find, inspect and remove operations and the object layer validator. R8b: the two authoring operations (a preset from a model, an item definition from a preset); both write drafts only, and a person approves them into a named folder. Both are Saboteer's class, because the make-playable loop (A7a) calls them.

#### UI and text

**UI1 UI split, truthful package, UIKit, theme validator, TabView.** UI becomes Widgets, Screens and Tests; the game-shaped content leaves, while the menu chrome and the studio theme stay with the game that reads them (Saboteer's copy lives in the game) until UI1b makes the Studio.Presentation folder and L11c moves them in, so nothing Saboteer's menus read is deleted before the folder exists; the package declares Core; samples move to the samples folder; the slot styles go to Inventory; Unity's own TabView replaces the tab widgets; theme variants and serialized view identity are added. Two of the eleven stories restructure UI and Chat. The Studio.Presentation folder in StudioDev is split off as UI1b so the console does not wait for the Studio.Tools shell. UI1's assembly split is the breaking merge, so it stands before the freeze. Worth having alone: yes, a stranger can install UI without the Input System and without Chat.

**UI2 StyledText, TextLog, TextEntry, WindowFrame.** Styled text with template spans, the text log, text entry and the window frame, with edit-mode logic tests and play-mode element tests; the Gallery sample shows them; the log's flush cost is measured with 10,000 lines. Worth having alone: yes, both games can replace their copies of the focus code.

**UI3 ConsolePanel and ConsoleView over the operation list.** The console panel and view over the operation directory with completion, audience filter, history and the scoped log sink, and the public result-to-lines helper. Core's uGUI console and prefabs and Chat's console are deleted here; the old registries, attributes, router and console logger go in CL3b. It stands before the freeze so the demo shows the new console. Worth having alone: yes, one console replaces three.

**UI4 Switchboard.** The networked text package. UI4a1 (5 stories) is the library: profile, kinds, scopes, session, host, filters, rate limit, mute list, templates, history and the in-process loopback. UI4a2 (5) is Switchboard.UI with the chat view, the UI bridge and the chat settings page. UI4a (1) is Saboteer's cut-over: its own profile asset, its chat network kept thin as the client interface's implementation, its input contexts class, the console and chat views in place of its own, and its chat window, settings panel and hand-wired switches deleted. UI4c (2) is Corsairs' compile-only cut-over of its console view and chat glue onto UI3 and UI4a, Corsairs' class, landing with the train on 2027-01-14 so Corsairs keeps compiling on the branches it follows; the rest of its conversion is UI4b's. UI4b (4) is Switchboard.Networking over the protocol assembly (the client and delivery halves, then the region and group scopes), the profile check in Switchboard.Networking.Editor, and Corsairs' cut-over of its chat glue, console view, input switches and layout glue; it retires Saboteer's thin chat network and the chat corruption above U+00FF and waits for Networking's event channel and the check seam. The console-view part of Corsairs' cut-over waits for CL3b. Worth having alone: yes, the first eleven stories replace the chat window and the console with no Networking.

**UI5 Tooltip host and bound settings rows.** The tooltip host with detail tiers and bound labelled rows over Unity's own binding; Saboteer's settings view and Corsairs' tooltip view are ported as the proof. A person judges the tooltip look in both games.

**UI6 Input contexts, layout as a Persistence section.** The input-context seam, the layout store saved as a Persistence section, the modal host and confirm dialog, and Saboteer's hand-wired switches deleted. UI6a: input contexts and the modal host, with Saboteer's hand-wired switches replaced by one class of the game. UI6b: the layout section and Saboteer's layout glue deleted, Corsairs' switches and layout glue going in UI4b. UI6b needs only the first slice of Persistence. The layout has no version: an older layout is not read and a tester who saved one sees the default HUD once; the demo is exempt from the saves rule.

**UI7a Core.Editor controls.** Core.Editor's four controls: the type picker, the report view (two action buttons, the check's name per finding and a conditional banner), the section card and the header bar. Worth having alone: yes, with UI absent.

**UI7b UI.Editor: skin, Gallery, validators, Console page.** The skin, the Gallery, the theme and view validators, New View, and the Console page reached through the window's page attribute. A person judges the skin in the Gallery.

**UI7c Three inspectors in UI Toolkit.** Core's log settings, GeoForge's material table (moved into GeoForge's editor assembly) and the identity asset, built from the Core.Editor controls. The first two stories delete the old types. A person judges the three inspectors.

**UI8 ui operations for agents.** The `ui` operations (views, show, hide, toggle, tree, find, click, set, focus, themes, theme, capture), the editor-audience `ui new-view` and `ui validate`, and the agent context file; the first story tests whether a simulated click reaches a button in a player. Worth having alone: yes, an agent can see and drive the UI.

#### World

**W1 The world model.** The world model behind WorldForgeKit: surfaces, operators, rules, footprint sampling, occupancy, a plan without statics, no Entities in WorldForge's 35 runtime files, derived ids, a detect-only fingerprint, estimate and rasters. Today's output is frozen as golden hashes first (W1g, one story) and WorldForge's 124 tests are ported, with no old-format reader. W1a is seven stories, which W2 and W10a wait on; the WorldForge internals pitch sits between it and W1b (12 stories), whose compare story prints one seed's golden region hashes so the Unity 6.7 probe and the Unity 7 alpha copy can list every difference. Worth having alone: yes, seed preview, maps and plan work without a voxel.

**W2 Density out.** W20 is the planning story for Pro's nine generation passes, ending in a go or no-go that gates Saboteer's boards. W2a: the density source seam and public encoding in GeoForge, point queries, a camera-free versioned run-list read, the change and residency event, chunk interest over Core's viewer source, the presenter split into a collision part and a picture part, and the manager as an instance; the world instance steps the collision scene. W2b (12 stories): the WorldForge-to-GeoForge bridge, occupancy skipping, Pro's pipeline retired for Corsairs and the edit store synced. W2c (the last two stories): the blob tables become plain structs and arrays and the three fillers are deleted; it waits for the story that removes GeoForge Pro from Saboteer's manifest, because Pro's nine passes compile against both and Saboteer follows the branch. W2a waits for Navigation's spike so its go or no-go can shape the run-list read and the change event before both games depend on them. Worth having alone: yes; the gate is the Corsairs budgets unchanged. The developer captures the Corsairs F2 numbers with the bridge in place.

**W3 Objects out.** Placement records with derived ids into WorldObjects, decoration stampers as rules, the static scratch lists gone, and WorldForge stops emitting entity spawn requests (UN4 deletes the old path after the batch measurement's go).

**W4a Places core.** The Place asset with typed layers, owners, composition from Saboteer's solver and six sockets, nesting, duplicate, validation and preview, per-cell rules, and the public read surface for checks (harvestable layers, entrance, rules). The first story measures whether the adjacency solver converges with many cells fixed, on Saboteer's real parts. A Place's data is Unity serialization, with packing for saves and the wire; the first story also proves that a layer whose type is missing survives a save of the asset. Worth having alone: yes.

**W4b Places layers.** GeoForge.Places capture and bake as operations, WorldObjects.Places with its preset-reference check in its editor assembly, the voxel layer as serialized fields (its first story measures file size and import time against today's 63.7 MiB), the edit-mode voxel brush and a stamp that may name a reference frame. One converted capture is the size fixture; the re-import of the 51 captures and the replay of the SculptPass recordings are W10a's, done once in one sitting so a point of interest exists once at a time. The brush story also carries `geoforge layer-edit`, which revises an approved layer through its owner. A person sculpts a cave in edit mode.

**W4c Places gym and checks.** `places gym-start`, `gym-status` and `gym-leave` over a Place or a prefab asset, with the playable character of the game (the project names the prefab; the gym profile type, Places' neutral default and Studio.Content's profile that offers the studio's playable characters are all W4c's, and the studio profile is edited in StudioDev only), the stable character name and the held prop, the cell grid with a reroll-seed preview, and a farming-village stranger step run on the default profile. The gym sits behind Saboteer's milestone and before any Corsairs launch, in no milestone's class because no Corsairs rewire needs it; the plan refuses a start before every Saboteer-class part has ended. Until it lands a shared place is played in the game. The gym walk-through carries no navigation line until Navigation lands. Its held-item story waits for a packaged character and its hold pose. The soak does not use it. A person plays a place in the gym and judges the cell-grid inspector.

**W5 Places in the world.** WorldForge.Places: place rules, pads, anchors and the footprint contract; locations lose their content entries. A person plays a place in context at a real seed's site.

**W6 Horizon draws.** The first story plans the far field: it lists the candidates (today's tiles moved into Horizon, nested rings, Unity Terrain), the reference machine and the world sizes, and chooses none. W6a: Horizon on URP behind HorizonKit with a height array source, palette, published shader constraints, status and handover operations, meters, and the measurement of the candidates. W6b: the chosen renderer. The far layer planning story (W6n) is counted once, in W6: W6 is 13 stories including W6n, so World's own count of the remaining W6 stories is 12, and Networking counts none. Worth having alone: yes, a racing game gets a far field before any voxel exists. A person judges the seam by eye in the test scene.

**W7 Near meets far.** The first story plans the saved world: what a save stores beyond seed, fingerprint and deltas, and whether the generated base is stored, ending in a go or no-go (the stored-base stories are built only on a "store" answer). Then the near-coverage interface, Horizon.GeoForge, the handover band, the seam test scene, and WorldForge's Meshing assembly retired. A person judges the seam in the test scene.

**W8 Seed preview and labels.** Rasters in the editor and the game, a high-fidelity bake, label queries and the sample. The headline of the WorldForge brief. The colour ramp is the game's look.

**W9a Lines, scatter, benchmark scene.** W9s is the 20,000-instance benchmark scene over 64 regions that the batch measurement needs, built first; then carve operators for roads and rings, and scatter rules out to Instancing naming a visual. It no longer waits for Navigation. Worth having alone: partly, carving stands alone, the outputs wait.

**W9b Tag volumes and reachability.** Tag volumes for roads, rivers and water out to Navigation, the WorldForge.Navigation bridge that calls the reachability check, and Navigation's reachable-deposits check (built in NV5, in Navigation.Places.Editor) exercised against a place. After the Corsairs milestone and before any launch, because it waits for Navigation's built things and its authoring surface.

**W10a Boards and generators.** The generators rebuilt in Studio.Content under names that name no game (a cave rooms generator, a grid board generator, a ramp generator), their settings assets and Saboteer's configurations, the 51 captures re-imported and the SculptPass recordings replayed, golden floors per seed equal to today's, and Saboteer's floors generated through Places and no longer through Pro's pipeline. The last story, W10aL, removes GeoForge Pro from Saboteer's manifest; it is a manifest line, so it is exempt from the freeze, and W2c and Unity's blob epic (UN6) wait on it. Saboteer sheds Entities only when UN6, UN4b and that story have all landed. WorldForge is updated to serve both games and Pro's repository is untouched. A person judges that the generated rooms match the old ones.

**W10b A board nested in a place.** A Corsairs place nests a configured board through Places' nesting, and the nested board generates the same rooms per seed as the stand-alone board. The showpiece; nothing waits on it.

**W11 The far layer (provisional, undated).** Built after the far-field renderer is measured: a far client sees a forest felled 2 km away as felled, and dug ground as dug, through Networking's far summary contract and GeoForge's coarse edit summary. See the undated list.

#### Networking

**NW1 Replication protocol.** The engine-only protocol assembly: contract, dirty set, counted sections, sequence and gaps, snapshot pager, batch ring, join scheduler, interest map with the audience reach bound, lease ids (a block's upper bound is written durably outside the sliced world save before any lease in it is granted, so a restarted shard never reissues an id a persistent world saved), stamping of Core's intent key, `WritePolicy` and the owner-mode path (who may write each replicated thing is a configuration per thing with no privileged default; owner mode needs no validator), and the in-memory simulator with hostile-command and join-race cases. No PurrNet type appears in it. Worth having alone: partly, a tested protocol with no consumer yet.

**NW2 PurrNet adapter and first consumers.** Everything in Networking is created by one world instance and serves only that world: the hub, the region streamer and its interest map, the lease issuer and table, the reference frame identity map, the clock schedule, the event link and the ledger; nothing in it is static and nothing covers the process. The replication hub and region on PurrNet, the pooled byte-data carrier, the three write policies (an unset one refused by the settings check), the owner-mode relay in the adapter, resync, host handling, GeoForge.Networking over the protocol assembly, and Saboteer's terrain module (534 lines and a defect list) and the GeoForge sample module replaced. Two stories carry the linked move: the hold (a batch names its linked partner and a client holds a half for at most one tick) and the linked upload (one message carrying step 1's records and step 2's packed call, applied by the host in one step), with the second-process latency test. The tick rate (20) and the fixed step (50) are settings read once, and nothing is derived from either. NW2g, the gate story (the PURRNET define, the constraints and the bootstrap that offers the install, proved first as a probe, with the error and player-build stop when PurrNet is installed outside the tested range), stands before the freeze; the other twelve are the consumer stories and land after the festival. Worth having alone: yes, Saboteer drops 534 lines and a defect list. A person defines the telemetry-off symbol, makes the region prefab and watches a two-process test.

**NW3 Region streaming and the capacity report.** NW3s reads the manual on `PhysicsScene.Simulate` from a late FixedUpdate and runs it in a second scene (Runtime's order test waits for it). NW3a: world scope end to end, a synthetic-viewer benchmark, the PurrNet whitelist and spawn cost measured, the capacity report, and a two-world smoke test whose falling body uses the world instance's step driver. NW3b: WorldObjects.Networking, and Corsairs' five hand-written modules (2,575 lines), proximity job and 49-region respawn retired. Worth having alone: yes; the first eight give a measured streamer. A person measures a thousand colliders in a real dedicated-server build.

**NW4 Events, operations and time.** NW4a (4 stories, after the festival): the event channel with audiences (Participants, Region, Group, All) over PurrNet's player broadcast, the audience reach bound and the event backstop place, and a two-peer test that carries a Saboteer chat line; its first story reads whether the broadcast calls exist in the PurrNet version Saboteer already runs. NW4b (5 stories): the operation gateway with the audience enforced, `PurrNetTickSource` and `ServerClock` over Core's `TickClock`, routing of a write by the policy of the source that holds its target, the two-build test, and the retirement of Corsairs' per-tick time request; its operation stories wait for the router seam (CL1b). Saboteer's crew log relay stays until the shipped recorder exists. Worth having alone: yes, the chat corruption and the per-tick time request go.

**NW5 Guards, context and journal.** `NetworkingKit` with the networking operations, the audit as check classes through Core's check seam with a package as the subject, the layout fingerprint, the telemetry check, the hub inspector and scene overlay, the sample, the AI context and the journal seam. Worth having alone: yes, the audit helps any PurrNet project.

**NW6 Delta codecs (backlog).** An adapter that registers Core's pure delta pack and unpack with PurrNet for unreliable per-entity streams; the per-player ledger is deferred. Built only if a measurement asks.

**NW7 Prediction packing spike.** A written answer, from a measured PurrDiction scene in NetworkingDev, on how a predicted world's state and input are packed, together with the black box's questions (shipped builds, its file, the dump relay). Nothing is built from it. A person closes the go or no-go in writing.

**NW9 Far layer build.** `FarSummarySource` and the horizon layer prefab, the picture summary source in WorldObjects.Networking, and the layer's cost next to the near layers with its simulator case. It waits for the far-field renderer's measurement. Worth having alone: yes, a forest chopped 2 km away reads chopped.

**NW10 Stepping ownership when a world predicts.** One probe story in NetworkingDev: one scene holding PurrDiction's `PredictionManager` and one scene stepped by a driver, asserting that each local physics scene is stepped once, reading `Physics.simulationMode` and `Time.fixedDeltaTime` after the manager starts, and a written rule for the driver (it leaves a scene that holds a manager alone, and steps the default scene when the process is in script mode). The predictor steps a predicted world. It lands before L3's driver story. A person closes the written rule.

#### Unity

**UN1 The Unity ledger.** The ledger of Unity systems the line builds on, the check operation with changelog scan and exit code, the Move story template and a CI job (UN1a, four stories, including the facts bench with rows for Simulate from a latest-order FixedUpdate, local physics scenes and `ExtractAsset` with `AddRemap`); the Editor-gate job (UN1b); the player test bench for Pipeline discovery and a simulated click (UN1c). The stripping check itself is CL1's first story. Worth having alone: yes, the table is useful before the check. A person judges each ledger row changed, unchanged or unsure.

**UN2 Unity's pool and the registry asset.** Unity's pool in place of Core's, the registry asset in preloaded assets with an Addressables bridge, four registries moved out of Resources, and the sample import operation. A broken reference is re-saved with no redirect. A person moves Corsairs' presets out of Resources and creates the registry asset.

**UN3 Batch path measurement.** Evidence (2026-10-26): in DirectX 12 players of Unity 6.4 and 7.0, Frame Timing's GPU time read about 0.016 ms per frame, and Unity 7.0 hides URP's camera from the per-sampler GPU timer; `Planning/PackageLine/Evidence/GrassProbe.md` in the Spellbound workspace. The missing captures, the 20,000-instance scene, one prototype of Unity's `BatchRendererGroup` path, the measurement report in editor and in a Windows player, and a written go or no-go. Entities Graphics is only the baseline. It gates the Instancing seam and must finish before the old path is deleted. Worth having alone: yes, the answer is the product. A person runs it on the reference PC, judges the pop between levels of detail and reads a no-go.

**UN4 WorldObjects store and awakening.** UN4a: WorldObjects' store as native columns per reference frame partition (a row is 47 bytes), the awakening job and policy, region release, the timer pass and a benchmark with 1, 20 and 200 viewers against the old query. UN4b: ObjectParent and Corsairs rewired, Core's ECS deleted, and the Entities package removed from Core's manifest in its last story. Worth having alone: yes, Core is Entities-free the day UN4b lands.

**UN5 Instancing seam.** `InstancingKit`, the batch and visual types, settings, the batch renderer with a small culling routine of ours, and the WorldObjects bridge; Corsairs draws again without Core's ECS once UN4b lands, as one unit. No Entities method, no stopgap, no renderer of our own beyond the culling routine.

**UN6 Blobs and hosts leave the games.** Blob tables become plain structs and native arrays in GeoForge, WorldForge and Saboteer, the generation system becomes a plain driver, and Entities leaves their manifests. It starts after the story that removes GeoForge Pro from Saboteer's manifest and after World's last two density stories, follows Saboteer's soak, and edits Saboteer's own code after the soak, so Corsairs' soak repeats Saboteer's once; the first release waits for it. Core keeps the Entities package in its manifest until UN4b, so Saboteer compiles Entities at its milestone either way; Saboteer sheds Entities only when UN6, UN4b and W10aL have all landed.

**UN7 Batch renderer and mesh LOD.** Mesh LOD selection, the importer check, material validation, a golden-image test per URP version, and the submitted-versus-visible report. A person judges the golden images.

**UN8 CoreCLR and domain-reload readiness.** A statics audit by text scans (the Project Auditor go or no-go stays in LV3a alone), one call for the four assembly scans, Volumetrics' domain-unload releases replaced, a play-mode test that enters twice with domain reload off, CI on the 6.7 beta and the experimental CoreCLR player (allowed to fail), and the bridge-define Safe Mode drill. A person runs the Safe Mode drill and reads the beta results.

**UN9 Probe: Unity 6.7 beta and a Unity 7 copy.** A probe that waits for nothing and that nothing waits for. It installs the Unity 6.7 beta in a throwaway copy of the Corsairs Isle project folder, made by a plain folder copy that skips what Unity regenerates (Library, Temp, Logs; `run-local-tests.sh` is WF3a's and reuses the same exclusions later), so the working project stays on its editor and every package the checks need (PurrNet, WorldForge, GeoForge, UI, Entities) is in the copy; a check that still needs something the copy lacks is written down as not run. It writes what breaks against the ledger rows 6.7 changes; the ten ordered checks of the Unity 6.7 and Unity 7 summary are the steps of stories 1 to 3. The fourth story copies the same folder again and opens the copy once in the newest Unity 7 alpha, writing every error and warning into one list that says whether the Unity 7 move is a small or a large job; the working project never opens in it. If a beta or alpha will not install, the story ends with a note. A person reads the note.

#### Navigation

**NV1 Navigation spike.** A throwaway spike in NavigationDev measuring tile build time from GeoForge's run lists, bytes per tile, nodes per millisecond for surface and open searches, and whether a mixed-resolution seam keeps paths sound. It ends in a written go or no-go filed as a Decision issue that blocks NV2. It runs before W2a builds GeoForge's run-list read and change event, because its answer can change their shape. Its 5 gates are the one Navigation part inside Saboteer's gate count, because W2a waits on its written result; every other Navigation epic is after the Corsairs milestone. A person closes the Decision issue in writing.

**NV2 The ground field.** The swimmer step through an open water volume, samples with coverage, tiles, cell classes, profiles, four movers, labels, `FindPath` and `Reachable`, `NavigationKit`, grid and heightfield sources, a minimal runtime overlay and two samples, then the GeoForge bridge with an oracle test against GeoForge's own voxel query. NV2a starts only after the Corsairs milestone; the plan refuses an earlier start. Worth having alone: yes, a spider crawls a cave and a swimmer crosses a flooded one.

**NV3 Hierarchy, why, distances, line of sight.** Tile graph, free-space octree, solid components, time slicing, why, distances, line of sight, stale paths, and the moat-at-every-level matrix with soundness property tests.

**NV4 Built things.** Footprints, the resolution ladder, tag volumes, portals and states, the Navigation.WorldObjects bridge, handles for owners, and the door, wall and column scenario. Worth having alone: yes, a base with a door.

**NV5 Authoring and agent surface.** The profile inspector with preview, footprint gizmos, scene overlay, the navigation operations (path, reach, why, field, probe, fit-footprint), `FitFootprint` and `CheckReachability`, the context file, the Navigation.Places adapter, and the reachable-deposits check. World's reachability story and ArtPipeline's footprint check call it.

**NV6 Fields in reference frames and joined fields: ships and moving decks.** A ship deck as a field riding its reference frame, a path that crosses from the deck's field into the ground's through a gangplank link, a moving or spherical GeoForge volume through the reference frame and the up provider, a water world, and a ship profile that floats on a water tag. The first story proves a path across a moving deck. It sits after the Corsairs milestone and before any Corsairs launch, because a sailing game does not launch without boats. It waits for Navigation's built things, for the reference frame binding in Character.Body, and for Core's half of the noun. Evidence (2026-10-26), a data point and not a decision: a water probe floated a ship on swell waves computed on the CPU and measured the cost of those queries and of drawing the sea in URP; `Planning/PackageLine/Evidence/WaterProbe.md` in the Spellbound workspace.

**NV7 Strategic layer (backlog).** Optimistic unknown space and a coarse source such as WorldForge's plan or Horizon's shape; replan on load.

**NV8 Jumps, drops, ladders as links (backlog).** Generated and authored links for jumps, drops and ladders.

**NV9 Path following, crowd registry, avoidance.** `PathFollower`, the crowd registry, a replaceable `ILocalAvoidance` chosen by measurement against the raid-of-forty test, and the Navigation.Character bridge to Character.Body's input seam. Worth having alone: yes, a raid reaches a door without stacking.

#### Art

**A1 ArtPipeline core.** The rule set as game assets with Studio.Presentation's as defaults, palettes and the palette type, kinds, model and texture checks, importer repairs, the docked verdict window, the folder audit, the artpipeline operations, a reference sample with six broken models, and Keep as new material (a material embedded in a model becomes a material file in the palette folder). A1a is the checks (9 stories), A1b the window, audit, sample and Keep (8). A1b stands before A4, because once A4 removes the hand-placed grip the artist's only sight of a misplaced grip would otherwise be the command line. Lives at Packages/ArtPipeline. Worth having alone: yes, a farming sim or a card game uses it with no Character. A person judges the verdict picture and checks Maya and Blender hint wording in the applications.

**A2 Character bridge.** Rig, socket, grip and wear checks, the contract check, the socket step at import, the humanoid repair, and the ragdoll check at import, which runs Character's own builder as the artist's preview. The tenth story is the row-figure check over the rule set; both checks ask `CharacterKit.Body.IsPlayable`, so A2 waits for the playable marker.

**A3 Hold test and wear test.** The prop shown in the reference figure's hand through reference poses, the wear test, and the verdict picture written to a file. A person judges the hold alignment picture.

**A4 Rewire Saboteer's prefabs onto contract nodes.** Saboteer's two player prefabs (5,217 and 10,248 lines of YAML) are rebuilt by hand as variants of the model, contract nodes replacing the hand objects and the hand-placed grip; the audit's findings are worked off. Corsairs' prefabs follow in A4c (2 stories, Corsairs' class, after A4, A2, A3, L4 and R5a and before R7c, estimated 2028-04-13 to 2028-04-17). It stands in Saboteer's milestone: a prop that passes the grip check and is sent still sits at its pivot while the games align held items with the hand-placed grip, set by hand on 27 prefabs. It waits for the verdict window and the hold test, so that when the grip goes the artist can see whether a locator in the file worked. Until A4c lands, a prop sent to Corsairs sits at its pivot. An engineer rebuilds the two unpacked prefabs by hand.

**A5 Send and Get latest.** Destination base with preflight, changed, send and receive, `GitLfsDestination` in Studio.Tools, stacked sends, the setup check, and the commit contract with the pull request Action, which runs as the GitHub App the organisation owns. Send sends only the files the artist changed under the art folders, and a test proves a kept material and a rig contract travel with it. The artist's machine needs git and Git LFS only and never sees a git word. A5a is the minimal Send: the folder-based send set, the commit subject the title rule reads and the push of the artist's branch, with no window, plus the branch-point rule (the merged-or-removed test, stacked sends) and Get latest as its second menu item, so the artist's clone comes back to the default branch after a merge without an engineer. A5b is the rest: the setup check, the window and the check at Send, after the prefab rewire. A5a is 6 stories and A5b 4. A5a runs estimated 2027-03-15 to 2027-03-23 and is Saboteer's class; A5b is After Corsairs, before launch and ends estimated 2028-09-05, so Saboteer's 538 gates include only A5a's. A5b also makes Saboteer's release audit delegate to `artpipeline check` and removes its own texture size check, so there is one rule in one place. The artist ruleset switches on in a game repository when A5a lands there. The artist's first sign-in is a person's.

**A6 Bridge docs, AI context, pair test.** The bridge's docs and AI context, and the bridge pair test in the Matrix on the rows the line's rule names on its date.

**A7 Make playable and open in gym.** A7a (4 gates, Saboteer's class, with R8a and R8b): a prefab variant of the model with bounds colliders, then the kind's chain of operation lines: `artpipeline playable` runs the chain, and the chain's drafts (a preset, an item definition) stay in the drafts folder until the artist presses Approve in the window, which moves each into the folder the kind names; an agent cannot approve, and an agent running `artpipeline playable` ends with 'succeeded: 2 drafts waiting for approval'. So an artist gets a held prop into Saboteer alone before Saboteer's milestone. A7b (1 gate) is Open in gym through `places gym-start`, and alone waits for the gym (W4c). A person judges both.

#### Living

**LV1 Layout and probes.** LV1a: the probe of Packages/<name> (git and Git LFS working inside the folder, PackageInfo found for the embedded package, version defines, a git path install, Samples~ import, and Unity accepting the short folder name Packages/Core) and the bootstrap in a clean project. LV1b: the layout, the shell template and the restructure pilots (Inventory and Decals). Nothing is pinned, so LV1b carries no game manifest line; those are LM and LS. The folder-name answer is the developer's; a failed probe stops and asks.

**LV2 Runner and read tier.** The PackageCheck repository and the read tier of the checks, with the Spellbound window shell and the Check page; the report adopts Core's shape. PackageCheck is the twenty-third package, a Tool.

**LV3 Operations and compiled rules.** Operations, the run tier and the Project Auditor probe (LV3a), then compiled rules and the Studio.Tools story (LV3b). The checks include: a stored line holding a Tick, TickSpan or tick rate fails, packing's layout description is used, and stored lines are counted in the bump check. LV3b waits for the authored-key scan and stands in Saboteer's milestone because the stored-format gate waits for it.

**LV4 Context and the first hour.** The AGENTS.md contract and generators, `core packages`, the names-resolve check, the snippet runner, sample import and sync, the smoke run and the docs convention. LV4a (3 stories) is the contract, the generators and the names-resolve check, built to end before the first rewire; LV4b (4) is the rest and follows Corsairs. `package-init` and `adopt` print the line text link, and the context names a Pipeline range. Worth having alone: partly, Core's own AGENTS.md is useful alone. "Understood in an hour" is a person's judgement.

**LV5 StrangersDev.** The stranger projects in nine parts, each switching on with the packages it installs: the harness and Core-only project (LV5a), the Core-only compile without Entities (LV5m), the card game (LV5s), the farming sim without Places (LV5b1, LV5b2), the village step (LV5b3), the MMO server's first build with the grid board step in a project with no game (LV5c0), the racing and underwater strangers (LV5c), and the matrix with its drift report (LV5d). The Matrix row reads 6000.3 and the studio's editor (6000.4 today). Worth having alone: yes, from the Core-only project.

**LV6 The Spellbound window: Line and Package pages.** The window's Line and Package pages, installing and updating from git URLs; the package list comes from GitHub, and the catalogue reader picks the known-good line whose Core range admits the installed Core, since a package has one line per supported Core major. Branch mode: `#beta`, Update re-adds the line, and a known-good tag is shown as advice, never a pin. A buyer's window installs the known-good released tag for its Core major, with a major about every 12 months, an upgrade offered at a reduced cost (whether the Asset Store offers upgrade pricing for a UPM product is unverified), and bug fixes with no API break for a year inside a major. A held package (GeoForge Pro until its own pitch) is installed only against the GeoForge tag its catalogue line names.

**LV6m Window maintenance and branch modes.** The window's three modes on a slice that needs no catalogue: the committed project setting (tags, branch, maintenance), the manifest writer for `#beta` and `#release-<major>` over the installed packages, and Update re-adding the line. A buyer installs a released tag, our games follow a branch, and a shipped game follows the maintenance branch of its Core major. It is the first Steam release itself (estimated 2028-06-08, with WF5m on 2028-06-12) and waits for every Saboteer-tagged part, Corsairs' soak, Diagnostics and Studio.Online, Core 2.0, the tag gate, the release checklist and the candidate tag; until it lands a pushed Studio change reaches a game by re-adding the package line through the Package Manager, which is the same text. Its first step confirms the settings mechanism and that the package manager exposes the installed commit. A person opens Saboteer once on the maintenance branch.

**LV7 Gates.** LV7a: the push gate, the floor compile and the 6.3 row, which no longer wait for the move to 6.7. LV7b and LV7c: the tag gate and the release checklist, undated. LV7d (2 stories): the stored-format release gate, because a game sold on Steam is a customer from its first release, and the release scan, which fails a release when any shipped text file starts with a `%UNITY` directive newer than the oldest supported editor. LV7d stands in Saboteer's milestone and the soak waits for it together with L8u, so the guarantee exists before Saboteer's first Steam release.

#### Workflow

**WF1 One convention, one board.** The Area options, fields and report script, the commit subject rule, the issue forms and the artist onboarding form, the reusable workflow that opens a pull request from a pushed art branch, the GitHub App the organisation owns for the release and pull request Actions, and the settings story (protected default branch, required unity-tests status, code owner review on the judgment fields, `line-text-address.txt` with its copy test). WF1a (2), WF1b (10), and WF1r (1), which switches the artist ruleset on in each game repository in the sitting where A5a lands there. A5a in turn needs WF1b's App, Action and protected main first. Worth having alone: yes, the day it lands for the team.

**WF2 Templates.** Skeleton, initialise, setup and callers, and the template files. The template carries `line-text-address.txt` and a branch-named PackageCheck manifest line; `skeleton-version.txt` becomes a record, not a held version. A person tries `setup.sh` on a clean Windows machine and a Mac.

**WF3 Checks, adoption and the local gate.** The title check, the Unity jobs and the local gate, which runs `packagecheck surface` for the stored-format hash. The author runs the Unity tests before review. The test runner spike is a single undated story. A person types the post-status line and agrees merge blocking on private repositories.

**WF3s Test runner spike.** Whether a CI runner is worth having beyond local Unity CLI runs. Not required for the plan; undated.

**WF4 Releases from commits.** semantic-release and commitlint in CI only, beta and release-candidate branches, the first release, and the final tag mechanism. Nothing is pinned: games follow branches. A person merges beta into the release candidate and fast-forwards main at the first stable release.

**WF5 The release train.** Six stories: release order (Core first), one command for a line release, and the line release cutting and protecting `release-<major>` in every repository when a Core major's tags are made (WF5a, 3); the pair matrix as a release artifact, the candidate tag starting the StrangersDev run, and `drift-report.sh` (WF5b, 2); and WF5m, the maintenance branch for a shipped major: its entry in the release configuration (whose `range` is the package's own current major, Inventory at 1.x carrying `range: 1.x` on `release-2`), the pull request guard that refuses a breaking change or a removed surface line, and the check that a shipped game's manifest line names it. WF5m is Saboteer's first Steam release (estimated 2028-06-12), after every Saboteer-tagged part, Corsairs' soak and the first final tags; the plan holds it within a week of LV6m. WF5b's release Action writes a package's known-good catalogue line for the major of the branch its tag was cut from, and the Matrix runs once per supported Core major. `consumers.txt` and the rolling bump pull request are removed. The drift report is run by hand.

**WF6 Selling (undated).** Store packing, the listing generator, a licence pass, docs publishing, the support routine and the bug button. See the undated list.

**WF7a Saboteer adopts the template files.** Saboteer's repository takes the template files, the title rule, a protected main and the tag script, touching no game code and no scene. It is Saboteer-tagged and is not a bug fix or media, so it may not run in the freeze; the cut-over takes the whole window before it, so this epic lands after the festival and the Next Fest demo is tagged by hand. The freeze rule (a change to a branch Saboteer follows that can break its build waits on a side branch inside the freeze and merges after Next Fest) is a Decision issue a person closes with text. The Steam deploy and the tag are the developer's.

**WF7b Games ship the same way.** After Next Fest: Corsairs adopts the template files and the title rule and normalises its bundle version; both games replace ParrelSync with Multiplayer Play Mode and hold the art pull request caller; `tag-release.sh` attaches the build folder's file list to the release and prints whether the C++ runtime files of a Windows 6.7 build are in it, so the Steam upload includes them or the copy is switched off deliberately; and `pre-deploy-check.sh` in GameTemplate runs Living's release scan before BuildPipeline's deploy runs steamcmd. It waits for the maintenance-branch pair so no later Saboteer-tagged part comes before them.

**WF8 Rituals.** The scheduled Unity release review issue, a per-sprint line review issue and a retrospective form.

#### Studio and pitches

**PWO WorldObjects pitch with its spike.** The WorldObjects pitch before L3: three stories of pitch (the world instance, the presenter, change and resolve, ids, the collision part in every build) and one spike story that tests the riskiest seam on a copy before the package is cut. It decides the shape of L3 and of the riding epic's last story. A person reviews and approves the pitch and judges the spike's result.

**PP Persistence pitch with its spike.** The Persistence pitch before L8: three stories of pitch (the storage seam, the section attribute's use and the section header, the capture contract with a per-tick budget, a database implementation that never blocks a tick, and the upgrade of a shipped game's old saves) and one spike story. It sizes L8, L8c, L8u and L8b. It runs in the first weeks of the plan because the first slice of Persistence (L8a) waits for it; the developer approves it in November.

**L11 Studio packages.** StudioDev with its five packages: Studio.Tools first (the shell the ledger check, the art destination and the house rules need), then Gameplay (equipment, talents, the house set of states, tooltip wording, after its pitch), Online, Presentation and Content as the libraries they compile against land. Studio.Content holds only what both games share and never names a game. L11d1 holds the studio character and its hold pose only: a Studio.Content controller component over Character.Body carrying `IPlayableCharacter`, with the neutral four states imported from Character's sample, so it waits for Character and the rig surface and not for Studio.Gameplay; the gym profile type and the studio's profile are W4c's; the commands that grant abilities are L11d2's. UI1b creates the Studio.Presentation package folder in StudioDev and L11b the Studio.Online one, so Saboteer's chat profile stays in Saboteer until Studio.Online exists; L11c is what remains of Presentation. Studio.Online waits for Diagnostics. Studio.Content is edited in StudioDev and never inside a game. Worth having alone: yes, cluster by cluster.

**PG Studio.Gameplay pitch.** The Studio.Gameplay pitch: equipment, skills and talents as Studio compositions of Inventory's and Modifiers' public surface, and the tooltip lines. It follows the Inventory and Modifiers audit, so it designs against the seams that exist. A person reviews and approves the pitch.

**PW WorldForge internals pitch.** The deeper pitch for WorldForge's internals: the generation model the world model's boundary seams were drawn for. It follows the first half of the world model and precedes the second. A person reviews and approves it.

**PIN Instancing internals pitch.** The deeper pitch for Instancing's internals (grass, impostors, levels of detail), after the batch measurement and the Instancing seam. Instancing draws with Unity's `BatchRendererGroup` only. A person reviews and approves it. Evidence (2026-10-26): grass measurements and BatchRendererGroup as found in Unity 6.7 and 7.0, `Planning/PackageLine/Evidence/GrassProbe.md` in the Spellbound workspace.

#### Calendar and rounds

**SF Saboteer festival: ship the demo, demo defects, festival fixes, wrap up.** Four gates on fixed days, estimated and moved with whatever Steam's partner page says: SFa on 2027-02-03 ships the demo build, SFd on 2027-02-09 handles defects before the press preview (2027-02-11), SFb on 2027-02-24 fixes what the festival shows, and SFc on 2027-03-02 wraps up and re-tests. A fix to a package Saboteer uses is made on that package's branch. A person chooses the build, runs the Steam deploy and the tag.

**AUc Core's audit before Core 2.0.** Core's own audit against the line's rule for Core and the surface review, the compile cost re-measured, and one gate for what it finds. A step to Core 2.0, estimated 2028-05-15 to 2028-05-17, before Saboteer's first Steam release.

**CT Core 2.0.** The stable tag of Core's rewrite, above the baseline `v1.1.9` (estimated 2028-05-19). After it Core changes only additively; a breaking change waits for a major, at most once per Unity LTS cycle.

**FX Findings fixed after each round.** The gates that fix what each eight-lens round finds: three after the foundation round, the Saboteer milestone and the Corsairs milestone, three after the line is complete, and six after the audit. Nothing waits on it; it keeps the rounds honest.

**AU Audit pass of the other packages.** One audit pass over every package that is not Core, after the line is complete, with the fix gates that follow it. Ends the plan.

## Pitches, spikes and probes

Five deeper pitches. A pitch is three gates and 1.28 million tokens; the two put before L3 and L8 carry a spike story and are four gates and 1.41 million. A person reviews and approves each pitch before the epic it precedes starts.

| Pitch | Name | Follows | Precedes | Estimated start | Estimated end | Gates | Tokens (M) |
|---|---|---|---|---|---|---|---|
| PWO | WorldObjects pitch with its spike | L1, R0 | L3, R3c | 2027-04-12 | 2027-04-15 | 4 | 1.41 |
| PP | Persistence pitch with its spike | L2c | L8a, L8, L8c, L8u, L8b, UI6b, UI4a1 | 2026-11-26 | 2026-12-02 | 4 | 1.41 |
| PG | Studio.Gameplay pitch | L6 | L11a1 | 2027-09-07 | 2027-09-09 | 3 | 1.28 |
| PW | WorldForge internals pitch | W1a | W1b | 2028-02-01 | 2028-02-03 | 3 | 1.28 |
| PIN | Instancing internals pitch | UN3, UN5 | UN7, IN1 | 2028-07-05 | 2028-07-10 | 3 | 1.28 |

Not scheduled: the MMO's own shard pitch, the prediction pitch of the first game that predicts, the second WorldForge pitch for an unbounded world, and any pitch the audit pass finds missing. Each is one more pitch of the same price when a game asks.

Spikes and probes, with what each blocks. Each is a story inside the epic named, priced there, and ends in a written go or no-go closed by a person.

| Spike or probe | In | What it blocks |
|---|---|---|
| Unity 6.7 beta and a Unity 7 alpha copy (estimated 2027-01-21 to 2027-01-27) | UN9 | Nothing; nothing waits for it. Its note feeds the executive brief |
| Reflection discovery against 6.7 and the next major under stripping, Mono and IL2CPP | CL1 story 1 | Every story that registers an operation; a no-go moves discovery to a source generator |
| Packages/<name> with git and Git LFS inside, version defines, path install, Samples~, the short folder name | LV1a story 1 | Every repository restructure, the template and every new package repository |
| Bootstrap on clean 6000.3 and 6000.4 projects | LV1a story 2 | Core's constraint in every epic that rewrites a package |
| `TypeCache` finds an attributed class that implements a closed generic interface (fallback: scan of marked assemblies) | CL4 story 10 | The check seam and every check registered through it |
| Project Auditor on 6000.3 and 6000.4 | LV3a | The compiled smell rules, which are text scans until it answers |
| Pro's nine generation passes | W20 | W2a and Saboteer's boards (W10a) |
| The saved world: what a save stores, what the fingerprint names | W70 | W7 and the stored-base stories |
| The far-field renderer: candidates, reference machine, world sizes | W6p | W6a's measurement and the choice of renderer |
| The far layer plan (estimated 2027-07-13) | W6n | NW9 and W11, together with the renderer's measurement |
| Navigation: tile build time, bytes, nodes per millisecond, the level seam (estimated 2027-05-05 to 2027-05-11) | NV1 | W2a (the GeoForge read it judges), NV2 and everything after it |
| The batch path against today's draw path | UN3 | UN4a, UN5 and UN7 |
| Does Simulate order as designed from a latest-order FixedUpdate | NW3s | R3d, the world-step order test |
| Who steps a world that predicts: `PredictionManager` and a driver in one process (estimated 2027-01-15) | NW10 | L3's driver story |
| PurrDiction's packing, the black box in shipped builds, its file | NW7 | Any prediction in a game; the shipped recorder in Diagnostics and the retirement of Saboteer's crew log relay |
| The WorldObjects pitch's spike | PWO | L3 and R3c |
| The Persistence pitch's spike | PP | L8a and with it UI4a and UI6b; then L8, L8c, L8u, L8b |
| A pushed branch of the shape `art/<artist>-<slug>` opens the pull request; any other shape is refused | A5a | A5a's caller and WF1r |
| The test runner | WF3s (undated) | Nothing; local Unity CLI runs are the merge rule meanwhile |

## The undated list

Undated: they wait on the second milestone and on decisions that need Corsairs on the line. Core's audit, Core 2.0, the tag gate and the release checklist left this list: Saboteer's first Steam release waits for them, so they are dated (step 66).

| Item | Gates | Tokens (M) | Waits on | Why it is undated |
|---|---|---|---|---|
| Selling: store packing, listing, docs, support (WF6) | 7 | 0.93 | WF4a, CL2, WF6a, WF4b | a store step; publisher enrolment (five to seven business days) is the developer's own story and not a gate |
| Test runner spike (WF3s) | 1 | 0.13 | WF3a | not required: local Unity CLI runs are the merge rule |
| The far layer build (W11, provisional) | 6 | 0.88 | W6n, W6a, W7, NW9 | waits for the far-field renderer's measurement |

### After the plan: a Core major

After Core 2.0 a change between majors is additive. A Core major comes about every 12 months with the line's move to the Unity LTS of its time; buyers are offered the upgrade at a reduced cost and get bug fixes, maintenance and no API break for a year inside a major. No one has run a cycle, so the budget is priced by analogy to the epics named.

| Step | Gates | Tokens (M) |
|---|---|---|
| Move to the new LTS | 4 | 0.56 |
| Ledger re-judged against the new LTS | 1 | 0.16 |
| Canary editor and domain-reload run | 1 | 0.17 |
| Floor compile and test rows: the new row in, the row the floor leaves out | 2 | 0.29 |
| Core major: audit and surface review | 3 | 0.51 |
| Stored-format gate over every package's surface file | 1 | 0.16 |
| Release order, one command, and the maintenance branch cut and protected in every repository | 3 | 0.40 |
| Throwaway copy opened once in the newest Unity alpha | 1 | 0.14 |
| Previous major kept for one cycle: backported fixes | 2 | 0.28 |
| Ledger re-judged at each Unity update release in the cycle (about three) | 2 | 0.29 |
| Upstream drift: PurrNet, URP, the Steam SDK | 2 | 0.29 |
| Shipped games' saves checked against the new layouts | 2 | 0.29 |
| Findings of the cycle's round fixed | 3 | 0.45 |
| One eight-lens round over the major | 0 | 0.91 |
| **Per major** | **27** | **4.89** |

About 27 gates and 4.9 million tokens per major, about 6 percent of a year at two streams (a year holds about 450 gates). Not in the budget: the support routine, the studio's own packages' minors, and backported fixes beyond the two gates above.

## The backlog

Items that wait for the separation or for a measurement. Each names what it waits on and where it lands. Priced and not scheduled unless stated.

| Item | Waits on | Lands in |
|---|---|---|
| Pack into a caller-owned buffer; decode limits; bit writer | PK | Core |
| Standard read and write as fast as the bitwise path | PK | Core |
| SmartPacker rewrite | PK | Core |
| Byte-data carrier for every packed RPC | NW2 | Networking |
| No text through PurrNet's string (corrupt above U+00FF) | PK, NW4a, UI4b | Core, Networking, Switchboard |
| Delta encoding against what each player confirmed | PK (pure half), NW6 (per player, conditional on a measurement) | Core, Networking |
| Turn PurrNet and PurrDiction telemetry off in every project | now; NW5 checks it | Studio.Online, games |
| Seventeen module defects | NW2 (base), NW3b (Corsairs modules) | Networking |
| Late-join paging, host loopback, pending observers, tick list, per-flush allocations, decode before consumer check | NW1, NW2 | Networking |
| Voxel edit encoding; per-joiner edit table rebuild | W2a, NW2 | GeoForge, Networking |
| Logging in join paths; verbose defines out of shipping builds | now | Corsairs |
| Game time request every tick; round trip per hit | NW4b, R6 | Corsairs |
| Seven scaling fixes | L3 (ids, euler), UN4a (index, proximity), NW3a (page size) | WorldObjects, Networking |
| Saboteer's two no-rollback item paths | R6b | Saboteer over Inventory transactions |
| Debug.Log in four packages | LV3a mechanical fixes; each package's restructure story | GeoForge, Switchboard, Persistence, Volumetrics |
| Six packages demand a Resources folder | UN2 (registry asset) | each package |
| Sample assets under Resources in Modifiers and Controller | L6, L4 | Modifiers, StateMachine |
| GeoForge leaf prefab internal, own pools | L7a | GeoForge |
| Decals' URP reference in the main assembly | L12 | Decals |
| Land assumptions in WorldForge and Volumetrics | W1a, L12 | WorldForge, Volumetrics |
| Unity package versions disagree across packages | LV1b (restructure) | all |
| `UnityEditor` outside the editor guard in a runtime file (unverified) | L1 | Core |
| The `useWorldForge` toggle | W2b (WorldSystem retired) | Corsairs |
| Fifteen link renames | WF1b | all |
| SpellboundDocs rebuilt from the documentation folders | WF6b (undated) | SpellboundDocs |
| Rope level of detail and fake ropes | L12, then its own epic | TetherShop |
| Terrain edits with any shape | W2a | GeoForge |
| Point of interest workflow, nesting, sharing, skirts | W4a, W4b, W4c | Places, WorldForge |
| Capture volumes from players | W4c, L11d1, L11d2 | Places, Studio.Content |
| Models, armour, cosmetics, held items | A2, A4, L11a1 | ArtPipeline, Character, Studio.Gameplay |
| Mechanics that break | R3a, R4, R6, R7b | Character, Inventory |
| Grass, view distance | IN1, W6b, W7 | Instancing, Horizon |
| Two-process network tests | NW2, WF7b (Multiplayer Play Mode) | NetworkingDev |
| UI Toolkit runtime bindings replacing binders | UI4a, UI5 | UI, Switchboard, Inventory |
| A lobby seam in Networking with Studio's Steam implementation | NW2, L11b | Networking, Studio.Online |
| The Logging framework's export read by Core's sinks | MV | Core |

Voxelising meshes belongs to GeoForge Pro and is out of scope.

Marked backlog by their owners, priced and not scheduled:

| Item | Gates | Tokens (M) | Waits on | Lands in |
|---|---|---|---|---|
| R5b Ragdoll driver on motion claims in Character.Rig | 7 | 1.07 | R3a, R5a, L4 | nothing on the line waits for it |
| NV7 Strategic layer | 6 | 0.98 | NV3, W1a | Navigation |
| NV8 Jumps, drops and ladders as links | 5 | 0.79 | NV3, NV4 | Navigation |
| NW6 Delta codecs (conditional on a measurement) | 3 | 0.44 | NW2, PK | Networking |
| Joined state replay with Networking's journal | not priced | | CL1b, the networking journal | Core |
| Blender and Maya integration | not priced | | A1b, A2 | ArtPipeline |
| Plan by region for unbounded worlds | not priced | | W1b | WorldForge |
| Diagnostics' shipped recorder, its file and its relay, and the retirement of Saboteer's crew log relay they allow | not priced | | NW7's answer | Diagnostics |
| Catch-up of physics after a hitch: for now physics may fall behind the clock; a later discussion once the games iterate, held for that discussion | not priced | | R3d, NW4b | Runtime, Networking |

Nothing in the backlog decides a boundary. Items moved up into the critical path because they do: the resource registry seam (L1 and UN2), the golden hashes (W1g), the baseline soak (R7a), the packing slice (PK).

## The developer's own acts and dates outside the gate count

- **Steam's partner page:** check the festival dates, the last day a demo build may change and the registration steps before 14 December 2026. Third-party dates: Next Fest 22 February to 1 March 2027, press preview 11 February, registration about 10 January. The cut-over has no margin against a freeze that starts earlier than 2027-01-14.
- **Publisher enrolment:** five to seven business days; undated, no gate.
- **Asset Store review:** the time between submitting and going live is not stated anywhere and was not measured. It sits after the second milestone.
- **Unity 6.7 LTS:** expected at the end of 2026 (the studio's estimate; no Unity page gives a date). UN9 installs the beta in a throwaway copy (estimated 2027-01-21 to 2027-01-27). The move (MV) does not start before 2027-01-04 and nothing waits for it. Unity 7 has no final date; UN9's fourth story opens one copy in the newest alpha once.
- **6.3 LTS end of support, December 2027:** the floor moves to 6.7 then (FL, 2 gates, estimated 2027-12-13 to 2027-12-14).
- **The merge of Modifiers' branch:** estimated 2027-03-02, after the festival's last gate; the developer's act.
- **Saboteer's first Steam release:** the act has no gate; it is estimated 2028-06-12, after every Saboteer-tagged part, Corsairs' soak and the first final tags, and LV6m and WF5m put the window's mode and the maintenance branch in place that day (step 66). Until then Saboteer follows the branches. The order is confirmed by the developer's note of 2026-10-24: Saboteer does not release until the packages are final.
- **GeoForge Pro:** the catalogue holds it with the status `held` and names the last GeoForge tag it compiles against; a Pro pitch is undated.
- **Leave and public holidays:** priced as a rate row, not as dates.

## How the plan differs from the product

Nothing in this plan was run. The dates are the scheduler's run of 2026-10-24 (`Planning/PackageLine/Pitch/Revisited/Workflow/roadmap_svg.py` in the Spellbound workspace, re-priced with the owners' counts). The only measured figure is the cost of a red-team round, taken on the line in an earlier round. Every other cost is computed, every date comes from a program that places the epics on two streams, and every one of them is an estimate.

| Cost | Per unit | Assumption |
|---|---|---|
| Reading | 36 tokens per line in scope | 12 tokens per line, read three times across a story's life |
| Writing | 30 tokens per line written | 15 tokens of output per line, written twice (draft, fix after the gate) |
| Verify loops | 8,000 tokens each, 6 per story | recompile, console, test run, read back |
| Session overhead | 40,000 tokens per session, 2 per story | skills, instructions, memory, the status file |
| Fan-out | reading times 1.5 | applied to every epic that reads 8,000 lines or more |
| A deeper pitch | 1.28 million for 3 gates | 15,000 lines read, 3,000 written |
| A red-team round | 0.32 million per epic of 8 stories or more | four readers, measured |
| A milestone round | 0.91 million | eight readers over the whole, measured on the line |

So a story costs 128,000 tokens before its reading and writing. The lines read and written are the owners' own estimates. Tokens do not cover wall-clock: Unity compile and test loops and the gate's turnaround are clock.

- **The gate rate is unmeasured.** One gate per person per working day is the planning rate; sprint 1 measures it and the plan is re-issued. The token rates are unmeasured too; the first story of most epics measures what the epic's cost rests on.
- **The program is a heuristic.** No part is preempted once started, so a small change of input moves a date by days in either direction. The sensitivity rows below are separate runs, not a prediction of the next one.
- **Reserve:** the last working day of every sprint with 8 or more working days is held back on both streams (10 percent of capacity); the dates already include it. Sprints 5 and 31 (the Christmas weeks) have none. Off days: 2026-12-24, 25 and 28 to 31, 2027-01-01, 2027-12-24 and 27 to 31, 2028-12-25 to 29.
- **Placeholders sized later:** L8a (the first 2 of Persistence's 6 gates), L8c and L8u (4 each) are sized by the Persistence pitch; IN1 and L8b are placeholders for their pitches; L6, the house-set story in L11 and the collision story in L3 are the planner's sizings.
- **The planner's splits:** CL1/CL1b, CL3a/CL3b, CL4/CL4b, UI1/UI1b, UI4a1/UI4a2/UI4a, UI4c, L8a/L8, R4p, W2c, W10aL, W6n, WF1r, WF5m, NW2g, and L1r, LV4a, A5a, L8c, L8u and MV. The owners hold their epics whole.
- **Counts the owners state differently** (the plan's figure is the plan's): L1 10 against 7, L3 10 against 9, L4 10 against 8, L6 5 against 7, L11 11 against 10, L12 8 against 7, MV 7 against 4, UI1 11 against 9, NW2 13 against a claim list of 12, UN8 5 against 6 (the area's six stories are priced as five gates), WF2 8 against 9 (the layout probe is LV1a story 1, counted once in Living's epic). After the readers' round the owners' tables moved again and this re-run (2026-10-24) priced them: Runtime 98 (R6d is 3 stories), Art 56 (A5a 6 and A5b 4; A4c 2 new), and UI4c, Corsairs' compile-only cut-over with the train (2 gates, the planner's own lines, 1,500 read and 400 written by analogy to CL3a). Command line's table sums to 72, the plan's figure; Workflow's 68 against 67 and Unity's 56 against 55 each count once more a probe the plan prices elsewhere (WF2's layout probe in LV1a, UN8's Project Auditor probe in LV3a) and stand at the plan's figures. Totals by area as priced: Line and Core 93, Pitches 17, Studio 11, Command line 72, Runtime 98, UI and text 70, World 166 (160 plus W11's 6 undated), Networking 60, Unity 55, Navigation 67, Art 56, Living 64, Workflow 67, Calendar and rounds 28.
- **Classes differ in places:** the plan places an epic by the rule that an epic belongs to the first milestone that needs it (an epic that rewires, deletes code from or moves a game, and everything it depends on). Where an owner filed another class (CL4, CL6, CL7, R2, R8, UN1, UN2, UN7, UN8, UN9, W2b, W2c, NW10, UI4b, WF2, WF1a, WF1b, WF7a), the plan's class stands.
- **Not in the gate count:** Steam's own steps, the Asset Store review, publisher enrolment, leave and public holidays.
- **Unknown from here:** whether Unity 6.7 LTS ships at the end of 2026, how PurrNet behaves on 6.7, Steam's festival steps, and anything that runs. The 6.3 test row and the floor compile run by hand until LV7a lands.
- **Open consequences:** a prop sent to Corsairs sits at its pivot until Corsairs' prefabs follow the contract (A4c, estimated 2028-04-17); the shipped black box recorder is unpriced; the cut-over runs on the studio's own skill files because the shipped agent context lands after it.

If the rate differs (each row is a fresh run, every date an estimate):

| Case | Saboteer on the line | Saboteer's first Steam release | Corsairs Isle on the line | End | Cut-over ends |
|---|---|---|---|---|---|
| Plan: two streams, one gate per person per day, freeze from 14 January | 2028-01-10 | 2028-06-12 | 2028-04-25 | 2028-10-11 | 2027-01-14 |
| 0.93 gates per person per day (leave and holidays) | 2028-04-10 | 2028-10-20 | 2028-08-21 | 2029-03-27 | 2027-03-29 |
| 0.75 gates per person per day | 2028-06-30 | 2029-02-13 | 2028-11-29 | 2029-08-02 | 2027-04-06 |
| 1.25 gates per person per day | 2027-11-11 | 2028-04-06 | 2028-02-23 | 2028-07-25 | 2027-01-11 |
| Three streams (a third person at the same rate) | 2027-08-17 | 2027-11-29 | 2027-10-26 | 2028-02-28 | 2027-01-05 |
| One stream | 2029-03-07 | 2029-12-20 | 2029-10-08 | 2030-09-05 | 2027-04-20 |
| One person away for the cut-over run-up (sprints 3 and 4), worse stream | 2028-01-20 | 2028-06-22 | 2028-05-08 | 2028-10-24 | 2027-03-17 |
| Unity 6.7 ships after 2027-07-01 (only the move waits) | 2028-01-10 | 2028-06-12 | 2028-04-25 | 2028-10-11 | 2027-01-14 |

The freeze rows are equal because the work that would run in the freeze window is package work the streams carry anyway. The only rows that move the cut-over are the ones that take capacity before 14 January. Losing a quarter of the rate (1.00 to 0.75) costs about 31 weeks on Corsairs. If the release checklist did not wait for the racing and underwater strangers, the first release would be 2028-05-23, 20 days sooner.

## The stories of step 1: Core as assemblies (L1 with L1r)

Step 1 is the smallest slice that shows the shape: Core redrawn as assemblies and every consumer compiling against them, with no behaviour changed. L1 has seven stories and L1r three. Stories L1-1 to L1-6 and L1r-1 to L1r-3 are step 1; L1-7 waits for the layout probe and is the first story of step 2. The split of L1 into seven stories is the planner's; the outcomes are the epic's. Facts are marked **verified** with the date (checked in source or measured) or **verify before building on it** (a lead from a survey that another session may have changed since).

Applies to every story of the step:

- **Rules:** Core's assemblies depend on the engine modules and nothing else Spellbound; references point down or sideways, never up; names are spelled out, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, C# formatted to the studio's Rider settings (brace on the same line, 4 spaces, 120 columns, CRLF).
- **Rules:** a move changes no namespace and no public type; no alias, no `MovedFrom`, no parallel old and new path; every consumer of a moved type is updated in the same change.
- **Rules:** work only in the directories the kickoff names; a gap in a dependency or a change that belongs in another package is raised in the report and stops that story, never worked around; nothing merges to a branch the games follow.
- **Rules:** every consumer resolves Core from GitHub and the lead never touches git, so no branch exists for the working tree. Each consumer's project takes a temporary manifest line of the form `"com.spellboundstudios.core": "file:../../CoreDev/Packages/Core"` (the path as it is on this machine) that points at CoreDev's working tree; it is a local path and not a pin, it is listed in the report under Files, and the developer removes it when the branch exists and the work merges.
- **Regression contract:** Core's edit-mode tests pass unchanged (138, counted by attribute on 2026-10-22, not run: **verify before building on it**); the logger, packing, hashing, registries, `SingletonManager`, weighted tables and assembly scanning behave as before; every type that was public stays public under the same name and namespace.
- **Regression contract:** Saboteer and Corsairs compile against the branch once L1r's references are in; neither game's code, scene or prefab changes.
- **Done, for each story:** compiles clean in the dev project through the Unity CLI (`unity command recompile` with `--project-path`, then the console shows no error), the tests pass, and the report lists what moved and what was proposed.

### L1-1 The engine-only assembly

- **Outcome:** Core's runtime has one assembly that depends on the Unity engine modules alone and references no Unity package.
- **Verified (2026-10-22):** Core 1.1.9 on its development branch has 124 runtime files, 62 of them a world-object framework.
- **Verified (2026-10-22):** Core's assembly references Entities, Entities.Graphics, Entities.Hybrid, Burst, Collections, Mathematics, Transforms, TextMeshPro, Input System and uGUI, and Unity.Physics and Unity.Physics.Hybrid, which are referenced and unused.
- **Verify before building on it:** `ImmutableAttribute.cs` line 3 has `using UnityEditor;` outside the editor guard in the runtime assembly; check it in this story and fix it if a player build would not tolerate it.
- **Rules:** the engine-only assembly keeps the name every consumer references today (`Spellbound.Core`); the new assemblies take new names, default `Spellbound.Core.<Part>`, named in the report.
- **Regression contract:** the vocabulary Core keeps (logger and sinks, tallies, packing, FNV hashing, registries, `SingletonManager`, weighted tables, assembly scanning) compiles in the engine-only assembly unchanged.
- **Done:** the assembly definition lists no Unity package; the report holds the table of folder to assembly.

### L1-2 The world-object assembly

- **Outcome:** Core's world-object folders (Objects, ObjectData, ECS, ModuleContracts) sit in an assembly of their own, awaiting WorldObjects.
- **Verified (2026-10-22):** the framework pulls Entities, TextMeshPro, Input System and uGUI into every project that installs Core, a card game included; Core has no tests for the ECS systems, presets, `DeltaResolver` or console parsing.
- **Verify before building on it:** Modifiers' `StatData.cs` and 68 Corsairs files use the moved namespaces (searched 2026-10-24); WorldForge's assemblies reference only Core's main assembly.
- **Rules:** the Entities references stay inside this assembly until Entities leaves Core's manifest, which is another epic's last story (UN4b); nothing here removes a package.
- **Regression contract:** a type that moves keeps its name and namespace; with L1r in, both games compile and behave as before.
- **Done:** the engine-only assembly does not reference this one; the report lists the types per assembly.

### L1-3 The console assembly

- **Outcome:** Core's console folder sits in an assembly of its own, default `Spellbound.Core.Console`.
- **Verify before building on it:** `Core.Console` is used by 2 GeoForge files, 3 Chat files and 1 VolumetricFog file (searched 2026-10-24).
- **Verified (2026-10-22):** Core's console is a uGUI console over a registry; its views are deleted later by the UI work, not here.
- **Rules:** nothing is deleted or rewritten; the old console keeps working exactly as it does.
- **Regression contract:** the three console mechanisms (Core's registry, Chat's second registry, the views) run as before in both games.
- **Done:** compiles; the report names every consumer of the namespace so L1r can follow.

### L1-4 The folder cycles

- **Outcome:** the cycles between Core's folders are broken so every new assembly compiles with references pointing one way.
- **Verify before building on it:** the cycle list comes from an outside review and the survey, not from this plan; read the real references in source first and list them in the report.
- **Rules:** break a cycle by moving the shared type down into the assembly both sides reference, or by an interface in the lower assembly; do not merge assemblies back to hide a cycle.
- **Rules:** if the clean fix needs a change outside Core, say so and stop that cycle.
- **Regression contract:** no behaviour test changes; no public type changes its namespace.
- **Done:** zero cycles; the report lists each cycle found and how it was broken.

### L1-5 Packing and engine types

- **Outcome:** it is known whether Core's packing uses any engine type, and if it uses none, packing compiles with no engine references.
- **Verified (2026-10-22):** the same packing is the save format, the wire format and WorldObjects' instance data, so a change to packing itself is a Core major.
- **Rules:** packing's byte layout does not change; no format version; if it does use engine types, list them in the report and leave packing where it is.
- **Regression contract:** a round trip over every packed type, and a byte comparison of the output before and after the story, are identical.
- **Done:** a written result in the report, and the compile setting changed only when the result is "none".

### L1-6 The rebuild, measured again

- **Outcome:** the clean rebuild of both games is measured again against the survey's figures.
- **Verified (2026-10-22, one clean rebuild per game, Ryzen 9 9950X3D, 16 cores, 61.6 GB):** Corsairs' compile graph took 35.4 s and Saboteer's 20.4 s; Core started at 27.9 s and 16.1 s because it references Entities Graphics, which finished at 27.6 s and 15.8 s; Core's own compile and post-process took 0.44 s and 2.21 s in Corsairs, 0.38 s and 1.62 s in Saboteer.
- **Verified (2026-10-22):** the two runs were taken under different conditions (Corsairs in a windowed editor, Saboteer in a headless one); take both the same way this time.
- **Rules:** use the Unity CLI as the survey did (`CompilationPipeline.RequestScriptCompilation` with a clean build cache through `unity command eval`, then `unity recompile`), and read per-assembly times from `Library/Bee/fullprofile.json`.
- **Regression contract:** no project file changes for the measurement; no claim without the numbers.
- **Done:** the survey's table repeated, with the honest reading: a game still waits for Entities Graphics until Entities leaves Core's manifest, so a gain is expected for package projects and non-Entities consumers and not for the games yet.

### L1-7 Core's repository to the settled layout (first story of step 2)

- **Outcome:** Core's package folder sits at `Packages/Core` in CoreDev, arranged as the layout probe (LV1a) proved.
- **Verified (2026-10-22):** each package's repository sits inside its package folder today (for example under `Assets/Core`) and the dev project roots are not repositories.
- **Rules:** built only after the probe has passed; the lead never touches git, so moving a repository's root is the developer's act and this story prepares and verifies the move.
- **Regression contract:** file identities (the GUIDs in the meta files) are kept; Core compiles and its tests pass in the moved layout.
- **Done:** the dev project opens on the new layout and the report says what the developer must move.

### L1r-1 GeoForge, Chat and VolumetricFog follow

- **Outcome:** the assemblies of GeoForge, Chat and VolumetricFog reference the new console assembly wherever their files name the console namespace.
- **Verify before building on it:** `Core.Console` appears in 2 GeoForge files, 3 Chat files and 1 VolumetricFog file (searched 2026-10-24).
- **Rules:** edit each package in its own development project; change assembly definitions only, plus the temporary manifest line the step's rules allow.
- **Regression contract:** each package compiles and its tests pass against CoreDev's working tree; no public type of the package changes.
- **Done:** all three compile through the Unity CLI against the working tree; the report lists each file edited.

### L1r-2 Modifiers and every other package follow

- **Outcome:** Modifiers and any other package assembly that names a moved namespace references the matching new assembly.
- **Verify before building on it:** Modifiers' `StatData.cs` uses the world-object namespace (searched 2026-10-24); search every package for the others instead of trusting this list.
- **Rules:** assembly definitions only, plus the temporary manifest line; if a package needs more than a reference, raise it in the report.
- **Regression contract:** Modifiers' tests (196 plus the performance suites, counted 2026-10-22) pass; **verify before building on it**.
- **Done:** every Spellbound package compiles against CoreDev's working tree; the report lists the search and its results.

### L1r-3 The games' own assemblies follow

- **Outcome:** Corsairs' assemblies (WorldForge, WorldSystem, TalentSystem and the tests) and any Saboteer assembly that names a moved namespace reference the new assemblies.
- **Verify before building on it:** 68 Corsairs files use the moved namespaces and WorldForge's references name only Core's main assembly (searched 2026-10-24); the search for Saboteer was not run.
- **Rules:** assembly definitions only, plus the temporary manifest line, no scene, prefab or script change; WorldForge is edited in its own development project, the others in the game that owns them.
- **Regression contract:** both games open and compile against CoreDev's working tree and their existing test assemblies compile.
- **Done:** both games compile; nothing is merged to a branch they follow (that is the later step that also carries LS and LM).

## The stories of step 2: layout, templates, Core's first vocabulary (LV1a, LV1b, L1-7, WF2a, L2c, R0d)

Step 2 settles where a package lives and starts Core's vocabulary. The probe runs first and gates every move; the template, Core's declarations and the packing description need only the probe's folder answer and run beside each other; the three moves come last, prepared by the lead and made by the developer. Fifteen stories: LV1a two, LV1b four, L1 one (L1-7, written under step 1), WF2a four, L2c three, R0d one. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the rules of step 1 hold (engine-only Core, references down or sideways, spelled-out names, one type per file, no comments, logging through Core, the studio's Rider formatting; a move changes no namespace and no public type; work only in the named directories; a gap is raised and stops the story; nothing merges to a branch a game follows).
- **Rules:** every new C# file starts with `// Copyright (c) Spellbound Studios. All rights reserved.`; existing files keep their header until the C1 rule exists.
- **Rules:** the lead never touches git in a repository the developer owns. A move of a repository's root, a branch, a tag or a commit is the developer's act; the story prepares the script and the files, verifies them on a throwaway copy made outside every repository, and hands the developer one bash line. Git runs only inside throwaway copies and scratch repositories the lead creates for the probe.
- **Rules:** the new repository of this step (`Template`) is created as a folder beside the other repositories; the developer initialises and publishes it.
- **Rules:** a type enters Core only as the line declares it (rule 4); every value a game might tune is a parameter or a setting with a default; nothing in Core knows a connection, a scene or a game.
- **Regression contract:** Core's edit-mode tests pass unchanged (141, counted by attribute on 2026-10-24); every public type of Core keeps its name and namespace; the logger, packing, hashing, registries, `SingletonManager`, weighted tables and assembly scanning behave as before.
- **Regression contract:** Inventory's and Decals' tests pass in the moved layout; their package.json, asmdefs and GUIDs are unchanged by the move; both games compile against the branches they follow today, and nothing in this step changes a game.
- **Done, for each story:** compiles clean through the Unity CLI in the project named, its tests pass, and the report lists what was built, what was proposed and what the developer must do.

### LV1a-1 The layout probe

- **Outcome:** it is known, from a scratch project, that a package at `Packages/<Name>` works: git and Git LFS from the project root with the package inside, `PackageInfo` found for the embedded package, a version define naming an embedded package and one naming a Unity module, an install by `?path=/Packages/<Name>#<ref>` into a second project, `Samples~` import, the test runner finding the package's tests, and Unity accepting the short folder name `Packages/Core` for `com.spellboundstudios.core`.
- **Verified (2026-10-24):** git 2.52 and Git LFS 3.7.1 are on the PATH; editors 6000.4.8f1 and 6000.3.10f1 are installed; no package repository has an LFS file; Unity's manual says a local git dependency needs `git+file://` or a `.git` suffix and that `?path=` comes before `#`.
- **Verify before building on it:** that Unity's version defines accept an embedded package's name and a `com.unity.modules.*` name; the manual page did not answer and the probe does.
- **Rules:** the probe uses a copy of Core (today's working tree, no `.git`) as the embedded package, so the folder name question is answered on the real package; the scratch projects live in the session's scratch folder and are deleted at the end.
- **Rules:** if git or Git LFS misbehaves inside the folder, or Unity rejects the short name, the step stops and asks; nothing after this story is built.
- **Regression contract:** none; nothing of the developer's changes.
- **Done:** a written result per question, pass or fail with the evidence, in the report; the nested clone (a package repository inside a project repository) is answered too.

### LV1a-2 The bootstrap in a clean project

- **Outcome:** it is known what a package's `Bootstrap` assembly costs and whether it works: a package installed without Core into a clean 6000.3 and a clean 6000.4.8f1 project, no studio credentials, compiles with no error, its bootstrap says Core is missing and names the install, and Core can then be fetched from its public address; the compile cost of one more assembly and the fetch time are measured.
- **Verified (2026-10-24):** the Core repository is public; Core has no `Packages/Core` on GitHub yet, so the fetch probes today's address on `dev` and the `?path=` form is proven by LV1a-1 on the scratch repository.
- **Rules:** the probe package is throwaway and ships nowhere; its main assembly is constrained on `SPELLBOUND_CORE` from a version define on Core's id, its `Bootstrap` assembly has no references, reads the address from a text file beside its class and writes one console line; no window exists yet (LV2), so the probe records the console line.
- **Rules:** a Git LFS client cannot be removed from this machine; the probe records that the package has no LFS file and that the fetch does not call LFS.
- **Regression contract:** none.
- **Done:** the written result with the numbers (compile delta of one assembly, fetch time on each editor), which gates the Core constraint in every L epic that rewrites a package.

### LV1b-1 The convention and the dev project shell

- **Outcome:** the `Template` repository holds the standard dev project shell: `Assets/_Project/Scenes` and `Settings`, `Packages/manifest.json` (Core by `?path=/Packages/Core#beta`, the test framework, the Pipeline package, the Unity packages a sentence needs), `ProjectSettings/ProjectVersion.txt` at 6000.4.8f1, `.gitignore`, `.gitattributes` with Saboteer's LFS patterns scoped to `Assets/_Project`, `.editorconfig` from the studio's Rider settings, `CODEOWNERS`, the root `AGENTS.md`, `line-text-address.txt`, `managed-files.txt`.
- **Verified (2026-10-24):** Saboteer's `.gitattributes` holds 32 LFS patterns, none scoped; Corsairs' `.editorconfig` is the studio's; every dev project's root is a Unity project that is not a repository, with the Unity template's `TutorialInfo` and `Readme.asset` still in `Assets`.
- **Rules:** PackageCheck's files (`Identity.asset`, `Surface.txt`, `Documentation~/index.md`, `Bootstrap`, the ledger) are not in the template; `skeleton-version.txt` records `none` until PackageCheck exists. The PackageCheck manifest line is added by LV2.
- **Rules:** the template ships no `.meta` file; Unity writes them on first open.
- **Regression contract:** none.
- **Done:** the folder exists beside the other repositories with every file above; the report lists the tree.

### LV1b-2 The restructure script

- **Outcome:** `scripts/adopt-repository.sh <Name>` in the template moves a package repository from today's layout (the repository root inside the dev project at `Assets/<Name>`) to the settled one in place: the `.git` folder moves to the dev project root, the package moves to `Packages/<Name>`, `Assets/Scenes` and `Assets/Settings` move under `Assets/_Project`, the shell files are added, everything is staged on a new branch and committed with a title in the studio's form, and the next lines (push, pull request with the line text's address in the body, the new manifest line for every consumer) are printed for a person.
- **Verified (2026-10-24):** Core, Inventory and Decals each have their repository at `Assets/<Name>` with a Unity project `.gitignore` inside it and no `.gitattributes`.
- **Rules:** file identities are kept (every `.meta` moves with its file; `Assets/<Name>.meta` is deleted because the folder leaves `Assets`); the script refuses to run on a dirty working tree, on a root that is already a repository, or when `Packages/<Name>` exists.
- **Rules:** the script is verified on a throwaway copy of each pilot repository, never on the developer's; the developer runs it once per repository.
- **Regression contract:** on the copy, the package's GUIDs, package.json and asmdefs are byte-identical before and after; the project opens, compiles and its tests pass.
- **Done:** the script, and the three copies (Inventory, Decals, Core) opened and tested through the Unity CLI.

### LV1b-3 Inventory and Decals as pilots

- **Outcome:** Inventory and Decals are ready to move: the script has been run on a copy of each, each copy opens on 6000.4.8f1 at `Packages/<Name>`, compiles and passes its tests, and the developer has one line per repository.
- **Verified (2026-10-24):** both repositories are on `main` with clean working trees; Inventory has `Samples/` (not `Samples~`) and a `UITK` assembly; Decals depends on Core and URP.
- **Rules:** nothing in either package changes in this story (no `Samples~` rename, no asmdef edit); the move is a move. A game's manifest line (`?path=/Packages/<Name>`) is LM's and MV's and lands the hour the move merges, so the report prints the lines.
- **Regression contract:** the pilots' test counts match before and after; both games keep compiling against today's `main` until the developer merges.
- **Done:** the two lines for the developer and the test results on the copies.

### LV1b-4 The tag convention and the first tags

- **Outcome:** the tag convention of the line text is applied: Core takes its baseline tag `v1.1.9` on the commit that published 1.1.9, and every other repository takes no tag until its first release (`1.0.0-beta.1`, made by the release in WF4).
- **Verified (2026-10-24):** no package repository has a tag.
- **Rules:** a tag is the developer's act; the story finds the commit and hands the line.
- **Regression contract:** none.
- **Done:** the commit named with its evidence and the one line.

### WF2a-1 The package skeleton

- **Outcome:** the template's `Packages/<name>` holds the hand-written starting files of a package: `package.json` (id, display name, floor 6000.3, dependencies empty, author, samples entry), `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` with the six headings, `Runtime/Spellbound.<Name>.asmdef` with its `<Name>Kit` front door and the Core constraint, `Editor/`, `Tests/Runtime/`, `Tests/Editor/`, `Samples~/<Name>Sample/`, `Documentation~/boundary-sheet.md`.
- **Verified (2026-10-24):** no `OperationGroup` attribute exists yet (CL1, step 4); the initialiser leaves the line out and CL1 adds it to the skeleton.
- **Rules:** assembly references are by name; every `.cs` file starts with the copyright line; the front door compiles empty; `Tests` are two assemblies (edit and play) with one passing test each so the test runner shows the package the day it is born.
- **Regression contract:** none.
- **Done:** a package made from the skeleton opens and compiles in the shell with Core installed.

### WF2a-2 The initialiser

- **Outcome:** `bash scripts/initialise-package.sh <Name> "<sentence>" [--kind library|tool] [--requires burst,mathematics,urp] [--presentation]` renames the skeleton's placeholders, writes the sentence into `package.json` and the READMEs, declares the Unity packages named by `--requires` with the versions of `managed-unity-packages.txt`, adds `<Name>.Presentation` with `defineConstraints ["!UNITY_SERVER"]` on `--presentation`, makes no `Runtime` folder for a tool, and deletes itself.
- **Rules:** bash and POSIX tools only; the name must be a PascalCase identifier.
- **Regression contract:** none.
- **Done:** run on a copy of the template for a library and for a tool; both open and compile with Core from the local probe repository.

### WF2a-3 The engineer's setup

- **Outcome:** `bash scripts/setup.sh` sets `core.hooksPath` to `.githooks`, prints the editor version the project needs, and runs the agent context install when the operation exists (CL5, step 9) or says it does not yet.
- **Rules:** the `commit-msg` hook checks the title rule with the pattern of the workflow area; it is the one file of WF1 this story carries, because the setup is meaningless without it.
- **Regression contract:** none.
- **Done:** a bad commit title is refused on a scratch repository and a good one passes.

### WF2a-4 The callers

- **Outcome:** `.github/workflows/pull-request.yml` and `release.yml` are thin callers of the organisation's shared workflows at `@main`, and `.releaserc.yaml` names `beta`, `rc` and `main` with the package's paths.
- **Verified (2026-10-24):** the organisation's `.github` repository has no `.github/workflows/` yet; the shared workflows are WF3's and WF4's.
- **Rules:** the callers carry no logic; the shared workflow names are the ones the workflow area wrote (`check.yml`, `release.yml`).
- **Regression contract:** none.
- **Done:** the files exist and the report names the shared workflows they wait for.

### L2c-1 The section attribute

- **Outcome:** Core has `SectionAttribute`, how a package marks a type as savable state under a name, with no version and no migration step; Persistence discovers it later.
- **Rules:** one attribute, on a class or struct, not inherited, one per type, a required non-empty name; nothing else, because the Persistence pitch (step 3) designs its use.
- **Regression contract:** none beyond the step's.
- **Done:** the attribute and its tests (the name is kept, an empty name is refused).

### L2c-2 The ground vocabulary

- **Outcome:** Core has the surface source and the occupancy source: `ISurfaceSource.Schedule(in SurfaceRequest, NativeArray<SurfaceSample>, JobHandle)`, `SurfaceRequest` (origin, spacing, count, reference frame id), `SurfaceSample` (height, class byte), `IOccupancySource.Classify(in Bounds)` and `Occupancy` (empty, solid, mixed).
- **Rules:** engine types only (`Vector2`, `Vector2Int`, `Bounds`, `NativeArray<T>`, `JobHandle`); no Mathematics; the structs are blittable so a Burst job can read them; no default implementation holds a sea level or a sky.
- **Regression contract:** none beyond the step's.
- **Done:** the types, a test with a custom source for each seam, and a test that the structs are blittable.

### L2c-3 The reference frame noun

- **Outcome:** Core has `ReferenceFrameId` (64 bits, default is the world), `IReferenceFrame` (id, world pose, velocity at a point, angular velocity), `ReferenceFramePose` (a pose in a reference frame, with conversions to and from world space through the frame), and `ReferenceFrameDirectory` (per world, maps an id to its frame, register and unregister, the world for the default id).
- **Verify before building on it:** `ReferenceFrameChecks.RequireConstantUp` needs `UpField` (R0) and the guard (R1a); neither exists. The check is held for R0 and said so; the noun lands without it.
- **Rules:** no static directory; a directory is an instance a world owns; a duplicate registration is refused with a result, not an exception.
- **Regression contract:** none beyond the step's.
- **Done:** the types and tests (default id is the world, pose round trip through a moving frame, directory register, lookup, unregister, duplicate refused).

### R0d-1 The layout description of Core's packing

- **Outcome:** `CoreKit.Packing.Describe(Type)` returns the layout of a packed type as text: its instance fields in declaration order, each as name and type, nested value types expanded, so the surface writer and a saved section's header hash the same text.
- **Verified (2026-10-24):** Core has no `CoreKit`; packing is hand-written `IPacker` implementations over `Span<byte>`, so the description reflects the type's fields, not a schema.
- **Rules:** `CoreKit` is `public static class CoreKit` in `Spellbound.Core` with a nested `Packing` class; the text is deterministic (ordered by metadata token, culture-free), carries no hash itself, and names a type by its full name; a cycle is cut by naming the type once more without expanding.
- **Regression contract:** none beyond the step's; packing's bytes do not change.
- **Done:** the function and tests (field order, a nested struct expanded, a renamed field changes the text, a reordered field changes the text, a cycle terminates).

### The written result of the layout probe (LV1a, 2026-10-25)

Run on this machine with git 2.52, Git LFS 3.7.1, editors 6000.4.8f1 and 6000.3.10f1, on a scratch project holding a copy of Core at `Packages/Core`. Every row passed; the layout of decision 12 stands.

| Question | Result | Evidence |
|---|---|---|
| Unity accepts `Packages/Core` for `com.spellboundstudios.core` | pass | The package resolves as Embedded; Unity exposes it under its id, so asset paths read `Packages/com.spellboundstudios.core/...` while `PackageInfo.resolvedPath` is the short folder. `FindForAssetPath("Packages/Core/...")` answers null |
| `PackageInfo` found for the embedded package | pass | `FindForPackageName` and `GetAllRegisteredPackages` both list it as Embedded |
| A version define naming an embedded package | pass | `com.spellboundstudios.core` with `[1.1.9,3.0.0)` defines `SPELLBOUND_CORE`; an assembly constrained on it compiles and runs |
| A version define naming a Unity module | pass | `com.unity.modules.physics` defines; an absent package does not |
| File identities kept | pass | The GUID of a moved file equals its meta file's GUID in the moved project |
| `Samples~` import | pass | The sample is found by `Sample.FindByPackage` and imports into `Assets/Samples/Spellbound.Core/1.1.9/` |
| The test runner finds the package's tests | pass | 141 of 141 edit-mode tests pass in the scratch project |
| Git and Git LFS from the project root with the package inside | pass | 410 files committed, 353 under `Packages/Core`, none under `Library`; one LFS file under `Assets/_Project`, nothing under `Packages/Core` in LFS; git run from inside the package folder answers the project root |
| Install by `?path=/Packages/Core#main` from a repository | pass | A second project resolved Core as a Git package from a local bare repository at the probe's commit and ran its code; final compile clean |
| A nested clone (a package repository inside a project repository) | works in git, not as the layout | The outer repository records `Packages/Core` as an embedded repository pointer, not as files; Unity opens it. The one-repository layout stands |

The bootstrap probe (LV1a story 2): a throwaway package with a `Bootstrap` assembly (editor only, no references, one class, one address file) installed without Core into a clean 6000.3.10f1 project and a clean 6000.4.8f1 project. Both compiled with no error, the Core-constrained assembly stayed out, the bootstrap wrote one console line naming the install address, and Core then installed from its public GitHub address over https with no credentials in 17.7 s on 6000.4.8f1 and under about 30 s on 6000.3.10f1. The constrained assembly compiled after the install. The bootstrap assembly's warm compile cost 0.16 s plus 0.05 s of post-processing, against the audit's computed 0.2 to 0.8 s. The editor log shows no Git LFS call, and the package has no LFS file. One fact for UN4b: a clean 6000.4 project that installs today's Core logs 14 compile errors in Unity's serialization package on the first resolve, from Core's Entities 1.3.14 pin; the final compile is clean.

Facts the probe changed: the manual did not say whether a version define accepts an embedded package or a module name; both do. Settings taken: the skeleton's Core range is `[1.1.9,3.0.0)` until Core 2.0; the restructure branch is `layout/packages-folder`; the adoption script does not copy the workflow callers into a repository until the shared workflows exist.

## The stories of step 3: the Persistence pitch (PP)

Step 3 designs Persistence before any of it is built. Four stories: three of pitch and one spike. Nothing in Persistence changes and nothing in a game changes; the spike runs in a throwaway project outside every repository, with Core from CoreDev's working tree. The step's written result is the pitch page, the design file `Areas/Persistence.md` (the design source of L8a, L8, L8c, L8u and L8b once the developer approves it), the spike's written result below, and the sizing of the placeholders L8a, L8c, L8u and L8b. The split is the planner's; the outcomes are the epic's. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the pitch obeys the line's Persistence row and the rules of the line: no static entry point, no bridge to any data package, no knowledge of any section's layout, no format version or migration before the first ship to a customer, every section under a header of name, layout fingerprint and length, an old layout refused by name, durations in seconds, an unresolved id reported and the consumer's policy deciding.
- **Rules:** the design starts from Core's section attribute and Core's layout description as they exist after step 2; a gap in Core is raised and sized, never worked around in Persistence.
- **Rules:** every decision put to the developer is one plain question with the recommendation first and the alternative after; a question a standing rule or the game's premise answers is applied and recorded, not asked.
- **Rules:** the spike's code ships nowhere and is kept only in the session's scratch folder; the real save files it reads are the developer's own on this machine and are never written.
- **Regression contract:** nothing of the developer's changes; both games keep compiling against today's Persistence and today's saves keep loading in them.
- **Done, for each story:** the written result in `Areas/Persistence.md` and on the page, and the report.

### PP-1 The storage seam and the section header

- **Outcome:** the public surface of the rewritten Persistence is designed and shown as calling code: the front door and the one instance it opens, the store (one saved thing, a character or a world or the settings) as a bag of sections, the storage seam with its file and memory defaults, the section header with Core's fingerprint, section discovery through Core's attribute, refusal by name with the report, and the policy for a section no installed package knows; today's calling code in both games stands beside the same code rewritten.
- **Verified (2026-10-25):** Persistence 0.1.2 is ten runtime files with no tests under the id `com.spellbound.persistence`, pins Core at 0.0.2, and exposes a static `SaveSystem` that keeps a JSON metadata file, a file-level format version that deletes every save when it changes, and sections keyed by an integer id per scope string, found by an `AppDomain` scan in a static constructor. Saboteer uses it in 10 files (six settings sections, the chat settings as JSON text inside a section, the HUD layout); Corsairs in 15 store types and 6 callers (character, world and local stores).
- **Verified (2026-10-25):** Core has `SectionAttribute(name)` with a required name and nothing else, `CoreKit.Packing.Describe(type)` returning the type's name and its fields in declaration order, and `StableHash.Fnv1A32`; neither game's saves carry a header today.
- **Rules:** the fingerprint hashes the field lines of the description with the type's own name left out, so a type can be renamed and the section name alone is the identity; the file itself opens with the same header for Persistence's own container type, so the container needs no format version either.
- **Done:** the surface as signatures on the page and in the design file, and L8a's two gates named.

### PP-2 The capture contract and the database seam

- **Outcome:** it is designed how a save never blocks a tick: a plain section packs whole on the calling thread, a large section hands over slices under a per-tick budget that its owner advances, and packing's result goes to storage off the thread; the durable small record written and flushed on request, which Networking's lease issuer needs; and L8b's shape behind the same seam: one atomic write across several stores, a load of named sections only, per-entity stores, and a database implementation of the seam.
- **Verified (2026-10-24, Networking's claim 5):** a save is never one synchronous pack of every section on the simulation thread; the observations `save slice milliseconds` and `ticks over budget` are declared through Core; the lease bound is written through the storage seam with a flush before a grant.
- **Verify before building on it:** packing throughput in bytes per millisecond is unmeasured; Networking's N3 measures it on its synthetic world before L8 chooses between copying memory and slicing the walk.
- **Rules:** the budget is a setting with a default and nothing is derived from it; the database engine is chosen at L8b and not here; Persistence owns no tick, the owner of the store advances the save.
- **Done:** the contract as signatures; L8 and L8b sized.

### PP-3 The upgrade of a shipped game's old saves

- **Outcome:** it is designed how a player's save written by an older release of a shipped game loads in a newer one: a step the game registers per section name and old fingerprint, chained to the current layout and reported, run through two doors the game chooses between: at load when a section is refused by name (the default, written out on the next save), or over every save of a kind as a job the game drives from a button, a loading screen or its first start; where a game records the fingerprints it shipped; what a customer may extend.
- **Verified (2026-10-24, decided):** a game sold on Steam is a customer from its first release built on the line, the demo is exempt, and in a shipped game the upgrade runs on its own; detection stays as it is and nothing is kept for compatibility before that release, so today's files are not carried into the rewritten Persistence.
- **Rules:** no format version, no migration step and no old reader before the first ship; the step is the game's code and Persistence only applies it; any operation is named in the operation grammar, as a start and status pair if it can outlast a reload.
- **Done:** L8u sized; the input of the stored-format release gate named.

### PP-4 The spike

- **Outcome:** it is known from a throwaway project with today's Core that the fingerprint is the same on every compile and differs when a field is renamed; that a changed layout is refused by name with both fingerprints reported and an unknown section keeps its bytes; that a write of 64 MB through the seam returns to the caller at once and completes off the thread, and that frames stay short while a write of 128 MB runs; that 400 sections of 256 KB are captured under a 1 ms per-tick budget; and that today's Saboteer settings file parses, is refused as a whole by the new reader, and one upgrade step carries its video settings into the new store.
- **Verified (2026-10-25):** real save files from both games exist on this machine under the games' persistent data folders; Saboteer's settings file holds six id-keyed sections in a file of 257 bytes.
- **Rules:** the throwaway project installs Core from CoreDev's working tree by a local path; its tests run through the Unity command line; the numbers are reported as measured on this machine with no claim beyond it.
- **Done:** a written result per question, pass or fail with the numbers, beside step 2's result below.

### The written result of the Persistence spike (PP-4, 2026-10-25)

Run on this machine in a throwaway project holding Core from CoreDev's working tree (Unity 6000.4.8f1, Pipeline 0.8.0-exp.1): 21 play mode tests through the Unity command line, all passing on the second run. The first run failed one row and the failure changed the design (the capture row below). Nothing in Persistence or in a game changed, and the real save files were only read.

| Question | Result | Evidence |
|---|---|---|
| The fingerprint is the same across compiles | pass | The video settings section hashes to 322187b3 and Persistence's own container to 3a977eb5 on two compiles of the assembly |
| A renamed field changes the fingerprint; the same fields under another type name do not | pass | A copy of the type with one field renamed hashes differently; a copy with the same fields under another type name hashes the same, because the type's own name line is left out |
| A changed layout is refused by name with both fingerprints | pass | `refused: section saboteer.settings.video layout 687bdde9, current 322187b3`; the other sections of the store were read |
| An unknown section keeps its bytes | pass | Five bytes under a name no catalog knows came back unchanged beside an accepted section |
| A write of 64 MB returns at once and completes off the thread | pass | The call returned after 0.024 ms; the file was complete after 32.1 ms; the temporary file was gone and the final file had every byte |
| Frames stay short while a write of 128 MB runs | pass | 622 frames during the write, median 0.12 ms, max 0.69 ms; the 30 idle frames before it had a 13.0 ms hitch, so the write added nothing |
| 400 sections of 256 KB under a 1 ms per-tick budget | pass on the second run | 100 MB captured in 6 ticks, max tick 1.001 ms, five ticks ending within 1 µs past the line as the chunk in flight finished. First run: the buffers grew while slicing and one tick cost 15.2 ms; the design now sizes the buffers from each section's expected size before the first slice |
| A section larger than one tick is split across ticks | pass | 64 MB captured in 86 ticks under a 0.05 ms budget, max tick 0.167 ms |
| A 64 B record written and flushed to disk | pass | 2.35 ms, read back equal |
| Today's Saboteer settings file parses | pass | Format version 1, six sections: ids 10 (36 B), 11 (64 B), 12 (53 B), 13 (22 B), 14 (10 B), 15 (12 B), 257 bytes in all |
| Today's file is refused as a whole by the new reader | pass | No store header; the reader refuses with the name it read and touches no section |
| One upgrade step carries the video settings into the new store | pass | The 64 legacy bytes read as the video section, written under its header into a store of 116 bytes, read back field for field |
| Discovery through Core's attribute | pass | The catalog finds the section by name through Core's assembly scanning; a duplicate name is an error at open |

Facts the spike changed: the capture buffers are sized before the first slice (folded into `Areas/Persistence.md`). Settings taken: the budget default 1 ms; the file extension `.sbs`; the over-budget counter counts any overshoot, and a tolerance for the chunk in flight is a setting L8 names. Not measured: packing throughput of a real world (Networking's N3) and discovery under build stripping (CL1's first story).

## The stories of step 5: the UI kit (UI1, UI2)

Step 5 turns UI into the kit the line sells: three assemblies with a truthful package, a theme that is a contract, and the four parts every later text surface is built from. Nineteen stories: UI1 ten, UI2 nine. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Nothing in a game changes in this step; the games meet the new assemblies at step 8, and the consumer list in the report is what that train updates.

Applies to every story of the step:

- **Rules:** the rules of steps 1 and 2 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows). Every new C# file starts with `// Copyright (c) Spellbound Studios. All rights reserved.`; moved files keep their header.
- **Rules:** UI depends on Core and the engine modules only; no assembly of UI references the Input System, uGUI, TextMeshPro or any data package. Everything UI draws is replaceable without editing the package: a template or a class on an element, a token, a seam with a default.
- **Rules:** the assemblies are `Spellbound.UI.Widgets`, `Spellbound.UI.Screens` (references Widgets), `Spellbound.UI.Editor` (editor only, references both), the test assemblies and the sample assembly. Namespaces follow assemblies; the front door `UIKit` sits in the root namespace `Spellbound.UI` inside Screens. Widgets and Screens carry `!UNITY_SERVER`, and every assembly that references them carries the same constraint.
- **Rules:** the package stays at `0.2.10`; the version is never typed. The developer's merge into `beta` is the sign-off, and `beta` is created from `main` by the developer in the hand-off line, because both games follow UI's and Chat's `main` with no ref and nothing of this step may reach them before step 8.
- **Rules:** a value a game might tune is a token, a property with a default or a constructor argument, never a literal in logic; the roles UI ships are neutral; no string in the package names a game.
- **Verified (2026-10-25):** the UI repository is the folder `UIDev/Assets/UI` (the dev project root is not a repository), `main` is its only branch, both games install it as `git@github.com:Spell-Bound-Studios/UI.git` with no ref; Chat is the same at `ChatDev/Assets/Chat` (branches `main`, `l1-core-assemblies`); UI has 112 edit-mode tests counted by attribute, Chat 74; no editor was open; Core has no observation model yet (`ObservationContext` arrives with R1a in step 17), so no door of this step takes one and the flush cost is measured in the test instead.
- **Verified (2026-10-25):** `Tab.closeable`, the `closing`, `closed` and `selected` events and `TabView.tabClosed`, `tabReordered`, `reorderable` are on Unity's 6000.3 and 6000.4 script reference pages; `com.unity.ui.test-framework` 1.0.0 (2025-07-09) exists in the Unity registry with the assemblies `Unity.UI.TestFramework.Runtime` and `Unity.UI.TestFramework.Editor` and a `simulate.Click(element)` and `simulate.FrameUpdate()` API; editors 6000.4.8f1 and 6000.3.10f1 are installed.
- **Regression contract:** UI's 112 edit-mode tests pass unchanged in meaning (names and namespaces follow the split); the view stack, cursor arbiter, escape chain, layout store (format byte 2 and its payload unchanged), layout edit mode, tooltip surface, resource bar (minus its three variant classes), scroll view, anchors, spotlight and perimeter effects behave as before; Chat's 74 tests pass in ChatDev and Chat's `UIIntegration` compiles against UI's working tree; Core and both games are not changed by this step.
- **Done, for each story:** compiles clean in UIDev through the Unity CLI, its tests pass in the project named, and the report lists what was built and what was raised.

### UI1-1 The spike: a closeable tab, the theme swap and the class the tokens hang on

- **Outcome:** it is known on 6000.4 and 6000.3 how a `TabView` tab is made closeable and what fires when it closes; that swapping `PanelSettings.themeStyleSheet` restyles a live element and a token declared under `.sb-theme` resolves on a descendant through `CustomStyleProperty`; whether a `:root` token reaches an editor panel and whether a class on the root does. The fixture stays in the Gallery's Theme page for U9's Unity 7 run.
- **Rules:** the 6000.3 row runs in a throwaway project outside every repository that installs UI and Core from the working trees by local path; the working project is never opened in another editor.
- **Done:** a written result per question in the report; the theme and tab tests stay in the package's tests.

### UI1-2 Widgets, Screens, Editor and Tests, and a truthful package

- **Outcome:** `Spellbound.UI.Widgets` holds the elements that stand alone (the surviving kit, manipulators, geometry, the theme) and `Spellbound.UI.Screens` holds views, the manager, cursor, escape, sequencing, layout store and edit mode with its regions; both carry `!UNITY_SERVER`; the test assembly follows; `package.json` declares Core as a floor, Unity `6000.3`, and the Gallery under `samples`; the sample assembly is not auto-referenced and references no Unity package.
- **Verified (2026-10-25):** two runtime assemblies today, `Spellbound.UI` and `Spellbound.UI.UITK`, both referencing Core while `package.json` declares nothing; the sample assembly is auto-referenced and references `Unity.InputSystem`.
- **Regression contract:** every surviving public type keeps its name; its namespace follows its assembly.
- **Done:** compiles; the existing tests pass under the new namespaces; the consumer list (Chat, both games' `using` lines, UXML namespaces and theme imports) is in the report.

### UI1-3 The game shapes leave

- **Outcome:** `HeroButton`, `MilestoneChain` and its binder, `CharacterRow`, `WorldRow`, `TraitRow`, `StatRow`, `MenuPanel`, `PortraitTile`, `IconTile`, `ListRow`, `WindowPanel`, `StandardButton.uxml` and `MenuChrome.uss` leave the package; `ResourceBar` loses its `Cast`, `Interrupted` and `Fizzled` variants and takes any state class; `Maximizable`, `PanZoomable`, `TabBar`, `TabStrip` are cut (no consumer, or Unity's `TabView`). Saboteer's copy of the menu chrome is the game's, taken at step 8 from UI's `main`; the report names every file.
- **Verified (2026-10-25):** `Maximizable`, `PanZoomable`, `TabBar`, `IViewTransition` have no consumer outside the package; `TabStrip` is used by Corsairs' `SettingsTabsView` and the sample; the variant classes are used by Saboteer's `UnitFrameCastBar` and Corsairs' `CastBarView`; `MenuChrome.uss` is imported by both games' theme sheets.
- **Done:** the files are gone from the package, the package has no game noun, and the report lists the consumers step 8 updates.

### UI1-4 The slot styles go to Inventory

- **Outcome:** `SlotStyles.uss` leaves UI; its home is Inventory's UITK bridge. The Inventory half is raised, because InventoryDev is outside this step's directories.
- **Done:** the file is gone from UI; the report names its last commit on UI's `main` for the Inventory story to take it from.

### UI1-5 Unity's TabView replaces the tab widgets

- **Outcome:** the kit ships no tab element; `Tabs.uss` restyles Unity's `TabView` and `Tab` from tokens, closeable and reorderable included; the Gallery uses it; Corsairs' `SettingsTabsView` is named for UI4c.
- **Done:** compiles; the Gallery's pages are a `TabView`; the spike's closeable test passes.

### UI1-6 Tokens under `.sb-theme`, the default theme, the second theme

- **Outcome:** every token is declared on `.sb-theme`, named `--sbui-*` as today; `View` puts the class on its document root and a widgets-only buyer puts it on theirs; the default theme is a Theme Style Sheet in the package (`Default.tss`) importing Unity's default theme, the tokens and every widget sheet; a second theme (`Light.tss`) replaces the tokens and nothing else; Unity's own controls (button, text field, toggle, slider, dropdown, scroller, tab view) are styled from tokens in the theme, so a buyer writes no class to get the look.
- **Done:** compiles; the Gallery opens on the default theme; the theme validator of UI1-9 passes both shipped themes.

### UI1-7 The theme switcher and theme variants

- **Outcome:** `ThemeSwitcher` (from Corsairs' 52 lines, generalised) applies a theme to every registered `PanelSettings`, lists the registered themes and stacks token layers (variants) on the roots registered with it; the package ships two variants, `LargeText.uss` and `HighContrast.uss`; `UIKit.Themes` is the switcher a game configures.
- **Rules:** static state resets on play mode entry without domain reload.
- **Done:** a test applies the second theme and a variant and reads the changed token; the Gallery's Theme page switches both.

### UI1-8 Serialized view identity, PanelView, UIKit.Views

- **Outcome:** a view's identity is a serialized string that defaults to the type's full name and is hashed with Core's hash; `PanelView` is a sealed view with no logic that a UXML and a policy complete in the inspector; `UIKit.Views` lists the live managers and resolves a view by identifier, which U8's operations and the console use.
- **Verified (2026-10-25):** today the identity is the hash of the simple type name and Chat's and Corsairs' `ConsoleView` collide.
- **Done:** tests cover the default identity, an explicit identity and the collision; compiles.

### UI1-9 UI.Editor: the theme validator and the view validator

- **Outcome:** `Spellbound.UI.Editor` holds a theme validator that lists every token the default theme declares and a theme copy lacks, and a view validator that finds two views with one identifier, a view outside a manager and a view whose document has no panel settings; both are plain functions with edit-mode tests and a menu entry under `Spellbound/UI`; they become operations and checks when CL1 and CL4 land.
- **Done:** tests pass; both shipped themes and both variants validate clean.

### UI1-10 Chat follows the split, and UI and Chat to the settled layout

- **Outcome:** Chat's `UIIntegration` references Widgets and Screens with a bounded range on UI, its two files use the new namespaces, and both repositories move to the settled layout with the template's `adopt-repository.sh`, run by the developer with the editor closed after the kit commit; the sample folder becomes `Samples~` in the same move.
- **Rules:** the restructure is the developer's act; the story prepares the preconditions and the lines.
- **Done:** Chat compiles in ChatDev with UI installed from the working tree; the hand-off carries the lines.

### UI2-1 The spike: the role colour read, the Localization read, 10,000 lines

- **Outcome:** it is known that a role's colour declared as a token on the host resolves through `CustomStyleProperty<Color>` on `CustomStyleResolvedEvent`; whether Unity Localization 1.5 hands back a pattern with its placeholders intact (`StringTableEntry.Value`) so a game can implement `ITextTemplateResolver` over it; and what 10,000 lines cost `TextLog` to append and flush in dynamic-height and fixed-height mode, on this machine.
- **Rules:** the Localization read runs in a throwaway project; UI never references Localization.
- **Done:** the figures in the report beside the plan's "unmeasured".

### UI2-2 StyledText

- **Outcome:** `StyledText` is a list of spans (text, role, optional link, optional detail tier) built through `StyledText.Begin()`; roles are open ids hashed from names with Core's hash, UI ships `Plain`, `Muted`, `Emphasis`, `Positive`, `Negative`, `Warning`, `Link`; `StyledLabel` is the one element that writes rich-text markup, escapes every plain span and raises `LinkActivated` from `PointerUpLinkTagEvent`; a role's colour, weight and style are tokens `--sbui-role-<name>-color`, `--sbui-role-<name>-bold`, `--sbui-role-<name>-italic` read on the label itself.
- **Done:** edit-mode tests on building, escaping and role ids; a play-mode test on the colour read.

### UI2-3 The template span

- **Outcome:** `StyledText.Begin().Template(id, Argument.Of("value", 12).Role(...))` builds a span resolved at render through `ITextTemplateResolver`; the default resolver reads a `TextTemplateTable` asset; arguments are typed (text, number, nested styled text) and escaped; a missing pattern renders the id and its arguments so nothing is lost.
- **Done:** tests on word order, a nested argument and a custom resolver (`TextTemplateResolver_CustomImplementation`).

### UI2-4 TextLog

- **Outcome:** `TextLog` wraps a `ListView` with a capacity, dynamic or fixed row height, `Append(StyledText)`, `Clear()`, a bottom-sticky scroll and a new-lines pill, flushing once per frame.
- **Done:** play-mode tests on capacity, sticky scroll and the pill.

### UI2-5 Live lines and the flush

- **Outcome:** `AppendLive` returns a handle whose `Update(StyledText)` rewrites the line in place; `Flush()` is public so a caller and a test can force it; the 10,000-line figures of UI2-1 are taken through it.
- **Done:** a test updates a live line; the figures in the report.

### UI2-6 TextEntry

- **Outcome:** `TextEntry` owns focus with retries, suppresses Enter on the focus frame, refocuses after submit, cancels on Escape, walks `EntryHistory` on Up and Down, asks an optional `ITextCompleter` on Tab, and raises `Submitted`, `Cancelled` and `FocusChanged`; its focus trace is a property the hosting component serializes, not a static.
- **Verified (2026-10-25):** Chat's `ChatWindowElement` and `ConsoleElement` carry the same retry, frame and refocus fields.
- **Done:** tests on history, completion, cancel and the submit round trip.

### UI2-7 WindowFrame

- **Outcome:** `WindowFrame` is the one draggable, resizable, lockable, closable window: header with title and buttons, a content slot, a resize grip; its structure comes from a template a buyer replaces and its look from `WindowFrame.uss` tokens; it replaces `WindowChrome.uss` and `WindowPanel.uxml`.
- **Done:** play-mode tests on close, lock and the content slot; the Gallery opens one.

### UI2-8 The tests on both rows

- **Outcome:** the edit-mode logic tests and the play-mode element tests run green on 6000.4.8f1 in UIDev and on 6000.3.10f1 in a throwaway project that installs the package from the working tree.
- **Done:** both runs with counts in the report.

### UI2-9 The Gallery sample

- **Outcome:** `Samples~/Gallery` is one scene with a manager and views built from the public API only: pages for styled text and templates, the log, the entry, the window frame, the surviving kit, and the theme (switch, variants, the token read fixture); a HUD with regions and the layout edit mode; the escape menu as a `PanelView` with no class.
- **Rules:** the sample references no Unity package; keys arrive as UI Toolkit events.
- **Done:** the Gallery compiles and opens in UIDev; the developer judges it.

### The written result of the step 5 spikes (UI1-1 and UI2-1, 2026-10-25)

Run on this machine: the package's play-mode element tests through the UI Test Framework (`com.unity.ui.test-framework` 1.0.0) in UIDev on 6000.4.8f1 and in a throwaway project on 6000.3.10f1, the Localization read in a throwaway 6000.4 project with `com.unity.localization` 1.5.13, and the editor-panel question in UIDev's resident batch editor. Nothing in a game changed.

| Question | Result | Evidence |
|---|---|---|
| How a `TabView` tab is made closeable, and what fires | pass, both rows | `Tab.closeable = true` adds a close button (`unity-tab__close-button`) to the header; a click raises `Tab.closed`, then `TabView.tabClosed(tab, index)`, and removes the tab; `Tab.closing` is a `Func<bool>` whose `false` keeps the tab; `TabView.reorderable` adds the reorderable class; the kit ships no tab element and `Tabs.uss` styles Unity's |
| `PanelSettings.themeStyleSheet` swapped at runtime restyles live elements | pass | `ThemeSwitcher.TryApply` on two probe theme assets; the panel's root reads the new token after one update |
| A token under `.sb-theme` resolves through `CustomStyleProperty` | pass, with a rule | It resolves on the element that carries the class; a descendant reads it through `var()` in USS but not through `customStyle.TryGetValue`. So role tokens are declared under `.sb-theme .sb-styled-label` and anything that reads a token in code puts the class on itself; the Gallery's token readout does |
| A theme variant stacked as a second sheet wins over the theme's token | pass | `SetVariantActive` adds the sheet to every registered root and the token read changes; disabling restores it |
| A `:root` token reaches an editor panel; a class on the root does | unchecked | The edit-mode test needs an `EditorWindow` with a panel and skips itself in a batch editor; it logs the answer when run in an open editor. The default stands: tokens hang on the class |
| The role colour read on the label | pass | A probe sheet declaring `--sbui-role-positive-color` renders `<color=#0AC81E...>` into the label's rich text |
| Unity Localization hands back the pattern with placeholders intact | pass | `StringTableEntry.Value` returns `{value} % mehr {stat}` unchanged, smart or not, so a game implements `ITextTemplateResolver` over `StringTable.GetEntry(id).Value` |
| 10,000 lines in `TextLog` | measured | 10,000 lines of two roles appended then flushed in one call: dynamic height 7 ms for the flush and 14 ms for the two panel updates after it; fixed height (22 px rows) 1 ms and 2 ms on 6000.4.8f1; 8 and 19 ms, 2 and 3 ms on 6000.3.10f1. Measured through the UI Test Framework panel at 800 by 600 on this machine; the list is virtualised, so the updates lay out the visible rows only. Dynamic height stays the default; fixed height is the mode for a log that must stay cheap |

Settings taken: the role tokens are three custom properties per role (`-color`, `-bold`, `-italic`) under `.sb-theme .sb-styled-label`; a missing template pattern renders the id and its arguments; the new-lines pill text is a format property with the default `{0} new`; `TextLog` defaults to dynamic height with 22 px fixed rows when switched; `WindowFrame` hides on close by default and its lock button is text (`Lock`, `Unlock` properties); the validators are menu entries until CL1 and CL4 land. Not measured: the flush cost through an observation context (Core has none until R1a).

## The stories of step 11: one convention, one board (WF1a, WF1b, WF2b)

Step 11 gives the team one convention and one board: the forms and the convention text in the organisation's `.github` repository, the board's fields and README, the scripts every repository carries, the art pull request workflow, the GitHub App, the repository settings and the game template. Sixteen stories: WF1a two, WF1b ten, WF2b four. The split is the planner's; the outcomes are the epics'. Everything here is YAML, bash and Markdown; no package, no Unity project and no game changes. Facts are marked **verified** with the date or **verify before building on it**.

Applies to every story of the step:

- **Rules:** the rules of steps 1 and 2 hold where they apply (spelled-out names, no comments in code, work only in the named directories, a gap is raised and stops the story). Bash with POSIX tools and `gh` only; no new dependency; a GitHub API body is built where its line is typed and no data file of another format is stored.
- **Rules:** every form, template, script and AGENTS.md points at the line text through `line-text-address.txt` or its one address and copies nothing of it.
- **Rules:** the lead never touches git and never writes to GitHub. Branches, commits, pushes, pull requests, board writes, issue types and repository settings are the developer's acts, each through one script the lead prepares and runs in read mode first.
- **Rules:** a GitHub fact the area marked unverified is checked live before anything is built on it, and the answer is written into this section.
- **Rules:** nothing changes how a pull request into Core or UI is checked or merged until steps 4 and 5 have merged. The stories that protect a default branch or add the pull request Action are prepared in this step and their pull request opens last.
- **Regression contract:** the Template's existing scripts behave as before (a bad title is refused and a good one passes, the initialiser is untouched, `adopt-repository.sh` is untouched); every board item keeps its field values, no issue is closed or re-typed, the four views keep working; Core's existing ruleset stays until the settings story runs.
- **Done, for each story:** the files exist, each script ran on this machine in read mode or against a copy with the result recorded here, and the report lists what the developer runs.

### WF1a-1 The board's fields and README

- **Outcome:** the board's Area holds the line's packages beside the plan's areas; Gates and Tokens are number fields and Gates is filled from each epic's body; a Decision issue type exists beside Epic, Story, Task and Bug; the board README is rewritten for the forms, the fields, the title rule, Decision issues and the pull request that closes a story.
- **Verified (2026-10-25):** the board holds 169 items and 28 Area options (the plan's areas and today's package names), the fields Step and Class exist, the organisation has four issue types, and 100 epics carry a plan area (Core 18, World 15, Runtime 13, UI 11, Networking 9, Unity 9, Command line 8, Navigation 4).
- **Rules:** a rename reuses the option id (Chat to Switchboard, Controller to Character, VolumetricFog to Volumetrics); WorldObjects, StateMachine, Diagnostics, Horizon, Places, Instancing, TetherShop, ArtPipeline and PackageCheck are added; the plan's areas stay because the epics carry them, and nothing is removed. Gates holds the plan's gate count; Tokens holds the millions of tokens a step's sessions used, written at the step's report. The Discord bot's briefing names the board's fields and lives outside this step's directories, so the lines it needs are listed in the report and not edited.
- **Regression contract:** every item keeps its Area, Status, Priority, Sprint, Class and Step; the four views are unchanged.
- **Done:** the batch script; after it runs the fields, the options, the type and the README read back as written.

### WF1a-2 The work forms and the pull request template

- **Outcome:** `.github/ISSUE_TEMPLATE/` in the organisation's `.github` repository holds the Epic, Story, Task and Bug forms and `config.yml`, and `.github/PULL_REQUEST_TEMPLATE.md` exists. Each form sets its issue type and adds the issue to the board; the Story form requires Outcome and Done when and offers Verified facts, Rules, Regression contract and Waits on, so a story can wait on a written Decision issue; anyone on the team opens one.
- **Verified (2026-10-25):** GitHub reads an organisation's default forms from `.github/ISSUE_TEMPLATE` of its public `.github` repository; the `type` and `projects` keys are supported and the projects key needs write permission on the project; no repository of the organisation has forms of its own.
- **Rules:** titles follow the board README and carry no prefix; the Bug form is the one a buyer sees and asks only what a bug needs; blank issues are off and the chooser links the line text and Discord.
- **Regression contract:** none.
- **Done:** the files, each read back against GitHub's form syntax.

### WF1b-1 CONTRIBUTING.md and SUPPORT.md

- **Outcome:** `CONTRIBUTING.md` says how the repositories, the issues, the titles, the branches, the pull requests, the GitHub App, the repository settings and the board work day to day and points at the line text for every rule; `SUPPORT.md` says where a buyer asks, what to include and what to expect.
- **Rules:** no copy of the line's rules; the first-response time of two working days is a setting with a default.
- **Regression contract:** none.
- **Done:** the files; the pointer check passes on the repository.

### WF1b-2 The Decision, Move, Boundary sheet and Engineer onboarding forms

- **Outcome:** four more forms: Decision (Question, Recommendation, Alternative, What waits on it, Answer; type Decision), Move (From, To, Ledger rows that change, Projects to move, Steps, Done when; type Story), Boundary sheet (the headings of `Documentation~/boundary-sheet.md`; type Task) and Engineer onboarding (repository, editor version and the steps as checkboxes; type Task).
- **Verified (2026-10-25):** no Decision issue type exists; the Roadmap names Decision issues for the Navigation spike, the freeze rule and the Story form's blocked-by line.
- **Rules:** a Decision is closed by writing the answer into the issue; the Move form's steps are the shell the Unity ledger epic fills at step 13.
- **Regression contract:** none.
- **Done:** the files.

### WF1b-3 render-issue-body.sh

- **Outcome:** `bash scripts/render-issue-body.sh <kind> --<field> "<text>"...` prints a body with the headings the form of that kind produces, for epic, story, task, bug and decision, so an issue an agent opens with `gh issue create --type` reads like one opened through the form.
- **Rules:** an unknown kind or field is refused with the usage; bash only.
- **Regression contract:** none.
- **Gap raised:** the roadmap skill's issue bodies live in the `claude-skills` repository, outside this step's directories; aligning them to the form labels is raised and not done.
- **Done:** run for a story with three fields and for a bad field.

### WF1b-4 sprint-report.sh

- **Outcome:** `bash scripts/sprint-report.sh [--sprint "Sprint N"]` prints the sprint running today, or the named one: its dates and day, the items by Status with assignee, priority, gates and what blocks them, gates done of planned, tokens recorded, and what each person has in progress.
- **Verified (2026-10-25):** run against the live board for Sprint 1: 28 items Done and 18 Ready, before the Gates field existed.
- **Rules:** reads through `gh api graphql --paginate` and writes nothing.
- **Regression contract:** none.
- **Done:** the run above.

### WF1b-5 The art pull request workflow

- **Outcome:** `.github/workflows/art-pull-request.yml` in the organisation's `.github` repository is a reusable workflow: called from a game repository on a push to `art/**`, it takes a token as the App, reads the first commit beyond the default branch, checks its subject against the title rule, opens the pull request with that subject as the title and the commit's body as the body, and on any failure files a Bug issue in `Roadmap` naming the branch and the repository.
- **Verified (2026-10-25):** events caused by the repository token start no workflow run and a pull request it opens waits for a person's approval, while an App installation token avoids both (GitHub's page on triggering a workflow); `actions/create-github-app-token` is at v3 and takes a client id and a private key.
- **Rules:** the caller is ten lines in the game repository with `secrets: inherit`; the workflow names no game; it is the pull request Action, so its pull request opens last.
- **Regression contract:** no repository calls it until GameTemplate holds the caller, so nothing changes when it merges.
- **Done:** the file; its first run is the App's confirmation in WF1b-6.

### WF1b-6 The GitHub App

- **Outcome:** the App the organisation owns is described in `CONTRIBUTING.md` (name, permissions, installation, the two secrets) and the developer creates it; the first run confirms that a pull request the App opens runs its checks without the approval prompt.
- **Verified (2026-10-25):** the organisation has one App installed (gitbook) and ten organisation secrets; on GitHub Free an organisation secret does not reach a private repository (GitHub's page on secrets), so until the plan changes the two secrets are repository secrets in each repository whose workflows need them.
- **Rules:** the key is generated on the App's page and stored once as a secret; no key is written in any repository.
- **Regression contract:** none.
- **Done:** the App exists and the confirmation run is recorded here.

### WF1b-7 repository-settings.sh

- **Outcome:** `bash scripts/repository-settings.sh <owner/repository> [--game] [--app-id <id>] [--template-repository] [--check]` prints the lines that set a repository as every repository is set, or with `--check` reads the settings back and reports drift; it reads the plan's answer first and says when rulesets are not available.
- **Verified (2026-10-25):** run in check mode against Core, Inventory and Template: the drift of each is listed, and Inventory and Template report the plan limit.
- **Rules:** it prints and never applies; the ruleset bodies are built where the line is typed.
- **Regression contract:** none.
- **Done:** the runs above.

### WF1b-8 Protected default branches

- **Outcome:** it is known which repositories can be protected on the organisation's plan, and every repository that can is set: squash merge with the title alone, merged head branches deleted, the default branch changed only through a pull request with the `unity-tests` status and code owner review on the judgment fields, the App on the bypass list. Core's ruleset "Merge Power" is replaced by the standard one.
- **Verified (2026-10-25):** the organisation is on GitHub Free; branch protection and rulesets are refused on private repositories ("Upgrade to GitHub Pro or make this repository public to enable this feature", HTTP 403 on Inventory) and allowed on public ones (Core answers "Branch not protected" and holds one ruleset); Core allows merge commits only and every other repository allows all three merge kinds.
- **Rules:** the lines run after steps 4 and 5 have merged, because they change how a pull request into Core merges; where the plan refuses, the rule is a team agreement and the check reports it as unenforced; whether the organisation moves to GitHub Team is the developer's decision.
- **Regression contract:** nothing in step 4's or step 5's pull requests is blocked before they merge.
- **Done:** the plan check's written result below, and the settings applied with the check green on every repository that can be set.

### WF1b-9 The artist ruleset

- **Outcome:** `repository-settings.sh --game` prints the ruleset that confines artists to `art/*`: every branch but `art/*` is created or updated only by the maintain and admin roles, organisation admins and the App.
- **Verified (2026-10-25):** both game repositories hold two admins and one collaborator with the write role; a private repository cannot hold a ruleset on the plan.
- **Rules:** printed now and switched on by WF1r (step 15) the day A5a lands in a game repository; the role ids 2 (maintain) and 5 (admin) are **verify before building on it**, checked when the ruleset is first created.
- **Regression contract:** none.
- **Done:** the printed lines.

### WF1b-10 The pointers to the line text

- **Outcome:** every form, template, AGENTS.md and adoption body points at the line text and none copies it; `bash scripts/check-line-text-pointer.sh [root]` fails a missing pointer or a copy, both for a repository made from a template and for the organisation's `.github` repository itself.
- **Rules:** the Bug form and `config.yml` carry no pointer, because the Bug form is the one a buyer sees; the `.github` repository is the home of the line text and needs no address file.
- **Regression contract:** none.
- **Done:** run on Template and on the `.github` repository's files, both green.

### WF2b-1 sync-template.sh

- **Outcome:** `bash scripts/sync-template.sh [--template <owner/repository>] [--ref <branch>] [--check]` compares every file in the template's `managed-files.txt` with the repository's copy, a workflow caller with the ref after `@` ignored, and opens a pull request taking the template's copies where one drifted. A game repository passes GameTemplate.
- **Verified (2026-10-25):** run in check mode inside Template against its own `main`: the two files this step changes are the only drift, and a checkout with carriage returns compares equal to GitHub's copy.
- **Rules:** refuses a dirty working tree before it writes; line endings are compared without the carriage return.
- **Regression contract:** none.
- **Done:** the run above.

### WF2b-2 update-skeleton.sh

- **Outcome:** `bash scripts/update-skeleton.sh [--repository <owner/repository>] [--ref <branch>] [--path <folder>] [--check]` compares the commit `skeleton-version.txt` records with PackageCheck's branch tip and opens a pull request copying the changed skeleton files when it moved; `none` means PackageCheck does not exist yet and nothing is compared.
- **Rules:** the skeleton path's default, `Packages/PackageCheck/Skeleton~`, is a setting LV2 names when PackageCheck exists.
- **Regression contract:** none.
- **Done:** run with `none` recorded.

### WF2b-3 GameTemplate

- **Outcome:** the `GameTemplate` repository: a Unity project whose manifest holds no Spellbound line, the hooks, the scripts, the LFS baseline scoped to `Assets/_Project`, `.editorconfig`, `CODEOWNERS`, the root `AGENTS.md`, `line-text-address.txt`, `managed-files.txt`, the artist's root `setup.sh` (a check, not an installer: git, Git LFS, the large files pulled, the editor version), the pull request caller and the ten-line art pull request caller; and the Artist onboarding form in the organisation's `.github` repository.
- **Verified (2026-10-25):** no GameTemplate folder or repository exists; the Template holds every file the game template copies.
- **Rules:** the tree is prepared outside every repository and the developer publishes it with one script; the project opens with no error through the Unity command line on a copy.
- **Regression contract:** none.
- **Done:** the tree, the Unity open recorded here, the publish script.

### WF2b-4 The template is a template

- **Outcome:** Template and GameTemplate are marked as template repositories, so `gh repo create --template` starts a package or a game; the start-a-package walk is in Template's `AGENTS.md` and the start-a-game walk in GameTemplate's; the engineer's `setup.sh` is tried on a clean Windows machine and a Mac.
- **Rules:** the walk on clean machines is the developer's act and the step's stop item.
- **Regression contract:** none.
- **Done:** the two `gh repo edit --template` lines run and the walks written; the clean-machine result is recorded here when it comes.

### The written result of the plan check (WF1b-8, 2026-10-25)

Read live with `gh api` on 2026-10-25. The organisation `Spellbound-Studios` is on GitHub Free.

| Question | Result | Evidence |
|---|---|---|
| Branch protection on a private repository | refused | `repos/Spellbound-Studios/Inventory/branches/main/protection` answers HTTP 403, "Upgrade to GitHub Pro or make this repository public to enable this feature" |
| Rulesets on a private repository | refused | `repos/Spellbound-Studios/Inventory/rulesets` answers the same 403 |
| Rulesets on a public repository | allowed | Core holds the ruleset "Merge Power" (pull request with one approval, thread resolution, code quality, no deletion, no force push; organisation admins bypass) |
| An organisation secret in a private repository | not available on this plan | GitHub's page on secrets: "Organization-level secrets and variables are not accessible by private repositories for GitHub Free" |
| GitHub Team | required pull request reviewers, protected branches and code owners in private repositories; billed per user | GitHub's plans and pricing pages, 2026-10-25 |

Repositories that can be protected today: `.github`, Core, Modifiers, GeoForge, Controller, SpellboundDocs, NetworkedTerraformingExample (public). Repositories that cannot: Inventory, Decals, UI, Chat, Persistence, WorldForge, VolumetricFog, GeoForgePro, Template, GameTemplate, Roadmap, SaboteurDev, CorsairsIsleDev, BuildPipeline, claude-skills (private). Until the plan changes, the default branch of a private repository is a team agreement and `repository-settings.sh --check` reports it as unenforced.

### The written result of the settings (WF1b-8 and WF1b-9, 2026-10-25)

Applied on 2026-10-25 with `repository-settings.sh --apply` over the twenty active repositories of the organisation, after steps 4 and 5 had merged, and read back green with `--check` on every one. The organisation stays on GitHub Free by the developer's decision of the same day; private repositories are a team agreement until that changes.

| Setting | Where | Result |
|---|---|---|
| Squash merge only, the pull request title alone as the commit, a blank message, merged head branches deleted | all twenty repositories | applied |
| The ruleset "Default branch": changes only through a pull request, code owner review on the `CODEOWNERS` paths, no deletion, no force push, squash only, organisation owners bypass | `.github`, Core, Modifiers, GeoForge, Controller, SpellboundDocs (public) | applied; Core's ruleset "Merge Power" (one approval, thread resolution, code quality) removed and replaced |
| The same ruleset | Template, GameTemplate, Chat, UI, Decals, Inventory, VolumetricFog, WorldForge, claude-skills, SaboteurDev, CorsairsIsleDev, GeoForgePro, Persistence, BuildPipeline (private) | refused by the plan; reported as unenforced |
| The required `unity-tests` status | nowhere yet | opt-in through `--require-unity-tests`, switched on when the local gate that posts the status lands (WF3a, step 33); requiring it earlier would block every pull request from anyone who is not an organisation owner |
| The artist ruleset "Artists push art branches only" | the two game repositories | printed, not applied: the plan refuses rulesets there and WF1r switches it on when A5a lands |
| The App on the bypass lists | nowhere yet | the App is deferred to step 15 (A5a) by the developer's decision of 2026-10-25, pending the artist's preference between an Action running as the App, a personal token, or `gh` on the artist's machine; one re-run with `--app-id` adds it |
| Template and GameTemplate marked as template repositories | both | applied |

Core's pull requests now merge with `--squash` like every other repository's; only its default branch `main` carries the rule, `dev` does not.

## The stories of step 9: the agent route (CL2, CL5)

Step 9 opens the road an agent takes to the line: one Unity CLI command that runs any operation line, Volumetrics' three commands as the first package on the registry, and the context a package ships so an agent learns its front door, rules and operations from a file and not from its source. Thirteen stories: CL2 six, CL5 seven. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Nothing in a game changes in this step; both games already follow Core's `dev` branch, and VolumetricFog's change lands on a `beta` branch the games do not follow until step 36 or a manifest edit the developer makes.

Applies to every story of the step:

- **Rules:** the rules of steps 1, 2 and 4 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows without the developer's hand). No JSON is written or parsed by any new code: the bridge's version ranges are read from its own assembly definition by a text match, and the agent context is Markdown.
- **Rules:** Core's runtime assemblies reference the engine modules only; the bridge assembly references `Spellbound.Core` and `Unity.Pipeline.Attributes` alone and compiles only when `com.unity.pipeline` is installed inside a range the bridge names (line rule 2 and 5). Core.Editor may reference `UnityEditor.PackageManager`. No new dependency anywhere else.
- **Rules:** the one command the line adds to the Unity CLI is `spellbound_run` (rule 27); every other spelling an agent types is an operation line `<group> <operation> [arguments]` with the status word first in the answer. The Pipeline spelling appears in the bridge's declaration files and nowhere else; the stub an agent installs finds the command by search.
- **Rules:** the shipped context file is `AGENTS.md` at the package root with six headings in this order: Purpose, Front door, Rules, Not for, Gaps, Ledger. Generated text inside it sits between two delimiter lines that carry a name and a hash, written by `core context` from the live catalog, so prose and generated text never mix. A backticked identifier in the prose names a type, member or operation line that exists; Living's check (LV4a) enforces it later and this step writes the files so that it would pass.
- **Verified (2026-10-25):** Core's `dev` holds CL1 (pull request 103): `Spellbound.Core.Operations` with `OperationHost`, `OperationCatalog`, `OperationRun` (a `CustomYieldInstruction` with `AsTask()`), `OperationResult` (status word first), `OperationCaller`, `OperationSettings` with `bridgeAudiences` defaulting to `developer`, and the group `core` with `help`, `about`, `history`, `stats`; Core's package is `Packages/Core` with `Spellbound.Core`, `Spellbound.Core.WorldObjects`, `Spellbound.Core.Console`, `Spellbound.Core.Editor` and four test assemblies; CoreDev installs `com.unity.pipeline` 0.8.0-exp.1, whose `[CliCommand]` and `[CliArg]` live in `Unity.Pipeline.Attributes` with no define constraint; the Unity registry holds Pipeline 0.8.0-exp.1, 0.9.0-exp.1 and 0.9.1-exp.1 (latest), and 0.9 declares a command as `[CliCommand(group, name, description)]` run as `unity command <group> <name>` while the two-argument form still exists; the CLI is 1.0.0-beta.14 and reads exit 2 as bad arguments and exit 6 as a command failure; editors 6000.4.8f1 and 6000.3.10f1 are installed.
- **Verified (2026-10-25):** VolumetricFog's repository is the folder `VolumetricFogDev/Assets/VolumetricFog` on `main` (the only branch besides `l1-core-assemblies`), both games install it from `main` with no ref, its package is `com.spellboundstudios.volumetricfog` 0.1.3 with the assemblies `Spellbound.Volumetrics`, `Spellbound.VolumetricFog`, `Spellbound.VolumetricClouds`, an editor and a test assembly; its three console commands are `[ConsoleUtilityCommand]` methods in `VolumetricConsoleCommands` (`volumetrics.stats`, `volumetrics.timing`, `volumetrics.debugview`) printing through `ConsoleLogger`, the only use of `Spellbound.Core.Console` in the package; its `AGENTS.md` is 393 lines under its own headings; it has no `CHANGELOG.md`.
- **Verify before building on it:** which exit code the CLI gives a command whose handler throws `ArgumentException` against one that throws `InvalidOperationException`; how the CLI answers a call made during the play mode domain reload; whether Unity's `versionDefines` expression accepts a prerelease bound such as `[0.8.0-exp.1,0.9.0-exp.1)`; whether a `[CliCommand]` method in a package assembly survives managed code stripping in a development player without `[Preserve]`.
- **Regression contract:** Core's 252 edit mode tests and 3 play mode tests pass unchanged; `core help`, `core about`, `core history` and `core stats` answer as the step 4 report shows, with `core about` gaining lines and losing none; the old console under `Runtime/Console` is untouched; every type that was public stays public under the same name and namespace; a project without `com.unity.pipeline` compiles Core with no bridge assembly and no console line; VolumetricFog's fog, cloud and shadow stages, its registry, facade and diagnostics hub behave as before, and its other tests pass; neither game's code, scene or prefab changes.
- **Done, for each story:** compiles clean in its dev project through the Unity CLI, its tests pass, and the report lists what was built and what was raised.

### CL2-1 The bridge assembly and `spellbound_run`

- **Outcome:** `Spellbound.Core.Pipeline` is a runtime assembly of Core at `Runtime/Pipeline`, referencing `Spellbound.Core` and `Unity.Pipeline.Attributes` only, compiled only when `com.unity.pipeline` is installed inside one of the ranges its assembly definition names, one define per range. `SpellboundRunCommand.Run(line)` runs the line through `CoreKit.Operations` with the bridge's caller, awaits the run and returns the result text; `invalid` throws `ArgumentException`, `failed` and `refused` throw `InvalidOperationException`, so Pipeline reports each through its own failure channel. One declaration file per range: `[CliCommand("spellbound_run", description, Tags = { "spellbound" })]` for 0.8 and `[CliCommand("spellbound", "run", description, Tags = { "spellbound" })]` for 0.9, each taking one required argument `line`.
- **Rules:** the description tells an agent to start with `core help`; the method is marked to survive stripping because Pipeline finds it by reflection in a player; the body is one file the declarations call, so the Pipeline spelling never reaches it.
- **Regression contract:** a project without Pipeline compiles Core with no bridge; Pipeline's own commands are untouched.
- **Done:** `unity command --query spellbound` lists the command against the CoreDev editor and `unity command spellbound_run --line "core help"` prints the same text as `core help` in C#; the bridge's own tests pass.

### CL2-2 The caller policy and the console line when the bridge is off

- **Outcome:** `PipelineCaller.Current` builds the caller from `OperationSettings.bridgeAudiences` (`developer` unless the studio changed the field, which is the one setting that grants `approver` to an agent). Core.Editor reads the installed `com.unity.pipeline` version at editor load and, when Pipeline is installed but the bridge type is absent from the loaded assemblies, writes one console line through Core's logger naming the installed version and the supported ranges, once per editor session. The ranges are read from the bridge's assembly definition by a text match, so they are written once. `PackageVersionRange` compares a version against one range, prerelease identifiers included.
- **Regression contract:** no console line in a project without Pipeline, and none when the bridge compiles.
- **Done:** tests for the caller, the range comparison and the message; the line is read in the Console of an editor whose Pipeline is outside every range (proved in CL2-4 with the fixture).

### CL2-3 The fixture project driven by the Unity CLI

- **Outcome:** `scripts/bridge-fixture.sh` in Core's repository makes a throwaway project outside every repository that installs Core from this working tree by local path and Pipeline at a version it is given, starts a headless editor on an editor version it is given, waits for the Pipeline server, and asserts through `unity command`: the command is found by search, `core help` exits 0 with `succeeded:` first, a line that does not bind exits with the bad-arguments code and `invalid:` in the error, a valid call that finds a fault exits with the failure code and `failed:`, a refused call exits with the failure code and `refused:`, and a result spanning frames (an operation that returns a `Task`) completes. It records each exit code it observed. It then enters play mode with `editor_play`, calls `spellbound_run` during the reload and records what the CLI answered, which is the fact Limits left open.
- **Rules:** bash, run by a person or by `run-local-tests.sh` once WF3a exists; it never touches git and removes its project at the end unless told to keep it.
- **Done:** the script passes against Pipeline 0.8.0-exp.1 on 6000.4.8f1 and its written result (the exit codes, the reload answer) is in the Roadmap under this step.

### CL2-4 Each Pipeline range and the 6000.3 floor row

- **Outcome:** the fixture runs against every range the bridge names (0.8.0-exp.1 and 0.9.1-exp.1) on 6000.4.8f1, and against 0.8.0-exp.1 on 6000.3.10f1, and passes; a run against a Pipeline outside every range (0.7.0-exp.1) shows the bridge compiled out and the Core.Editor console line in `unity command console`.
- **Verify before building on it:** the 0.9 declaration compiles against 0.9.1-exp.1 as the fetched page describes it.
- **Done:** four written results in the Roadmap, one per run, each naming the editor, the Pipeline version, the command spelling found and the exit codes.

### CL2-5 The development build with the runtime flag

- **Outcome:** the fixture builds a Windows development player of its project with Pipeline's `enableInBuilds` on, starts it, and `unity command --runtime <exe> spellbound_run --line "core about"` answers from the player with `player` in the text; the stripping question for the command method is answered by the same run.
- **Rules:** the player is built in the throwaway project only; `enableInBuilds` is never switched on in a repository's project settings.
- **Done:** a written result with the player's answer and its stripping level.

### CL2-6 Volumetrics' three commands converted

- **Outcome:** `Spellbound.Volumetrics` carries `[assembly: OperationGroup("volumetrics", <the line's sentence>)]` and `VolumetricOperations` declares `stats` (reads), `timing --enabled` (writes) and `debug-view [--view]` (writes; omitted, the override clears and the renderer feature's setting is used again), each returning its text; `VolumetricConsoleCommands` and the `Spellbound.Core.Console` reference leave the package; the tests run the lines through the host and assert the hub's state; `README.md` names the operation lines in place of the console spellings.
- **Rules:** the group is `volumetrics`, the package's decided name (line: VolumetricFog became Volumetrics; the id and folder change in L12, step 36); the sentence is the line's; no `Print` helper remains, the answer reaches whichever face asked.
- **Regression contract:** the hub's `TimingOverride` and `DebugViewOverride` behave as before; the fog, cloud and shadow stages and the Demo sample are untouched.
- **Done:** compiles in VolumetricFogDev against Core's working tree; `unity command spellbound_run --line "volumetrics stats"` answers against the VolumetricFogDev editor; the package's tests pass.

### CL5-1 The six headings and Core's own context file

- **Outcome:** the context file contract: `AGENTS.md` at the package root with Purpose, Front door, Rules, Not for, Gaps and Ledger, in that order; Ledger holds `Builds on` rows naming the Unity types the package rests on and `Moved` rows naming what left the package and where it went. Core ships one: its Purpose is the line's sentence, its Front door is `CoreKit` with the generated operations block, Rules point at the line text and say what an agent must not do, Not for names what Core never owns, Gaps names what is not built yet, Ledger carries Core's rows. `GeneratedBlock` in Core's runtime renders, finds, replaces and hashes a delimited block by name, so `core context`, `core context-install`, Living's writer and the release check share one form.
- **Done:** `core context --package core` prints the file with its block current; tests for the block helper.

### CL5-2 The generated operation blocks

- **Outcome:** `AgentContextBlocks.Operations(group, packageLine)` renders a group's operation table from the live catalog: the package id and version, then one entry per operation with its usage line, effect, audience, availability and each argument's description and default, in the catalog's order, so the text is the same on every machine; the block carries the FNV hash of its body in its opening delimiter and a stale hash is one comparison.
- **Done:** tests render the fixture group and assert the hash changes when an operation changes and not when the file's line endings do.

### CL5-3 `core context`

- **Outcome:** `core context` (Core.Editor, in the `core` group) lists every installed Spellbound package: id, version, its operation group and count, the front door its file names, and the path of its context file; `core context --package <group or id>` prints that file's path as the first line, then the file with its generated blocks refreshed from the live catalog, and when the package ships no file it says so and prints the generated blocks alone. The package of a group is found from its assemblies through the package manager, and the file through the package's resolved path, which serves an installed package and an embedded one alike; a package still kept under `Assets/<Name>` in its dev project, which the package manager does not know, is found through its assembly definition's folder and the nearest `package.json` above it, and the summary says so.
- **Verified (2026-10-25):** an embedded package at `Packages/<Short>` resolves under its id and its `resolvedPath` is the short folder (the step 2 probe); a package under `Assets/<Name>` has no `PackageInfo` at all (VolumetricFogDev, this step).
- **Done:** tests against Core's own file in CoreDev; the answer read once through `spellbound_run`.

### CL5-4 `core context-install` with its three targets

- **Outcome:** `core context-install --target <Skill, Agents or Claude>` writes the stub into the project on request: `Skill` writes `.claude/skills/spellbound/SKILL.md`; `Agents` and `Claude` write the same text as a delimited block into the project's own `AGENTS.md` or `CLAUDE.md`, creating the file when it is missing and replacing only the block on a rerun, so a person's notes are never touched. The stub holds no package fact and no Pipeline spelling: it tells the agent to find the command by search and gives the operation lines, which are the same under every Pipeline version. The target is an enumeration, never a path, so these three files are the only ones this operation can write.
- **Done:** tests run the writer against a temporary root twice and assert the notes around the block survive; the operation answers `succeeded: wrote <path>` or `updated <path>`.

### CL5-5 `core about` with the installed packages, and `core ledger`

- **Outcome:** `core about` gains, in the editor, one line per installed Spellbound package with its version, read through a seam Core.Editor fills at load (`InstalledPackages.Source`); a player has no package manager and keeps printing the groups and operation counts. `core ledger` prints every installed package's Ledger rows as a table of package and row, and says which packages ship no Ledger heading.
- **Done:** tests for the seam's default (none) and a swapped source; `core ledger` read once in CoreDev.

### CL5-6 VolumetricFog's file as the pilot

- **Outcome:** VolumetricFog's `AGENTS.md` is rewritten under the six headings with nothing of its guidance lost: Purpose is the line's sentence; Front door names the `Fog` facade and the setup menu command, holds the generated `volumetrics` operations block, and keeps the API guide, the frame model, the tool table and the words-to-numbers table beneath it; Rules keeps the hard rules, the budgets and the common mistakes; Not for names the techniques and decisions that belong to the game or to a particle system; Gaps names what the package cannot do today, the missing `VolumetricsKit` door among them; Ledger carries its `Builds on` rows. Every backticked identifier in it exists.
- **Done:** `core context --package volumetrics` prints it with a current block in VolumetricFogDev.

### CL5-7 Bridge doors listed by `core context`

- **Outcome:** a bridge assembly's second door is found by the convention and not by an attribute: an assembly named `Spellbound.<Package>.<Other>` holding a public static class `<Package><Other>Kit`. `BridgeDoors.Find()` lists them with the signatures of their public static members; `core context` names the doors present in the project per package, and `core context --package <group>` prints them in a second generated block, `doors`, after the operations block. The door check for a bridge assembly (rule A1's variant for bridges) is handed to Living, as the design says.
- **Done:** a fixture assembly `Spellbound.Fixture.Other` with `FixtureOtherKit` is found with its signature lines in the tests; no real bridge exists yet in any package, so the first real listing is GeoForge's at W4b.

### The written result of the agent route checks (CL2-3, CL2-4, CL2-5, 2026-10-25)

Run on this machine with `scripts/bridge-fixture.sh` in Core's repository: a throwaway project outside every repository that installs Core from the working tree by local path and `com.unity.pipeline` at the version given, a headless editor on the version given, and the Unity CLI 1.0.0-beta.14 driving it. Each row is one run; the seven checks are the command found by search, `core help`, a line that does not bind, a failed line, a refused line, a dry run, and a line that spans frames.

| Editor | Pipeline | Command found | Seven checks | Notes |
|---|---|---|---|---|
| 6000.4.8f1 | 0.8.0-exp.1 | `unity command spellbound_run --line "..."` | all pass | The row the development player was built from |
| 6000.4.8f1 | 0.9.1-exp.1 | `unity command spellbound run --line "..."` | all pass | The second declaration file, `[CliCommand("spellbound", "run", ...)]`; 0.9 also renames Pipeline's own commands (`editor_status` becomes `editor status`), which the fixture follows |
| 6000.3.10f1 (the floor) | 0.8.0-exp.1 | `unity command spellbound_run --line "..."` | all pass | Entities left out of the manifest; the editor's built-in Entities resolved Core's dependency |
| 6000.4.8f1 | 0.7.0-exp.1 (outside every range) | none, as expected | the bridge compiled out and the console line was written | The editor log reads `Assembly Spellbound.Core.Pipeline.dll ... not valid. Loading of assembly skipped.` and then `[PipelineBridgeCheck.Run:0] Spellbound agent road off: com.unity.pipeline 0.7.0-exp.1 is outside the supported [0.8.0-exp.1,0.9.0-exp.1) or [0.9.0-exp.1,0.10.0-exp.1); update Spellbound.Core or install a Pipeline inside [0.8.0-exp.1,0.9.0-exp.1) or [0.9.0-exp.1,0.10.0-exp.1).`; the CLI 1.0.0-beta.14 cannot talk to a 0.7 server at all (401), so the check reads the log |
| 6000.4.8f1 | none | none, as expected | Core compiled and its 297 edit mode tests passed in a one-shot `unity test` run (the bridge's 8 tests compiled out with it); no console line in any log | `--pipeline none` |

**Exit codes (CL2-3).** The CLI gives exit 6 to every failure the bridge reports, and the two kinds are told apart by the text, not the code: a line that does not bind comes back as `Pipeline server returned 400 Bad Request: Parameter Validation Failed. invalid: no operation 'core nope'.`, a valid call that finds a fault or is refused as `... Command Execution Failed. failed: ...` or `... refused: ...`. So the status word is the first word after Pipeline's own classification, as designed, and the plan's hope that exit 2 would mark a bad line is not how this CLI behaves (exit 2 is the CLI's own usage error). A missing `--line` is `Parameter Validation Failed. Required parameter 'line' is missing or empty`, exit 6. Under `--format json` the failure is in `errors[0].message` and the exit code stays 6. A success prints the result as one line in the human format with the result's line breaks collapsed; `--result-only` or `--format json` keeps them.

**A call during the play mode reload (the fact Limits left open).** In CoreDev, which reloads the domain on play (`m_EnterPlayModeOptionsEnabled: 1` with options 0), `unity command editor_play` returned `Entered play mode` after 0.75 s and a `spellbound_run --line "core about"` sent at once answered `succeeded: Unity 6000.4.8f1, editor, playing ...` with exit 0, as did five more over the next twelve seconds. The CLI blocks until the editor is back, so a caller that chains `editor_play` and an operation line sees no gap and needs no retry; the default of the plan ("the caller retries until the status operation answers") stays as the rule for a call that races a reload from another process, and nothing in Core changes for it.

**The development player (CL2-5).** The fixture built a Windows development player of its project (`BuildOptions.Development`, the Build Settings development toggle set, Pipeline's `enableInBuilds` switched on through `set_runtime_pipeline_settings`) and started it with `-batchmode -nographics`. The player log reads `Pipeline: Runtime server started successfully on port 7900`, and `unity command --runtime BridgeFixture.exe spellbound_run --line "core about"` answered `succeeded: Unity 6000.4.8f1, player, playing`, `render pipeline: built-in`, `core: 4 operations in Spellbound.Core` with exit 0: the four runtime operations of `core`, no editor operation and no test fixture, which is the honest answer to what a build can do. Two facts from the road there: Pipeline's build processor bakes its settings only when the Build Settings development toggle is on or Pipeline's own `build` command runs, so a scripted `BuildPlayer` with the Development option alone ships the Pipeline assemblies and no settings, and the server never starts; and the throwaway project builds at managed stripping `Disabled` (the project default), so the stripping question for the command method stays answered by the `[Preserve]` it carries rather than by this run.

**What the fixture did not run.** IL2CPP (no module and no C++ toolchain on this machine, the same gap step 4 raised), the 6.7 beta and Unity 7 alpha rows (UN9 installs them), and a Pipeline newer than 0.9.1-exp.1, which does not exist yet.

## The stories of step 6: the console, Saboteer's commands, input contexts, the first slice of Persistence, the layout section (UI3, CL3a, L8a, UI6a, UI6b)

Step 6 puts one console over Core's operation list and takes Saboteer onto it before the freeze, converts Saboteer's ten command classes, gives UI its input-context seam and its modal host, builds the first slice of Persistence under the studio id beside the old package, and saves the HUD layout as a section. Fourteen stories: UI3 six, CL3a two, L8a two, UI6a two, UI6b two. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Three repositories change, each on a branch of its own: UI (`beta`), Persistence (a new `beta` beside `main`, which keeps the old package untouched) and Saboteer (a branch off `main` that the developer plays; its manifest points at the three branches and at Core's `dev`).

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 5 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows). Every value a game might tune is a property with a default, a serialized field or a constructor argument.
- **Rules:** UI references Core and the engine modules only; it never references Persistence, the Input System or any data package. Persistence references Core only. Saboteer edits no package; what it needs and a package lacks is raised.
- **Rules:** the console owns no registry, no parser and no static output event: a line goes to `OperationHost.Run`, the result comes back as an `OperationResult`, reports arrive through `OperationRun.Reported`, log lines through `Log.AddScopedSink` while the view is open. The operation grammar of the line text is the only grammar.
- **Rules:** Saboteer's branch compiles against UI `beta`, Chat `beta`, Persistence `beta` and Core `dev`, so the consumer updates step 8 listed for Saboteer (namespaces, UXML namespaces, theme imports, the removed shapes) land on this branch; step 8's LS story becomes the manifest lines alone. Corsairs is untouched.
- **Verified (2026-10-25):** Core `dev` at e0ca89f holds the operation host, catalog, result, caller, context, `OperationRun.Reported`, `OperationTable`, `Log.AddScopedSink`, `SectionAttribute(name)`, `CoreKit.Packing.Describe`, `StableHash.Fnv1A32`, `AssemblyScanning.ScannableAssemblies`; positional arguments bind (`fixture echo one`). UI `beta` at a53b2fc holds Widgets, Screens, Editor, the four text parts and the Gallery; `ViewPolicy` is a three-argument struct; `LayoutStore` packs a format byte 2. Persistence `main` at c5b12eb is the old package at the repository root (`Assets/Persistence` in PersistenceDev), ten files, no tests, installed by Saboteer with no ref. Saboteer `main` at 5fc4bd2 has ten command classes under `ConsoleCommands`, a Console object in `Gym.unity` and `NetworkedScene.unity` carrying Chat's `ConsoleWindowController` and `ConsoleView`, hand-wired input switches in `GameViewManager` (console) and `ChatHud` (chat), and `UiLayoutService` with `UiLayoutData` over the old `SaveSystem`; 38 C# files and 16 UXML files use the old UI namespaces, one `.tss` imports the old style paths; its working tree carries the developer's uncommitted manifest change (Core, Decals and Inventory at `?path=`), which is the baseline and is not touched.
- **Verify before building on it:** Saboteer's `packages-lock.json` pins Core at f5fdc49, a commit GitHub does not know; the branch's lock entry for Core is removed so the editor resolves `dev` afresh.
- **Regression contract:** UI's edit-mode and play-mode tests pass; the view stack, cursor arbiter, escape chain, layout edit mode, the four text parts and the Gallery behave as before; the Gallery opens on the default theme. The old Persistence package is byte-for-byte untouched on `main` and in the working tree, and Saboteer's settings, chat settings and progress keep loading through it. In Saboteer: the player map, console map and chat map switch as before (typing in the console or the chat never drives the player; closing either returns the player map); Escape closes the console; the HUD layout edit mode still moves and resizes regions and Done keeps the layout; every view, scene and prefab that used a moved UI type still resolves (GUIDs kept); the old `uilayout_global_uilayout.bin` is never read or deleted.
- **Done, for each story:** compiles clean in its dev project through the Unity CLI, its tests pass, and the report lists what was built and what was raised.

### UI3-1 OperationLines and the console log sink

- **Outcome:** `OperationLines` in Widgets turns an `OperationResult` into styled lines (the status word in the role its severity picks, the prose plain, a `Run:` hint muted) and a log entry into one line (level as role, source muted); `ConsoleLogSink` is an `ILogSink` that appends to a `TextLog`.
- **Done:** edit-mode tests on the status word, the hint line and each severity's role.

### UI3-2 OperationCompleter

- **Outcome:** `OperationCompleter` implements `ITextCompleter` over an `OperationCatalog` for one `OperationCaller`: group names, then operation names inside the group, then `--argument` names, then an enum argument's legal values; operations the caller may not run are not offered; `TryDescribe(text)` gives the usage line of the operation being typed so the panel can show it.
- **Done:** edit-mode tests on each level and the audience filter, with a custom `ITextCompleter` swapped into the panel.

### UI3-3 ConsolePanel

- **Outcome:** `ConsolePanel` is one element: a `TextLog`, a usage hint, a `TextEntry`; its structure comes from an optional template with named slots and its look from `Console.uss` tokens; it holds an `OperationHost` (default `CoreKit.Operations`), the caller's audiences, the echo prefix and the running text; a submitted line is echoed, run, its reports shown (a live line for a run that outlasts the call), its result appended by `OperationLines`; `AttachLog(level)` adds the scoped sink.
- **Done:** play-mode tests through the UI Test Framework: a line runs and its result shows; an invalid line shows in the negative role; a warning logged while attached appears and one logged after detaching does not; Tab completes a group name.

### UI3-4 ConsoleView and the ui operations

- **Outcome:** `ConsoleView` in Screens is a `View` over a `ConsolePanel` found in its document or built when the document has none; serialized audiences, log level, capacity and the input context; it focuses the entry and attaches the sink on show, detaches and blurs on hide, and raises the text-entry input context while its entry has focus. `ui themes`, `ui theme --theme-name` and `ui clear` ship in Screens under the `ui` group.
- **Done:** compiles; an edit-mode test runs `ui themes` through a host built on the Screens assembly.

### UI3-5 The Gallery console

- **Outcome:** the Gallery has a console view bound to a dock button and a key, so a buyer sees the console over the sample's operations; the dev scene matches.
- **Done:** the Gallery compiles and opens; the developer judges it.

### UI3-6 The deletions

- **Outcome:** Core's uGUI console (`ConsoleController`, `GameConsoleOutput`, the prefabs) and Chat's console (`ConsoleElement`, `ConsoleWindowController`, `ConsoleView`, `ConsoleCommandHistory`, the console sample) are deleted.
- **Rules:** CoreDev and ChatDev are outside this step's directories; the story is raised with the file list and stays open for a session in those repositories.
- **Done:** the file list in the report; `refused` until that session.

### CL3a-1 Saboteer's ten classes as operations

- **Outcome:** the ten `ICommand` classes become static methods under `[assembly: OperationGroup("saboteer", ...)]`: `crew-logs`, `fog`, `gold --amount`, `item --name [--count]`, `items`, `modifier-grant`, `modifier-revoke`, `modifier-status`, `modifier-dispel`, `poi`, `settings-list`, `settings-get`, `settings-set`, `settings-reset`, `spawner`, `world-items`; each names its effect and availability, returns text or an `OperationTable`, and refuses through `OperationException` with a hint. The ten files are deleted.
- **Done:** compiles; `core help --group saboteer` lists sixteen operations.

### CL3a-2 Saboteer's console onto UI's

- **Outcome:** the Console object in both scenes carries UI's `ConsoleView` over a Saboteer `Console.uxml` with a `ConsolePanel` in the game's look; Chat's `ConsoleWindowController` and `ConsoleView` leave the scenes; `GameViewManager` toggles the view on the console key as before and the developer-console setting still gates it; the manifest takes UI, Chat and Persistence from their branches.
- **Done:** compiles; the developer opens the console in the Gym and runs the sixteen operations.

### L8a-1 The package, the store, the header

- **Outcome:** `com.spellboundstudios.persistence` at `Packages/Persistence` inside the Persistence repository (so the install path `?path=/Packages/Persistence` never changes when the repository moves to the settled layout at L8), assembly and namespace `Spellbound.Persistence`, Core as its only reference; `PersistenceKit.Open(storage, settings, sections)` returning `Saves`; `Saves.Load(key, options)` and `Saves.Save(store, options)`; `Store` with `Section<T>()`, `Bind<T>(instance)`, `Has<T>()`, `Carried`; `StoreKey`; `SectionCatalog` built at `Open` through Core's assembly scanning with the four refusals (duplicate name, not a class, no `IPacker`, no parameterless constructor); `SectionHeader` and the fingerprint over the field lines of Core's layout description; the file layout of the pitch; `FileStorage` writing on a worker to a temporary file first.
- **Done:** edit-mode tests: a store round-trips through a file; the fingerprint is equal for two types with the same fields and differs when a field is renamed; `Open` fails naming a duplicate section.

### L8a-2 MemoryStorage, the refusal, the unknown policy, Required

- **Outcome:** `MemoryStorage`; `LoadResult` with `Loaded`, `New`, `Refused`, the `Refused` list with both fingerprints, `Unknown`, and the refusal reason; the unknown-section policy (`Carry` default, `Drop`) through `SaveSettings`; `LoadOptions.Required`; `SaveJob` with `Captured`, `Completed`, `Completion` and `FlushToDisk`.
- **Done:** tests on every door and every extension point: `Storage_CustomImplementation`, refusal by name, carry and drop, a required section refused, a truncated file, a missing file as `New`, a flushed write.

### UI6a-1 Input contexts

- **Outcome:** `IInputContextSwitch` (`Enter(uint)`, `Leave(uint)`) in Screens with `InputContextIds.Of(name)` and the shipped `TextEntry` id; `ViewPolicy.InputContextId` set through `WithInputContext`, never a fourth constructor argument; `View` gets a serialized `inputContext` name; `UserInterfaceManager.InputContexts` holds the switch (default none) and enters the top view's context when it becomes top and leaves it when it stops; `InputContextBinding` raises the same pair from a `TextEntry`'s focus. Saboteer's `SaboteerInputContexts` is the one class that touches `PlayerInputManager`; `GameViewManager` and `ChatHud` stop switching maps themselves.
- **Done:** edit-mode tests with a fake switch (`InputContextSwitch_CustomImplementation`): enter on top, leave on hide, no call for a view with no context; Saboteer compiles and typing never drives the player.

### UI6a-2 The modal host and the confirm dialog

- **Outcome:** `ConfirmDialog` in Widgets (title, message, confirm and cancel, template-replaceable, `Confirmed` and `Cancelled`); `ModalHost` in Screens shows one element over a layer the manager names, claims the cursor, locks the view stack and takes Escape first; `UserInterfaceManager.Modals` and `Confirm(title, message, onAnswer)`.
- **Done:** edit-mode tests on the host (show, answer, escape); the Gallery's quit asks through it.

### UI6b-1 LayoutStore as a section

- **Outcome:** `LayoutStore` carries `[Section("ui.layout")]` and implements `IPacker` (count and records, no format byte); `UserInterfaceManager.LayoutSaveRequested` fires when edit mode exits with its changes kept and when the manager is destroyed with the store dirty, never per record.
- **Regression contract:** the edit mode's revert payload still restores the records on Cancel.
- **Done:** tests on the round trip and the event.

### UI6b-2 Saboteer's layout glue

- **Outcome:** `GameViewManager` opens Saboteer's `Saves` once, loads the `settings` store, binds the layout, and saves on `LayoutSaveRequested`; `UiLayoutService` and `UiLayoutData` are deleted; a layout saved by an earlier build is not read, so the tester sees the default HUD once.
- **Done:** compiles; the developer places a panel, leaves and returns, and sees it kept; the old file is still on disk.

## The stories of step 10: probes and the Studio shell (NW10, NW2g, UN9, L11t)

Step 10 answers three questions by running them and makes the home the Studio packages grow in. Eight stories: NW10 one, NW2g one, UN9 four, L11t two. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Nothing in a game, in Core or in any shipping package changes in this step; the probes live in NetworkingDev and in throwaway copies, and the Studio shell is a new repository.

Applies to every story of the step:

- **Rules:** the rules of steps 1, 2 and 5 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, the copyright line on every new C# file, logging through Core, the studio's Rider formatting; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows).
- **Rules:** a probe ends in a written result, a table of question, result and evidence, in this file; the developer's merge of the pull request that carries it closes the probe. A probe's code ships nowhere: NW10's and NW2g's probe assemblies stay under NetworkingDev's `Assets/Tests`, beside the probes that are already there, and UN9's copies are deleted when the note is written.
- **Rules:** the working Corsairs Isle project is never opened in another editor. UN9 works on a plain folder copy that skips `Library`, `Temp`, `Logs`, `.git` and the generated solution files; the copy keeps the working tree's uncommitted edits and its `packages-lock.json`, so it compiles the same package commits the game does.
- **Rules:** every decision put to the developer is one plain question with the recommendation first; a question a standing rule answers is applied and recorded, not asked.
- **Verified (2026-10-25):** NetworkingDev is a plain Unity project on 6000.3.10f1 with no git repository and no Networking package; it holds PurrNet 1.25.0-beta.4 from `#dev`, PurrDiction 1.4.0 from `#release`, Core 1.1.9 from `#dev` at an older commit, and four probe assemblies under `Assets/Tests`. No `Networking` and no `Studio` repository exists in the organisation; `Template` is at the step 11 state (pull request 4 of its repository). The Corsairs Isle working tree has five uncommitted edits and locks Core `#dev` at a commit before step 4's operations.
- **Regression contract:** NetworkingDev's existing test assemblies (NetworkModules, Prediction, PredictionHost, WireFormat) compile and their edit-mode and play-mode tests pass as before; the Corsairs Isle working project is untouched, byte for byte; no file of any other repository changes.
- **Done, for each story:** compiles clean through the Unity CLI in the project named, its tests pass, and the written result stands in this file.

### NW10-1 Who steps a world that predicts

- **Outcome:** it is known, from one process in NetworkingDev, what PurrDiction's `PredictionManager` does to the process when it wakes and starts (`Physics.simulationMode`, `Time.fixedDeltaTime`), that the scene holding a manager is stepped by the manager alone, that a local physics scene without a manager is stepped once per fixed step by a driver and not at all without one, and that the default scene is stepped by Unity in automatic mode and by the driver alone once the process is in script mode. The rule for the world instance's driver is written from the readings and filed to Runtime and WorldObjects for L3's driver story.
- **Verified (2026-10-25):** `PredictionManager.Awake` sets `Physics.simulationMode = Script` when its physics provider includes 3D (`PredictionManager.cs:133`), `OnEarlySpawn` sets `Time.fixedDeltaTime = tickDelta` (`:563`) and the physics pass calls `gameObject.scene.GetPhysicsScene().Simulate(delta)` (`:1899`); `OnDestroy` restores neither; the provider defaults to none, so a manager without the provider set steps no physics. PurrNet registers a scene only through its own scene module, so a manager in a scene of its own is spawned into a scene loaded through `ScenesModule.LoadSceneAsync` with `PurrSceneSettings.physicsMode`.
- **Rules:** the driver of the probe implements the rule under test: it steps the physics scene of its own scene with `Time.fixedDeltaTime` at the latest execution order, leaves a physics scene alone when a manager's scene uses it, and steps the default physics scene only in script mode. The step count is read from a body with no gravity whose velocity is set each fixed update to one unit per step, so distance travelled equals steps taken.
- **Done:** the play-mode tests pass in NetworkingDev; the written result and the rule are in this file.

### NW2g-1 The PurrNet gate, proved as a probe

- **Outcome:** it is known on 6000.3 that an assembly constrained on a symbol a `versionDefines` entry defines over a bounded range of `dev.purrnet.purrnet` compiles when the installed PurrNet is inside the range and is skipped with no error when it is outside; that a prerelease version is accepted in the range expression; that an ungated editor assembly reads the installed version through `PackageInfo` at each domain reload, logs an error through Core naming the version and the range when PurrNet is installed outside the range, and stops a player build with that message through `IPreprocessBuildWithReport`; that a build passes when the installed PurrNet is inside the range; and that with PurrNet absent the gated assembly is skipped, the project opens with no error, and a menu item offers `Client.Add` of PurrNet's address, after which the gated assembly compiles.
- **Verified (2026-10-25):** no Networking package exists yet (NW1 creates it in step 21), so the gate is proved as probe assemblies under `Assets/Tests/PurrNetGate` in NetworkingDev, shaped as the package's assemblies will be: a gated adapter, an ungated editor assembly, and tests. Core 1.1.9's logger registers its sinks at `RuntimeInitializeOnLoadMethod` only, so an error logged through Core at domain reload in edit mode reaches no sink.
- **Rules:** the tested range is written once in the probe (`[1.25.0-beta.1,2.0.0)`), the out-of-range case uses a second expression (`[2.0.0,3.0.0)`) against the same installed PurrNet, so both cases are proved against one install; the absent case runs in a throwaway project outside every repository.
- **Done:** the edit-mode tests pass in NetworkingDev, the two player builds give the expected results, the absent-case project behaves as written, and the written result is in this file.

### UN9-1 The 6.7 beta copy opens and compiles (checks 1 to 4)

- **Outcome:** a plain folder copy of the Corsairs Isle project opens in the newest Unity 6.7 beta, and it is written against the ledger rows which packages compile, which calls are removed or now errors (the saved-reference rules on Modifiers and Core first), what Unity does with Collections, Burst and Mathematics declared as packages, whether Core's assembly scan and the unload code still run and warn with play mode entered twice without domain reload, and whether the experimental CoreCLR player installs; the Localization migration is written down as not run, because Corsairs holds no Localization package.
- **Rules:** the copy is opened by the beta editor in batch mode from the command line and driven through the Unity CLI; the editor is installed by the developer, because the Windows installer asks for administrator rights that only a person can grant.
- **Done:** the written result per check.

### UN9-2 A Windows build, the renderer and the importer (checks 5 to 7b)

- **Outcome:** a Windows player built from the copy on 6.7 lists its shipped files and whether the C++ runtime files are among them (the Steam upload half is BuildPipeline's and is written down as not run); the PC renderer asset's ambient shadowing setting is read after the beta's upgrade and the console's words about it recorded; Instancing's batch draw and Art's importer behaviours are written down as not run because neither package exists, with the Resident Drawer setting of the copy's URP asset recorded.
- **Done:** the written result per check.

### UN9-3 PurrNet, the physics scene scope and Entities, then the ledger lines (checks 8 to 10)

- **Outcome:** whether PurrNet compiles on 6.7 and a host and a local client connect (NetworkingDev's module tests copied into the throwaway copy); what `PhysicsSceneLoadScope` offers against the route of a scene created with `LocalPhysicsMode`; which Entities calls are errors in the copy. Then one line per ledger row 6.7 changes: changed, unchanged or unsure, with the quote, and the note for the executive brief.
- **Done:** the note.

### UN9-4 The Unity 7 alpha copy

- **Outcome:** a second plain copy of the Corsairs Isle folder opens once in the newest Unity 7 alpha, every error and warning is written into one list that says whether the Unity 7 move is a small or a large job, the first line of a text asset re-saved by the alpha is recorded, and the checks that need packages the copy lacks (the theme fixture, the seed compare, the discovery probe) are written down as not run; `VoxelMaterialDatabase` is baked where the copy's GeoForge allows it.
- **Rules:** the working project never opens in the alpha; the copy is deleted when the list is written.
- **Done:** the list.

### L11t-1 The Studio repository shell

- **Outcome:** `StudioDev` exists beside the other dev projects, made from the template's working tree as `gh repo create --template` would make it: the dev project at the root, the template's scripts, workflows, hooks and managed files, a manifest that installs Core from GitHub and the Pipeline package, and the convention for five packages by cluster under `Packages/`. The developer initialises the repository and pushes the template commit first, so the Studio.Tools shell is a reviewable pull request on top of it.
- **Rules:** managed files are not edited, so the template's sync keeps working; the manifest points Core at `#dev` until Core has a `beta` branch, because the template's `#beta` line resolves to nothing today.
- **Done:** the folder opens in 6000.4.8f1 through the Unity CLI with no compile error.

### L11t-2 The Studio.Tools package

- **Outcome:** `Packages/Studio.Tools` is the first Studio package, id `com.spellboundstudios.studio.tools`, shaped as a tool: one editor assembly `Spellbound.Studio.Tools.Editor` constrained on Core's define, the front door `StudioToolsKit` holding the text of the copyright line, an edit-mode test assembly whose test reads every C# file of the package and fails on one that does not open with that line, a sample folder, and the identity files the template ships (`package.json`, `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` with its headings, the boundary sheet).
- **Rules:** the folder is `Packages/Studio.Tools`, the short name with its dot, as the line text's package folder rule says; the namespace is `Spellbound.Studio.Tools`, the operation group `studiotools`, the front door `StudioToolsKit`.
- **Done:** compiles in StudioDev and its tests pass through the Unity CLI.

### The written result of the stepping probe (NW10-1, 2026-10-25)

Run on this machine in NetworkingDev (Unity 6000.3.10f1, PurrNet 1.25.0-beta.4, PurrDiction 1.4.0, fixed step 0.02 s, the manager at 30 ticks a second): five play-mode tests through the Unity command line, all passing, with the readings written to `Temp/stepping-ownership.txt`. Each step count is a body's distance in units at one unit per step; a window is 50 fixed updates or 60 ticks.

| Question | Result | Evidence |
|---|---|---|
| What the manager does to the process when it starts | `Physics.simulationMode` becomes `Script` for the whole process and `Time.fixedDeltaTime` becomes the tick step | Read after `OnEarlySpawn`: mode `Script`, fixed step 0.0333 s, tick step 0.0333 s; the process was at `FixedUpdate` and 0.02 s before |
| A manager in a scene with its own physics scene steps that scene, once per tick | pass | The scene loaded through PurrNet's scene module with `LocalPhysicsMode.Physics3D`: 60 steps in 60 ticks; the driver placed there stepped 0 times and skipped 60 |
| A local physics scene is stepped once per fixed step by a driver and not at all without one | pass | Driven scene 50 steps in 50 fixed updates (60 in 60 beside the manager); the idle scene 0 |
| The default scene in automatic mode is Unity's, and the driver stays out | pass | 50 steps in 50 fixed updates with the driver's `skipped automatic default` at 50 and its own steps at 0 |
| The default scene in script mode is stepped by nobody until the driver steps it | pass | 0 steps in 25 fixed updates without a driver, then 50 in 50 with one; beside a manager in its own scene the default scene took 60 driver steps in 60 fixed updates |
| A manager in the default scene owns the default physics scene | pass | 60 steps in 60 ticks, the default-scene driver stepped 0 and skipped 60; a driven local scene beside it kept 60 in 60 |
| What the manager leaves behind when it is destroyed | finding | The process stays in `Script` mode at the tick step (0.0333 s) after the manager and its host are gone; nothing restores `FixedUpdate` mode or the 0.02 s step |
| How a driver knows a scene holds a manager | finding | `PredictionManager.TryGetInstance(scene.handle)` answers from a static dictionary filled in `Awake` and cleared only when play mode starts; it keeps destroyed managers and prefab templates whose `Awake` ran. The probe's driver counts a manager only when it is alive and spawned |

**The rule for the world instance's driver (filed to Runtime and WorldObjects for L3's driver story):** the driver steps the physics scene of its own scene with `Time.fixedDeltaTime` at the latest execution order; it leaves a physics scene alone when a live, spawned `PredictionManager` sits in a scene that uses that physics scene (its own scene, or any scene when the physics scene is the default one); it steps the default physics scene only while `Physics.simulationMode` is `Script`, because a manager anywhere in the process switches the whole process to script mode and Unity then steps nothing on its own. Two consequences the games carry: once a world has predicted, physics in every world of that process runs at the tick step until something sets the fixed step back, and the mode and the step are not restored when the predicted world unloads, so a game that predicts one world and keeps others decides at its prediction pitch who restores them. Rule 11 of the line text stands as written; the two consequences are additions for L3's driver story and the first prediction pitch.

### The written result of the PurrNet gate probe (NW2g-1, 2026-10-25)

Run on this machine in NetworkingDev (Unity 6000.3.10f1, PurrNet 1.25.0-beta.4 installed from `#dev`): eight edit-mode tests through the Unity command line, all passing, with two player builds; and a throwaway project outside every repository (6000.3.10f1, Core `#dev` at `e0ca89f`, no PurrNet) opened once in a batch editor. The probe assemblies stay under `Assets/Tests/PurrNetGate` in NetworkingDev; the Networking package takes the same shape when NW1 creates it.

| Question | Result | Evidence |
|---|---|---|
| A prerelease version is accepted in a `versionDefines` expression | pass | `[1.25.0-beta.1,2.0.0)` defines `PURRNET` with 1.25.0-beta.4 installed; the asmdef imports with no error |
| An assembly constrained on the symbol compiles when the installed PurrNet is inside the range | pass | `NetworkingDev.PurrNetGate.Adapter` is in `CompilationPipeline.GetAssemblies` and references a PurrNet type |
| The same constraint skips the assembly with no error when the range excludes the installed PurrNet | pass | `[2.0.0,3.0.0)` leaves the symbol undefined; `NetworkingDev.PurrNetGate.OutOfRange` is absent from the compilation, its asmdef is still reported by `GetAssemblyDefinitionFilePathFromAssemblyName`, and the console shows no error |
| An ungated editor assembly reads the installed version at domain reload | pass | `PackageInfo.FindForPackageName("dev.purrnet.purrnet").version` answers `1.25.0-beta.4`; the same assembly carries the range as its own `versionDefines` entry without a constraint, so `#if PURRNET` tells it whether the range held |
| Outside the range an error through Core names the version and the range | pass | One `Error` entry on a recording sink: "PurrNet 1.25.0-beta.4 is installed but outside the tested range [2.0.0,3.0.0), so the adapter is compiled out and nothing that references it compiles. Install a PurrNet inside the range." Inside the range nothing is logged |
| A player build stops with that message when the gate fails | pass | `IPreprocessBuildWithReport` throws `BuildFailedException`; `BuildPlayer` returns `Failed` after 0.9 s with the message in the report |
| A player build passes when the gate holds | pass | Windows 64 player of the sample scene: `Succeeded`, 111 s the first time and 3.8 s warm, 0 errors |
| With PurrNet absent the project opens clean, the gated assembly is skipped and the install is offered | pass | The throwaway project compiled only the editor probe assembly, with 0 errors; `Spellbound/Networking/Install PurrNet` was offered |
| The offer installs PurrNet and the gated assembly then compiles | pass | `Client.Add` of `https://github.com/PurrNet/PurrNet.git?path=/Assets/PurrNet#dev` installed 1.25.0-beta.13; after the resolve the adapter compiled, the out-of-range assembly stayed out, the offer disappeared |
| Core's current `dev` head compiles on 6000.3 | pass | Core `e0ca89f` (the step 4 state) resolved and compiled in the throwaway project |

Facts the probe changed: `#dev` of PurrNet moves (beta.4 in NetworkingDev's lock, beta.13 on a fresh install), so the catalogue row's tested range and the games' lock files are what hold a version, never the address. A gap for Core: `LogBootstrap` registers sinks at `RuntimeInitializeOnLoadMethod` only, so an error logged through Core from an `InitializeOnLoadMethod` in edit mode reaches no sink; the editor gate's error is proved on a sink the test registers, and the gate that ships needs Core to give editor code a sink (raised below). Settings taken: the probe's tested range is `[1.25.0-beta.1,2.0.0)`, the install address is the one both games already use, a project with no PurrNet logs nothing and only offers the menu item.

### The written result of the Unity 6.7 beta probe (UN9-1 to UN9-3, 2026-10-25)

Run on this machine on Unity 6000.7.0b6 (the newest beta the Unity command line offers; b7 is named in Unity's notes but not offered), installed by the developer, on a plain folder copy of the Corsairs Isle project: the working tree of 2026-10-25 with its five uncommitted edits and its lock file, with `Library`, `Temp`, `Logs`, `.git` and the generated solution files left out. The copy holds Core 1.1.9 at the lock's commit, PurrNet 1.20.0-beta.216, GeoForge 0.6.24, UI 0.2.7, Chat 0.3.11, Controller 1.1.4, Modifiers 0.2.5, Inventory 0.2.0, Persistence 0.1.2 and Entities 6.4.0 declared. Every opening was headless through the Unity command line; the working project was never opened. The copies were deleted after the note.

| Check | Result | Evidence |
|---|---|---|
| 1 Every package compiles | fails on Core's Entities folder and on two Corsairs files; clean after four one-line stubs | Core `ObjectPresetAuthoring.cs:26` (`IBaker.AddSharedComponentManaged`) and `ObjectParent.cs:580` (`EntityManager.GetSharedComponentManaged`) are errors CS0619 ("Managed ISharedComponentData support is deprecated and will be removed... First deprecated in 6.6"). With those stubbed in the copy, Corsairs' `NetworkedChunk.cs:77` fails on the same call and `TalentTreeAssetOpener.cs:15` fails on the `EntityId` from `int` cast ("EntityId will not be representable by an int in the future"); `EditorUtility.InstanceIDToObject(int)` is an error too, so the fix is the `OnOpenAsset(EntityId, int)` signature. With all four stubbed, every package and every Corsairs assembly compiles on 6.7 with zero errors |
| 1 The saved-reference rules | no error | Modifiers' and Core's `SerializeReference` uses raise none of UAC1005 to UAC1008, UAC1019 or UAC1020. The analyzer reports UAC1001 (a field skipped by serialization), UAC1002 (an incomplete serialized hierarchy) and UAC1010 as warnings in Corsairs' game code, the Heathen Steam asset and Steamworks.NET; UAC0005 names Core's `AssemblyScanning.cs:10` and `LogConfigEditor.cs:189` for `AppDomain.GetAssemblies()`; UAC0023 names `BinaryFormatter` in Heathen; UAC0008 and UAC0009 say `UNITY_64` and `DEVELOPMENT_BUILD` are no longer defined (PurrNet's UTP transport, Steamworks.NET) |
| 2 Collections, Burst and Mathematics declared as packages | compile; the beta replaces them | The lock's Collections 2.x, Burst 1.8 and Mathematics 1.3 resolve as built-in `com.unity.collections 6.7.0`, `com.unity.burst 2.0.0`, `com.unity.mathematics 1.4.0`; Entities 6.4.0 resolves as built-in 6.7.0; URP as 17.7.0. No duplicate-type error |
| 3 Core's assembly scan and unload code | runs; one analyzer warning | Play mode entered and left twice with domain reload off (`DisableDomainReload`, set on the copy): `SmartPackerRegistry` registered its nine packers on both entries, the console shows no error, and the only words about the scan are the compile-time UAC0005 warning on `AssemblyScanning.cs:10` |
| 3 The experimental CoreCLR player | not run | It is a separate module, `windows-coreclr` (347 MB), which the editor install did not include; installing a module asks for administrator rights like the editor |
| 4 Localization migration | not run | Corsairs holds no Localization package; Saboteer's 6.7 move runs it. The beta ships `UnityEngine.LocalizationModule` and `UnityEngine.LocalizationRuntimeModule` as engine modules |
| 5 A Windows build ships the C++ runtime files | yes | A Windows 64 player of an empty scene built on 6.7 (`Build Finished, Result: Success`); the build folder holds `concrt140.dll`, `msvcp140.dll`, `msvcp140_1.dll`, `msvcp140_2.dll`, `msvcp140_atomic_wait.dll`, `msvcp140_codecvt_ids.dll`, `vcruntime140.dll` and `vcruntime140_1.dll`, plus `dstorage.dll`, `dstoragecore.dll` and a `D3D12` folder, beside `UnityPlayer.dll` and `MonoBleedingEdge`. Whether the Steam upload includes them is BuildPipeline's and not run; switching the copy off is MV's choice |
| 6 The old ambient shadowing setting | still honoured, unchanged | `PC_Renderer.asset` opens on 6.7 as a `UniversalRendererData` with two renderer features, `ScreenSpaceAmbientOcclusion` active and `DecalRendererFeature` active; nothing moved it to a Volume and the console says nothing about it. Art's verdict picture render is not run (ArtPipeline does not exist) |
| 7 Instancing's batch draw and the Resident Drawer | not run | Instancing does not exist; the copy's `PC_RPAsset` has `GPUResidentDrawerMode: InstancedDrawing` |
| 7b Art's importer behaviours | not run | ArtPipeline does not exist |
| 8 PurrNet compiles and connects | yes | PurrNet 1.20.0-beta.216 compiles on 6.7 (two warnings about removed symbols); a play-mode test starts a host over `LocalTransport` and its local client connects: `isServer True isClient True isHost True localPlayerReady True serverState Connected clientState Connected` |
| 9 `PhysicsSceneLoadScope` | read | A struct in `UnityEngine.PhysicsModule` with one constructor taking a `PhysicsScene`, a `scene` property and `Dispose`: a `using` scope that makes scenes loaded inside it use the given physics scene. It does not replace the world instance's route (a scene created or loaded with `LocalPhysicsMode.Physics3D` owns its physics scene); it adds a way to load an authored scene asset into an existing world's physics scene, which the world instance can offer later without a design change |
| 10 The managed-component compile errors | confirmed | Check 1's three CS0619 errors are exactly the managed-component removal; two are in Core's ECS folder that UN4b deletes, one in Corsairs' chunk code that the Corsairs rewire removes |

**The ledger rows 6.7 changes:**

| Row | Changed, unchanged or unsure | The quote |
|---|---|---|
| Editor floor | unchanged | The floor stays 6000.3; 6.7 opens the copy and compiles it after four one-line edits, none in a package the line keeps |
| Rule 12, the `AppDomain` scan and `DomainUnload` | unchanged on 6.7, with a warning | "warning UAC0005: AppDomain.GetAssemblies() in Unity may return already unloaded assemblies and result in errors or leaks. Use Unity APIs instead"; the scan still runs with domain reload off |
| Burst and Mathematics declarations | changed | Both resolve as built-in modules (`com.unity.burst 2.0.0 BuiltIn`, `com.unity.mathematics 1.4.0 BuiltIn`) whatever the manifest declares; Collections too (`6.7.0 BuiltIn`) |
| Core packing against `com.unity.serialization` | unsure | The copy pulls `com.unity.serialization` through Entities only; Core's packing does not reference it. Nothing to read in this copy |
| Dedicated Server 3.0 and Multiplayer Play Mode 3.0 | unsure | Not in the copy's manifest; not read |
| Cinemachine and Performance Testing | unchanged | Cinemachine 3.1.6 and the performance test framework resolve and compile |
| Project Auditor | unsure | Not in the copy; not read |
| The batch renderer, Mesh LOD and the Resident Drawer | unsure | `GPUResidentDrawerMode: InstancedDrawing` is honoured; no Instancing code exists to draw |
| ArtPipeline's model hooks | unsure | No ArtPipeline code exists |
| The Pipeline package | changed in words | Pipeline 0.8.0-exp.1 runs on 6.7 and drives the copy; the Unity command line says "This project's com.unity.pipeline uses the old command names. Run unity pipeline upgrade" on every project |
| GameObjects-are-Entities and `EntityId` | changed | `EntityId` from `int` is an error (CS0619), `EditorUtility.InstanceIDToObject(int)` is an error, `OnOpenAsset(EntityId, int)` is the signature |
| Localization | changed | Engine modules `UnityEngine.LocalizationModule` and `UnityEngine.LocalizationRuntimeModule` exist in the beta; the package migration is not run |
| Collections | changed | Built-in 6.7.0 |
| The saved-reference rules | unchanged | No UAC1005 to UAC1008, UAC1019 or UAC1020 in the copy |
| `PhysicsSceneLoadScope` | changed, additive | A struct scope over a `PhysicsScene`; the world instance's route stands |
| Animation Rigging | unsure | Not in the copy |

### The written result of the Unity 7 alpha copy (UN9-4, 2026-10-25)

Run on this machine on Unity 7000.0.0a12 (the newest alpha the Unity command line offers), on a second plain copy of the same folder. The story asks for one opening; the copy was opened once as it was and then three more times with the same four one-line stubs as the 6.7 copy, to read what lies behind the first errors. The working project never opened in it. The copy was deleted after the list.

The list, every error and warning of the first opening and what the later openings added:

| Kind | Where | What |
|---|---|---|
| error | Core `ObjectPresetAuthoring.cs:26`, `ObjectParent.cs:580` | `AddSharedComponentManaged` and `GetSharedComponentManaged` no longer exist (CS0103, CS1061); the same two lines 6.7 refuses |
| error, second opening | Corsairs `TalentTreeAssetOpener.cs:15` | `EntityId` from `int` is an error; `InstanceIDToObject(int)` too; `OnOpenAsset(EntityId, int)` compiles |
| error, third opening | Corsairs `NetworkedChunk.cs:77` | `AddSharedComponentManaged` no longer exists |
| clean compile, fourth opening | every package and every Corsairs assembly | Zero errors; the same warning set as 6.7 (UAC1001 x4, UAC1002 x8, UAC1010 x4, CS0067 x4 in Corsairs' code) |
| warnings, first opening | the Heathen Steam asset, Steamworks.NET, PurrNet, Core, UI, Chat, GeoForge | UAC1002 x238 (incomplete serialized hierarchies, nearly all Heathen), UAC1001 x57, UAC0023 x24 (`BinaryFormatter` deprecated), CS0618 x20 (`PlayerSettings.GetScriptingDefineSymbolsForGroup` obsolete, in Steamworks.NET's installer), UAC0005 x10 (`AppDomain.GetAssemblies()` in Core and Persistence), UAC0008 x6 and UAC0009 x2 (`UNITY_64` and `DEVELOPMENT_BUILD` removed, in Steamworks.NET and PurrNet's UTP transport), CS0067 x4, CS0414 x2 |
| runtime, play mode | the editor | "Initialize CoreCLR" in the log; `enterPlayModeOptionsEnabled` stays false on the copied project, as Unity said an existing project keeps its setting; play mode entered and left twice with no error from Core, and Core's packers registered both times |
| runtime error, play mode | PurrNet 1.20.0-beta.216 | `MethodAccessException: Attempt by method 'PurrNet.CodeGen.Serializers...Serializer.Register()' to access method 'PurrNet.Packing.PackCollections.RegisterQueue<...>'`, then `InvalidOperationException: [Hasher] Type 'PurrNet.Modules.TickManagerRequestLocalTick' is not registered`; the host and client connect test fails. PurrNet's generated serializers call a method CoreCLR refuses them access to, which Mono allowed |
| runtime error | Steamworks.NET | "Failed to load types from assembly com.rlabrecque.steamworks.net ... Unable to load one or more of the requested types" |
| dialog | URP | "URP Material upgrade: The Materials in your Project were created using an older version of the Universal Render Pipeline" is raised as a dialog the batch editor cannot show |
| warning | DOTween | Two `.dll.meta` files hold a `PluginImporter` below the supported minimum version and want a re-save |
| text assets | `Assets/NetworkPrefabs.asset` re-saved by the alpha | The first line stays `%YAML 1.1`, the second `%TAG !u! tag:unity3d.com,2011:`; 7000.0.0a12 writes no `%UNITY` line and neither does 6000.7.0b6. Of the two a12 entries, the later one holds: text files do not start with a version line |
| `AddObjectToAsset` | GeoForge `VoxelMaterialDatabase.BuildTextureArrays` on `CorsairsMaterials.asset` | The bake ran, two texture arrays sit under the asset and the main object is still the `VoxelMaterialDatabase`; the alpha's change (no replacement of the main object) does not break this caller |
| not run | the theme fixture, the seed compare, the discovery probe, Legacy Theme Priority | UI's fixture is on UI's `beta`, which the copy does not follow; W1's compare and Core's discovery record do not exist yet; no member named for a legacy theme priority exists on `PlayerSettings`, `EditorSettings` or `PanelSettings` in a12 |

**Small or large:** the compile side of the Unity 7 move is small: four one-line edits, three of them in Entities code the line deletes anyway (UN4b and the Corsairs rewire) and one `EntityId` signature. The runtime side is not ours to size: PurrNet's generated serializers and Steamworks.NET fail to load on CoreCLR, so the move waits for a PurrNet release that runs on CoreCLR, which the catalogue row's tested range gates, and for a Steamworks.NET that loads. The alpha writes no `%UNITY` line into text assets, so the release scan's threshold stays "any `%UNITY` first line fails" with nothing yet to compare against.

Facts the probes changed: Corsairs' `packages-lock.json` pins Modifiers at `d3348df`, a commit GitHub no longer holds; the copy resolved it from the lock all the same. Settings taken: the probe copies skipped `.git` as well as `Library`, `Temp` and `Logs`; the stubs are `#if UNITY_6000_7_OR_NEWER` guards in the copies only, and nothing in a repository changed.

## The stories of step 7: Switchboard and Saboteer's chat (UI4a1, UI4a2, UI4a)

Step 7 turns Chat into Switchboard, the line's text-between-players library, puts the chat window and the chat settings page over UI's parts, and cuts Saboteer over to it before the freeze with a thin network layer of the game's own and the in-process loopback. Eleven stories: UI4a1 five, UI4a2 five, UI4a one. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Two repositories change, each on a branch of its own: Chat, which becomes Switchboard (`switchboard` into `beta`), and Saboteer (`switchboard-chat` into `main`, which the developer plays). The networked bridge (UI4b) is not part of this step: Saboteer's `ChatNetwork` stays as a thin class of the game implementing Switchboard's two transport interfaces over PurrNet until Networking's event channel lands.

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 6 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows). Every value a game might tune is a profile field, a property with a default, a serialized field or a constructor argument.
- **Rules:** the rename follows rule 8 of the line text. The package id is `com.spellboundstudios.switchboard`, the folder `Packages/Switchboard`, the root namespace and assembly `Spellbound.Switchboard`, the front door `SwitchboardKit`, the operation group `switchboard`. Nothing keeps the old name: no alias, no `MovedFrom`, no second assembly. The repository rename on GitHub (`Chat` to `Switchboard`) and the clone's folder rename (`ChatDev` to `SwitchboardDev`) are the developer's acts in the hand-off; GitHub redirects the old address, and Saboteer's manifest line carries the new one.
- **Rules:** `Spellbound.Switchboard` references Core and the engine modules only. `Spellbound.Switchboard.UI` is a bridge compiled when UI is installed (`versionDefines` on `com.spellboundstudios.ui`, range `[0.2,1.0)`), references Widgets and Screens, and carries `!UNITY_SERVER`. No assembly references the Input System, PurrNet, Steamworks, Persistence or any data package. Everything the bridge draws is replaceable without editing the package: a template with named slots on the panel, USS classes and role tokens for its look, a seam with a default for every decision a game makes differently.
- **Rules:** the library's strings name no game and carry no colour. A line a player reads is a `StyledText`; a system line is a template id with named arguments, rendered at the receiver through UI's `ITextTemplateResolver`; the shipped `TextTemplateTable` holds the English patterns and a game replaces it or backs the seam with its own localisation.
- **Rules:** where the router runs, and whether filters and the rate limit run at the sender, the router or both, is a profile setting with no default in the library (`LimitPlacement.Unset`); `SwitchboardKit.Connect` and `SwitchboardKit.Host` refuse a profile that leaves it unset. Saboteer's profile runs both limits at the sender. Moderation is the filter seam plus the per-sender rate limit and the mute list, each switchable; no word lists.
- **Rules:** Core has no observation model yet (`ObservationContext` arrives with R1a in step 17), so no door of this step takes one, as in steps 5 and 6. Core's identity type arrives with R0 (step 13), so a participant is a `ParticipantId` over a 64-bit value with zero as none, never a Steam type or a PurrNet connection.
- **Verified (2026-10-25):** Chat `beta` at e4e488c is `Packages/Chat` in ChatDev (the repository root is the dev project) with four runtime assemblies (`Spellbound.Chat`, `.UITK`, `.UIIntegration`, `.Samples`), 4,447 lines of C#, 67 edit-mode tests, a `Samples/` folder (not `Samples~`) and no UI line in its manifest; UI `beta` holds the four text parts, `ConsolePanel`, `ConsoleView`, `WindowFrame`, `AdjustableRegion`, `InputContextBinding` and the `ui` operations; Persistence `beta` holds `Store.Bind<T>` and the section catalogue over Core's `[Section]`; Core `dev` holds the operation host with `Run(OperationInvocation, caller)` and `Packer.WriteString`. Saboteer `main` at ec93d4c has ten chat files under `Assets/_Project/Chat` (1,267 lines), the Chat object in `NetworkedScene.unity` (`ChatHud`, `ChatRegionWindowController`, a `UIDocument`), the `ChatNetworked` object (`ChatNetwork`, a PurrNet `NetworkIdentity`), the lobby's chat in `LobbyView.cs` over `LobbySteamChatTransport`, five `CHAT_PLAYER_*` localisation keys with `{0}`-style patterns, and `NetworkAssets.asset` listing `Spellbound.Chat.UITK.ChatSettingsAsset`. No editor was open.
- **Verify before building on it:** PurrNet's string arguments corrupt text above U+00FF (the roadmap's reason for UI4b). The thin layer sends Core-packed bytes, so whether the corruption is gone is checked in the two-player session the developer plays.
- **Regression contract:** in Saboteer, two players in a networked session see each other's lines in the chat window, whispers reach only their target (`/w name text`, `/r text`), `/me` emotes, join and leave announcements still appear in every client's language, the chat opens on the chat key and typing never drives the player, Escape leaves the entry, the window drags and resizes in the HUD edit mode and keeps its place in the saved layout, the lobby's crew talk still shows Steam lobby chat with names in player colours, the lock state and the player's chat settings survive a restart, and the console still works beside the chat. In the package: the rename leaves no `Chat` noun in a public name, Switchboard's tests pass in its dev project, and the sample compiles against public surface only.
- **Done, for each story:** compiles clean in its dev project through the Unity CLI, its tests pass, and the report lists what was built and what was raised.

### UI4a1-1 Switchboard: the rename and the shell

- **Outcome:** `Packages/Chat` becomes `Packages/Switchboard` with `package.json` (id, display name, the sentence from the line text, Unity `6000.3`, Core declared, the sample entry), `README.md`, `AGENTS.md` under the six headings, `Runtime/Spellbound.Switchboard.asmdef` (Core only), `Runtime/UI/Spellbound.Switchboard.UI.asmdef` (the bridge), `Editor/Spellbound.Switchboard.Editor.asmdef`, `Tests/Editor` and `Tests/Runtime` assemblies, `Samples~/SwitchboardSample`; every old file (engine, UITK, UIIntegration, the console, the samples, the tests) is deleted. The dev project's manifest installs UI from `beta` and the UI Test Framework and lists the package under `testables`.
- **Done:** the package compiles empty of old code; the folder, id, namespace and assembly names match the shared conventions; the file list of what was deleted is in the report.

### UI4a1-2 The profile and its primitives

- **Outcome:** `SwitchboardProfile` is a ScriptableObject with kinds (`MessageKindDefinition` assets: key, whether players may send it, whether its text is a template id), channels (`ChannelDefinition`: key, display name, aliases, scope, role name, read-only, lines kept for late joiners), verbs (`VerbAlias`: alias to operation line), tabs (`TabDefinition`: name, channel keys, empty for all), limits (`SwitchboardLimits`: maximum length, rate limit lines and seconds with its switch, the mute list switch, history capacity, `LimitPlacement`), a default channel, and includes (other profiles whose entries this one extends). `MessageScope` is an abstract asset that picks receivers from a participant directory; the package ships `EveryoneScope`, `DirectScope` and `GroupScope` over the `IGroupDirectory` seam (default: no groups, so the scope refuses). The four kinds (`say`, `emote`, `whisper`, `notice`) and the two scopes ship as assets under `Runtime/Defaults`. `SwitchboardKit.NewProfile()` builds the same profile in code for a test or an agent. The editor assembly holds a profile validator (alias collisions, a channel with no scope, a verb naming no operation) as a plain function with a menu entry under `Spellbound/Switchboard`.
- **Done:** edit-mode tests on channel ids from keys, alias lookup through includes, the validator's three findings, and `MessageScope_CustomImplementation`.

### UI4a1-3 Message, packing and the session

- **Outcome:** `Message` is the one record that crosses the wire (kind, channel, sender, sender name, target, target name, text, named arguments, sent-at milliseconds); `MessagePacker` packs it through Core's packer with UTF-8 text and no format version. `IMessageTransport` is the client seam (local participant, `Send`, `Received`); `IDisplayNameSource` names the local player (default: the transport's own name). `SwitchboardKit.Connect(profile, transport, displayName)` returns a `Session`: history (a ring with the profile's capacity), `Received`, `Say`, `Emote`, `Whisper(name, text)`, `Reply`, `Notice(templateId, arguments)` as a local line, `Mute` and `Unmute`, `ActiveChannel`, `LastWhisperFrom`, a filter chain for incoming lines, and `Settings`, the `[Section("switchboard.settings")]` packer that holds the mute list and the player's display preferences (timestamps, channel names, window locked, background opacity, text size). The sender-side limits (length, rate) run when the profile places them at the sender, and a refusal is a local notice with its template id.
- **Done:** tests on the packing round trip (a line above U+00FF included), a whisper refused with no target, the sender-side rate limit, the mute filter, the settings section round trip, `MessageTransport_CustomImplementation` and `DisplayNameSource_CustomImplementation`.

### UI4a1-4 The router

- **Outcome:** `SwitchboardKit.Host(profile, delivery)` returns a `Router` over `IMessageDelivery` (deliver one line to a receiver set). `Join(id, name)` and `Leave(id)` keep the participant directory and send the kept history of each channel to a joiner; `Receive(message, sender)` stamps the sender from the transport, resolves a whisper's target by name, checks the kind, the channel, read-only, the length and the router-side filters, asks the channel's scope for its receivers, keeps the channel's history and delivers; every refusal goes back to the sender as a notice with a template id and arguments. `RateLimitFilter` is the shipped per-sender filter; `IMessageFilter` is the seam.
- **Done:** tests on everyone and direct delivery, an unknown target, a read-only channel, a kind players may not send, the router-side rate limit, late-join history, `MessageDelivery_CustomImplementation` and `MessageFilter_CustomImplementation`.

### UI4a1-5 Typed commands and the loopback

- **Outcome:** the group `switchboard` ships `say`, `whisper`, `reply`, `emote`, `channels`, `history`, `mute` and `unmute`, each with an optional `--session` argument that defaults to the one connected session (`SwitchboardKit.Sessions` lists them; a session registers on connect and leaves on dispose). A line typed into a session that starts with `/` is routed through the profile's verbs to an operation on Core's host as an `OperationInvocation` (the leading words fill the operation's arguments, the remainder is its last text argument); any other `/word` runs as an operation line as typed; the result's lines come back as local notices. `LoopbackSwitchboard` is the in-process pair: one router, any number of sessions, no network.
- **Done:** tests on every operation through the loopback, `/w` to `switchboard whisper` with a name and a multi-word body, an unknown verb reported as invalid, and an agent-style run of `switchboard whisper` through `OperationHost.Run`.

### UI4a2-1 Lines, roles and the templates

- **Outcome:** `MessageLines.Of(message, profile, options)` turns a message into a `StyledText`: a muted timestamp when asked, the channel name in its role when asked, the sender's name as a link span in the role the `IParticipantRoleSource` seam gives it (default `SwitchboardRoles.PlayerName`), the body plain, an emote as name and action, a whisper as a `To` or `From` template span, a notice as a template span. `SwitchboardRoles` declares `PlayerName`, `Timestamp`, `ChannelName`, `Notice`, `Whisper`, `Emote`; `Chat.uss` declares their tokens under `.sb-theme .sb-styled-label` and the panel's classes. The shipped `SwitchboardTemplates.asset` holds the English pattern of every template id the library emits.
- **Done:** edit-mode tests on each line shape, the escaped body, the link payload, `ParticipantRoleSource_CustomImplementation`, and a check that every id in `SwitchboardTemplates` has a pattern in the shipped table.

### UI4a2-2 ChatPanel

- **Outcome:** `ChatPanel` is one element: a `TabView` with a `TextLog` per tab of the profile, an active-channel pill, a `TextEntry`, a settings button; its structure comes from an optional template with named slots and its look from `Chat.uss`. `Bind(session)` appends each received line to the tabs whose channels match, marks an inactive tab unread, submits the entry to the session, cycles the active channel on Tab with an empty entry, routes a name link to the `ILinkAction` seam (default: fill the entry with the whisper verb and the name), and applies the session's settings (timestamps, channel names, text size).
- **Done:** play-mode tests through the UI Test Framework: a line lands in the matching tabs only, an inactive tab goes unread and clears on select, submit reaches the session, a link click fills the entry, `LinkAction_CustomImplementation`.

### UI4a2-3 ChatView

- **Outcome:** `ChatView` in the bridge is a `View` over a `ChatPanel` inside a `WindowFrame`, found in its document or built when it has none, wrapped in an `AdjustableRegion` named `chat-window` so the HUD layout edit mode moves and resizes it and the layout section keeps it; the frame's lock writes the session's settings; the entry's focus raises the text-entry input context; `FocusEntry()` is the one call a game's chat key makes; the settings button toggles a `ChatSettingsView` when one is registered; the template resolver comes from a serialized `TextTemplateTable` (the shipped one by default) or from `TemplateResolver` set by the game.
- **Done:** compiles; an edit-mode test binds a session to a view in a test manager and reads the region name and the input context on focus.

### UI4a2-4 The chat settings page

- **Outcome:** `ChatSettingsPanel` is a small element on Unity's own controls over `SwitchboardSettings`: timestamps, channel names, lock the window, background opacity, text size, and the mute list with an unmute button per name; `ChatSettingsView` wraps it in a closable `WindowFrame`. A change raises `Session.SettingsChanged`, so the game saves the section once.
- **Done:** play-mode tests: a toggle writes the section, unmute removes the entry, the view closes on its frame's close.

### UI4a2-5 The sample

- **Outcome:** `Samples~/SwitchboardSample` is one scene built from the public API only: a loopback router, the local session and a second session driven by a small bot that answers, a profile asset with two channels and two tabs, the chat view, the settings page, a console view beside it so a person types `switchboard channels` and sees the operations; its theme imports `Chat.uss`.
- **Done:** the sample compiles when copied into the dev project's samples folder; the developer judges it.

### UI4a-1 Saboteer's cut-over

- **Outcome:** Saboteer gets its own profile asset (`general` on the everyone scope, `whisper` on the direct scope, the verbs `w`, `tell`, `t`, `r`, `me`, one tab, the rate limit and the mute list on, both placed at the sender) and a lobby profile; `ChatNetwork` is rewritten thin: the host runs the router through `SwitchboardKit.Host` with itself as the delivery, every peer is the session's transport, lines travel as Core-packed bytes over the existing RPC shape, a join announces the name, a leave leaves the router; `SaboteerChat` connects the session when the networked scene is ready, binds the chat view and the settings view, names the local player from Steam, gives names their player colour through the role seam (one role token per palette colour in the game's `Tokens.uss`), resolves template ids through the game's localisation (the five match announcements keep their keys) with the shipped table as the fallback, binds `SwitchboardSettings` into the settings store and saves on change, and focuses the entry on the chat key; `MatchAnnouncer` posts template ids with arguments; the lobby's crew talk is a `ChatPanel` over a thin Steam lobby transport. `ChatHud`, `ChatSettingsPanel`, `ChatSettingsData`, `ChatSettingsService`, `LobbyNameColorLink` and `ChatSettingsDefaults.asset` are deleted; the Chat object in `NetworkedScene.unity` carries `ChatView` and `SaboteerChat` over a `Chat.uxml` in the game's look, a `ChatSettings` object carries `ChatSettingsView`; `NetworkAssets.asset` drops the old settings asset; the theme imports `Chat.uss`; the manifest installs Switchboard from its branch.
- **Done:** compiles; the developer plays a two-player session and judges the chat window and the settings page.

### The written result of step 7 (UI4a1, UI4a2, UI4a, 2026-10-25)

Built on this machine in ChatDev (the package, now Switchboard) and SaboteurDev, each driven by its own headless editor through the Unity CLI; the networked bridge (UI4b) was not touched. Switchboard: 62 edit-mode and 14 play-mode tests green, after a second-model review whose ten findings were fixed, the sample played in the dev project and answered `switchboard channels` and `switchboard whisper` through `spellbound_run`. Saboteer: compiles against the Switchboard working tree; the two-player session is the developer's.

| Question the step settled | Result |
|---|---|
| Where Saboteer's limits run | At the sender (`LimitPlacement.Sender`), as the line text says; the library refuses a profile with no placement, and the router applies the limits again only when a profile says `Router` or `Both` |
| Whether a client needs a roster | No. A whisper carries the target's name and the router resolves it; a line carries the speaker's name; the lobby's crew talk needs none either |
| How a typed verb becomes an operation | `VerbRouter` builds an `OperationInvocation` from the catalogue's description: leading words fill the arguments, the remainder is the last text argument, the typing session fills `--session`. The library's own operations say nothing on success, so a typed `/w` shows the whisper line and nothing else |
| Whether the chat corruption above U+00FF is gone | The thin layer sends Core-packed bytes (UTF-8 inside the payload); the packing test round-trips `日本語 🙂`. The two-player session confirms it on the wire |
| What a notice looks like | A marker in the `Notice` role, then UI's template span: literal text plain, arguments emphasised. UI's template span cannot carry a role for its literal text (raised for UI) |
| Chat settings | One section, `switchboard.settings`, bound into Saboteer's settings store beside the HUD layout and saved half a second after the last change; the lobby keeps the library defaults |

Settings taken are listed in the Switchboard pull request. Raised for UI: the template span's literal role. Not run: the 6000.3 floor row; `packagecheck check` (LV2 is step 14).

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

## The stories of step 25: ArtPipeline core (A1a, A1b)

Step 25 creates ArtPipeline, the line's art tool: the rules as the project's assets, the checks and their importer repairs, the verdict window with its picture, the folder audit, the reference sample and Keep as a new material. Seventeen stories: A1a nine, A1b eight. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. One new repository, `ArtPipeline` (clone `ArtPipelineDev`, package at `Packages/ArtPipeline`), made from the template; no other repository changes. Steps 14 and 15 ran at the same time in other sessions.

Applies to every story of the step:

- **Rules:** a Tool: editor only, one assembly `Spellbound.ArtPipeline.Editor` in namespace `Spellbound.ArtPipeline`, depending on Core and Core.Editor and nothing else. Names spelled out, one type per file, no comments or XML docs, the copyright line on every C# file, logging through Core, the studio's Rider formatting. No value a game tunes is a constant: sizes, budgets, name patterns, severities, the check budget and every colour of the picture are fields with defaults.
- **Rules:** a game's rules are its own assets; nothing in the package names a game, a folder, a socket or a material. The studio's default kinds and palette are Studio.Presentation's bridge and are not built here. A gap in another package is raised and stops its story.
- **Regression contract:** Core's surfaces are used as they are (`ValidationReport`, `ValidationRun`, `IAuthoredDefinition`, drafts, operations, `HeaderBar`, `ReportView`, `SectionCard`, `[SerializeReferenceDropdown]`); `core validate`, `core help` and `core context` keep working with the new group and types in them; a project with no rule set imports every file exactly as Unity would; the template's managed files are unchanged apart from the initialiser's own edits and the manifest's Core line.
- **Done, for each story:** compiles clean in ArtPipelineDev through the Unity command line, the edit-mode tests pass, and the pull request's report lists what landed.

### A1a-1 The package from the template

- **Outcome:** ArtPipelineDev made from the template with `initialise-package.sh ArtPipeline "Exports art, a model or a texture." --kind tool`: the package at `Packages/ArtPipeline`, the front door `ArtPipelineKit` in the editor assembly, the operation group `artpipeline`, the edit-mode test assembly, and the sample at `Samples~/Reference`.
- **Verified (2026-10-27):** the template's manifest names Core `#beta`, which Core does not have; the dev project follows `#dev` as every other dev project does.
- **Done:** the empty package compiles and `core help --group artpipeline` lists the group.

### A1a-2 Rule sets and rows

- **Outcome:** `ArtRuleSet` (scope, rows, patterns that are not art, the artists' application, whether the window opens on first import, the rules folder, the check budget, window style sheets), `ArtRuleRow` (pattern, kind, the palettes the game adds, reference figure), `ArtPathPattern` (`*`, `**`, `?`, case-insensitive), `ArtRuleBook` and `ArtRule`. A path belongs to the rule set whose scope pattern matches it most closely; inside it the first row whose pattern matches and whose kind reads the file wins; a row whose kind waits in the drafts folder is inactive.
- **Rules:** several rule sets may sit in one project, so a sample's rule set judges only the sample.
- **Done:** tests for matching, specificity, file-type fall-through, ignore patterns, draft rows and validation.

### A1a-3 Kinds, palettes and the authoring contract

- **Outcome:** `ArtKind` (what it reads through `IArtSubjectReader`, an up direction, an ordered `[SerializeReference, SerializeReferenceDropdown]` list of `IArtCheck`, palettes) and `MaterialPalette` (folders of materials); the rule set, kind and palette implement `IAuthoredDefinition`, and a kind's report nests each check's own validation under `checks[i]` and names a check class that no longer exists.
- **Done:** tests for each validation code; `core validate` reports the three types.

### A1a-4 Subjects and the check seam

- **Outcome:** `ArtSubject`, `ModelSubject` (bounds in the model's placed frame, triangles, meshes, nodes, material slots, embedded textures, bone names) and `TextureSubject` (source size, alpha); `IArtCheck`, `ArtCheck<TSubject>` with a severity field, `IArtFix`, `IArtImportRequirement`, `ArtHint` (a plain hint and hints named by application), `[ArtFinding]`; `ArtChecker.Evaluate` and `Check` return Core's `ValidationRun` with each finding stamped with its check and each check's milliseconds as a `ValidationTiming`.
- **Done:** a custom check, fix, requirement, reader and anchor each swapped in by a test.

### A1a-5 The model checks

- **Outcome:** `ScaleCheck` (size along the kind's up against a range; fixes Convert Units or the Scale Factor when the importer is the cause), `AxisCheck` (a quarter turn about X on the root, fixed by Bake Axis Conversion while it is off, or on a mesh, hinted; baking at first import is a kind's choice, off by default, since the bake can change a rig's bone rotations), `PivotCheck` with `BaseAnchor`, `CentreAnchor` and `NodeAnchor`, `TriangleBudgetCheck`, `LevelsOfDetailCheck`.
- **Verified (2026-10-27):** `ModelImporter.generateMeshLods` exists in 6000.3.10f1's editor module, so the check needs no version define.
- **Done:** a passing and a failing case for each, and each fix clearing its finding.

### A1a-6 The material, texture and naming checks

- **Outcome:** `MaterialSlotCheck` (slot names against the row's palettes then the kind's; a same-named palette material is remapped by its fix; an unknown slot offers Pick and Keep; a name held by two palettes warns once and the game's wins), `EmbeddedTextureCheck`, `TextureSizeCheck`, `NormalMapCheck`, `ColourSpaceCheck`, `AlphaCheck`, `NamingCheck` (file and material patterns, copy numbers ` (1)` and `.001`) and `ImporterPresetCheck` (a Unity preset compared with the importer, skipping the file's own data and the preset's excluded properties).
- **Done:** a passing and a failing case for each.

### A1a-7 Importer repairs and first-import application

- **Outcome:** `ArtChecker.Fix` (every fixable finding or one code, with a dry run) and `PickMaterial`; `ArtImportWatcher` applies a kind's import requirements when a file is imported for the first time and queues every judged import; `ArtCheckQueue` checks one file at a time inside the rule set's budget per editor update; `ArtVerdicts` keeps the verdicts.
- **Verified (2026-10-27, 6000.4.8f1):** `AssetImporter.importSettingsMissing` is true in `OnPreprocessModel` and `OnPreprocessTexture` for a file with no meta and false on a reimport, so a new `_Normal` texture arrives as a normal map and a new Z-up model arrives baked under a kind that bakes at first import, and a reimport never applies a requirement again.
- **Done:** tests for first import, no second application, fix and dry run.

### A1a-8 The unmatched report

- **Outcome:** a model or texture under a rule set's scope that no row covers and no pattern marks as not art gets the warning `artpipeline.unmatched`, naming the folders whose kinds take that kind of file; `artpipeline unmatched` lists them across the project.
- **Done:** tests for the finding and the list.

### A1a-9 The artpipeline operations

- **Outcome:** `check [--measure]`, `fix [--code] [--slot] [--pick] [--keep]`, `explain`, `codes`, `unmatched`, `rules`, `kind-new` and `kind-add-check` (both through the drafts folder), each a result led by its status word; `check` answers `failed:` when a file has an error finding.
- **Done:** tests for each status and the `approver` refusal; the operations read once through `spellbound_run`.

### A1b-1 The verdict window

- **Outcome:** Window > ArtPipeline, a docked UI Toolkit window that follows the Project selection: Core.Editor's `HeaderBar` with one sentence in the artist's words ("Fix before sending", "Worth fixing", "Passes every check of Prop"), Core.Editor's `ReportView` with the hint named by the rule set's artist application and the Fix, Pick an existing material and Keep as a new material buttons, a progress line ("Checking 23 of 167"), and the slowest check. It opens itself on the first judged import of a session unless the rule set turns that off, and never in batch mode. Its look is a style sheet of classes and custom properties, set as the window script's default reference, plus the style sheets a rule set lists.
- **Done:** compiles; the views build without a panel in a test; a person judges the window.

### A1b-2 The verdict picture

- **Outcome:** `ArtPicture` draws the model in a neutral clay finish beside the row's reference figure on a ground grid, with the pivot's axes and the kind's anchor marked and the height labelled, through `PreviewRenderUtility` and the active pipeline's default material, cached as a PNG under `Library/Spellbound/ArtPipeline/Pictures`; with no figure set, the picture says a person must set one on the row; `artpipeline preview <path> --out <file>` writes it.
- **Done:** the picture of every sample model written and looked at.

### A1b-3 The Inbox

- **Outcome:** every model and texture imported in this session that is not passing, with its worst severity and summary, kept across domain reloads; a click selects the file and shows its verdict.

### A1b-4 The folder audit

- **Outcome:** `ArtAudit` and `artpipeline audit <folder> [--offset] [--limit]`: the files under a folder grouped by finding code with their counts, and how many are red, amber and passing.

### A1b-5 Keep as a new material

- **Outcome:** `ArtChecker.KeepMaterial` and `artpipeline fix --keep` (audience `approver`): the slot's own material becomes one file in the first folder of the row's first palette, and the slot uses it. It refuses with a sentence when the row adds no palette, when that folder cannot be written, when the kind's naming check rejects the name, when a material of that name is in the palette already, and for a caller without `approver`.
- **Verified (2026-10-27, 6000.4.8f1):** `AssetDatabase.ExtractAsset` writes the material file and adds the slot's remap itself; after the reimport the embedded material is gone. `AddRemap` is not needed for Keep.

### A1b-6 The reference sample

- **Outcome:** `Samples~/Reference`: a neutral rule set over the sample's own folder (metres, Y up, a humanoid kind, a prop kind, a texture kind), a palette of six materials, a reference figure, and six models that each break one rule, plus a texture that breaks one.

### A1b-7 The export card

- **Outcome:** each check describes its rule in one sentence; the window shows the kind's card under the findings and `artpipeline rules` prints every kind's card.

### A1b-8 The docs page and the AI context

- **Outcome:** `Documentation~/index.md`, the README, the boundary sheet, and `AGENTS.md` under the six headings with its generated operation block and the ledger rows U-052 and U-053, moved from the studio's ledger with this step's evidence.

### The written result of step 25 (A1a, A1b, 2026-10-27)

Built on this machine in ArtPipelineDev, driven by a headless editor through the Unity command line on 6000.4.8f1. The package compiles clean on 6000.4.8f1 and 6000.3.10f1, and its 568 edit-mode tests pass on both. The sample's nine files audit as designed: three to fix before sending, four worth fixing, two passing.

| Question the step settled | Result |
|---|---|
| Does `importSettingsMissing` work in the preprocess hooks | Yes, on 6000.4.8f1: true in `OnPreprocessModel` and `OnPreprocessTexture` for a file with no meta, false on a reimport. A new `_Normal` texture arrives as a normal map and a new Z-up model arrives baked under a kind that bakes at first import. Not run on 6000.3 or 6000.7 |
| How Keep makes a material file | `AssetDatabase.ExtractAsset` writes the file and adds the slot's remap itself; after the reimport the embedded material is gone. `AddRemap` serves Pick only |
| What a reimport of 167 models costs | 167 sample-sized models (5.8 MB): first import 2.5 s, a forced reimport 1.9 s (about 11 ms each), the checks 0.38 s with the slowest file at 20 ms. Changing the hook's version reimports every model and texture of a project, so the hook keeps its version |
| What installing the package costs a game | Unity reimports every model and texture once when a model or texture hook first appears: 733 files in 3.7 s in ArtPipelineDev, mostly small package icons. Saboteer holds about 430 models and 250 textures and Corsairs about 90 models and 2,230 textures under Assets, so each pays one longer import the first time it installs ArtPipeline; later code changes to the package do not repeat it |
| Whether the Mesh LOD members exist on the floor | Yes: `generateMeshLods` is in 6000.3.10f1's editor module, so the check carries no version define |
| How a Z-up file arrives | A single-node file is turned 270 degrees about X on its root; a file with several top-level parts gets the turn on each part. The axis check treats both as one fixable finding |
| What Unity reports for a file's units with Convert Units off | `fileScale` reads 1, so the file's own unit cannot be read; the scale check tries centimetres, millimetres, inches and feet and offers the importer fix when one of them fits the kind's range |
| Where the window's style sheet comes from | A default reference in the window script's meta file, so the package loads it without a path; a rule set adds its own after it |

Raised: none against another package. Not run: the 6000.3 floor compile; the window in a person's editor, which a batch editor cannot open; the hint wording inside Blender and Maya; `packagecheck check`, which step 14 builds.

## The stories of step 8: the train reaches the games (UI4c, LM, LS)

Step 8 lands Core's assemblies, the references, the console and the chat in both games on one day. Corsairs takes a compile-only cut-over of its console view and chat glue onto UI's console and Switchboard, and both games' manifest lines and lock files follow the layout move and the branches the line now uses. Four stories: UI4c two, LM one, LS one. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Two repositories change, each on a branch of its own: Corsairs (`ui-kit-and-switchboard` into `main`) and Saboteer (`train-lock` into `main`). No package repository changes; step 13 ran in Core at the same time and merged first.

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 7 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs in new code, logging through Core, the studio's Rider formatting, the game's own copyright line on new game files; a gap is raised and stops the story; the lead never touches git). A game edits no package; what it needs and a package lacks is raised.
- **Rules:** compile-only means Corsairs compiles and keeps the behaviour it had wherever the new parts allow; the rest of its conversion is other epics' (its commands as operations in CL3b, its chat on Switchboard.Networking and its layout glue on Persistence in UI4b).
- **Rules:** a game's change starts from the game's `main`, never from a person's working branch. Corsairs' checkout sat on a working branch with uncommitted work, so the step was rebuilt on `main` in a throwaway copy outside every repository and compiled there; the checkout was given back as it was.
- **Rules:** on the train day each game's lock moves every package the train carries (Core, the packages that took L1r's references, Inventory and Decals for the layout move, UI and Switchboard for the console and the chat) to the head of the branch its line follows; every other pin stays where the game's `main` has it. No `file:` line is left in either manifest.
- **Verified (2026-10-27):** the heads the train pins are Core `dev` 9e7fc0c (step 13's merge), UI `beta` 0e1c93d, Switchboard `beta` 32dae18, Persistence `beta` 1077a65, Inventory `main` 012b62a, Decals `main` a529bff, GeoForge `dev_1.0` fbd5aee and Modifiers `main` d3348df. Corsairs `main` at c1dc4c96 follows Core at the old address, Inventory at the old address, Chat and UI on `main`, and pins Modifiers at 7141af2 (before the rename of `ModifierPool` to `ModifierTable` at fdaaa75) and GeoForge at 0571f59 (before `IGeoEditStore` traded `DefaultVoxelDataFunc` for `geoChunkEngine` at 07c46ad5); during the hand-over `main` gained e9c8fd4e, which takes the GeoForge change and pins GeoForge at 07c46ad. Its console is a game `ConsoleView` over Chat's `ConsoleWindowController`, its chat a `ChatHudView` over Chat's `ChatWindowController` and a 211-line `ChatNetwork`, both on `Player HUD Canvas.prefab`; its HUD layout is section 1 of the old Persistence package's `local` save, written in UI's earlier layout format (a format byte, then the records). Saboteer `main` at 89889d8 already carries the path-form lines for Core, Decals, Inventory, UI, Switchboard and Persistence (steps 6 and 7) and pins Core at e0ca89f, Decals at f5fdc49 and Inventory at c6e3a5a, with no Switchboard entry.
- **Verify before building on it:** whether Corsairs builds a dedicated server. None was found in the build pipeline or the project settings; UI's Widgets and Screens carry `!UNITY_SERVER`, so a server build would not compile while Corsairs' game assembly uses UI.
- **Regression contract:** Corsairs compiles on `main` with the train and its edit-mode tests pass; every scene, prefab and asset that used a moved or deleted UI or Chat type resolves or is rewired, with no missing script left; the HUD shows the chat by default and hides it on death; the chat key focuses the entry only while the chat shows, Enter sends and returns control to the game, Escape and the chat cancel key leave the entry, typing never drives the player; whispers and `/me` work; the console opens on the console key with the console input map, Escape and the close keys close it, and it hides the other views; a HUD layout saved by an earlier build does not throw; the four themes keep their look and cascade order and the cast bar keeps its interrupted and fizzled flashes; the settings tabs still switch Video, Sound and Binds; the mastery card's milestone chain, the start menu's hero buttons and the talent tree's maximize and pan-zoom still work; the crafting and digging pools still load. Saboteer compiles with the train and plays as after step 7.
- **Done, for each story:** compiles clean through the Unity CLI in the project named, tests pass where the project has them, and the report lists what changed and what was raised.

### UI4c-1 Corsairs on the UI kit and the new console

- **Outcome:** Corsairs' code and UXML use `Spellbound.UI.Widgets` and `Spellbound.UI.Screens`; the four themes import the kit's sheets from `Runtime/Widgets/Theme` and take what UI no longer ships as the game's own (the window chrome, the menu families as `MenuBase.uss`, the slot styles, the milestone chain with its binder, the maximize and pan-zoom manipulators, and the templates the start screen holds: hero button, character row, world row, icon tile, portrait tile, stat row, which keep their asset ids), each sheet imported in the slot the library's sheet had, so the cascade keeps its order; every token sheet declares under `.sb-theme`, views get the class from UI and the three documents that are not views (nameplate, tooltip, menu tooltip) register their roots with `UIKit.Themes`; the cast bar declares its own end-state classes; the settings tabs move to Unity's `TabView`; the HUD's console is UI's `ConsoleView` with the input context `corsairs.console`, and `CorsairsInputContexts` is the one class that switches input maps for UI; the HUD layout moves to section 2 of the `local` save, so a layout saved by an earlier build is not read and the HUD shows its default once.
- **Done:** compiles on `main` with the train; the theme sheets import with no invalid path; no scene, prefab or asset holds a reference into a package version the train replaced; the start screen plays with no error; the console view carries the console context.

### UI4c-2 Corsairs' chat onto Switchboard

- **Outcome:** `ChatNetwork` is the thin PurrNet layer Saboteer uses (the host runs the router, lines travel as Core-packed bytes, one `TargetRpc` per receiver); `CharacterDisplayNameSource` names the player from the character save; `CorsairsChat` connects the session when the HUD is built, binds Switchboard's `ChatView`, focuses the entry on the chat key only while the chat shows, clears and blurs it on the chat cancel key and turns the entry's `RefocusAfterSubmit` off so Enter returns control as before; `CorsairsSwitchboard.asset` holds `general` (`g`, `gen`, 20 lines kept for late joiners) on the everyone scope and `whisper` on the direct scope, the old chat's verbs `w`, `whisper`, `tell`, `t`, `r`, `reply`, `me`, `em`, `emote`, one tab, and runs its limits at both ends; `ChatView` takes the chat's place among the HUD's default views; `ChatHudView` and the game's `ConsoleView` are deleted; the manifest installs Switchboard from `beta` and drops Chat.
- **Done:** compiles on `main` with the train; the HUD prefab shows `ChatView` among its default views and no missing script.

### LM-1 Corsairs' manifest lines follow the layout move

- **Outcome:** Corsairs follows Core (`?path=/Packages/Core#dev`) and Inventory (`?path=/Packages/Inventory`) in the path form and installs the Unity Pipeline package; its lock moves Core, Inventory, UI, Switchboard, GeoForge and Modifiers to their heads and keeps Controller and the old Persistence where `main` has them; the consumer update the moved Modifiers pin needs comes with it (`ModifierPool` to `ModifierTable` in the crafting commands and the two modifier pool assets); GeoForge's (`IGeoEditStore.geoChunkEngine` in the sync module and the networked chunk) reached `main` in e9c8fd4e with the same lines.
- **Done:** Corsairs resolves and compiles on `main`; the pull request lists the final lines.

### LS-1 Saboteer's manifest lines follow the layout move

- **Outcome:** Saboteer's lines already took the path form with steps 6 and 7, so the manifest does not change; the lock moves Core, Decals and Inventory to their heads and gains the Switchboard entry it never had; its other pins are already at their heads.
- **Done:** Saboteer resolves and compiles; the pull request lists the final lines.

### The written result of step 8 (UI4c, LM, LS, 2026-10-27)

Built on this machine. Corsairs was rebuilt on `main` in a throwaway copy outside every repository and driven by its own headless editor through the Unity CLI; Saboteer was resolved and compiled in its own checkout. Corsairs: compiles clean, 124 edit-mode tests green, the four themes import with no invalid path, and of 365 text assets the 42 unresolved references all predate the step (none points into a package version the train replaced); the start screen plays with no error. Saboteer: compiles clean, no test assemblies. Both pin Core at 9e7fc0c.

| Question the step settled | Result |
|---|---|
| Which branch Corsairs' change starts from | `main`. The checkout was on a working branch 19 commits ahead with uncommitted work, so the step was rebuilt on `main` in a throwaway copy and compiled there; the checkout went back to the developer's state |
| Whether Corsairs' `main` compiles on the train by itself | No. The train's Modifiers renamed `ModifierPool` to `ModifierTable` and its GeoForge changed `IGeoEditStore`; only the working branch had followed. The Modifiers lines come with LM; the GeoForge lines reached `main` from a teammate (e9c8fd4e) while the step was handed over, and `main` at e9c8fd4e plus the step rebuilds the verified copy file for file |
| Which pins move | Only the packages the train carries. Moving Controller to its head as well broke Corsairs' camera and movement code, which follows Controller's older API on `main` |
| What Corsairs' console runs | Core's, UI's and Switchboard's operations. Chat's old console went with Switchboard, so Corsairs' own commands (crafting, items, player, `ui theme`, WorldForge, build stress, instance data) are not reachable until CL3b converts them |
| What happens to a HUD layout saved by an earlier build | It is not read. UI's layout store dropped its format byte, so the earlier bytes throw `ArgumentOutOfRangeException`; the layout moved to section 2 of the `local` save, the old section is dropped on the next save, and the HUD shows its default once |
| How the shapes UI no longer ships reach Corsairs | As the game's own copies from UI's `main`, imported in the slots the library's sheets had; the window chrome's icons come from the kit's `Runtime/Widgets/Icons` |
| What the compile did not show | `MainMenuCanvas.prefab` holds five of UI's removed templates by asset id (character row, world row, icon tile, portrait tile, stat row): character creation threw and the icon picker failed on the start screen. The templates came over with their original ids, so the prefab is untouched; a reference scan over every scene, prefab and asset, not only scripts, is what found them |
| How Corsairs' chat behaves after Enter | The entry blurs and the game has the keys again, as before; Switchboard's entry refocuses by default and the kit's `RefocusAfterSubmit` is the door |
| What the review found | Run on Opus because Fable was at its limit. Corsairs' old chat took `/whisper`, `/reply`, `/em` and `/emote`, and the profile now has them (Saboteer's step 7 profile does not; reported in its pull request). Escape drops the chat draft again. Inventory's drag ghost sits on the panel's root, outside every themed root, so a dragged item loses its slot frame: raised for Inventory, not worked around |
| Temporary `file:` lines | None in either game, and none was added this step |

Raised: Inventory's drag ghost needs a layer the consumer chooses. Not run: the 6000.3 floor row; `packagecheck check` (LV2 is step 14); a networked session in either game.

## The stories of step 14: runner, window shell, first inspectors (LV2, LV4a, UI7c1, UI7c2)

Step 14 gives the line its checker and its window: PackageCheck, the twenty-third package, a Tool in a new repository, with the read tier of the bar and the Check page; the Spellbound window shell and `PackageIdentity` in Core.Editor; the agent context contract with its generator and its names check; and three inspectors in UI Toolkit. Sixteen stories: LV2 ten, LV4a three, UI7c1 two, UI7c2 one. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Three repositories change, each on a branch of its own: Core (into `dev`), GeoForge (into `dev_1.0`) and PackageCheck, a new repository made from the Template's working tree, whose first commit is the template and whose package arrives as a pull request on top of it. No game changes.

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 13 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows without the developer's hand). No JSON is parsed or written: `package.json` and assembly definitions are read by text match, as Core already reads them, and `Identity.asset` is read from its YAML lines.
- **Rules:** PackageCheck is a Tool: one editor assembly `Spellbound.PackageCheck.Editor` constrained on Core's define, referencing `Spellbound.Core` and `Spellbound.Core.Editor` only; the front door `PackageCheckKit` in `Spellbound.PackageCheck`; the operation group `packagecheck`; a `Bootstrap` assembly with no references; no `Runtime` folder and one test folder.
- **Rules:** a rule is one class deriving from `LineRule`, found by `TypeCache`; its tier, decision and maturity are open id sets, not enums; every value a rule reads (the name prefix, the id prefix, the foundation, the organisation address, the line text address, the floor) comes from a `PackageCheckValues` asset whose defaults are neutral, and a rule that names the foundation answers "not applicable" when the values name none. The studio's own rules (C1, C2, C3 and the leads C9 and C11) and the studio's values are Studio.Tools' (LV3b): this step builds the 37 neutral rules of the read tier that read files, and the studio's values asset sits in PackageCheckDev's `Assets/_Project/Settings` until Studio.Tools takes it.
- **Rules:** every `.asset` this step adds is made through Unity's own pipeline from the Unity command line (rule 24); the fixture identities under `Tests/Fixtures~` are copies of such an asset.
- **Verified (2026-10-27):** Core `dev` is at 9e7fc0c (step 13's merge) and CoreDev's working tree equals that commit's tree (tree 287127ff) plus three editor-written settings files; it holds the four shared controls in `Spellbound.Core.Controls.Editor`, the check seam (`IDefinitionCheck<T>` over a `ScriptableObject`, `RegisteredDefinitionCheckAttribute`, `DefinitionCheckRegistry`, `DefinitionValidationRunner`, `ValidationRun`), `GeneratedBlock`, `AgentContextFile`, `AgentContextBlocks`, `CoreEditorOperations.Refresh` and `PipelineBridgeRanges.Read()`. Core.Editor is one assembly with namespaces `Spellbound.Core.<Feature>.Editor`; Core's tests are one editor assembly over a flat `Tests` folder.
- **Verified (2026-10-27):** `LogConfigEditor` (319 lines, the old editor system, `Spellbound.Core.Logging.Editor`) finds sinks by scanning `AppDomain.CurrentDomain.GetAssemblies()` on every repaint, rewrites the sink list from inside `OnInspectorGUI` and logs through `Debug.Log`; Core's ledger row U-018 names it as Moved.
- **Verified (2026-10-27):** GeoForge's repository is `GeoForgeDev/Assets/GeoForge` on `dev_1.0` at fbd5aee, clean, with one runtime assembly and no editor or test assembly. `MaterialSideTableEditor` (the old editor system) and `MaterialSideTableUtility` (the menu items `Spellbound/GeoForge/Validate All Material Side Tables` and `Sync All Material Side Tables`) sit inside `Runtime/Scripts/BlobsAndSOs/MaterialSideTable.cs` under `#if UNITY_EDITOR`; the runtime types `MaterialSideTableBase` and `MaterialSideTable<TData>` are read by `GeoForgeManager.GetMaterialData<TData>` in builds, so they stay where they are. Saboteer has four subclasses (footstep audio, impact effects, impact particles, tooltips). CoreDev's project ledger row U-057 names `MaterialSideTableEditor` as Moved.
- **Verified (2026-10-27):** no `PackageCheck` repository exists in the organisation; the Template's `main` is at 1a9b2ac, its `initialise-package.sh` makes a tool by moving the front door into the editor assembly, and its `skeleton-version.txt` records `none`. Saboteer's lock pins Core at 9e7fc0c; the Corsairs working tree, on a teammate's branch, pins Core at c41bdb6. No .NET SDK is on this machine, so every compile is the Unity command line's.
- **Verify before building on it:** that a `ScriptableObject` type declared in an editor assembly can be the main object of an asset inside a package folder and loads through `AssetDatabase` (the identity type lives in Core.Editor); that one `[CustomEditor(typeof(MaterialSideTableBase), true)]` UI Toolkit inspector serves every closed generic subclass, as the old one did; what the read tier costs on the largest package of the line.
- **Regression contract:** Core's edit-mode and play-mode tests pass; `core validate`, `core context`, `core ledger` and `core unity-ledger` answer as before; the inspector banner still shows a definition's report; a `LogConfig` asset still sets the global level (with its one-line description), the log file name, the Unity log capture and each sink's enabled flag and filter level (offered only at or above the global level, never None), Undo still reverts each change, and Apply still writes the `SPELLBOUND_LOG_*` defines for the selected build target while keeping every other define; the sinks listed are the same set the old inspector found.
- **Regression contract:** GeoForge compiles and its runtime is unchanged apart from the editor classes that leave the runtime file (the two table types keep their names, fields and script GUID); a material side table still shows its database, entries and fallback, Sync and Validate still work from its inspector, and the two menu items still exist; Saboteer's four tables keep their data, since no asset or script GUID changes. Neither game changes, and no package other than Core, GeoForge and PackageCheck changes.
- **Done, for each story:** compiles clean through the Unity command line in the dev project named, its tests pass, and the pull request's report lists what landed.

### LV2-1 The PackageCheck repository

- **Outcome:** `PackageCheckDev` exists beside the other repositories, made from the Template's working tree as `gh repo create --template` would make it and initialised as a tool; `Packages/PackageCheck` holds `package.json` (`com.spellboundstudios.packagecheck`, the line's sentence, floor 6000.3, no dependencies, the sample entry), `README.md`, `CHANGELOG.md`, `LICENSE.md`, `AGENTS.md` under the six headings, `Documentation~/index.md` and the boundary sheet, `Editor/Spellbound.PackageCheck.Editor.asmdef` with `PackageCheckKit`, `Bootstrap/` (an editor assembly with no references, one class and one address file: with Core missing it writes one console line naming Core's install line and opens one non-modal window per editor session for every package together), `Skeleton~/Bootstrap` (the same files with the package name as a placeholder), `Tests/Editor` and `Samples~/PackageCheckSample` (the Template's sample folder, holding a house rule of the reader's own). The dev project's manifest installs Core from GitHub at `#dev` and lists the package under `testables`.
- **Rules:** the developer initialises and publishes the repository with one script: the template commit on `main`, then the package as a reviewable pull request on top; managed files are not edited, so the template's sync keeps working.
- **Done:** PackageCheckDev opens on 6000.4.8f1 through the Unity command line with no compile error, and the package's tests pass.

### LV2-2 `PackageIdentity` in Core.Editor

- **Outcome:** `PackageIdentity` in `Spellbound.Core.Packages.Editor` is the type of `Identity.asset` at a package's root: `kind`, `layer`, `status`, `job`, `frontDoor`, `mustNotOwn`, `hotPath`, `deterministicOutput`, `simulation`, `machineMatchedJobs` and `skeletonVersion`, with `JudgmentFields` naming every field but the last. It implements `IAuthoredDefinition` (an empty job, kind or front door, an id that is not lower-case kebab, an unknown status, an empty list entry and a negative skeleton version are findings under `core.identity-*`), so `core validate --path Packages/<Name>` and the inspector banner report it. `PackageIdentity.Find(folder)` loads a package's identity. Core gets its own `Identity.asset`: foundation, the line's sentence, front door `CoreKit`.
- **Rules:** no field is derived from code (dependencies, bridges, operations, samples and the version are not in it); `machineMatchedJobs` is the list `DeterministicFloatModeScan` will be given when V5 reads it (LV3b).
- **Done:** edit-mode tests on every finding, a clean identity, `Find` on Core's own asset, and `core validate --path Packages/Core` naming the identity.

### LV2-3 The Spellbound window shell

- **Outcome:** `SpellboundWindow` in `Spellbound.Core.Window.Editor` opens from `Window/Spellbound`; a page is a class deriving from `WindowPage` and marked `[WindowPage(title, order)]`, found by `TypeCache` through `WindowPages` (a type source the tests replace), sorted by order then title, the first of two pages with one title kept and the second logged; the window lists the pages in a column, shows the selected one through `WindowPage.CreateContent()`, remembers the selection across reloads, and says in plain words when no page is installed; `SpellboundWindow.Open(title)` opens it on a page. It never opens a modal.
- **Rules:** plain UI Toolkit with `sb-window` classes and no stylesheet asset, so UI.Editor skins it and Unity's default look shows otherwise; Core.Editor registers no page of its own in this step (Line, Package, Operations and Drafts are LV6's and CL7's).
- **Done:** edit-mode tests on discovery, order, the duplicate, a custom page (`WindowPage_CustomImplementation`) and the empty state.

### LV2-4 The runner, the report, the values and the classifier

- **Outcome:** `PackageCheckKit.Check(folder)` reads a package folder from disk once into `PackageUnderCheck` (its files, its `package.json`, its assembly definitions with their roles, its identity, the line of packages around it) and runs every rule into a `LineRun`: a Core `ValidationReport` of findings (code `packagecheck.<rule>`, the rule's label stamped as the check), one `RuleResult` per rule (passed, must fix, please confirm, waived, not applicable, not run), the timings and the text whose first word is `failed` when a fact failed. `LineRule` carries an identifier, a title, a group, a revision, a tier, a decision and a maturity; `RuleTier`, `RuleDecision` and `RuleMaturity` are readonly structs with named defaults. `IAssemblyClassifier` gives each assembly its roles (Editor, Tests, Samples and Bootstrap by name and folder, Bridge when a version define names another package, Presentation from a type list in the values or a `!UNITY_SERVER` constraint, Simulation only when the identity names it), with `AssemblyClassifier` as the default. `PackageCheckValues` holds the line's values; `PackageKind` assets hold a kind's id, default layer, required files and folders and whether it has a runtime, and PackageCheck ships foundation, library and tool. `SourceText` strips comments and string literals so a banned name inside either is not a hit; `BannedTextRule` is the base of every text rule.
- **Rules:** a finding of an enforced fact is an error ("must fix"), of a lead or an advisory fact a warning ("please confirm"), of a waived subject information ("waived", shown and not counted); a rule that throws is reported as `packagecheck.rule-threw` and the run goes on.
- **Done:** edit-mode tests with a custom rule (`LineRule_CustomImplementation`), a custom classifier (`AssemblyClassifier_CustomImplementation`), custom values and a custom kind, and on the text readers.

### LV2-5 The fixture harness

- **Outcome:** `Tests/Fixtures~` holds two passing families and one failing overlay per rule. `Line` is a family with a foundation (`Basis`, a foundation; `Ropes`, a library; `Inspect`, a tool) under its own prefix and values; `Plain` is a family with no foundation (`Gadget`, a library), where every rule that names the foundation answers "not applicable". A failing overlay is the files that differ from a passing package plus a list of files to remove; the harness copies a family into a temporary folder, applies an overlay and runs one rule.
- **Done:** a test asserts every shipped rule has an overlay that fails it with its own code and passes on both families, so a rule cannot ship without its fixtures.

### LV2-6 The identity and layout rules

- **Outcome:** I1 (the identity exists, its kind is a known kind, its job is one sentence, its status is valid), I2 (folder, id, display name, root namespace and author address agree), I3 (the files and folders the kind requires), I4 (nothing that must not ship: `Resources`, `Samples` without the tilde, maintainer files, `.git`, a ledger, and no file a Git client without LFS cannot fetch), I5 (assembly names and namespaces under the package's name), I6 (the bootstrap equals the skeleton's at the recorded version), I7 (the skeleton version is within two of the latest, advisory) and I8 (every file has a `.meta` and every `.meta` a file).
- **Rules:** `Surface.txt` joins I3's list when the surface writer exists (LV3b).
- **Done:** each rule's failing overlay fails it and both families pass it.

### LV2-7 The dependency and bridge rules

- **Outcome:** D2 (a reference to another package of the line is a bridge unless the sentence names it), D3 (every bridge names a bounded range and its define is its constraint), D4 (no bridge points up the layer order), D5 (references by name), D6 (`unity` is the floor and every dependency version a plain version), D8 (every assembly that references the foundation is constrained on it, all on one bounded range), D10 (the chain from the foundation is at most the depth budget), D11 (a declared Unity package the running editor ships as an engine module, a lead) and D12 (an assembly that references a `!UNITY_SERVER` assembly carries the same constraint).
- **Rules:** a rule that needs another package's identity or assembly definitions reads them from the line of packages installed in the project, or from the family in the harness; where one is missing the rule says so.
- **Done:** each rule's failing overlay fails it and both families pass it.

### LV2-8 The code, test, sample, documentation, cost and waiver rules

- **Outcome:** C4 (logging through the foundation's logger), C5 (no fixed `Resources` path, `GetInstanceID`, object finds, `Camera.main`, or tag or layer by string in a runtime assembly), C6 (no engine clock or random in a simulation assembly), C7 (an assembly that names presentation types carries `!UNITY_SERVER`), C8 (static mutable state has a reset, a lead), C10 (tunable literals, closed enums and switches in a runtime assembly, a lead), C12 (no static mutable state in a simulation assembly), C13 (no `AppDomain` use); T1 (the kind's test folders and their assembly settings), T4 (no test reads sample content), T5 (a hot-path package has a `_NoAllocation` test, a lead); S1 (`Samples~` and the `samples` entries match), S2 (a sample reaches no internal surface), S4 (an imported working copy equals `Samples~`); V1 (the changelog's top entry is Unreleased or the version, dates in ISO form), V2 (`Documentation~/index.md` is not empty), V4 (licence and third-party notice, a lead), V6 (the version equals the changelog's newest released entry); P2 (no serialized trace or log switch); W1 (no waiver past its version, no answer for an older revision of its rule).
- **Rules (settled in the build):** C4 leaves out test assemblies, since a test calls the engine's log to test capture, and, on the foundation only, the folder of the type the values name as its logger, the one place that writes to Unity's console. P2 does not apply to the foundation, which holds the observation settings it sends tracing to, and matches whole words of a field's name. V1 and V6 read the headings the release writes (`# [1.2.0](compare link) (2026-10-28)`) as well as hand-written ones.
- **Done:** each rule's failing overlay fails it and both families pass it.

### LV2-9 The Check page, the menu and `packagecheck check`

- **Outcome:** PackageCheck registers the window's Check page: a picker of the project's own packages (embedded or local; the package cache is never scanned) and a folder field, a header with the summary in plain words, a section per group with one row per rule (identifier, title, state word) and each finding drawn by Core's `ReportView` with its location opening the file at its line, and the rows of a package's own checks, named by the check. A package's own checks are the checks Core.Editor's seam registers over `PackageIdentity`, run against the package's `Identity.asset`. The page reruns when a file of the package it shows is saved. `Spellbound/Check Package` opens it. `packagecheck check [--path <folder>]` answers with the same text, `failed:` when a fact failed.
- **Done:** edit-mode tests on the page's rows from a fixture run, the seam's checks (with a custom check swapped in through a `DefinitionCheckRegistry` of its own) and the operation through `CoreKit.Operations`; the developer judges the first run of the page.

### LV2-10 The ledger, adopt, baseline and the read-tier budget

- **Outcome:** `PackageLedger` (waivers, answers and gates) lives at `Assets/_Project/Ledger/<Name>.asset` and never ships. `packagecheck adopt --path <folder> --kind <id> --job "<sentence>" --front-door <type>` writes a missing identity and ledger, prints the line text address and runs the bar once; `packagecheck baseline --path <folder> --rule <id> --ends-at <version> --reason "<text>"` records today's hits of a rule as one grouped waiver ending at a version, so a new hit fails and a removed one shrinks it. The read tier is timed on the largest package of the line and its budget becomes a value with a default and an acceptance test.
- **Done:** edit-mode tests on adopt (refused when an identity exists, previewed on a dry run), on a baseline that waives today's hits and fails a new one, on W1 with an expired waiver, and the budget test.

### LV4a-1 The `AGENTS.md` contract and A3

- **Outcome:** A3 reads a package's `AGENTS.md`: the six headings in order, the Rules section naming the line text address from the values and carrying no copy of the line text, and inside Front door the generated blocks on disk and current (`operations` when the package has an operation group, `doors` when it has a bridge door, `samples` when it ships samples, `depends`, and `pipeline` naming the supported range of the Pipeline package, never one version).
- **Rules:** a block is current when its hash matches its body and its body equals what the generator renders now, so the generated text and `core context` cannot disagree; the freshness half needs the compiled catalog and is marked unverified while the compile is stale.
- **Done:** the rule's failing overlay fails it and both families pass it; Core's and PackageCheck's own files pass it.

### LV4a-2 The generators and `packagecheck fix --rule A3`

- **Outcome:** `packagecheck fix --path <folder> --rule A3` writes the generated blocks into `AGENTS.md` on disk through Core's `GeneratedBlock`, inserting a missing heading in its place and leaving every hand-written line as it was; `--dry-run` answers `previewed:` with the blocks it would write. The operations and doors blocks are the ones `core context` writes; samples, depends and pipeline are new.
- **Rules:** the supported Pipeline range is read from Core's bridge assembly definition (`PipelineBridgeRanges.Read()`), the one place CL2 wrote it.
- **Done:** edit-mode tests run the fix twice against a temporary file and assert the hand-written lines survive and the second run changes nothing; Core's and PackageCheck's `AGENTS.md` are written by it.

### LV4a-3 The names-resolve check A4

- **Outcome:** A4 reads every backticked span of `AGENTS.md` and `README.md` outside fenced code, the generated blocks, the Gaps section (which names what is not built yet) and the Ledger section; a span that is a dotted name beginning with a capital (a type, a member, a call, a generic) must resolve in the package's loaded assemblies or, failing that, in any loaded assembly, and a span whose first word is an operation group must name an operation of that group; anything else (paths, status words, arguments, snippets) is not a name. A miss is a fact with the file and line.
- **Rules:** A4 needs the compiled surface and is marked unverified while the compile is stale; the Ledger rows are A11's (LV4b).
- **Done:** the rule's failing overlay fails it and both families pass it; Core's and PackageCheck's files pass it or their misses are fixed in this step.

### UI7c1-1 Core's log settings inspector

- **Outcome:** `LogSettingsInspector` in `Spellbound.Core.Logging.Editor` replaces `LogConfigEditor`, which is deleted: a UI Toolkit inspector bound to the asset's serialized fields, one `SectionCard` per section (log level with its description, file output, Unity log, sinks), each sink a toggle and a filter level offered only at or above the global level; Apply writes the defines through `LogLevelDefines`; sinks are found through `TypeCache`, once, when the inspector opens; the message goes through Core's logger.
- **Done:** edit-mode tests on the defines per level, the merge that keeps foreign defines, the filter choices and the inspector's sections; Core's ledger row U-018 stops resolving its type.

### UI7c1-2 GeoForge's material table inspector

- **Outcome:** GeoForge gains `Spellbound.GeoForge.Editor` (`Editor/`, editor only, constrained on Core's define) holding `MaterialTableInspector`, a UI Toolkit inspector for every material side table (the default fields, then a card with Sync and Validate whose problems show in the inspector, not only in the console) and `MaterialTableMenu` with the two menu items; `MaterialSideTableEditor` and `MaterialSideTableUtility` leave the runtime file; the first test assembly `Spellbound.GeoForge.Editor.Tests` covers the inspector over a fixture table.
- **Rules:** edited in GeoForgeDev only; the runtime types and their script GUID do not change; the new assembly needs Core's controls (Core `dev` at 9e7fc0c or later).
- **Done:** compiles in GeoForgeDev, its tests pass; the ledger row U-057 stops resolving its type wherever GeoForge is installed.

### UI7c2-1 The identity asset's inspector

- **Outcome:** `PackageIdentityInspector` in Core.Editor draws `Identity.asset` from the Core.Editor controls, grouped as Living's table groups it (what the package is, what it must not own, how it is checked, the skeleton), every judgment field marked as needing the code owner's review, the kind, layer and status offered as choices, and the identity's own report beneath, refreshed as a field changes.
- **Done:** edit-mode tests on the groups, the judgment marks and the report's refresh; the developer judges it on Core's and PackageCheck's identities.

### The written result of step 14 (LV2, LV4a, UI7c1, UI7c2, 2026-10-27)

Built on this machine in CoreDev, GeoForgeDev and the new PackageCheckDev, each driven by its own headless editor through the Unity command line, after a second-model review (Opus, since Fable's quota was spent) whose 25 findings were 21 fixed, one fixed in part and raised, one written into the stories and two raised, each listed in the pull requests. PackageCheck: 218 edit-mode tests passed. Core: 637 edit-mode tests, 633 passed and 4 skipped for want of a graphics device, and 8 play-mode tests passed. GeoForge: 4 edit-mode tests passed. The three inspectors and the Check page were built and tested headless; the developer judges them in a live editor.

| Question the step settled | Result |
|---|---|
| Whether a type in an editor assembly can be a package's `Identity.asset` | Yes. Core's and PackageCheck's identities, made through the Unity command line, load through the AssetDatabase and `PackageIdentity.Find` |
| How the checker reads a package it does not compile | From disk: assembly definitions and `package.json` by text match, C# with its comments and strings masked, `Identity.asset` and the ledger through `InternalEditorUtility.LoadSerializedFileAndForget`, which reads Unity's text form outside the AssetDatabase, a temporary fixture copy included. Every rule gives the same result on the fixture families with LF and with CRLF line endings |
| What the read tier costs | Core, the largest package of the line in the project (854 files): 458 ms on the first run after a compile, 138 ms warm. GeoForge (458 files) 84 ms, PackageCheck (534 files) 59 ms, warm. The budget value defaults to 1000 ms |
| When a package counts as compiled | When it is registered in the open project or sits inside it. A package a `file:` line links from outside the project counts, so its compiled checks run; the first run on Core in PackageCheckDev found the opposite and was fixed |
| Whether one UI Toolkit inspector serves every closed generic material table | Yes. `[CustomEditor(typeof(MaterialSideTableBase), true)]` draws a `MaterialSideTable<T>` subclass, as Saboteer's four tables are |
| What a headless editor can test of an inspector | The element tree and its first values. Without a panel `Bind` fills nothing and neither change events nor `TrackSerializedObjectValue` fire, so the live-refresh tests skip in a `-nographics` editor |
| Whether the generated text and `core context` agree | Yes. `packagecheck fix --rule A3` in PackageCheckDev and `core context` in CoreDev render Core's operations block with the same hash, and a second fix changes nothing |
| How the foundation meets C4 and P2 | Its logger's folder is the one place that writes to Unity's console, and its observation settings hold the trace switches the line sends every package to. C4 leaves out the folder of the type the values name as the logger, and only on the foundation; P2 does not apply to the foundation; a test may call the engine's log to test capture |
| The first run of the bar | PackageCheck passes its own: 35 passed, 4 not applicable. Core: 13 must fix, 3 to confirm, 15 passed, 8 not applicable. GeoForge, checked by folder from outside its project: 13 must fix, 2 to confirm, 14 passed, 5 not applicable, 5 not run. The two lists are the packages' adoption backlogs, written out in their pull requests |

Settings taken are listed in the pull requests. Raised: the released commit fails A3, because the generated operations block names the package's version; Core's logger has no sink outside play mode; the Template has no PackageCheck manifest line, records no skeleton version, has no third-party notices section in its licence, and its `update-skeleton.sh` must fill the skeleton's new `COPYRIGHT_LINE` token; CoreDev's manifest has no PackageCheck line. Not run: the 6000.3 floor row; the run and line tiers, which are LV3a's.

## The kickoff prompt for step 1

Send this to a fresh session. The optional line grants one preview aid; remove it if you do not want to grant it. Step 1 has no user-facing strings, so there is no wording list to skim.

```
Load the lead-engineer and library-design skills and follow them.

Build step 1 of the Roadmap in the line folder of the organisation's .github repository (Roadmap.md,
with Line.md and Brief.md beside it): stories L1-1 to L1-6 and L1r-1 to L1r-3, Core as assemblies and
every consumer's references. Work in /d/dev/unity/spellbound/CoreDev, and for L1r only the assembly
definitions and the temporary manifest line named in the stories in GeoForgeDev, ChatDev, ModifiersDev,
the VolumetricFog development project (verify its folder name), WorldForgeDev and the game projects.
Read the Roadmap fully first, then the Line text's sections on Core and the rules of the line, then the
Core sections of Areas/Line.md beside it, the area file the step names. Read
nothing else.

The plan is not the product. Nothing in it was run. Facts marked "verify before building on it" are
leads: check them in the code before relying on them.

You own the delivery. Use subagents where the work really splits, review every diff yourself, and
walk every regression contract before you report. Never touch git; leave everything in the working
trees. If a gap belongs in another package, say so in the report and stop that story.

Optional: you may create one throwaway Unity project outside every repository for the Core-only
compile and the rebuild measurement, and run the Unity CLI against the projects named above; nothing
else outside them.

Stop after step 1. Do not start L1-7 or anything else. End with the report the Roadmap asks for,
the list of evidence you need from me, and "ready to test".
```

Then one follow-up prompt per remaining step, sent only after the evidence for the step before has been sent and the developer has said to continue:

```
Continue with step N of the Roadmap: <the epics and parts in the step's row>. Same rules as before.
Stop after step N.
```

Step 2 starts with L1-7 and is sent as: "Continue with step 2 of the Roadmap, starting with story L1-7. Same rules as before. Stop after step 2." A step that names a pitch, a spike or a probe stops at its written result; the developer's answer is part of the evidence.

## The report each step ends with

Every step ends with the report defined in the line text ("The report a build step ends with"): stories with a status word, the regression contract walked line by line, compile and tests with counts, measurements beside the computed figures they replace, settings taken with their defaults, gaps raised, strings proposed and not changed, each "verify before building on it" fact confirmed, changed or unchecked, files changed, evidence needed, the developer's by-hand checklist for the Unity Editor, and "ready to test" as the last line. This plan adds two lines to it:

1. **Cost:** gates used against the step's gates in the table, tokens used against the plan's figure for its epics, and, once sprint 1 has run, the measured gate rate and token rate so the plan can be re-issued.
2. **Stop:** which item of the step's "Stop and wait for" column is the evidence the lead needs, so the developer can send it and say to continue.

Since 2026-10-25 the full report is the pull request's body and the chat carries three parts (the decisions that need the developer, what changed against the plan, the developer's move); the merge is the sign-off, as the line text says under "The report a build step ends with". Steps whose "Waits for steps" are all merged run side by side, one session per step on its own branch and dev project, never two in one repository at once.


## What to read

A builder reads this file in full, the line text for the packages, the rules of the line and the shared conventions, and the brief only to learn what the line is. For the step being built, the builder also reads the sections of the area file that the step's epic ids name (the list under the build steps), because the design of each epic lives there and only step 1's stories are written out here; the step's own stories are written from those sections at the step's start and approved before the first is built. Nothing else of the pitch is a source: where a fact is marked "verify before building on it", check the code, not the pitch.
