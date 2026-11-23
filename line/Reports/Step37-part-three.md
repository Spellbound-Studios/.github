# Step 37 part three: the raw writers closed and Corsairs on transactions (R6b-5, R6c-1 to R6c-5)

Built 2026-11-23 by the step runner from `Planning/PackageLine/Prompts/Step37-part-three.md`. Two repositories built, one read: Inventory in `_probes/Inventory37c` on `r6b-raw-writers-closed` from `origin/main` 91f589c (two commits); CorsairsIsleDev in `_probes/Corsairs37c` on `r6c-corsairs-transactions` from `origin/main` 2b667645 (four commits); SaboteurDev in `_probes/Saboteur37c` for one compile that committed nothing. Core and Networking read through the locks. No human gate: the regression reading is the tests and the compiles (plan A9, answer 4). The two pull requests merge in the same hour.

## Tasks

| Task | Kind | Attempts | Result |
|-|-|-|-|
| inventory-seam | seam | 1 | passed |
| verify-inventory-seam | verify | 1 | passed, no finding |
| inventory-sample | build | 1 | passed |
| verify-inventory-sample | verify | 1 | passed, no finding |
| corsairs-seam | seam | 2 (one lead ruling) | passed |
| verify-corsairs-seam | verify | 1 | passed, one note |
| corsairs-bag | build | 1 | passed |
| verify-corsairs-bag | verify | 1 | passed, no finding |
| corsairs-loads | build | 1 | passed |
| verify-corsairs-loads | verify | 1 | passed, two report corrections |
| corsairs-commands-windows | build | 2 (no code change on the second) | passed |
| verify-corsairs-commands-windows | verify | 3 (two on check wording, one lead ruling) | passed, no finding |
| saboteer-closed-compile | design | 2 (one lead ruling) | passed |
| corsairs-closed-compile | design | 3 (one triage) | passed |

## The answers held

The developer answered the plan's four questions with its recommendations: the driver keeps its constructor and `DefaultDropHandler` goes; `Sort` stays public and the chest sorts through the engine; the auto-placed `Mint` with data is raised and the games plan their own slots; the regression reading is edit-mode tests listing contents before and after and reading the audit, the three build scenes opened, and the hosted check is the weekend Steam build. Every brief was held to these and to the fifteen plan answers A1 to A15.

## Inventory, every check

Seam (`inventory-seam`, commit b450703). Five writers `internal` (`InventoryEngine.cs:46`, `:83`, `:186`, `:245`, `:298`), `TryAddItem` without `virtual`, `ExecuteIntraMove` `private` non-virtual (`:329`), `inventoryItems` `private protected readonly` (`:11`); `InternalsVisibleTo("Spellbound.Inventory.Tests")` in `Runtime/AssemblyInfo.cs`; `DefaultDropHandler` removed, `DropHandler` null by default, `?.Invoke` at `SlotInteractionDriver.cs:203`. Before: 0 `error CS`, 388 of 388, `check` 4 must fix, 2 to confirm. Red: 399 run, 9 failed, all new. After: 0 `error CS`, 399 of 399, `Surface.txt` 379 to 371 lines, eight `-member` lines named, no `+` line, `check` 4 must fix, 2 to confirm (one C10 line moved). Verified on a fresh editor (PID 32236): the same counts, the 11 new cases present, none lost, the column check empty. Deviations disclosed: the `## Gaps` heading kept (PackageCheck A3 fails without it, 5 must fix read once); two base signatures of 122 and 123 columns wrapped in `SlotInteractionDriver.cs:78` and `:152`.

Sample (`inventory-sample`). Raw writer grep over `Samples~/Demo` 0; seven `[Test]` cases in `Samples~/Demo/Tests`; `Assets/Samples` absent after the import's deletion; `TryAddItem` in `Documentation~/index.md` 0; "arrived" in the operation description 1 and in `AGENTS.md` 2; `check` 4 must fix before and after; status filter empty; column check empty. Suite 399 without the import, 406 with, 399 after. Red: 2 CS0115 (the old overrides against the closed writers). Verified on a fresh editor (PID 22108): the same, 0 `error CS` without, with and after the import, none of the 388 base tests missing, `packagecheck` through the editor's `spellbound_run` form since it is not on PATH.

## Corsairs, every check

Seam (`corsairs-seam`, commit 7fdfa812). Lock `c092406` to 91f589c by one `Client.Add`, equal to Inventory `main`, manifest unchanged. The lock move produced 7 `error CS` (`PlayerBagEngine.cs:103`, `:156`, `:172`, `PlayerInventory.cs:103`, `EquipmentInventory.cs:84`, `CraftingConsoleCommands.cs:114`, `:177`), each renamed `SetItemAt` to `TrySetItemAt` and nothing else (A15). Edit mode 792 base, 792 moved, 817 after (25 seam tests: reasons 4, inventory 4, placement 8, transfer 6, world door 3). `inventory audit` base "no operation", moved "no inventory accounts are live". Red 5 `error CS`. The lead ruled during the seam (01:55): `CorsairsWorld` compiles in the World assembly and cannot see Assembly-CSharp, so the seam types went into a new `Spellbound.CorsairsWorld.Inventory` asmdef referenced from the World asmdef by one line, and `ContainerTransfer.TryCommit` takes an `IItemInfoProvider`. Verified (PID 39424): 817 of 817, 7 `corsairs.` reasons, 5 type files, no scene search, column check empty, no new static field.

Bag (`corsairs-bag`, R6c-1). Closing-member grep on `PlayerBagEngine.cs` empty; `Engine.Sort()` in `InventoryWindowView.cs` 0; `InventoryTransaction` in the bag 5; suite 827 (10 new); red 7 CS1061. The four sort fixtures were run through the base `Sort` override before the change and recomputed by hand by the verifier (PID 38080): they match. Slots change only through `transaction.Move` (`:430`) and `transaction.Swap` (`:446`) in one transaction (`:187`) after a dry run on a copy (`:176`).

Loads (`corsairs-loads`, R6c-2 and R6c-3, commit 9f9ee7af). Closing-member grep on the four files empty; `SaveLoad` present in each load file; suite 847 (20 new: bag load 11, equipment load 5, equip transfer 4); red 20 CS0117 and 4 CS1729. Verified (PID 13656): 847 of 847, column check empty. The verifier corrected two report claims: three working copies are LF (the index stores LF as the base does, so the commit matches), and the equipment load's "behaviour change" is an improvement (the base already refused on `CanAcceptItem` and lost the item; the new load sends it to the overflow).

Commands and windows (`corsairs-commands-windows`, R6c-4 and R6c-5, commit 9bd4b594). Closing-member grep over `Assets/_Project` empty; `Engine.Sort()` in `SharedInventoryWindowView.cs` 1; em-dash and scene-search loops empty; manifest Networking count 0; suite 863 (16 new: crafting 5, spawn 2, chest 4, award 3, throw 2); red CS0117. The verifier failed twice on its own check wording (scene names anchored where the probe prints paths; a static-holder grep matching method parameters); the lead amended both checks (04:40) and the third run passed (PID 29180): 0 `error CS` after the scene probe, three scenes with `missingScripts=0`, 863 of 863.

Closed-writer compiles. Saboteer against `_probes/Inventory37c/Packages/Inventory` by a `file:` line: 0 `error CS` at the lock, with the line, after the restore; manifest and lock byte equal to the committed copies; 0 commits. The lead ruled the StartScreen LFS pointers and the panel settings asset known rewrites. Corsairs the same: 0, 0, 0; the triage ruled the two UI Toolkit settings assets line-ending rewrites and the task closed on the amended filter. The `file:` line resolved only after `UnityEditor.PackageManager.Client.Resolve()`; `AssetDatabase.Refresh` alone left the PackageCache in place.

## The regression contract

| Reading | Count |
|-|-|
| Inventory edit mode | 388 before, 399 after, 406 with the sample, 0 lost |
| Corsairs edit mode | 792 before, 792 after the lock move, 817, 827, 847, 863, 0 lost |
| `error CS` | 0 on every editor of every task and both `file:` compiles |
| Build scenes | 3 opened, 0 missing scripts |
| `Surface.txt` | 8 member lines removed, none added |
| `packagecheck check` | 4 must fix, 2 to confirm before and after |
| Raw writers under Corsairs' `Assets/_Project` | 7 before, 0 after |
| Column check | empty on every task |
| Commits | Inventory 2, Corsairs 4, Saboteer 0 |

## Sign-off findings and how each was resolved

Six story reads on Opus produced seventeen findings; the lead checked each at its line and ranked them. No bar break; no fix round.

1. No game container registers with the accounts (`PlayerInventory.cs:87`, `EquipmentInventory.cs:67`, `SharedInventory.cs:27`), so the in-game `inventory audit` reports a mismatch for every item held while the containers and commits are correct. Ruled: the writer configuration of step 43 decides which containers the accounts count (as Saboteer part two registered the chest only where the machine has authority); the chest's file is outside every allowance of this part; the balanced reading is the tests' (A9). Raised, and stated in the Corsairs body.
2. `ContainerTransfer.cs:28` to `:49`: an empty source swaps the destination's stack into itself. Unreachable: `SlotInteractionController.cs:51` refuses a pointer down on an empty slot, `InventoryUi.TryThrowStack` refuses an empty slot, the equip action and the controller move a held stack. Raised.
3. `PlayerBagEngine.FollowMovedStack` (`:132`) is right only after an applied transfer. Held: `InventoryUi.cs:170` to `:175` returns on a refused commit first, and it is the only caller. Raised.
4. `PlayerBagEngine.cs:146` to `:159`: the two-favourites swap is unreachable after `TryRebindFavorite`, and the test named for it proves the rebind. Raised.
5. The sample's red reading is the sample assembly's compile break, not the new tests failing. Accepted: the test assembly could not compile behind the broken sample; the brief's check asked for `error CS` lines. Raised for brief wording.
6. `DemoInventoryActions.cs:96` to `:101` commits a no-op swap of two full equal stacks. Accepted at sample scale. Raised.
7. `TryShrink` mints one transaction per displaced stack where the brief read as one. Ruled: the per-stack shape stands, since the planner reads the engine and two stacks in one transaction can claim one slot; A14 gives the chest acts the same shape; the audit tests pass.
8. `AGENTS.md:65`: the `Move` data rule. Confirmed against `InventoryTransaction.cs:293` to `:295`: a whole-quantity portion shares the array, a split clones it. Holds.
9. `AGENTS.md:73`: the empty `## Gaps` heading. Accepted; raised for PackageCheck.
10. `SlotInteractionDriver.cs:78`, `:152` wrapped for the column check. Accepted.
11. `ContainerPlacement.cs:24` spells the empty test with a literal where `IsEmpty` covers it. Nit, raised.
12. `FavoritesBag.MoveReservation` moves and never swaps, as the base did. Holds.
13. The sample's sort runs the planner three times. Nit, raised with the sort step.
14. The settle bound `layout.Length + 3` at `PlayerBagEngine.cs:309`. Nit, raised.
15. `CraftingConsoleCommands.TryRewriteFirstSlot` answers refusals through a default receipt. Nit, raised.
16. Five Corsairs test fixtures repeat one setup. Nit, raised.
17. Two inaccurate claims in the loads report, corrected by the verifier. Recorded above.

## Rulings during the run

- 01:20: `saboteer-closed-compile` names SaboteurDev, which the step did not list; SaboteurDev joined the step's repositories read-only for that task.
- 01:55: the Corsairs seam's two blocks (the World assembly cannot see Assembly-CSharp; the quantity that fits needs the item info Inventory keeps internal) ruled as recommended: the new asmdef and the provider argument; a public `TryGetItemInfo` raised for Inventory.
- 04:40: `verify-corsairs-commands-windows` failed on wording alone; the scene path and static-holder checks amended.
- Triage: the two CorsairsWorld UI Toolkit settings assets are line-ending rewrites; check 5 of the Corsairs compile excludes them.

## Facts that changed

`CorsairsWorld` compiles in `Spellbound.CorsairsWorld.World`, not Assembly-CSharp, so a game type the world must see needs its own assembly. `InventoryEngine.TryGetItemInfo` is internal at 91f589c. `PortionOf` shares the data array for a whole-quantity move and clones it for a split. A `file:` manifest line resolves only after `Client.Resolve()`. `packagecheck` is not on PATH in the runner, so checks run it through the editor. The editor rewrites `player_template_penguin.asset`, the two UI Toolkit settings assets, DOTweenSettings and three ProjectSettings files with empty content diffs in the Corsairs checkout, and the StartScreen LFS pointers and `panel_settings_world.asset` in Saboteer's. The Corsairs index stores LF for every file under `core.autocrlf=true`.

## Raised

- Inventory: the auto-placed `Mint` with data and an auto-placed `Move`; a transaction sort step; a public `TryGetItemInfo` on `InventoryEngine`; a `Move` refusing an equal-stack drop with no room; `TypedInventory`'s identity constructor (standing); a test for the `Move` data rule.
- Core's PackageCheck: A3 requires `## Gaps` even when empty.
- Corsairs, step 43: register the bag, equipment and chest with the live accounts where this machine has authority; the player container's gate binding (UI4b-5, CorsairsIsleDev#190).
- Corsairs cleanups: the empty-source refusal in `ContainerTransfer`; `FollowMovedStack`'s precondition and dead branch; the settle bound; `IsEmpty` in `ContainerPlacement`; the crafting command's refusal value; one act helper for spawn, award and craft; one shared test fixture; the save written after a refused load; the chest's move-all rule untested; XML docs and regions in the other inventory UI files; `CorsairsWorld.cs:1` carries an older copyright header.
- Sample: `Debug.Log` to Core's `Log`; sample tests in the import; the planner run three times.
- Briefs: the `spellbound_run` form for `packagecheck`; a status filter listing every known editor rewrite at plan time; a scene probe check stripping the folder; a static-holder grep matching fields; a column check on a "nothing else changes" file run on the base first; a sample story's red named as the compile break.
- The hosted regression play is the developer's weekend Steam build.

## Models and cost

Plan and sign-off on Fable 5.1; catalogue, seams, builds, verifies, the two compile tasks and the six story reads on Opus at high effort. Before the sign-off sessions $43.87: plan 9.55, catalogue 2.11, seam 8.05, build 13.24, verify 9.81, triage 1.11. Per task: inventory-seam 2.59, verify 1.01, inventory-sample 3.96, verify 1.73, corsairs-seam 5.45, verify 1.11, corsairs-bag 2.97, verify 1.24, corsairs-loads 2.59, verify 1.35, corsairs-commands-windows 3.72, verify 3.37, saboteer-closed-compile 1.61, corsairs-closed-compile 1.65. Context maximum 170,011 tokens (inventory-sample) among the builds, 300,042 in the catalogue's first attempt.
