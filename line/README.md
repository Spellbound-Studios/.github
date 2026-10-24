# The Spellbound package line: what is in this folder

What this is: the plan, the rules and the design of the Spellbound package line, for any person or agent who builds, reviews or extends anything on the line in any repository of the organisation. Date: 2026-10-24. Every date in these files is an estimate the developer is not bound by, every cost is computed and not measured, and the game is Saboteer.

## The three files that bind

| File | What it is | Who reads it |
|---|---|---|
| `Brief.md` | The executive brief: what the line is, what it costs, where it stops, the two milestones, the rules in plain words, what Unity 6.7 and Unity 7 change. Five minutes | A person deciding whether to spend build time, and anyone who has read nothing else |
| `Roadmap.md` | The plan: the 70 build steps with hard stops (69 numbered and the festival's row F), the 119 dated epics with their estimated dates, the undated list and the backlog, the pitches, spikes and probes, the undated list, the backlog, the stories of step 1 and the kickoff prompt | Anyone starting or leading a build session, to find the step and what it waits for |
| `Line.md` | The binding line text: what a builder owns, the kinds, every package with its dependencies, bridges and limits, the rules, the homes procedure, the shared conventions, the accepted limits and the report a step ends with | Every person or agent before touching any package |

These three bind. Every rule in them is decided and is not asked again; anything they leave open becomes a setting with a sensible default, named in the step's report. The board that carries the same plan is the Spellbound Roadmap (organisation project 13), one Epic per epic of the roadmap.

## The design each step is built from

`Areas/` holds the design the roadmap's steps are built from, one file per area, as the pitch left them. A step's lead reads the sections of its area file that name the step's epics (the list under the roadmap's build steps says which file an epic id names), writes the step's stories from them in the format of step 1's stories, and reads nothing else of the pitch. Where a fact is marked "verify before building on it", check the code, not the file.

| File | Area |
|---|---|
| `Areas/Line.md` | The line as the pitch approved it, with the record of how it was reached: the kinds, every package, the homes and stranger tests, Studio, epics L1 to L13, milestones, decisions, limits |
| `Areas/Homes.md` | The homes test: library, Studio or game |
| `Areas/Roadmap.md` | The roadmap owner's file: the scheduler's results, the review deltas and the checkpoint records |
| `Areas/CommandLine.md` | The front door and the command line: operations, the authoring contract, the check seam, the agent context |
| `Areas/Runtime.md` | Shared runtime systems: the simulation vocabulary, observation, reference frames and riding, containment, inventory transactions, the soaks |
| `Areas/Art.md` | The art pipeline: rules, checks, the verdict window, the Character bridge, Send, make playable |
| `Areas/World.md` | The world: the world model, density out, Places, Horizon, boards and generators |
| `Areas/Networking.md` | Networking and scale: the protocol assembly, the PurrNet adapter, region streaming, events and operations, prediction held |
| `Areas/Living.md` | Living in the line: layout and probes, PackageCheck, the agent context, the strangers, the Spellbound window, the gates |
| `Areas/Unity.md` | Unity's own systems against ours: the ledger, pools, the batch path, the WorldObjects store, Instancing, CoreCLR readiness, the probes |
| `Areas/UnityChanges.md` | What Unity 6.7 and Unity 7 change for the two games and the packages |
| `Areas/Pathfinding.md` | Navigation: the spike, the ground field, hierarchy, built things, authoring, ships and decks, following and crowds |
| `Areas/Workflow.md` | Templates and studio workflow: one convention and one board, templates, checks, releases from commits, the release train, selling, the games shipping the same way |
| `Areas/UI.md` | UI, text surfaces and editor tooling: the UI kit, the console, Switchboard, tooltips, input contexts, the editor controls, the ui operations |

Inside the area files a path written as `Revisited/<Area>.md` names the same file under `Areas/`.

## In what order

1. `Brief.md`, if you have read nothing else.
2. `Line.md` in full, before touching any package.
3. `Roadmap.md`, to find your step, what it waits for and what evidence ends it; its kickoff prompt starts step 1.
4. The sections of the step's area file that name its epics, and nothing else.

A session that builds loads the library-design and lead-engineer skills; a deeper pitch loads design-pitch; a review loads red-team. The originals of these files stay under `Planning/PackageLine/Pitch/` in the Spellbound workspace as the record of the pitch.
