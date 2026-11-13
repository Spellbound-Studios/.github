# Step 24, part two: Character.Rig's edit-mode surface (R5a-1 to R5a-5)

Built 2026-11-12 and 2026-11-13 in the worktree `_probes/Character24b` of `Spellbound-Studios/Character`, branch `r5a-rig-surface` from `beta` d25d1b5, and merged by the pull request whose body links here. One repository, thirteen tasks in a chain (catalogue, seam, verify, then five build and verify pairs), each driven by its own headless editor through the Unity command line, never two at once. Plan, triage and sign-off ran on Fable; every other task on Opus at high effort. The evidence is in `_probes/handoff-24b/runner`: `plan.md`, `catalogue.md`, `before.md`, `briefs/`, `answers/`, `results/`, `diffs/CharacterDev.diff` and `verdict/`.

## The stories and their checks

Every build brief carried the same frame: the red run with the tests written and the code absent or stubbed; `recompile_status` with `compilationFailed` false and `grep -c "error CS"` at 0 on the editor log; `run_tests --mode EditMode --filter Spellbound.Character --async_tests true` and `--mode PlayMode`; story greps; the comment grep and the em-dash grep printing nothing; `spellbound_run --result-only --line "packagecheck check --path W/Packages/Character"` with no rule that passed in `before.md` failing; `git status --short` showing only `Packages/Character` (and the ledger in R5a-5) beside `ProjectSettings/ProjectSettings.asset`; `unity close` with the lockfile gone. Every verifier re-ran every check on a fresh editor and read the commit whole.

**Before** (`before.md`, d25d1b5, untouched worktree): edit mode 76 of 76, play mode 1 of 1 (`Assets/Samples` is gitignored, so the Locomotion sample's nine play-mode tests are absent), PackageCheck "2 must fix, 2 to confirm, 2 waived, 39 passed, 8 not applicable, 3 not run; compiled: current": must fix D9 (7 lines) and A1, to confirm C10 (4 lines) and V4, waived A7 and P1 until 2.0.0.

**Catalogue** (Opus, $3.66, 1 attempt, 7 checks passed). 217 lines, ten sections and Contradictions, 149 file-and-line citations. It confirmed that Core's `asset:` argument form resolves in an edit-mode test for assets saved through `AssetDatabase` (Core's `AuthoringOperationsTests.cs:147`, `:155`), that `scene:` resolves through `GameObject.Find` and so never sees a preview scene, and that `unity command <name> --help` prints only the generic help with no editor connected. Seven contradictions, the first that the thin `Spellbound.Character` assembly had no `Spellbound.Core` reference although plan items 9 and 12 put `ValidationReport` and the operation group there.

**Seam** (`seam-rig-types`, Opus, $4.24, 2 attempts, 12 checks passed; verified by `verify-seam`, $1.40, 9 checks passed). Thirteen new files in `Spellbound.Character.Rig`: `RigKind`, `RigBoneReference` (`UseHumanBone`, `HumanBone`, `BonePath`, `IsEmpty`, `Human`, `Path`), `RigBones` (`Resolve`, `FindDescendant`, `PathOf`), `RigSocket` (pattern `socket_{id}`, default local pose), `RigGrip` (pattern `grip_{socket}`), `RigPieceSlot`, `RigHips` (human Hips, 1 metre, `Vector3.forward`), `ResolvedSocket`, `SocketTable`, `SocketResolver`, `RebindMap`, `RagdollDryRunBone`, `RagdollDryRun`; `RigContract`'s fields with `IReadOnlyList` readers, `Editable...` lists and settable properties, `Hips` never null, `FindSocket`; `RagdollBuilder.ResolveBone` forwarding to `RigBones.Resolve`. Four asmdef changes by name: Rig gains Body, the thin assembly gains Core (triage), the editor tests gain Editor, the play-mode tests gain Rig. Red: 1403 `error CS` lines across the seven test files while the types were absent (unique per file 1, 5, 25, 55, 3, 5, 25). Green: 122 of 122 edit mode (76 plus 46: RigBonesTests 10, RigSocketTests 4, RigGripTests 3, RigContractFieldsTests 8, SocketResolverTests 11, RebindMapTests 4, RagdollDryRunTests 6), 1 of 1 play mode. The first attempt stopped blocked on `Surface.txt`, which the new members made stale (V3); triage answered that the file is PackageCheck's generated identity file, regenerated through `packagecheck surface --write` and never by hand, and the seam and every story regenerate it, additions only. `Surface.txt` 246 to 360 lines, 114 additions, 0 deletions. PackageCheck as before.md, with D9 gaining the four new references until the stories used them.

**R5a-1** (`build-r5a-1`, Opus, $2.97, 2 attempts; `verify-r5a-1`, $2.26, 2 attempts, 9 checks passed on a909525). `RigContract.Validate` with fifteen codes, each an error except the warning `character.required-bones-empty`: `reference-figure-not-playable` (through `PlayableCharacters.IsPlayable`, no finding for an empty figure), `socket-id-empty`, `socket-id-duplicate`, `socket-parent-bone-empty`, `grip-id-empty`, `grip-id-duplicate`, `grip-socket-unknown`, `piece-id-empty`, `piece-id-duplicate`, `hips-bone-empty`, `hips-height-not-positive`, `facing-axis-not-a-direction`, `height-range-invalid`, `ragdoll-profile-invalid`; messages name the field and the value, locations name the field with its index. `ContentHash` over `SerializedContent`: every field in order, length-prefixed text, invariant culture, floats as `"R"`, references by name. `RigKindMapping` in `Spellbound.Character.Editor`: Humanoid to Human, Generic to Generic, `TryFromAnimationType` false for Legacy and None. AGENTS.md's Front door paragraph describes the contract. Red: 44 of 60 `RigContract*` tests failed against the seam's empty `Validate` (the first attempt's red, with a mapping stub, 50). Green: 177 of 177 (RigContractValidationTests 31, RigContractChangeMarkerTests 18, RigKindMappingTests 6, RigContractTests 3), play 1 of 1. The first verification failed one check: `Editor/RigKindMapping.cs:13` was 121 columns; the fix wrapped the message argument and nothing else, and the second verification passed every check. `Surface.txt` 3 additions.

**R5a-2** (`build-r5a-2`, $1.62, 1 attempt; `verify-r5a-2`, $1.04, 9 checks passed on 5247d8e). `GripPlacement.HoldPose(gripNode, contract, socketId, report)` and the forwarding `CharacterKit.Rig.HoldPose`: null contract or report throws; a null grip node reports `character.grip-node-missing`; no figure reports the warning `character.no-reference-figure` with the text "The contract names no reference figure."; an unknown or empty id reports `character.unknown-socket` naming the id and the contract's ids; a parent the figure lacks reports `character.socket-parent-missing` naming the bone; each returns `Pose.identity`. Otherwise one `SocketResolver.Resolve` on the figure, then rotation `S.rotation * inverse(G.rotation)` and position `S.position - rotation * G.position`, with G the grip's pose relative to `gripNode.root` taken in the root's rotation and world units, so a scaled prop root keeps its world grip offset. Red 9 of 10 (`AddsNothingToTheFigureOrTheProp` passes against a stub, as it should). Green 187 of 187, play 1 of 1. A4 failed once on a backticked `ArgumentNullException` in AGENTS.md; the name is plain text now. `Surface.txt` 3 additions. D9 lost one line as the thin assembly used Core.

**R5a-3** (`build-r5a-3`, $2.41, 2 attempts; `verify-r5a-3`, $1.11, 9 checks passed on 6b49d26). The first attempt built `WornPieceRebinding` in Rig and `CharacterKit.Rig.RebindWorn` and stopped blocked: C7 failed, because Rig carries no `!UNITY_SERVER` and now named `SkinnedMeshRenderer`. Triage answered from line rule 12 and part one's `MeshBoundsMath` precedent: the type moves to `Spellbound.Character.Presentation` (file and meta moved, GUID kept), the door is `WornPieceRebinding.Rebind(wornPiece, targetRoot)` reached directly, `CharacterKit.cs` returns to HEAD, the tests move to `Tests/Editor/Presentation` with the `CharacterKit` test deleted, the Presentation and Presentation.Editor.Tests asmdefs gain Rig (edited by triage), no waiver. Behaviour unchanged: null arguments throw; every renderer under the piece, itself included and inactive too; bones and root bone matched by ordinal name to the first depth-first transform under the target root, the root matching its own name; any miss returns before any write with each missing name once in first-seen order. Red (attempt 1) 8 of 10. Green 196 of 196 (WornPieceRebindingTests 9), play 1 of 1; PackageCheck the before.md line with C7 passed; `grep -rn "Renderer" Runtime/Rig Runtime/Body` prints nothing. `Surface.txt` 2 additions.

**R5a-4** (`build-r5a-4`, $1.25, 1 attempt; `verify-r5a-4`, $1.06, 9 checks passed on bdde856). `CharacterKit.Rig.ResolveSockets(modelRoot, contract)` forwarding to `SocketResolver.Resolve(modelRoot, modelRoot.GetComponent<Animator>(), contract)`; `Tests/Runtime/SocketSpawnTests` (three play-mode tests: resolves once by id with Hand on its node and Back defaulted under Spine; the spawned model root carries a Transform only and no MonoBehaviour below it; the table's Hand pose follows the moved Hips) with `SocketTableHolder` on the character root above the model; `CharacterKitSocketTests` proving the door and the resolver agree; the AGENTS.md rule "Sockets are resolved by id once at spawn ...". Red: 2 of 3 play-mode tests and 1 of 1 edit-mode against an empty-table stub. Green 197 of 197 edit, 4 of 4 play. `Surface.txt` 1 addition.

**R5a-5** (`build-r5a-5`, $3.42, 2 attempts; `verify-r5a-5`, $3.39, 2 attempts, 11 checks passed on cdde766). `RagdollBuilder.DryRun(rigRoot, animator, profile)`: null or invalid profile gives the builder's own error and no bones; otherwise the shared `ResolveBones`, `Missing` by definition name, `TryRequireResolved`'s text as `Error`, then `TryCheckColliders` when all resolve; `Bones` as `RagdollDryRunBone` (name, `RigBones.PathOf` path, shape, mass share); nothing written, proven by component counts. `CharacterKit.Rig.DryRunRagdoll` forwards. `CharacterAssembly.cs` carries `[assembly: OperationGroup("character", <the Purpose sentence>)]`; `CharacterOperations.Sockets(context, root, contract)` answers "<n> sockets, <d> defaulted, <m> missing" and an `OperationTable` (id, state node/default/missing, path); `Ragdoll(context, root, profile)` answers `succeeded:` with `ToText()` or `failed:` with `Error`; a root not in the scene answers `invalid:`. The A7 waiver element is removed from `Assets/_Project/Ledger/Character.asset`, P1 stays. AGENTS.md gains the operations and pipeline blocks from `core context`. Red: 6 of 6 `RagdollDryRunBuilderTests` and 4 of 5 `CharacterOperationsTests`. Green 208 of 208 (RagdollDryRunBuilderTests 6, CharacterOperationsTests 5, RagdollBuilderTests 12 untouched), play 4 of 4; `core help --group character` lists both operations with both arguments each. PackageCheck before the waiver's removal "4 must fix, 2 to confirm, 0 waived, 44 passed" (V3 and A3 pending the surface write), after: "2 must fix, 2 to confirm, 0 waived, 46 passed, 3 not applicable, 3 not run; compiled: current", A7 in no finding. The first verification failed on `Tests/Editor/CharacterOperationsTests.cs:80` at 121 columns and asked for a clearer name than `TryFindUnresolved`; the second attempt wrapped the line and renamed the private phase `TryRequireResolved`, and the second verification passed every check. `Surface.txt` 7 additions.

## Final counts

| Reading | Before | After |
|-|-|-|
| Edit-mode tests | 76 | 208 |
| Play-mode tests | 1 | 4 |
| `error CS` | 0 | 0 |
| PackageCheck | 2 must fix, 2 to confirm, 2 waived, 39 passed, 8 not applicable, 3 not run | 2 must fix, 2 to confirm, 0 waived, 46 passed, 3 not applicable, 3 not run |
| Must fix | D9 (7), A1 | D9 (7, the same seven), A1 |
| To confirm | C10 (4), V4 | C10 (5, plus `RigKind.cs:4`), V4 |
| Waived | A7, P1 | none (A7 passed; P1 passed, its entry kept) |
| `Surface.txt` lines | 246 | 373, additions only |
| Files | | 70 added, 13 modified, none deleted or renamed |

## Findings and how each was resolved

1. Seam, blocked: `Surface.txt` stale (V3). Triage: regenerate through `packagecheck surface --write`, additions only, in the seam and every story. Resolved in the seam's second attempt.
2. Seam and catalogue: the thin assembly lacked `Spellbound.Core`. Triage added the reference as the seam's fourth asmdef change. Resolved.
3. verify-r5a-1, error: `Editor/RigKindMapping.cs:13` at 121 columns. Fixed by the builder's second attempt (message argument wrapped), re-verified.
4. build-r5a-3, blocked: C7 on Rig naming `SkinnedMeshRenderer`. Triage: `WornPieceRebinding` moves to Presentation, reached directly, no `CharacterKit.Rig.RebindWorn`, no waiver. Resolved in the second attempt; the lead records the renamed door here and in the stories file.
5. build-r5a-2, warning: A4 on a backticked exception name in AGENTS.md. Fixed within the attempt.
6. verify-r5a-5, error: `CharacterOperationsTests.cs:80` at 121 columns; `TryFindUnresolved` read as its opposite. Fixed by the second attempt (wrapped; renamed `TryRequireResolved`), re-verified.
7. verify-r5a-5, warning: the P1 waiver waives nothing now. Kept by plan item 14 until step 29; raised.
8. verify-r5a-5, warning: check 9's count of 6 `public static` lines was the brief's error (the file holds 8 with the nested class lines and without `RebindWorn`). Passed under the triage answer; noted for brief writing.
9. verify-r5a-4 and verify-r5a-5, information: `CharacterKit.cs:32` and `:35` throw `NullReferenceException` on a null model root. The briefs fixed the expression; raised.
10. verify-seam, note: `SocketTable.cs:31` throws `ArgumentException` on a hand-built table with a repeated id. Raised.
11. Every verifier, information: the batch-mode editor rewrote `Packages/packages-lock.json` and `ProjectSettings/EntitiesClientSettings.asset` on open; builders restored them from HEAD with CRLF, verifiers (forbidden to write) left them; none is in a commit.
12. Sign-off: no finding against the bar or the stories; the verdict is in `verdict/round-1-findings.md`.

## Decisions

The twenty answers in `plan.md` "Design questions answered from the stories" held, with the two triage answers above. The ones a reader of Runtime.md needs: `HoldPose` takes a `ValidationReport` and returns `Pose.identity` on a finding; `DryRunRagdoll` returns `RagdollDryRun`, whose `Error` is Runtime.md's string; the worn rebind is `WornPieceRebinding.Rebind` in `Spellbound.Character.Presentation`; the rig type is `RigKind`, mapped in the editor assembly; the change marker is `ContentHash`; Rig references Body; one bone reference shape and one resolver.

## Raised

- Character, `Runtime/CharacterKit.cs:32` and `:35`: null model root throws `NullReferenceException` before the resolver's or builder's answer.
- Character, `Assets/_Project/Ledger/Character.asset`: the P1 entry waives nothing; step 29 removes it.
- Character, `Runtime/Rig/SocketTable.cs:31`: a hand-built table with a repeated id throws `Dictionary.Add`'s `ArgumentException`.
- Character, `Runtime/Rig/RigContract.cs:372`: references hash by name, so a same-named swapped asset does not move the marker.
- .github, `Areas/Runtime.md:323` to `:325`, `:328`, `:442`, `:465`; `Areas/Art.md:270`, `:271`; `Stories/Step24.md:92`, `:97`, `:107`: the old signatures and names.
- PackageCheck: D9's seven lines and A1 as part one raised; C10 names a two-member enum.
- Unity CLI: `unity command <name> --help` is generic with no editor; the editor rewrites `packages-lock.json` and `EntitiesClientSettings.asset` on open.

## Cost by stage

| Stage | Dollars | Sessions | Context median | Context max |
|-|-|-|-|-|
| plan (Fable) | 9.10 | 1 | 109,461 | 213,710 |
| catalogue (Opus) | 3.66 | 1 | 131,494 | 202,660 |
| seam (Opus) | 4.24 | 2 | 101,925 | 164,417 |
| build (Opus) | 11.67 | 8 | 76,083 | 139,403 |
| verify (Opus) | 10.25 | 8 | 69,179 | 131,341 |
| triage (Fable) | 5.67 | 2 | 65,343 | 120,894 |
| total before sign-off | 44.59 | 22 | | |

## Not run

The run and line tiers (C8, T2, L1); the 6000.3 floor; a player or dedicated server build (the Presentation constraint is read, not built); the Locomotion sample's nine play-mode tests, absent from a fresh worktree; `RagdollBuilder.Build` against a Humanoid animator (the tests resolve by path, with a non-human `Animator` proving the fallback); the operations through `unity command spellbound_run` against a real scene (they ran through `CoreKit.Operations` in the test with the editor's open scene); the games, which are part three's.
