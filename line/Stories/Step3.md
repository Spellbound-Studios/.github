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

