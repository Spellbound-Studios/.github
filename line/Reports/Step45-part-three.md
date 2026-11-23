# Step 45, part three: the saved world spike (W70-1, Roadmap#179; W6b-1, GeoForge#164, closed as not needed)

Run 2026-11-23 by the step runner from `_probes/handoff-45-part-three/runner`. One pull request, `.github` into `main`, carries `line/Stories/Step45.md` and this report. Four tasks: two design tasks and one verify on Opus at high effort, one human gate; the plan, the catalogue (two sessions) and the sign-off on Fable. Nothing was committed to any code repository, no editor was opened and nothing was measured: every figure is computed from a layout read in the code at a named line or cited from step 27 and step 31. The evidence is in `_probes/handoff-45-part-three/runner`: `plan.md`, `catalogue.md`, `questions.md`, `answers.env`, `briefs/`, `results/`, `evidence/` (`catalogue`, `spike-saved-world`, `verify-spike`, `page-saved-world`), `stories/Step45.md` and `verdict/`; the decision page is `artifacts/studies/2026-11-23-saved-world/page.html`.

## The shape of the work

Part one's decision, read as the sentence at `Stories/Step45.md:268` and confirmed by his answer at `:295`, is Go, so this part builds W70-1 alone, writes no W6b-1 task and names GeoForgeDev in no task. W70-1 is a spike planning story: it reads what a save holds today in Persistence, what a saved world would have to hold in GeoForge's edit store, WorldForge's seed and definitions and WorldObjects' records, and writes the plan for the saved world in five rulings and one decision. The repositories were read at pinned commits through `git show`: GeoForge `dev_1.0` 22c814440b02aa62427a558b541aed133b4ac12e through the catalogue's read-only worktree, Persistence `beta` 61dfe8a6eb67f5406f5289bc4dce34643e4073ce, WorldForge `main` 4d750211d69ef8da369859b57eb2417014fe26c4, WorldObjects `beta` 7426e29644e19d4583bbc92ad38e944397f815b5, and Core 819a9853e25b as GeoForgeDev locks it. The developer answered do not store at 14:30.

**The catalogue** (`catalogue.md`, two sessions, $4.19) confirmed the precondition (GeoForge's `dev_1.0` 22c8144 carries `Spellbound.GeoForge.FarField` and compiles clean against its own lock on the second compile) and found eight contradictions the plan answered: the prompt's Roadmap line numbers stale by eight to ten and its World numbers by two; row 44 names no fingerprint section story; WorldObjects' `main` is the template shell and its head is `beta`; `VoxelData`'s summary says it is never saved while every edit saves it; the pitch's `Saves.UpgradeAll(string kind)` is `UpgradeAll(string kind, ObservationContext observations)` in code; GeoForge's own volume save carries an integer `SaveFormatVersion`; the stories file's lock line is WorldForgeDev's.

**The developer's answers** (`answers.env`): the result lives in the stories file's written result and this report, the superseded area lines listed with replacement sentences for a later queue row, no area file edited (question 1); the sizes are computed from the layouts and cited from steps 27 and 31, no editor opened, GeoForgeDev not worked in (question 2).

## The tasks and their checks

**The spike** (`spike-saved-world`, Opus, $3.36, 1 attempt, 176,407 context max, 15 checks). Check 1: the status of `.github`, GeoForgeDev, PersistenceDev, WorldForgeDev and WorldObjectsDev before and after, diffed, nothing printed, exit 0 (every file empty except WorldObjectsDev's, 872 bytes both times). Check 2: `grep -c "ApronVoxels = 3"` on `ChunkLayout.cs` 1. Check 3: `{ get; }` in `SectionHeader.cs` 3, `tick` 0. Check 4: `UpgradeRegistry.Add(string sectionName, uint fromFingerprint, SectionUpgradeStep step)` 1. Check 5: `git grep -il fingerprint` over WorldForge's `Runtime` empty. Check 6: eight headings in `saved-world.md`. Check 7: the decision line 1, the W7-6 and W7-7 sentence 1. Check 8: `4,496,182` 8, `601,526` 2, `85,750` 1, `2,147,483,647` 2. Check 9: `computed` 19, `Step27.md:117` 1. Check 10: area line references 17, verdict words 17. Check 11: the stories copy's first 313 lines diffed against `git show origin/main:line/Stories/Step45.md`, nothing, the part three heading 1. Check 12: part one's sentence 1, `GeoForge#164` 1, bold leads 10. Check 13: em dashes 0 in every written file. Check 14: `GAP:` 3 against three rows under Gaps raised. Check 15: the column check on the catalogue worktree against `dev_1.0`, nothing printed, exit 0. Checks 3, 5 and 13 record raw exit 1 from a grep that passes on zero.

The spike's rulings. A save stores, beyond the seed, the world fingerprint and the deltas: the world's identity with the fingerprint's parts (the game's identity section, `corsairs.world.identity` in Corsairs today, cited from `Stories/Step31.md:124`), the edit store's overrides as absolute `VoxelData` values keyed by flat index (`GeoForgeChunkData.cs:13`, `:46` to `:53`), WorldObjects' live instances and deleted generated placements (`WorldObjectsSection.cs:43` to `:68`), and progress. The world fingerprint is not Persistence's layout fingerprint (`SectionCatalog.cs:61` to `:65`, `StableHash.Fnv1A32` over a type's packed field lines); it names the seed (`WorldLayout.cs:9`), the content of every definition the layout reads, because the height noise reads no seed (`WorldSampling.cs:247` to `:255`) and the seed only picks which biome owns a Voronoi cell (`:318` to `:335`), WorldForge's generation version, which does not exist, and GeoForge's chunk size and voxel resolution (`VoxelVolumeConfig.cs:28`, `:33`), because the edit store keys overrides by flat index inside that layout; 32 bits, FNV-1a, the parts stored beside the combined value, 28 bytes once; and it is the value the game passes as `VoxelEditSource.BaseFingerprint` (`VoxelEditSource.cs:39`). The section's header is `Name`, `LayoutFingerprint` and `Length` and nothing else (`SectionHeader.cs:4` to `:13`, `StoreCodec.cs:24` to `:29`); a stored-base section, if ever built, carries no format version and no tick rate, against GeoForge's own `SaveFormatVersion = 1` pattern (`GeoVolumeEngine.cs:16`, `:878` to `:904`). The upgrade registry upgrades a changed layout (`UpgradeRegistry.cs:20`, `Saves.cs:213` to `:224`); a changed generator is not a layout change, so the game compares the world fingerprint at load and on a mismatch reports the parts that differ and the regions that hold saved changes, repairing nothing; adding the fingerprint's fields moves the identity section off `04a2a257`, so a released game registers one step that copies the old identity and marks the parts unknown.

The decision line: do not store, because a dense base at chunk size 128 is 4,496,182 bytes a chunk (computed, 131 x 131 x 131 x 2), so one store holds at most 477 of them before `StoreCodec.Encode` refuses it (computed, 2,147,483,647 / 4,496,182) and a world of a thousand dug chunks cannot be saved at all (4,496,194,000 bytes); because a stored base keeps the inside of a dug chunk but not the ground of the chunks around it; and because a change in what a seed generates is a major version after 1.0 (`Areas/World.md:622`). Under do not store a save adds nothing beyond today's edits but the fingerprint's 28 bytes once; a dug chunk costs 16 + 6 x edits bytes as `ChunkSaveEntry` packs it, 400 bytes at 64 edits. The only measured stored voxel form, step 27's sparse runs, was about 16 times the dense array of the same volume (`Stories/Step27.md:117`, 9,652,637 / 601,526), so no compression was counted on. W7-6 and W7-7, the stored-base stories, are given as signature blocks for step 47 and are not built.

**The verify** (`verify-spike`, Opus, $1.43, 1 attempt, 120,882 context max, 10 checks). Check 1: the spike's checks 2 to 15 re-run with the same counts, plus the status loop into its own files with every diff empty and the catalogue worktree's status empty. Check 2: the head diff of 313 lines empty. Check 3: the decision lines in `saved-world.md` and the stories copy compared, `same`. Check 4: the sizes recomputed by `python -I`, `85750 601526 4496182 477`, and their counts in `sizes.md` 1, 2, 8, 1. Check 5: three `GAP:` lines at `saved-world.md:39`, `:41`, `:85`, each naming WorldForge or GeoForge and a backticked member. Check 6: eighteen citations read at the pinned commits (`evidence/verify-spike/citations.md`), among them `ChunkLayout.cs:10`, `SectionHeader.cs:5` to `:7`, `WorldSampling.cs:247` to `:255` with no `seed` argument, `VoxelEditSource.cs:39`, `StoreCodec.cs:35` to `:38`, `UpgradeRegistry.cs:20`, `Saves.cs:213` to `:224`, `GeoVolumeEngine.cs:16`, `WorldObjectsSection.cs:43` to `:68`, `WorldLayoutBuilder.cs:236` to `:244`, `Packer.cs:448` to `:452` and `:496` to `:501`. Check 7: game nouns in `saved-world.md` 7, each a citation of a game's store or config today and none inside a code block. Check 8: bold leads after line 313, 10. Check 9: the spike's result file 35 lines with `STATUS=passed`. Check 10: the column check silent. Recomputed by hand: the 41-byte header, the 28 fingerprint bytes, the 52-byte record, the three store totals, 4,287.9 MiB, the 16.05 ratio, 749,363 edits, 400 bytes at 64 edits. No suite ran, because no code was written and the brief forbids an editor.

**The page** (`page-saved-world`, Opus, $1.21, 1 attempt, 95,624 context max, 11 checks). `Decision required` 2 (title and heading); `<button` 2; the two cost sentences word for word 1 and 1; the question word for word 1; `The spike recommends: do not store.` 1; readings, sizes, files, lines and hashes 0; em dashes 0; 16 visible sentences in `page-text.md`; the index line 1 and last in `artifacts/index.md`; the cost sentences equal to the spike's section 6; the column check silent. The page keeps the roadmap word step off its visible text; both answer pills share one colour.

**The gate** (`human-saved-world`). The lead judged the page done at 13:55. His answer at 14:30: do not store. The save records edits and changes only, everything else is generated from the seed, as the game already did; he called the question needless, since the game's existing behaviour decided it. W7-6 and W7-7 are not built.

## Final counts

| Reading | Value |
|-|-|
| Commits to any code repository | 0; every checkout's status equal before and after the spike and at the verify |
| Column check on the catalogue worktree against `dev_1.0` | silent, exit 0, three times |
| Stories copy against `origin/main:line/Stories/Step45.md` | 313 lines equal, then the part three section |
| Dense base at chunk size 128 | 4,496,182 bytes a chunk (computed); 85,750 at 32, 601,526 at 64 |
| Dense bases one store holds | 477 (computed against `int.MaxValue`) |
| Fingerprint bytes in the identity section | 28 once (computed) |
| Edit payload a chunk | 16 + 6 x edits bytes; 400 at 64 edits (computed) |
| Step 27's sparse form against the dense array | 16.05 (cited, `Stories/Step27.md:117`) |
| Citations read by the verify at the pinned commits | 18 |
| Gaps raised | 3 (two WorldForge, one GeoForge); Persistence 0 |
| Area lines superseded or confirmed | 6 superseded in `Areas/World.md`, 5 ranges confirmed in `Areas/Persistence.md` |
| Compile and tests | not run; no code written |

## Findings and how each was resolved

The verify's three nits: `VoxelVolumeConfig.cs:57` already holds `internal int ChunkSize => chunkSize`, so the gap's proposed `public int ChunkSize { get; }` would repeat the name (resolved by the sign-off: the stories copy and this report word the raise as making `:57` public and adding `Resolution` beside it; the evidence file keeps the spike's words); the `IGeoEditStore` signature block carries no access modifiers (accepted: it follows the code's form at `IGeoEditStore.cs:11` to `:39` and sketches a story not built); the brief's status loop keyed by basename overwrote GeoForgeDev's status file with the catalogue worktree's (both empty, nothing hidden; raised for the runner).

The sign-off's four (`verdict/round-1-findings.md`), signed off with none sent back: the three above, and the verifier's `section.s` in its `bash -c` copies of two checks, where the count is 10 either way (accepted). The sign-off's spot checks at the line: `ChunkLayout.cs:10` and `:14` to `:16`; `VoxelVolumeConfig.cs:28`, `:33`, `:57`; `page.html:92` and `:93` the only buttons, the word step only in the store key at `:215`; `artifacts/index.md:72`.

## Decisions

The plan's answers held (`plan.md`, "Design questions answered"): the decision read from part one's sentence and W6b-1 not built; the result in the stories file and this report; sizes computed, nothing measured; no seam task; the repositories read at pinned commits through `git show`; the catalogue's line numbers over the prompt's; the verify-before facts as checks; the two fingerprints distinguished; the header rule as the code has it; the upgrade path through the registry for layouts and the game's comparison for the generator; the recommendation the spike's and the decision the developer's; the player's cost read from the edit store's shape; the stories copy byte for byte with his answer appended by the sign-off; nothing committed; the page one screen; the report in the roadmap's shape. His answer at the gate: do not store. The plan role's lesson, recorded in the stories file: a question whose answer is the game's existing behaviour is not asked; the spike records it as a ruling and the gate shows the result, not a choice.

## Verify before building on it

- `ApronVoxels = 3` in `ChunkLayout.cs:10`, data width chunk size plus 3: confirmed.
- `SectionHeader` holds three properties and no tick word: confirmed.
- `UpgradeRegistry.Add(string sectionName, uint fromFingerprint, SectionUpgradeStep step)`: confirmed.
- No fingerprint in WorldForge's runtime: confirmed.
- `Saves.UpgradeAll` takes `(string kind, ObservationContext observations)`: confirmed, the pitch's one-argument form changed.
- Corsairs' terrain config uses chunk size 128: confirmed, read only.

## Raised

- WorldForge: `public const int GenerationVersion` on a public static class of `Spellbound.WorldForge` is missing (`Packages/WorldForge/package.json:3` the only version, 0.0.1); blocks the world fingerprint's generator part.
- WorldForge: `GeneratedWorldFingerprint` and `GeneratedWorldFingerprintParts` in `Spellbound.WorldForge.GeoForge`, with the content hash of a built `WorldLayout`, are missing (`saved-world.md:50` to `:83` gives the shape); blocks the world fingerprint in the identity section.
- GeoForge: `VoxelVolumeConfig` has no public read of its chunk size or voxel resolution (`Packages/GeoForge/Runtime/Scripts/BlobsAndSOs/VoxelVolumeConfig.cs:28`, `:33`, `:57`); make `ChunkSize` at `:57` public and add `public float Resolution => resolution`.
- GeoForge: the stale summary at `Packages/GeoForge/Runtime/Scripts/DataTypes/VoxelData.cs:12`.
- The line, for a later queue row: `Areas/World.md:466`, `:540`, `:622`, `:623`, `:624` superseded with the replacement sentences in `evidence/spike-saved-world/area-lines.md`; `Areas/Persistence.md:55`, `:57` to `:62`, `:65`, `:67`, `:69` to `:73` confirmed. `Areas/World.md:624` allows the fingerprint's parts to change once when the spike ends; this list is that change.
- Step 47: W7-6 and W7-7 are not built on do not store; W7 reads the world fingerprint from the identity section once WorldForge carries it.
- Runner: a status loop keyed by a checkout's basename collides with a worktree of the same name; key by path.
- Persistence: nothing missing.

## Cost by stage

| Stage | Dollars | Sessions | Context median | Context max |
|-|-|-|-|-|
| plan (Fable) | 6.07 | 1 | 115,631 | 173,437 |
| catalogue (Fable) | 4.19 | 2 | 103,697 | 161,997 |
| design tasks (Opus) | 4.57 | 2 attempts over 2 tasks | | 176,407 (the spike) |
| verify (Opus) | 1.43 | 1 | 94,717 | 120,882 |
| triage | 0.00 | 0 | | |
| total before the sign-off | 16.26 | | | |

Design tasks by task: spike-saved-world 3.36 (1 attempt), page-saved-world 1.21 (1).

## Not run

Any editor, compile or test; any measurement of a stored base or a save time (ruled out by answer 2); W7-6 and W7-7 (not built on do not store); W6b-1 (closed as not needed); the RTX 4060 run (Roadmap#181, the later act); any edit to an area file (a later queue row).
