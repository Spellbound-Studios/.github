# Checkpoint 2 revisited, area 4: the art pipeline (2026-10-23, revised 2026-10-24)

Revision note, 2026-10-29: the art registry design in `ArtRegistry.md` (this folder) overrides this file where they differ. ArtPipeline is the studio's own art pipeline and not a product for other studios; Send pushes picked items from the art registry project, never into a game; sends are built from the registry's main version without stacking; the rules live in the registry as settings and name no palette; the games pull items through the Registry window and keep records; A5 is re-cut (A5a 10 at step 15.4, A5b 2 at step 62), A7 runs in a game on a pulled item, A8's Maya half is answered by Unity's FBX Exporter, and A9 and A10 are new. The sections below stay as the design record of what was built in step 25.

Owner: the area 4 agent. Binds: `Requirements.md`, `Rules.md`, the library-design skill, `Corrections.md`, the approved `Revisited/Line.md` and `Revisited/Homes.md`. Everything in today's code is the Before. This file edits nothing else.

Revision note, 2026-10-24, checkpoint 5, third pass: two serious findings of the Opus readers are answered (red team below). (1) The way back and the branch-point rule move from A5b into A5a, so the artist's only Send for about 16 months can send a second model and receive the engineers' changes with no git by hand: A5a grows from 4 stories to 6, A5b shrinks from 6 to 4, and the pair still totals 10. (2) A new epic A4c, in Corsairs' class, puts Corsairs' playable character on contract nodes and names it as its reference figure, so a held prop sent to Corsairs is held, not left at its pivot: 2 stories, so the total goes from 54 to 56. Nothing the developer decided is reopened; the decided split into a minimal Send and the rest stands, and the minimal Send now holds the two menu items an artist cannot work without.

Revision note, 2026-10-24, checkpoint 5, second pass: four claims from other owners are answered (claims 4 to 7 of the checkpoint 5 table). The contract's playable test belongs to Character's `Validate` and a second check, over the rule set, tests the row's figure through `IsPlayable`; the gym line of the chain is stated as existing only once W4c lands; A5a lands with its caller and the ruleset switch and pushes only `art/<artist>-<slug>`. The total stays 54.

Revision note, 2026-10-24, checkpoint 5, the hand-off: the developer's 25 answers to the checkpoint 4 round are folded in one pass and two claims of the red team's open list are answered; nothing decided on 2026-10-23 or 2026-10-24 is reopened. What changed: (1) The artist's verdict window (A1b) and the hold test (A3) stay in front of Saboteer's milestone and join its class, and A4 waits for both; the gym (Places' W4c) sits behind that milestone and before any Corsairs launch, so A7 waits for it and no earlier art epic does. (2) A5 is split: A5a is a minimal Send in Studio.Tools (the send set, the commit subject, the push, no window, no checks), 4 stories, in Saboteer's class, dated by the hand-off after the demo (step 15, estimated 2027-03-09 to 2027-03-12); A5b is the rest, 6 stories, after Corsairs and before launch; the total stays 54. (3) A prefab says it is playable through `IPlayableCharacter` on the game's controller component; the rule set row's reference figure is such a prefab and the contract check reports one without it. (4) The check over the rig contract is drawn as `IDefinitionCheck<T>`, registered as `artpipeline.rig-contract`. (5) A shared place is edited in StudioDev and brought into a game by Update; no sentence here relies on an editable copy inside a game (none did; the gym row now says where the profile is edited). (6) The rule set, kind, palette, destination and rig contract types are authored types: after first ship, renaming a serialized field of one is a major, and the release check reads their fields. (7) The stale-field error carries the stored value text and nothing is written anywhere to keep it. (8) The release promise to a buyer is a rule of the line (a major about every 12 months, buyers offered the upgrade at a reduced cost, a year of bug fixes, maintenance and no API break inside a major); ArtPipeline's types are covered by it. (9) The importer repairs cite the 6000.4 pages because the 6000.7 model-import pages were not found; the 6.7 beta probe re-runs the importer behaviours, and no check here reads the renderer asset, whose SSAO feature becomes a Volume setting in 6.7. (10) The epic table carries a class for every epic and the dependencies by area key and epic id.

Revision note, 2026-10-24, checkpoint 4: the developer's answers to the 33 questions are folded in one pass, and nothing the developer decided is reopened. What changed: (1) The rules an artist's model is checked against are the game's own assets, with Studio.Presentation's as the defaults the game extends (question 7): a rule set row now adds the palettes and the rig contract the game wants for its pattern, a new `MaterialPalette` type names folders of materials, and a material finding gains the outcome Keep as a new material; the new material, and a new rig contract instance, travel in the artist's own pull request. (2) Artists push branches to the game's own repository, every main branch is protected, and Send sends only the files the artist changed under the art folders (question 23); the pull request Action runs as a GitHub App the organisation owns (question 31). (3) The gym the artist opens shows a playable character of the game holding the prop (question 6), started by `places gym-start --target {prefab}`; `gym-enter` is gone everywhere. (4) From the open claims: the playable chain writes drafts and ends with a person's approval; the first sign-in moves from the first push to the clone and step 0 points at the Artist onboarding form; A1a, A2 and A4 are Saboteer's class. (5) A check over Character's rig contract goes through Core.Editor's check seam, so a contract an artist brings fails before Send. (6) The epic table is re-counted: 53 stories (48 and five added now); the lines totals printed at the last revision, 24,900 read and 11,800 written, did not match their rows (23,900 and 12,000) and are corrected. (7) The one open decision, may artists push a branch, is answered and moved to Decided; none is open. (9) Red team answer: Studio.Presentation's default contracts leave the reference figure empty and the rule set row supplies the game's playable character; A2 grew by one story (54 in all). (8) Second pass of the same day: the previews of a prop or piece use the contract's reference figure, a playable character of the game, and the footprint check is stated as skipped until N5; the claims table lists all eight claims.

Earlier revision note, 2026-10-23, checkpoint 3: the developer's review of the page is applied in one pass. What changed: (1) Send needs no GitHub tool on the artist's machine: the destination pushes a branch and a GitHub Action in the organisation's `.github` repo opens the pull request; the tools come from the Artist onboarding form; the artist never sees a git word. (2) Blender and Maya integration is a named backlog epic, A8, unpriced. (3) The ragdoll builder stays in Character; ArtPipeline runs it at import as a check, which is the artist's preview. (4) The sentence is the approved one, "exports art, a model or a texture", with no further clause. (5) No compatibility wording of any kind remains. (6) Every operation is spelled in area 2's grammar: group `artpipeline`, front door `ArtPipelineKit`, `spellbound_run` the only Pipeline command, results led by their status word. (7) Studio.Content names no game; the gym profile is shared. (8) The milestones are the two games; the floor is Unity 6000.3; the package lives at `Packages/ArtPipeline` after the location probe. (9) Decisions 1 to 3 moved to Decided; one question is open. (10) The epic table carries A5 reshaped and A8 added, with dependencies by area key. (11) Second pass over six claims from other areas, answered in "Claims answered in the second pass": the rig contract carries no version field and a content hash marks models for a re-check, the branch is `art/<artist>-<slug>`, the CI status is gone and the check runs at Send and in the reviewer's local run, the footprint check runs Navigation's operation through the registry and merges its report, the ragdoll check waits on Runtime's backlog epic R5, and the bridge pair test runs in the Matrix.

How the work was done: the survey was read by me directly (the subagent tool was not available in this thread), from the code with file and line, and from the Unity 6000.4 manual and scripting reference. The red team below is therefore a self red-team with one pass per lens, and says so where it matters. At checkpoint 3 the subagent tool was again not available; every change was read and attacked by me. At checkpoint 4 the subagent tool was not available either; I read the answers, the line and the other areas' claims myself and attacked every change myself. At checkpoint 5 the subagent tool was not available either; I read the answers, the line, the roadmap rows for this area and the two claims myself and attacked every change myself.

## Survey: facts the design rests on

| Fact | Where |
|---|---|
| The only `AssetPostprocessor` in any Spellbound package or game is Core's preset manifest bump. Nothing in the line touches a model on import | `CoreDev/Assets/Core/Editor/ObjectPresetManifestPostprocessor.cs` |
| Saboteer has 135 FBX under `Art/DUMP-Characters` (`animationType` 3 in 123, 0 in 12) and 32 under `Art/Characters` (0 in 27, 2 in 2, 3 in 3; the ragdoll's code treats a Humanoid avatar as the working case, and 3 is the value on the one Humanoid Corsairs model). Settings differ file to file: `materialImportMode` is 0 in 122 of the DUMP metas and 2 in 4 of the Characters metas; `importBlendShapes` is 1 in 122 DUMP metas and in 4 of 32 Characters metas | `SaboteurDev/Assets/_Project/Art/*/*.fbx.meta`, counted with grep on 2026-10-23 |
| `Dwarf_player (1).fbx` sits beside `Dwarf_player_clothes.fbx` and `Dwarf_player_clothes (1).fbx` in the same folder | `Art/Characters/Dwarf/` |
| The only art check that exists is `TextureSizeCheck`: warns above 2048 px, runs in the release audit before a build, folder and ceiling are `const` | `Editor/ReleaseAudit/TextureSizeCheck.cs:8-9, 21-23` |
| The release audit already has the shape of a check: `IReleaseAuditCheck { Name; Run(report) }`, findings of severity Warning or Blocker. It is Saboteer code, 535 lines in 18 files | `Editor/ReleaseAudit/` |
| Hands are plain objects in the prefab. `MAINHAND` and `OFFHAND` exist in `Player.prefab` and `PlayerDwarfMale.prefab` with `m_PrefabInstance: 0`, so they are an unpacked copy of the model with no link back to the FBX. Re-exporting the rig does not reach them. The prefabs are 5,217 and 10,248 lines of YAML | `Player/PlayerDwarfMale.prefab:864-874` |
| The only report that a hand is missing is a runtime log: "Assign the MAINHAND transform of the current rig on the player prefab" | `Inventory/Player/PlayerHeldItemSync.cs:163-169`, `PlayerHotbar.cs:87-92` |
| A held item is aligned by a `HeldGrip` component placed by hand on the item prefab (27 prefabs carry it). The math inverts the grip's pose onto the anchor. A missing grip logs a warning once and the pivot sits in the hand | `Inventory/Items/HeldGrip.cs`, `ItemVisual.cs:45-72` |
| A second, different hand socket is built in code with hand-typed local offsets for the lobby dwarf | `StartScreen/LobbyDwarf.cs:388-399` |
| The ragdoll needs a Humanoid avatar and fifteen named bones, otherwise it logs an error. The auto-fill and bake is a Saboteer menu item. The ragdoll folder is 1,578 lines in 10 files | `Ragdoll/Editor/RagdollHumanoidAutoFill.cs:15-45`, `RagdollPlayerSetupRunner.cs:62-66` |
| Controller's visual-switch sample says one humanoid `AnimationCollection` drives every humanoid, but `AnimationCollection` does not exist in the package; the comment is stale | `ControllerDev/Assets/Controller/Samples/Scaffolding/CharacterVisualSwitcherExample.cs:8-12` |
| Corsairs has one character FBX (Humanoid), no sockets, no ragdoll, and equipment that changes stats but shows nothing on the body yet | `CorsairsIsleDev/.../Player/Animations/PolygonSyntyCharacter.fbx.meta`; a search of `_Project` for sockets, bones and skinned renderers finds none |
| Saboteer's `.gitattributes` already sends fbx, blend, png, psd and other art types to Git LFS | `SaboteurDev/.gitattributes:1-20` |
| Core already ships a UI Toolkit drawer for a list of abstract-typed entries: `[SerializeReferenceDropdown]` | `Core/Editor/SerializeReferenceDropdownDrawer.cs`, `Runtime/Tooling/SerializeReferenceDropdownAttribute.cs` |
| The Unity CLI package has `import_asset`, `find_assets`, `create_asset`, `set_serialized_field`, `run_script`, `menu`, `capture_game_view` | `SaboteurDev/Library/PackageCache/com.unity.pipeline@62c08c808737` |

Unity documentation read for this area (6000.4 unless noted):

- `AssetPostprocessor.OnPostprocessModel`: called when a model finishes importing, before the final prefab is written; the root is passed and may be modified; imported objects, meshes and clips exist only during the import and references to them are invalid after it; a prefab in another file cannot reference meshes from the imported FBX.
- `AssetPostprocessor.GetVersion`: when the version changes after a recompile, the assets associated with that postprocessor are reimported.
- `ModelImporter`: `animationType`, `globalScale`, `useFileScale`, `materialImportMode`, `humanDescription`, `sourceAvatar`, `importBlendShapes`, `optimizeGameObjects`, `importAnimation`.
- `Avatar.isHuman` is true for a valid human avatar; `isValid` is true for any valid Mecanim avatar, human or generic.
- Humanoid models need at least 15 bones in a human-like layout and a T-pose to make an Avatar (manual, "Using humanoid characters"). The page does not say how a failed mapping is reported.
- FBX importer: "Convert Units" and "Scale Factor"; physics expects 1 m in the world to be 1 unit in the file.
- A `.blend` file imports only with Blender installed on every machine; the manual recommends FBX in production.
- `AssetImporter.importSettingsMissing` is true when no meta file came with the asset. The page does not say it is reliable inside `OnPreprocessModel`: unverified, a spike story proves it.
- `AnimationClip.SampleAnimation` applies a clip at a time to a GameObject. The page does not say it works in edit mode: unverified, same spike.
- The `PreviewRenderUtility` and `ModelImporter.AddRemap` pages could not be fetched. They are named candidates only, and the first story that needs each proves it.
- The Unity 6000.7 pages for the model-import hooks (`OnPostprocessModel`, `GetVersion`, `ModelImporter`) were not found by the Unity reader at checkpoint 5. Every importer repair here cites the 6000.4 pages above; the 6.7 beta probe re-runs the importer behaviours named in the spikes and the members the checks use, and nothing is built on 6000.7 behaviour.

## The scenario, walked under this design

The scenario of `Areas.md`: an artist who has never used Unity drops in a character from Maya or Blender, sees at once whether it exported correctly (rig, sockets, materials, scale), a held sword lands in the hand with no tweaking, and one button sends the change to the game repo.

| Step | The artist does | What happens | Package |
|---|---|---|---|
| 0 | Follows the Artist onboarding form an engineer opened for them, then runs `bash setup.sh` once and opens the project | The form lists Git for Windows, Unity Hub with a sign-in, the Editor version it names and one clone line; GitHub asks for the sign-in at the clone. The script installs nothing: it fetches the large files, checks them and names anything missing in plain words; the Send tab shows the same list as a setup check | The Artist onboarding form (area 10), the template, Studio.Tools |
| 1 | Clicks Spellbound, ArtPipeline (the window also opens itself the first time a matching file lands) | A docked window says where each kind of file goes (the folders the project's rule set declares) and shows the one-page export card for each kind. A model or texture dropped anywhere else gets an amber card: "Not in a known folder. Move it to Assets/_Project/Art/Characters" | ArtPipeline |
| 2 | Drags `Knight.fbx` into the Characters folder | The path matches the Character kind. On import the rules set the importer (Humanoid, units, blend shapes) and add any socket the file lacks at the contract's default pose | ArtPipeline, Character bridge |
| 3 | Looks at the window | A verdict card, amber. A picture of the knight beside a 1.8 m reference figure, sockets drawn with names, and three findings in plain words. The ragdoll builder has already run in memory on the rig, so "the knight would fall apart at the left knee" is a finding here, before any game runs | ArtPipeline, Character bridge |
| 4 | Reads "Height 1.12 m. Characters here are 1.5 to 2.1 m. Maya exports centimetres: check the scene units" | Unity cannot repair a scale baked into the file, so the finding carries a hint for Maya and one for Blender instead of a button | ArtPipeline |
| 5 | Reads "Material 'Mossy Bark' is not in the palette" and the two buttons under it | Pick an existing one remaps the slot to a palette material by name (the importer only, the file is untouched). Keep as a new material takes the material out of the file into the game's own materials folder, where the game's palette finds it; the new files travel in the artist's own send. A name the naming check rejects (`Mat_1`) is refused with a sentence until the artist names it in the DCC | ArtPipeline |
| 6 | Fixes the scale in Maya and exports over the file | Reimport, card green; the sockets list shows which came from the file and which from the contract | ArtPipeline |
| 7 | Drops `Sword.fbx` into Held | Amber: no node named `grip_MainHand`. Hint: put a locator at the handle with that name | ArtPipeline |
| 8 | Adds the locator and exports | The Hold test panel shows the sword in the reference figure's hand through three reference poses, aligned by the same function the game uses | ArtPipeline, Character bridge |
| 9 | Presses Make playable on the sword | ArtPipeline makes a prefab variant of the model with bounds colliders; the kind's ordered list of operation lines then runs through Core's registry (`worldobjects preset-new --prefab {prefab}`, `inventory definition-new --prefab {prefab}`), each writing a draft in the drafts folder and reporting in plain words; a line whose group is not installed is reported skipped. The chain ends with a person: nothing it made is live until the artist presses Approve in the window, which moves each draft into the folder the kind names under the art folders (an agent cannot approve). Probably in the first release; settled when A7 starts | ArtPipeline, WorldObjects, Inventory, Core (claims) |
| 10 | Waits for play mode, then looks | The chain's last line, `places gym-start --target {prefab}`, loads the gym: Places spawns a playable character of the game (the prefab the project names; Studio.Content's profile offers the studio's playable characters; a game's own wins) holding the sword, aligned by the same function the game uses. The artist sees the sword in a running game. Back in the window the two drafts wait for Approve; Open in gym alone runs the same last line again for a second look. The gym sits behind Saboteer's milestone, so this step arrives with A7; until then the artist's last look is the hold test in step 8 | Places, Studio.Content (claims) |
| 11 | Presses Send, writes "Knight and sword, first pass" | The gate passes (no errors). The set is only what the artist changed under the art folders, with the meta files and any kept material or approved result in them; everything else changed in the project is listed as "not included" and never sent. The studio's destination confirms the large-file rule covers the files, makes one commit titled `feat(art): knight and sword, first pass` and pushes the branch `art/<artist>-<slug>` to the game's own repository (every main branch is protected, so the push cannot reach one). A GitHub Action, running as the GitHub App the organisation owns, opens the pull request from that commit. The window says "Sent. 1 send waiting for review" | Studio.Tools, Workflow (claim) |
| 12 | The next morning presses Get latest (A5a's second menu item, so it is there from the first send) | The destination fetches; if the earlier send was merged it moves to the default line of work and pulls, and says in plain words: "You have the engineers' changes. Nothing of yours was lost." Unsent changes or a conflict stop it with a sentence and leave every file as it is | Studio.Tools |
| 13 | Tells the engineers | They review the pull request; whoever merges runs the Unity tests first, since the artist has none, and `artpipeline check` is in that run. The sword's grip is a node in the file, so nothing is nudged by hand | Character, Workflow |

The scenario is won for everything the artist does, to the point of seeing the model in a running gym. No engineer step stays in the artist's way, and the artist's machine holds what the onboarding form installed (Git for Windows, which brings git and Git LFS, and Unity) and nothing else. What stays with engineers is review and the final shape of a prefab for a shipping scene: the variant is a starting point they extend, never a finished game object.

## Before, faithfully

What an artist or engineer does today in Saboteer to get a character and a held item working, each step from the code above:

| Step today | Who | Evidence |
|---|---|---|
| Drop the FBX into a folder. Nothing says which folder or what settings. The folder `DUMP-Characters` holds 135 files, `Characters` 32, with differing importer settings | Artist | Survey, row 2 |
| Open the Inspector's Rig tab, pick Humanoid, press Configure if mapping fails. Nothing tells them to | Artist | `RagdollPlayerSetupRunner.cs:62-66` prints the error only when a ragdoll bake is attempted |
| Build the player prefab from the model, unpack it, add `MAINHAND`, `OFFHAND`, `CarrySocket` as plain objects, place them by eye | Engineer | `Player.prefab`, `PlayerDwarfMale.prefab` |
| Drag those three into the `handAnchor`, `offHandAnchor`, `armsAnchor` fields of `PlayerHeldItemSync` | Engineer | `PlayerHeldItemSync.cs:9-11` |
| Put `HeldGrip` on each held item prefab, move it to the handle, check the result in Play mode | Engineer | 27 prefabs carry it |
| Run the menu "Saboteer, Ragdoll, Auto-fill And Bake Player Ragdoll" with the player prefab selected | Engineer | `RagdollPlayerSetupRunner.cs:15-50` |
| Find out a hand is missing from the console at runtime | Whoever plays | `PlayerHeldItemSync.cs:163-169` |
| Find out a texture is too large when the release audit runs before a build | Engineer | `TextureSizeCheck.cs` |
| Commit and push with git by hand; LFS patterns already exist | Whoever has git | `.gitattributes` |

What a consumer writes today for the held item, from `ItemVisual.cs:45-52` and `PlayerHeldItemSync.cs:184-191`:

```csharp
_visuals[(int)hand] = ItemVisual.AttachToGrip(ItemIdFor(hand), AnchorFor(hand), VariantFor(hand));
```

and, per item prefab, a `HeldGrip` placed in the Scene view. There is no check, no verdict, no report before runtime, and the same hand is built three different ways (prefab object, `CarrySocket`, `BuildHandSocket` in code).

Corsairs, the proving ground, has none of it: one character FBX, no sockets, and equipment with no visuals. Every worn or held thing Corsairs adds will be a fourth way unless the line gives one.

## Ideas: ten or more, kept and cut

| # | Idea | Verdict | Why |
|---|---|---|---|
| 1 | Rules as assets: a rule set maps folder patterns to kinds; a kind lists importer requirements and checks | Kept | A stranger declares their own kinds; no kind is built in. In a game the rule set, its palettes and its contracts are the game's own assets, and Studio.Presentation's kinds are the defaults it extends |
| 2 | A verdict card docked beside the Project window: one colour, findings in plain words, a Fix button where the importer can repair it, a hint where only the DCC can | Kept | The scenario's "sees at once" |
| 3 | A reference figure beside every model, drawn at the contract's height | Kept | A scale error is invisible as a number and obvious as a picture |
| 4 | Sockets from the contract, added at import when the file lacks them, taken from the file when it has them | Kept | The artist needs no rig knowledge; a skilled one overrides in the DCC |
| 5 | The hold test: the prop in the reference figure's hand, aligned by the function the game runs, through reference poses | Kept | "A held sword lands in the hand" shown before any game exists |
| 6 | The wear test: a worn piece rebound to the reference rig by bone name | Kept | Cosmetics fail by skeleton mismatch; names are checkable |
| 7 | Checks that the game itself enforces run through the game's code (the ragdoll dry run) | Kept | A parallel rule drifts; the same code cannot |
| 8 | Fixes change the importer only, never the source file | Kept | Idempotent, travels in the meta file, nothing to undo |
| 9 | Findings carry a stable code, a plain sentence, a DCC hint, and an optional fix code | Kept | An agent can act on the code; an artist can act on the sentence |
| 10 | Send as a destination the project declares; the gate runs the checks over the changed files first | Kept | "One button" without ArtPipeline knowing git |
| 11 | The destination confirms Git LFS covers each file before it commits | Kept | A 40 MB FBX committed without LFS is in history forever |
| 12 | A folder audit: one report of a whole folder (today 167 FBX) grouped by finding code | Kept | The first thing a team needs; also the first look at a folder nobody has checked |
| 13 | Textures as a second kind of subject (card faces, sprites, normal maps) | Kept | The card game has no models; `TextureSizeCheck` moves in |
| 14 | The release audit calls `artpipeline check` for the whole project and drops its own texture check | Kept | One rule, one place (DRY) |
| 15 | Operations for an agent: check, fix, explain, preview, audit, send, receive, setup | Kept | Requirement 12 and 13 |
| 16 | An export card per kind, generated from the rules | Kept | The artist reads it once, in the window; the rules cannot drift from it |
| 17 | Blender and Maya integration (export presets as Python and MEL files, or an add-on) | Backlog epic A8, unpriced | The developer put it in the backlog. It is a new format and a second toolchain, so nothing is built until it is picked up and its format is asked for |
| 18 | A badge on each file in the Project window | Cut | The only hook is IMGUI; the docked verdict does the job in UI Toolkit |
| 19 | A passport asset saved beside each model | Cut | A second file per model that can disagree with the model; the verdict is derivable |
| 20 | Prefab recipes: a kind lists components to add when it makes the prefab | Cut | A second system (components named in a rule asset). Idea 24 gives the artist a playable result without it |
| 21 | A ghost overlay of the previous version of a model | Cut for now | Valuable to artists; waits for the first artist week to prove it is the real pain |
| 22 | A git hook that blocks a bad commit | Cut | Local to each clone and needs installing; Send's gate and the reviewer's local run cover it |
| 23 | Runtime auto-fit: the character normalises scale and finds its own hand at spawn | Cut | Rejected direction C below |
| 24 | Make playable: a prefab variant of the model with bounds colliders, then an ordered list of operation lines the kind declares, run through Core's registry (a preset from the prefab, an item definition from the preset, the gym) | Kept; probably, settled when A7 starts | Replaces the cut idea 20. No component is named in a rule asset, and no new system: the variant is Unity's own prefab mechanism, the rest are other packages' operations |
| 25 | Open in gym: the artist's prop held by a playable character of the game in Places' gym, by the last operation line of the chain | Kept | The scenario's "in the game" without an engineer; the character is always a playable character of the game, never a stand-in |
| 26 | Get latest: the destination's Receive half, the way back from Send | Kept | A one-way button strands the artist the day after |
| 27 | Unmatched report: art files outside every folder of the rule set are found, shown amber and listed by Send | Kept | Silence is the worst failure for someone who cannot read a log |
| 28 | Setup check: the destination names what the machine lacks; the template's script installs nothing and checks | Kept | The first press of Send on a fresh machine must not end in an error the artist cannot read |
| 29 | Keep as a new material: a material finding offers Pick an existing one or Keep, and Keep takes the material into the game's own folder | Kept (2026-10-24) | An artist is never blocked on an engineer releasing Studio; the new files travel in the artist's own pull request |
| 30 | A palette as one list of materials in one asset | Cut | Two artists keeping a material on two branches edit the same list and collide on merge; a palette that names folders makes a kept material one new file |
| 31 | Studio.Presentation's rules as the only rules | Cut (2026-10-24) | Direction E below |

## Directions

**A. Rules, checks and a contract, at edit time, sent through a destination (taken).** ArtPipeline is an editor-only tool. A project declares kinds and a rule set. Models are checked and repaired where the importer can, shown to the artist as a verdict and a picture, and sent through a destination seam. The contract artists export to is Character's rig contract asset; ArtPipeline reads it and never owns it.

**B. The check lives at the source, in the DCC (rejected as a replacement; the integration is backlog epic A8, unpriced).** An add-on for Blender and a script for Maya validate before export, so the mistake never reaches Unity. It is an alternative to checking inside Unity. Rejected as the way to check: the arbiter of "did it export correctly" is Unity's own import (avatar mapping, material slots, units), which the add-on cannot see; it is a second toolchain in Python and MEL for a studio that ships neither; and a buyer's artists use a DCC we have never heard of. The cheap half survives: the export card in the window tells the artist what to set. Integration with the two applications as an addition to the checks is a named backlog epic, A8, with no price and no start.

**C. The character is tolerant at runtime (rejected).** `Character.Rig` normalises scale, searches the hierarchy for a hand and falls back to a guess when a socket is missing. It is an alternative to checking at import. Rejected: it makes a wrong asset work differently in two games, costs every spawn (and the MMO server runs it for nothing), and hides the error from the one person who can fix it.

Direction D, folding all of this into Character's editor assembly, was weighed and dropped without a picture: a farming sim without Character would have no scale, material or texture checks, and the line's Tool kind exists for editor workflows that stand without a runtime.

**E. The rules live only in the studio package (rejected by the developer, 2026-10-24).** Studio.Presentation holds every kind, palette and contract, and a game uses them as they are. Rejected: each new material or rig then waits for an engineer to release that package, which blocks the artist on the first day. The answer is direction A with the game's own assets and the studio's as defaults.

## After: the design

### What ArtPipeline is

A Tool, editor-only. Its sentence is the approved one: it exports art, a model or a texture. In working terms it checks an art export against the rules a project declares, repairs what the importer can, and hands it on through a destination the project declares, in one action. It depends on Core and the engine's editor modules and nothing else. The floor is Unity 6000.3; the studio edits on 6.4 and moves to 6.7 when it ships, and every importer member the package uses is checked against 6000.3 by the 6.3 test row. In its dev project it lives at `Packages/ArtPipeline`, once the location probe passes.

Assemblies:

| Assembly | Holds | Compiles when |
|---|---|---|
| `Spellbound.ArtPipeline.Editor` | The front door `ArtPipelineKit`, rule set and kind assets, the check and fix interfaces and the built-in checks, the import postprocessor, the verdict window, the operations, the destination base | Always, Editor only (`includePlatforms: Editor`) |
| `Spellbound.ArtPipeline.Character` | The rig checks, the socket step at import, the ragdoll check, the hold test and wear test, and the bridge's second door `ArtPipelineCharacterKit` (rule 9, because the assembly has a public surface) | Character is installed (`versionDefines`) |
| `Spellbound.ArtPipeline.Tests` | Edit mode tests in one folder, and the bridge pair test (`ArtPipeline.Character` against Character), which runs in the Matrix | Always |
| `Samples~/Reference` | A neutral rule set, a reference humanoid, six small models that each break one rule | Imported by `core sample-import` |

A Tool has no `Runtime` folder, and the front door lives in the Editor assembly. The line's rule 8 now reads "Runtime where the kind has one", so this is the rule as approved.

### The front door

One static class, `ArtPipelineKit`, so a person types the package name and lets the editor complete the rest. The suffix is area 2's rule (a class named like its package fails to compile inside any `Spellbound.*` namespace). It holds three entry objects, each an ordinary class a test builds on its own: `Checker` (`Check`, `Fix`, `Audit`, `Preview`, `Unmatched`, `Rules`), `Delivery` (`Send`, `Receive`, `Setup`) and `Playable` (`Make`).

```csharp
var report = ArtPipelineKit.Checker.Check("Assets/_Project/Art/Props/Held/Sword.fbx");

foreach (var finding in report.Findings)
    Log.Warn(finding.ToText());

if (report.ErrorCount == 0)
    ArtPipelineKit.Delivery.Send("Sword, first pass");
```

Each is also an operation in Core's registry under the group `artpipeline` (claim C1), so a person in the Spellbound window, an agent on the command line through `spellbound_run`, and a test call the same code.

### Types

| Type | Is | One sentence |
|---|---|---|
| `ArtRuleSet` | ScriptableObject | The game's map from folder patterns to kinds. A row is a pattern, a kind, the palettes the game adds for it, an optional rig contract that replaces the kind's and an optional reference figure (the game's playable character: a prefab whose controller component carries `IPlayableCharacter`) that fills the figure a default contract leaves empty. It also holds the destination, the DCC its artists use (an open id that picks which hint a finding shows), whether the window opens itself on the first matching import, the patterns that are deliberately not art, and the rules folder where the game's palettes and contracts live (one of the art folders, so they travel in a send) |
| `ArtKind` | ScriptableObject | One kind of art: importer requirements, an ordered list of checks, the palettes and the rig contract it names, and the folder under the art folders that Make playable approves into. Studio.Presentation ships ours as the defaults; a game uses them in its rows or makes its own |
| `MaterialPalette` | ScriptableObject | The folders whose Material assets a slot may use. A kept material is one new file in the first folder of the game's palette, so no list is edited and two artists cannot collide on one |
| `IArtCheck` | Interface, `[Serializable]` implementations in a `[SerializeReferenceDropdown]` list | Reads a subject, writes findings |
| `IArtFix` | Interface | Repairs a finding through the importer only |
| `ModelSubject`, `TextureSubject` | Classes | A read-only view of one imported asset: bounds, triangles, nodes by name, material slots, bones by name, the importer. No animation-system type appears in them; the avatar is read in the Character bridge |
| `ValidationReport` | Core's type | The sink a check writes to and the report a person or an agent reads; ArtPipeline owns no finding type of its own |
| `ArtDestination` | Abstract ScriptableObject | Four halves: `Preflight` (what this machine lacks), `Changed` and `Send` (the way out), `Receive` (the way back) |
| `MakePlayableStep` | Field on `ArtKind` | An ordered list of operation lines, with `{prefab}` and `{asset}` filled in, run through Core's registry after the variant is made; a line whose group is not installed reports itself skipped |
| `ArtPipelineKit` | Static class | The front door |

The kind lists its checks with `[SerializeReferenceDropdown]`, which exists in Core today, so there is no new drawer. Severity and the finding record are Core's `ValidationReport` (claim C2): error is shown to the artist as "Fix before sending" and warning as "Worth fixing". `ArtRuleSet`, `ArtKind`, `MaterialPalette` and `ArtDestination` implement Core's `IAuthoredDefinition` (`Validate` only; area 2 removed the format version, so a changed definition is re-authored), as does Character's rig contract asset (none of them carries a version field), so the inspector check, the unresolved-entry check on a kind and the one report an agent reads cover art as they cover every other definition. The member names on `ValidationReport` in the examples show the shape; area 2 fixes the real ones and the examples follow them. All of them keep their data in Unity's own serialization; Core packing is not used for any of them, and `core validate` reports a stored field a type no longer has as an error that carries the stored value's text; nothing is written anywhere to keep the value. `ArtRuleSet`, `ArtKind`, `MaterialPalette`, `ArtDestination` and Character's rig contract are authored types: once ArtPipeline has shipped to customers, renaming a serialized field of any of them is a breaking change and a major, by semantic versioning, and the release check reads their fields. A public check or fix class is part of the surface file, so renaming one is an API break and a major by the same rule.

### The game's rules and the studio's defaults

| Layer | Holds | Home |
|---|---|---|
| Defaults | The Humanoid character, Held prop and Worn piece kinds, our palette, our socket names, our contract instances for the playable characters' rigs with the bones, sockets, ragdoll profile and hips heights filled in and the reference figure left empty (a Studio package names no game's prefab) | Studio.Presentation |
| The game | The rule set and its rows (patterns, added palettes, a contract per row, the reference figure: the prefab of the game's playable character, which fills the empty figure of a default contract), the game's palette folder, kept materials, rig contracts the artist brings | The game's rules folder and art folders |
| Which wins | The game's row wins over a kind's default; a material name present in the game's folder and the studio's palette is a warning once, and the game's is used | Both |

Keep as a new material writes one file into the first folder of the game's palette. If the row adds no palette, Keep says so in a sentence ("This project has no place for new materials. Ask an engineer to add a palette to the rule set") and changes nothing; that is a one-time engineer step, not a release of Studio. A rig contract the artist brings is a new asset made from the Create menu in the rules folder, named by a row; it is validated like any definition, and the check in the Character bridge (below) catches a figure that lacks a bone the contract requires.

### What the buyer writes: three examples

A stranger's check, a racing game's wheel rule:

```csharp
[Serializable]
public sealed class WheelPivotAtAxleCheck : IArtCheck {
    [SerializeField] private float toleranceMetres = 0.01f;

    public string Code => "wheel.pivot_at_axle";

    public void Run(ModelSubject subject, ValidationReport report) {
        foreach (var wheel in subject.NodesNamed("wheel_*")) {
            var offset = (wheel.BoundsCenter - wheel.Pivot).magnitude;

            if (offset > toleranceMetres)
                report.Error(Code, wheel.Path, $"The pivot of {wheel.Name} is {offset * 100f:0.0} cm from the axle.");
        }
    }
}
```

A stranger's destination, a shared network folder:

```csharp
[CreateAssetMenu(menuName = "Spellbound/ArtPipeline/Shared Folder Destination")]
public sealed class SharedFolderDestination : ArtDestination {
    [SerializeField] private string folder;

    public override IReadOnlyList<string> Changed() => FolderComparison.NewerThan(folder, ArtKinds.Roots);

    public override SendResult Send(SendSet set, string message) => SendResult.Copied(set.CopyTo(folder));
}
```

The studio's rule set is a table in the inspector, no code:

| Pattern | Kind |
|---|---|
| `Assets/_Project/Art/Characters/**` | Humanoid character |
| `Assets/_Project/Art/Props/Held/**` | Held prop |
| `Assets/_Project/Art/Props/Worn/**` | Worn piece |
| `Assets/_Project/Art/UI/**` | Interface texture |

### Before and after for the held item, side by side

| Before (Saboteer today) | After |
|---|---|
| An engineer places `MAINHAND` by eye in an unpacked prefab and drags it into a field | The file or the contract supplies the socket; `Character.Rig` resolves it by id once at spawn |
| An engineer places `HeldGrip` in the Scene view on each of 27 prefabs | The artist puts a locator named `grip_MainHand` at the handle in the DCC; the verdict says if it is missing |
| `ItemVisual.AttachToGrip(itemId, anchor, variant)` aligns by the component | `Character.Rig` holds a prop at a socket by the node; the same function runs in the hold test |
| A missing hand is a runtime log | A missing hand is a red finding before the file leaves the artist's machine |
| `PlayerHeldItemSync.cs:9-11` holds three anchors typed by hand | The anchors are socket ids from the contract |

### The rig contract

Character owns the type (the line, row Character). Area 4 states what the artist-facing half of it must hold, so ArtPipeline and the artist share one document; it is claim R1 on `runtime`.

| Field | Meaning |
|---|---|
| Change marker | Not an authored field. `GetVersion` is made from a hash of the contract's content, so any edit to the contract re-checks the models of its kinds; the contract implements `IAuthoredDefinition`, which has no version, and no old contract is read |
| Rig type | Humanoid or Generic, Unity's own `ModelImporterAnimationType` |
| Required bones | For Humanoid, a set of `HumanBodyBones` (default: Unity's fifteen); for Generic, bone paths |
| Sockets | Each: an open id, the parent bone, the node name pattern, a default local pose used when the file has no node |
| Grips | Each: an open id, the node name pattern (`grip_{socket}`), the socket it goes to |
| Pieces | Slots a worn piece may fill; a piece's skinned bones must all exist in the rig by name |
| Hips | The hips bone, the hips height above the ground root in metres, and the facing axis (which local axis of the root points forward). The get-up anchor and the ragdoll driver read these, so no game carries its own numbers (claim from runtime, accepted) |
| Ragdoll profile | The profile the ragdoll builder bakes from (bone masses and joint limits); Character owns the builder and its editor button. ArtPipeline runs the builder in memory at import as a check, which is the artist's preview of the ragdoll |
| Height range | In metres, for the scale check |
| Reference figure and poses | The prefab of the game's playable character whose rig this contract describes, and the clips the previews sample. A contract shipped as a default leaves it empty and the rule set row supplies it; with neither set, the checks that need no figure still run and each preview says "This project has not named its playable character. Ask an engineer to set Reference figure on the rule set row" (a one-time step, as Keep's missing palette is), never a red finding on the artist's model. It is the body every preview of a prop or worn piece uses (hold test, wear test, the ragdoll dry run for a piece, the gym), so no preview invents a figure |

No socket name is in the package. `MainHand` is ours (Studio.Presentation); a farming sim names `Tool` and `Basket`.

### The checks that ship (all are defaults a kind can omit or replace)

| Check | Reads | Fix or hint |
|---|---|---|
| Scale | Bounds against a declared range, and the importer's unit conversion | Fix: importer scale where the cause is the unit setting; hint: apply scale in the DCC |
| Axis and pivot | The up direction and the pivot anchor are kind fields (the anchor is base, centre or a named node, so a game with no floor is not wrong by default) | Hint |
| Triangle budget | Triangle count per mesh against a number the kind sets | Hint |
| Mesh levels of detail | For a kind that asks for them, that the importer generates Mesh LOD levels (`ModelImporter.generateMeshLods`, with `meshLodGenerationFlags` and `maximumMeshLod`, listed on the 6000.4 scripting reference) | Fix: set the importer, applied at import like any requirement |
| Footprint (through an operation) | For a kind of building piece, that its footprint fits the grid Navigation expects, by running the operation line `navigation fit-footprint --asset {prefab}` through Core's operation registry and merging the `ValidationReport` it returns into its own; with Navigation absent, or the operation not registered, the check reports itself skipped and says why. The operation is Navigation's N5, placed after the Corsairs milestone and before any Corsairs launch, so the check skips itself until then; no epic here waits on it | Hint |
| Material slots | Slot names against the palettes the kind and the rule set row name; no embedded textures | Fix: Pick an existing material (remap by name), or Keep as a new material (one new file in the game's palette folder; refused for a name the naming check rejects and for a caller that is not a person) |
| Texture import | Max size, normal map type, colour space, alpha | Fix: texture importer |
| Naming | Patterns the kind sets; duplicate suffixes like `(1)` | Hint |
| Humanoid rig (bridge) | `Avatar.isHuman`, required bones present, listing the unmapped ones | Fix: set Humanoid; hint: configure the avatar |
| Sockets (bridge) | Each contract socket exists, from the file or the contract | Automatic at import |
| Grips (bridge) | A prop has the node its socket needs | Hint |
| Wear (bridge) | Every skinned bone of a piece is in the rig by name | Hint |
| Ragdoll builds (bridge) | Character's own builder runs in memory at import on the rig and the contract's ragdoll profile and reports its error; the artist sees the result on the verdict card. For a character model the body is the model's own rig; for a prop or a worn piece the body is the contract's reference figure, a playable character of the game, never a stand-in | Hint |
| Contract covers its figure (bridge) | A Core.Editor `IDefinitionCheck<T>` over Character's rig contract type, carrying `RegisteredDefinitionCheckAttribute` and registered by the bridge as `artpipeline.rig-contract (ArtPipeline)`: every required bone and each socket's parent bone exists on the reference figure, so a contract an artist brings fails in `core validate` before Send. That the figure is a playable character is the contract's own `Validate` in Character, which asks `CharacterKit.Body.IsPlayable(prefab)`; this check does not read the marker a second time | Hint |
| Row figure is playable (bridge) | A second `IDefinitionCheck<T>`, over `ArtRuleSet`, registered as `artpipeline.rule-set-figure (ArtPipeline)`: the reference figure a row supplies to a default contract, which has none of its own, passes `CharacterKit.Body.IsPlayable(prefab)`; the contract cannot judge that figure because it is empty. The rule set type lives in ArtPipeline and the bridge compiles with Character, so no assembly gains a reference | Hint |
| Hips and facing (bridge) | The hips bone exists, its height above the ground root is within a tolerance of the contract's, and the model faces the contract's axis | Hint |

### Import: what happens when a file lands

1. The postprocessor asks the rule set which kind the path belongs to. No rule set: it returns at once and the file is imported as Unity would. A rule set and no match, for a model or texture under `Assets` that no ignore pattern covers: the file is imported as Unity would, and an amber finding "Not in a known folder, move it to <the folders of the kinds that accept this file type>" is added to the Inbox and opens the window. The path match is a string comparison; its cost is reported by the same observation as the checks.
2. For a matching kind it applies the importer requirements. Whether this happens on first import only or on every import is an implementation spike (`importSettingsMissing` is not confirmed for `OnPreprocessModel`); the fallback is a Fix button, which always works.
3. Steps registered by the bridges run in `OnPostprocessModel`, which may modify the hierarchy; the socket step adds missing socket nodes. It adds plain transforms only, because adding a script to the imported root is not confirmed to survive.
4. After import, in `OnPostprocessAllAssets`, when the asset is loadable, the checks run and the verdict is cached. They do not run inside the import, because the imported objects do not exist after it.
5. `GetVersion` returns a number made from a hash of the rule set's and the contract's content, so an edit to either reimports the models of its kinds. The asset database's dependency hash (`AssetDatabase.GetAssetDependencyHash`) is the named candidate; it is confirmed, with its cost over 167 models, by the existing `GetVersion` spike.

Checks are queued and run one asset per editor update inside a time budget that is a rule set field, so a bulk reimport does not freeze the editor; the window shows "checking 23 of 167". Each check reports its milliseconds through Core's observation model (claim C3), and the window shows the slowest. A project with no rule set pays nothing, and no project pays anything at runtime: the package has no runtime assembly. The reference picture is rendered on demand and cached under `Library`, which is not in the repository.

### Send and Get latest

Staged. A5a, in Saboteer's class, is the Studio.Tools half only: `GitLfsDestination` behind two menu items, Send (with a message prompt) and Get latest. It makes the send set (only the files changed under the art folders, listed on the destination asset until A5b reads them from the rule set's patterns; everything else printed as not included), one commit titled `feat(art): <message>` or `fix(art): <message>`, and the push of `art/<artist>-<slug>`. It also holds the branch-point rule and the way back, both described below under "Where a send starts" and "The way back", so the second send never repeats a merged commit and the artist can receive the engineers' changes with no git by hand; in A5a they answer in plain sentences from the menu, with no window to show "1 send waiting for review". It has no window, no checks and no Preflight, and a missing git or large-file tool shows as the failing command's own message in one sentence. A5b adds the destination base type in ArtPipeline (the class then derives from it, and Send and Receive become its two operations), Preflight, the check gate, the Send tab with the waiting-sends line and Get latest beside Send, and the stale-model line of Receive. Until A5b lands nothing blocks the send of a model the rules would refuse; the engineers' review catches it. The sections below describe the whole.

`ArtPipelineKit.Delivery.Send(message)` does, in order: run the destination's `Preflight` (a missing piece stops the send with a sentence); ask the destination what changed under the art folders (every folder a pattern of the rule set names, the game's rules folder, and the folders Make playable approves into) and which art files sit outside them; check each changed file; refuse on any error with the findings; otherwise hand the set and the message to the destination. The set is only what the artist changed in those folders, with the meta files: never the whole project, never a scene, a script or any other file. Everything else changed in the project, and art files outside the folders, are listed in the Send tab as "not included" and do not block the send; the artist sees the list before pressing the button and again in the commit body. A kept material and a rig contract the artist made are in the set because they sit in the art folders. The destination decides what sending means.

Studio.Tools ships `GitLfsDestination`. It lists changed files with git, confirms the repository's `.gitattributes` sends each file's type to Git LFS (Saboteer's file already does), stages the files and their meta files, makes one commit and pushes the branch `art/<artist>-<slug>`, the slug made from the message, to the game's own repository. Every main branch is protected, so a push can land only on an art branch, and the destination never writes to a main branch. The commit subject is the studio's message format, `feat(art): <message>` (`feat` when the set adds files, `fix` when it only changes existing ones), and the body lists the changed files and the verdict of each. `artpipeline check` runs at Send, as the gate above, and again in the reviewer's local run (area 10's `run-local-tests.sh`); there is no CI step for art and no `art-check` status. That is all the destination does: it calls no GitHub tool and opens nothing. Send needs git and Git LFS on the machine and nothing else; Git for Windows brings both and the Artist onboarding form installs it. A GitHub Action in the organisation's `.github` repo, owned by area 10 and running as the GitHub App the organisation owns, sees the new branch and opens the pull request, taking the title from the commit subject and the body from the commit body, so the title satisfies the title rule without the artist typing a type or a scope. The artist never sees a git word: every message is a sentence ("Your files are saved on this computer under the name X; the server refused them"), and a send never discards or rewrites the artist's files. A project on Unity Version Control writes a second destination; the package changes nothing. How the Action reaches each game repository, and what exactly triggers it, are settled at creation in A5a against GitHub's documentation; none of it is verified here.

Where a send starts. The branch point is the default branch when the artist's earlier send was merged, and the earlier send's branch while it still waits for review. The destination tells which by git alone: after a fetch that prunes, the earlier branch is gone from the server (the repository deletes head branches on merge, a setting area 10 owns) and every file of that send matches the default branch, which counts a squash merge and does not count a send removed without merging. In the second case the new send is stacked: it carries the earlier commits, its commit body says "includes the earlier pass: <subject>", and the window shows "1 send waiting for review". What changed is always measured against the branch point, so a set never repeats files already sent. A branch cut fresh from the default branch while an earlier send waits was weighed and rejected: the earlier files would leave the artist's disk and yesterday's knight would vanish from the project. If the earlier branch is gone but its files do not match the default branch, the send was removed without being merged: the destination keeps the files, stays where it is, says so in a sentence, and an engineer says what to drop.

The way back. `ArtPipelineKit.Delivery.Receive()` is the destination's other half. `GitLfsDestination.Receive` refuses with a sentence if the artist has changes not yet sent ("Send first, or your changes stay as they are"); fetches; if the earlier send was merged, returns to the default branch and pulls with Git LFS; if it still waits, brings the default branch's changes into the artist's branch; and reports each outcome in plain words, including a changed rig contract and the models it makes stale (`artpipeline audit` lists them). On a conflict it stops, changes nothing, and names the files in plain words; it never resolves a meta file conflict on its own. The window's Send tab has Get latest beside Send. Unverified until its story: that a pull onto a stacked branch, and the merge test above on a squash-merged send, behave as described on a real repository with Git LFS; the story runs both on a clone of Saboteer.

What the artist cannot see is whether the Action ran: the window says "Sent" and shows the name of the branch, and it cannot see the pull request. An Action that fails is reported to the engineers by area 10's Action (claim W6), not to the artist.

Preflight. `ArtDestination.Preflight` returns a `ValidationReport` of what this machine lacks, each finding a plain sentence and a hint: git not found, the large-file tool not installed, large files not fetched in this clone, no sign-in for the remote. The sign-in happens at the clone, a step of the Artist onboarding form (Git for Windows' credential helper is expected to open the GitHub sign-in in the browser; unverified on the artists' machines, and A5a checks that the clone's sign-in covers the push); Preflight says in plain words if a push is refused for it. The Send tab shows the report as a setup check above the button; `artpipeline setup` prints it. The checks are the destination's (git is Studio's choice, a shared folder has its own missing pieces); the template's `setup.sh` (claim W5) installs nothing: it fetches the large files, checks them, and prints each missing piece as a sentence.

### The verdict window

A docked UI Toolkit window that opens itself on the first matching import of a session unless the rule set turns that off. Severity is shown in the artist's words: red is "Fix before sending", amber is "Worth fixing". When a file is selected in the Project window it shows: a coloured bar (green, amber, red) with one sentence; a picture (the model beside the reference figure, sockets named, the pivot marked); the findings, each with its sentence, its Fix or its Hint for the artist's DCC; and below, Hold test and Wear test when the Character bridge is present. A second tab, Inbox, lists every model imported this session that is not green. A third, Send, shows the changed files and the button. It ships no window chrome: the title bar is Core.Editor's `HeaderBar` and the findings list is Core.Editor's `ReportView`, fed the `ValidationReport` of the selected asset. ArtPipeline draws only what is its own: the picture, the pose scrubber of the hold test, the Inbox list and the Send tab. Its few styles are a USS file of custom properties on top of Core.Editor's, so the window restyles with the rest of the editor. This needs `ReportView` to show a per-finding hint and up to two action buttons, each calling a delegate (a material finding has two: Pick an existing one and Keep as a new material; claim U1).

### Operations (claim C1)

Area 2's grammar: the only Pipeline command is `spellbound_run`; every line is `<group> <operation> [arguments]`; the group is `artpipeline`; a result starts with its status word.

| Line | Does | Reads state |
|---|---|---|
| `artpipeline check <path> [--measure]` | The verdict of one file or folder as text; `--measure` adds heights, triangle counts and socket positions, because an agent may not be able to read a picture | Yes |
| `artpipeline fix <path> [--code <finding-code>] [--pick <material> \| --keep] [--dry-run]` | Repairs through the importer only; `--pick` remaps a slot to a palette material; `--keep` takes the material into the game's palette folder and needs the audience `approver`, which a person in the window holds and an agent does not; a dry run answers `previewed:` | |
| `artpipeline explain <finding-code>` | What the finding means and what its fix changes | Yes |
| `artpipeline preview <path> --out <file>` | Writes the verdict picture to a path | |
| `artpipeline audit <folder> [--offset <n>] [--limit <n>]` | One report of a folder grouped by finding code | Yes |
| `artpipeline unmatched` | Art files outside every folder of the rule set | Yes |
| `artpipeline rules` | The rule set, its kinds and its destination | Yes |
| `artpipeline setup` | The destination's preflight report | Yes |
| `artpipeline send --message <text> [--dry-run]` | Checks, then hands the set to the destination | |
| `artpipeline receive` | The destination's way back | |
| `artpipeline playable <path>` | The prefab variant, then the kind's operation lines in order, the last being `places gym-start --target {prefab}`, which exists only once Places' W4c lands (behind Saboteer's milestone), so no chain has the line before then; the lines before it write drafts, and a person approves them with `core approve`. Before it starts, the command asks `CharacterKit.Body.IsPlayable` of the row's figure and refuses with a sentence if the figure is not a playable character | |
| `artpipeline kind-new <id> <pattern>` | A kind, written into the drafts folder for a person to approve | |
| `artpipeline kind-add-check <kind> <check-type> [<field>=<value> ...]` | A check on a kind, through the drafts folder | |

The last two exist so an agent never writes a managed-reference list through a raw field write, which the Unity CLI's `set_serialized_field` rejects (area 8, from source). All run without a window, so they work from `spellbound_run` in batch mode. Two results, as an agent sees them:

```
artpipeline check Assets/_Project/Art/Props/Held/Sword.fbx
succeeded: 1 error, 1 warning
held.grip_missing  error  Assets/_Project/Art/Props/Held/Sword.fbx  no node named grip_MainHand
```

```
artpipeline send --message "Sword, first pass"
refused: 1 error must be fixed before sending
Run: artpipeline check Assets/_Project/Art/Props/Held/Sword.fbx
```

`ToText` writes one finding per line, code first; area 2 fixes the columns. Open in gym is not an ArtPipeline operation: it is the last line of a kind's chain, `places gym-start --target {prefab}`, run by `artpipeline playable`; nothing runs after it, because play mode reloads the domain.

```
artpipeline fix Assets/_Project/Art/Props/Held/Sword.fbx --code material.slot_unknown --keep
refused: artpipeline fix --keep needs audience 'approver'; this caller holds 'developer'
Run: ask a person to press Keep as a new material in the ArtPipeline window
```

```
artpipeline playable Assets/_Project/Art/Props/Held/Sword.fbx
succeeded: variant made, 2 drafts waiting for approval, entering play mode
Run: places gym-status
```

### Relation to Controller, ragdolls and cosmetics

| Concern | Owner | ArtPipeline's part |
|---|---|---|
| The body, its capsule and probe | Character.Body (area 3) | None |
| Sockets, held things, worn pieces, the ragdoll | Character.Rig (area 3) | Checks the file against the rig contract, adds missing sockets at import, shows the hold and wear tests with Character's own functions |
| The rig contract type | Character.Rig | Reads it; never copies it |
| Ragdoll profile baking | Character.Rig, editor | Runs the builder in memory at import as a check; the verdict is the artist's preview |
| Variants and cosmetics as data | Inventory and Studio.Gameplay | Checks the piece's skeleton and material slots |

## What a buyer writes, gets for free, can replace, and what the editor gives them

### ArtPipeline (Spellbound.ArtPipeline.Editor)

| | |
|---|---|
| Writes | A rule set asset (folder patterns to kinds, with the palettes and the rig contract each row adds); one asset per kind; a palette; a check class for a rule only they have; a destination if theirs is not git |
| Gets for free | The checks table above; the verdict window; the folder audit; the operations; the importer repairs; an export card per kind; the `ArtPipelineKit` front door |
| Can replace | Any check (omit it or swap it); any fix; the destination; the hint text by subclassing a check; the postprocessor's behaviour by leaving the rule set empty |
| Editor gives them | The window with Inbox and Send; a sample that opens on six deliberately broken models; the Spellbound window row; the kind and rule set inspectors with the check list drawer |

### Spellbound.ArtPipeline.Character

| | |
|---|---|
| Writes | A rig contract asset (Character's type) for their rig, and a reference figure prefab |
| Gets for free | Rig, socket, grip, wear and ragdoll checks; the socket step at import; the hold and wear tests |
| Can replace | The contract, the reference figure, the poses, and any check |
| Editor gives them | Sockets drawn on the verdict picture and a pose scrubber on the hold test |

### Samples~/Reference

A neutral rule set (units are metres, Y is up, one humanoid kind, one prop kind, one texture kind), a reference humanoid that stands in for a project's playable character, and six models that each break one rule. A buyer opens it and sees red cards with plain sentences within the first hour, without writing anything.

### Studio.Tools, art destination (private)

Writes the git and Git LFS destination, the commit message format and the branch naming; it opens no pull request, the Action does. Replaceable by any other destination asset in a game.

### Studio.Presentation, art kinds (private, bridge compiled when ArtPipeline and Character are both installed)

Holds our kinds, our palette, our socket names (`MainHand`, `OffHand`, `Back`, `Head`) and our contract instances for the playable characters' rigs, each with its bones, sockets, ragdoll profile and hips heights and with the reference figure empty, because a Studio package cannot reference a game's prefab. These are the defaults: a game's rule set references the kinds and adds its folder patterns, its palettes and its contracts, and its own win where they differ.

## The homes test and the stranger test, written out

Procedure: separate the type from the value; Library, Studio, Game; the stranger test on every type.

| Thing | Type or value | Library? | Studio? | Home | Stranger test |
|---|---|---|---|---|---|
| The rule set, kind, check, fix and subject types | Mechanisms | A farming sim, a racing game and a card game each declare their own kinds | | ArtPipeline | Passes: no kind, socket, folder or number is in the package |
| The scale, axis, pivot, triangle, material, texture and naming checks | Mechanisms with defaults | Every studio with artists; numbers are kind fields | | ArtPipeline | Passes: the card game uses only texture checks |
| The rig, socket, grip, wear and ragdoll checks | Mechanisms with a dependency | Any game with a body | | ArtPipeline.Character (bridge) | Passes: a game without Character never compiles it |
| `ArtPipelineKit` front door and operations | Mechanisms | | | ArtPipeline | Passes |
| The verdict window | Mechanism, editor | | | ArtPipeline | Passes: its colours are USS properties |
| The destination base type | Seam | A stranger's destination is theirs | | ArtPipeline | Passes: no git in the package |
| Git and Git LFS destination (push a branch; the Action opens the pull request) | Value on the seam | A buyer on Unity Version Control or a share would not want it | Two games, one pipeline | Studio.Tools | Library fails the stranger test, so it is Studio |
| `Humanoid character`, `Held prop`, `Worn piece` kinds with their numbers | Values | A buyer's heights and budgets differ | Identical in every game we ship | Studio.Presentation | Studio, not library: they are our taste |
| Socket names `MainHand`, `OffHand`, `Back`, `Head` | Values | | Ours | Studio.Presentation | Studio |
| Folder patterns (`Assets/_Project/Art/...`) | Values | | | The game's rule set | Game: they name one project's folders |
| `MaterialPalette` and the Keep fix | Mechanism | Any studio with a set of approved materials | | ArtPipeline | Passes: no material, folder or shader is named in the package |
| Our palette and our kinds as defaults | Values | | Identical in every game we ship | Studio.Presentation | Studio: our taste, which a game extends and may override |
| A game's added palettes, kept materials, rig contracts and rule set rows | Values | | | The game, in its rules folder and art folders | Game: they travel in the artist's own pull request |
| The check over Character's rig contract | Mechanism over another package's definition | Any game with rigs | | ArtPipeline.Character, through Core.Editor's `IDefinitionCheck<T>` | Passes: Character never imports ArtPipeline |
| The rig contract type | Mechanism | Any rigged game | | Character.Rig (line) | Passes; ArtPipeline reads it |
| The hold alignment function | Mechanism | Any game holding a prop | | Character.Rig | Passes; area 3 designs it |
| Mesh LOD check, Hips and facing check | Mechanisms; the numbers are kind and contract fields | Any studio with meshes or bodies | | ArtPipeline, ArtPipeline.Character (bridge) | Passes |
| The footprint check | Mechanism calling another package's operation | Any building game | | ArtPipeline, through the registry; the grid is Navigation's | Passes: nothing compiles without Navigation |
| Release audit's texture check | Duplicate of a mechanism | | | Deleted; the audit calls `artpipeline check` | |
| The prefab variant with bounds colliders | Mechanism: Unity's prefab variant plus a box collider fitted to the bounds | Any game with a model in a world | | ArtPipeline | Passes: no component of any game is named |
| The operation chain that follows (preset from prefab, item from preset, the gym) | Values on Core's operation mechanism | | | The kind lists operation lines; WorldObjects, Inventory and Places answer them | Passes: ArtPipeline names no package and compiles without them |
| Open in gym | Mechanism of Places; the profile is a value | | Shared by both games | Places (`places gym-start`), Studio.Content (the profile that offers the studio's playable characters, edited in StudioDev only and brought into a game by Update); a game's own wins, and Places' neutral default spawns the prefab the project names | Passes |
| The destination's Preflight and Receive halves | Seam members | A shared-folder buyer has other missing pieces and another way back | | ArtPipeline (seam), Studio.Tools (git) | Passes: no git in the package |
| The Action that opens the pull request | Value outside the package | | Ours | The organisation's `.github` repo (area 10) | Not in any package |

The assembly test: `ArtPipeline.Editor` depends on Core and the engine's editor modules only; `ArtPipeline.Character` is a bridge in the higher layer (Tool over a composer); the bridge pair test runs in area 7's Matrix on 6000.3 and 6000.4, compiling it with Character at its latest and at the floor of its range.

## Epics

Sizes in stories; lines are estimates by analogy to measured code (the ragdoll folder is 1,578 lines in 10 files; the release audit is 535 lines in 18 files; `Player.prefab` is 5,217 lines of YAML). Read means source an agent must read to do the work. Written includes tests. Dependencies are area keys (commandline is area 2, runtime 3, world 5, living 7, unity 8, pathfinding 9, workflow 10, ui 11) and the roadmap's epic ids, so the scheduler can be re-run from this table. A1 is split as the roadmap splits it: A1a the rules and checks, A1b the window, audit, sample and docs. A5 is split the same way: A5a the minimal Send, A5b the rest. Class is the roadmap's: Saboteer means in front of Saboteer's milestone, After Corsairs, before launch means after the Corsairs milestone and before Corsairs Isle launches. The last column says what the folds of 2026-10-24 did.

| Id | Delivers | Depends on | Alone | Stories | Lines read | Lines written | Class | Fold |
|---|---|---|---|---|---|---|---|---|
| A1a | ArtPipeline from the template, at `Packages/ArtPipeline`: rule set with rows, kinds, `MaterialPalette`, the scale, axis, material, texture, budget and naming checks, the texture subject, importer repairs and first-import application, the unmatched report, the `artpipeline` operations, the authoring contract on every type | commandline (CL1, CL4), workflow (WF2a), living (LV1a) | Yes: a farming sim or a card game uses it with no Character | 9 | 2,800 | 2,500 | Saboteer | Checkpoint 4: grown by 1 (palette type, rows that add palettes and a contract, material check with Pick). Checkpoint 5: unchanged |
| A1b | The verdict window, the folder audit, the reference sample with six broken models, the export card, the docs page and the AI context, Keep as a new material | A1a, ui (UI7a: `ReportView` and `HeaderBar`) | Yes | 8 | 2,500 | 2,200 | Saboteer | Checkpoint 4: grown by 1 (Keep). Checkpoint 5: in Saboteer's class and in front of the milestone, because A4 waits for it |
| A2 | The Character bridge: the rig, socket, grip and wear checks, the socket step at import, the ragdoll check at import (the artist's preview), the humanoid repair, the contract check through Core.Editor's `IDefinitionCheck<T>` and the row-figure check over `ArtRuleSet` (both ask `CharacterKit.Body.IsPlayable`, neither reads the marker itself), the reference figure supplied by the row and the one-sentence skip when none is set | A1a, runtime (L4, R5a for the ragdoll story only, R10 for `IsPlayable`), commandline (CL4, the check seam) | Yes, for any game with Character | 10 | 5,100 | 2,350 | Saboteer | Checkpoint 4: grown by 2. Checkpoint 5: the check is respelled and asks `IsPlayable`; a second check for the row's figure; no story added |
| A3 | The hold test and wear test with the reference figure (the game's playable character) and poses, the verdict picture as a file | A2, runtime (R5a, the hold function of claim R2), unity (spike results) | Yes | 5 | 2,000 | 1,300 | Saboteer | Checkpoint 5: in Saboteer's class and in front of the milestone, because A4 waits for it |
| A4 | The rewire: Saboteer's two player prefabs rebuilt as variants of the model, contract nodes replacing the hand objects and `HeldGrip`, Saboteer's rule set rows naming the dwarf as the reference figure, the audit's findings worked off; Corsairs follows in A4c | A2, runtime (L4), A1b, A3 | Yes, for the game | 5 | 7,000 | 900 | Saboteer | Checkpoint 5: waits for A1b and A3, so the artist sees a held prop before the hand-placed grip goes. It changes game prefabs, so it is not a bug fix or media and falls outside the freeze (claim on the roadmap) |
| A4c | The rewire in Corsairs: its playable character rebuilt as a variant of its model (`PolygonSyntyCharacter.fbx`, referenced by six prefab files of 2,200 to 2,300 lines in `CorsairAssets/Prefabs`) with contract nodes, its controller carrying `IPlayableCharacter`, its rule set row naming that prefab as the reference figure, and a first held prop (a cutlass with `grip_MainHand`) that passes the hold test and is held in Corsairs by the function the game calls | A4, A2, A3, runtime (L4, R5a) | Yes, for the game | 2 | 5,500 | 800 | Corsairs | Checkpoint 5, third pass: new. Without it the contract stops at Saboteer and every held thing Corsairs adds sits at its pivot, a fourth way |
| A5a | The minimal Send and its way back in Studio.Tools: `GitLfsDestination` behind two menu items, Send and Get latest, the send set limited to the art folders (listed on the destination asset) with the not-included list, the commit subject and body, the push of `art/<artist>-<slug>`, the only branch shape the artist ruleset lets an artist create, so the slug is made lower case from letters, digits and hyphens only; the branch-point rule (the default branch when the earlier send was merged, the earlier branch while it waits, the merged-or-removed test, stacked sends) and Get latest (refuses on unsent changes, returns to the default branch or brings its changes in, stops on a conflict with the files named); no window, no checks, no Preflight, and no stale-model line. It lands in a game repository with its caller, and WF1 switches the artist ruleset on in that repository in the same sitting | workflow (WF1 in the same sitting, WF1b, WF2b, the GitHub App and protected main branches, claims W6 and W7), living (L11t, the Studio packages shell) | Yes: it needs no ArtPipeline code | 6 | 1,700 | 1,500 | Saboteer | Checkpoint 5: split out of A5 with 4 stories, grown by 2 at the third pass (the branch point, Get latest), because the artist's only Send for a long time needs a way back; the hand-off dates it 2027-03-09 to 2027-03-12 and the roadmap re-dates it for 6 stories |
| A5b | The rest of Send: the destination base with Preflight, Changed, Send and Receive (`GitLfsDestination` derives from it and reads the art folders from the rule set), the gate with `artpipeline check`, the Send tab and setup check with Get latest beside Send and the waiting-sends line, the stale-model line of Receive, the test that a kept material and a rig contract travel and a scene does not, the release audit delegating to `artpipeline check`. The Action itself is area 10's | A5a, A1b, A4, workflow (WF3a) | Yes: Send and Receive with a folder destination stand alone | 4 | 1,600 | 1,200 | After Corsairs, before launch | Checkpoint 4: A5 grown by 1 (the send set test). Checkpoint 5: the rest of A5 after the split with 6 stories, shrunk by 2 at the third pass (the branch point and Get latest moved to A5a) |
| A6 | The bridge's first hour: its docs, its AI context, the bridge pair test | A2, living (LV4) | Yes | 2 | 500 | 300 | After Corsairs, before launch | Unchanged |
| A7 | Make playable and open in gym: the prefab variant with bounds colliders, the kind's operation lines writing drafts, the approval step in the window, `artpipeline playable`, a spike that a variant of an imported model survives reimport. Settled when it starts | A1b, runtime (R8b), world (W4c, the gym, behind Saboteer's milestone and before any Corsairs launch), commandline (CL4, drafts and `core approve`); each line skips when its owner is absent | Yes: the variant alone stands with no other package | 5 | 2,500 | 1,400 | After Corsairs, before launch | Checkpoint 4: grown by 1 (approval step). Checkpoint 5: waits for the gym that now sits behind the milestone; no other art epic does |
| A8 | Backlog, unpriced: Blender and Maya integration (export presets or an add-on) as an addition to the checks. Nothing is built until it is picked up and its format is asked for | A1b, A2 | Yes | not counted | not counted | not counted | Backlog | Unchanged |

Total 56 stories in A1a to A7 (A4c included, A8 not counted), about 31,200 lines read and 14,450 written, estimates by analogy to the measured sizes above, to be recalibrated by the first sprint's measured rate (the roadmap prices tokens and gates; these are the inputs). The fold of checkpoint 5 splits A5 into A5a (6 stories, 1,700 read, 1,500 written, after the third pass moved two stories into it) and A5b (4, 1,600 and 1,200), so A5 is still 10 stories, and adds A4c (2, 5,500 and 800). In front of Saboteer's milestone: A1a, A1b, A2, A3, A4 and A5a, 43 stories. In front of Corsairs' milestone: A4c, 2 stories, which R7c's soak waits for with every Corsairs-class part. The verdict window (A1b) and the hold test (A3) stay there because A4 removes the hand-placed grip, and a prop that passes the grip check and is sent would otherwise sit at its pivot while the games read `HeldGrip`. A4 rebuilds game prefabs, which the code freeze in Saboteer from mid January 2027 (bug fixes and media only, build scenes frozen) does not allow; the roadmap dates it outside the freeze. A5a lives in Studio.Tools and needs no ArtPipeline code, so the artist ruleset can switch on in a game repository when it lands there; the hand-off dates it after the demo build (estimated 2027-03-09 to 2027-03-12, step 15), so the demo does not contain it. After the Corsairs milestone and before Corsairs Isle launches: A5b, A6 and A7, 11 stories, none estimated to a date here. The gym (W4c) sits behind Saboteer's milestone, so A7 waits for it and no earlier art epic does; artists lose nothing by that, because the hold test shows the prop in the playable character's hand in the window. No art epic waits on Navigation's N5: the footprint check skips itself until N5 lands, after the Corsairs milestone. A1a can start before L4. A2 to A4 wait for Character, so the scenario is fully won only after L4.

Spikes and probes inside the epics, each a story with a yes or no: in A1a and A2, `importSettingsMissing` in `OnPreprocessModel`; `SampleAnimation` and a preview render in edit mode; whether a socket added in `OnPostprocessModel` survives into prefabs made from the model; the cost of a `GetVersion` reimport over 167 models. In A1b, how a material embedded in a model becomes a material file in the palette folder and the importer then resolves the slot to it (`AssetDatabase.ExtractAsset` and `ModelImporter.AddRemap` are named candidates; neither page was read here). In A5a, a pushed branch of the shape `art/<artist>-<slug>` makes the Action, running as the GitHub App, open a pull request from the commit subject and body, and a push of any other shape is refused by the ruleset; the clone's sign-in covers the push; whether a ruleset can limit an artist to branches named `art/**`. In A5a, the merged-or-removed test and Get latest on a squash-merged clone of Saboteer with Git LFS: the second send after a merge, and the receive onto a stacked branch. Every spike above that touches the importer or the preview is re-run once on the 6.7 beta by the beta probe. In A7, a variant of an imported model survives reimport; a held prop is held by the game's playable character in the gym.

## Decided

| Question | Answer | Date |
|---|---|---|
| What does Send do for the artist? | Checks, pushes a branch, and a GitHub Action in the organisation's `.github` repo opens the pull request. The artist never sees a git word. Details at creation (A5) | 2026-10-23 |
| Do we ship Blender and Maya export presets? | No. Blender and Maya integration is a backlog epic, A8, unpriced and low priority | 2026-10-23 |
| Does ArtPipeline make the first prefab? | Probably; discussed when A7 starts. Until then A7 stays in the table and nothing waits on it | 2026-10-23 |
| What does the sentence say? | ArtPipeline exports art, a model or a texture | 2026-10-23 |
| Where does the ragdoll builder live? | In Character. ArtPipeline runs it at import as a check, which is the artist's preview | 2026-10-23 |
| Is anything kept for compatibility before a package ships to customers? | No. A breaking change means re-save, re-author, re-import | 2026-10-23 |
| Where does the package live? | At `Packages/ArtPipeline` in its dev project; the folder is the short name (question 32) and the one-story probe confirms Unity accepts it | 2026-10-23, short name 2026-10-24 |
| Where do the rules an artist's model is checked against live? | In the game's own assets, with Studio.Presentation's as the defaults the game extends. Send gains the outcome Keep as a new material: the new material, or a new rig contract instance, travels in the artist's own pull request (question 7) | 2026-10-24 |
| May artists push branches to the game's own repository? | Yes. Every main branch is protected, and Send sends only the files the artist changed under the art folders, never everything (question 23) | 2026-10-24 |
| Who runs the pull request Action? | A GitHub App the organisation owns (question 31) | 2026-10-24 |
| What does the gym show? | A playable character of the game holding the prop. Places' neutral default spawns the prefab the project names; Studio.Content's profile offers the studio's playable characters; a game's own wins (question 6) | 2026-10-24 |
| Who runs the Unity tests before a merge? | The author; for an artist's pull request, whoever merges it, since the artist has none (question 30) | 2026-10-24 |
| What does validation do with a stored field the type no longer has? | Reports an error; it covers the rule set, the kinds, the palettes and the destinations (question 12) | 2026-10-24 |
| What may the line add to Core.Editor for checks over another package's type? | The seam only: one interface, one attribute and the lines that run registered checks; each package ships its own checks (question 11) | 2026-10-24 |
| Where do the verdict window and the hold test sit against Saboteer's milestone? | In front of it, in Saboteer's class; A4 waits for both | 2026-10-24 |
| Where does the gym sit against Saboteer's milestone? | Behind it and before any Corsairs launch; A7 waits for it | 2026-10-24 |
| What does the check seam's interface look like? | `IDefinitionCheck<T>` in Core.Editor, with the registered-check attribute; the rig contract check is registered as `artpipeline.rig-contract` | 2026-10-24 |
| How does a prefab say it is playable? | `IPlayableCharacter`, one empty marker interface on the game's controller component; Character answers `IsPlayable` from it; the rule set row's reference figure is such a prefab | 2026-10-24 |
| Where is a shared place edited? | In StudioDev, with the studio's playable character, then pushed and brought into a game by Update. There is no editable copy of a Studio package inside a game | 2026-10-24 |
| What does the stale-field error hold? | The stored value's text; nothing is written anywhere to keep it | 2026-10-24 |
| What is a renamed serialized field of an authored type after first ship? | A breaking change and a major, by semantic versioning; the release check fails it | 2026-10-24 |
| What is promised to a buyer? | A released tag installed through the Spellbound window; a major about every 12 months, buyers offered the upgrade at a reduced cost, and inside a major a year of bug fixes, maintenance and no API break. A rule of the line | 2026-10-24 |
| Is Send built whole in Saboteer's class? | No. A5a, the minimal Send, is in Saboteer's class and is dated after the demo build; A5b is the rest, after Corsairs and before launch | 2026-10-24 |

## Decisions still open

None. The fold of checkpoint 5 raised no matter for the developer; what it needs from other areas is in the claims.

## Claims received, answered (checkpoint 2b, as amended at checkpoint 3)

| From | Claim | Verdict | Reason |
|---|---|---|---|
| commandline | Report through `ValidationReport`, the rig contract implements `IAuthoredDefinition`, check, fix and send operations | Accepted | Already the design under claims C1 and C2; the private finding type is gone, the rule set, kind and destination assets implement the contract too, and the three operations return a report |
| runtime | The rig contract declares hips bone, hips height, facing axis and ragdoll profile; the ragdoll builder button stays area 4's | Amended, confirmed by the developer | The four fields are in the contract table and checked by the Hips and facing check. The button is rejected: the approved line homes the ragdoll in Character, so the builder and its editor button stay in Character.Rig and ArtPipeline runs the builder in memory at import as a check, which is the artist's preview. The developer confirmed this verdict |
| living | A Tool kind checked by the same bar without runtime rules; the contract version readable by `PackageCheck` | Accepted, the second half amended | The package has no Runtime folder. The contract has no version field at all (second pass, claim 2): a content hash in `GetVersion` marks models for a re-check, so claim H5 is withdrawn |
| unity | Animation seam with Animator default, rig re-judged at each LTS; check Mesh LOD at import | Accepted | Mecanim types were already confined to the Character bridge. The Mesh LOD check is added from the 6000.4 `ModelImporter` page, as a kind option off by default because mesh type support and the arrival version are unverified (claim N3) |
| pathfinding | A one-action check for building pieces may call Navigation's fit-footprint action | Amended | It calls the operation through Core's registry, not a bridge assembly, so ArtPipeline gains no dependency and no compile cost, and reports itself skipped when Navigation is absent. Claim P1 asks for a report-shaped result. Settled again in the second pass, claim 5 |
| workflow | Send opens a pull request titled `feat` or `fix` with scope `art`, in the game repo | Amended twice | The title is the commit subject, `feat(art): <message>` with the type chosen from the set (new files or only changes). At checkpoint 3 the destination no longer opens the pull request: it pushes a branch and a GitHub Action in the organisation's `.github` repo opens it, so the artist's machine has no GitHub tool |
| ui | The checker window uses `ReportView` and `HeaderBar` and ships no chrome | Accepted | Replaces claim U1; the verdict, picture and Send tab remain ArtPipeline's content. Depends on claim U1's capabilities in Core.Editor |

### Claims answered in the second pass (checkpoint 3)

| # | From | Claim | Verdict | Reason and change |
|---|---|---|---|---|
| 1 | orchestrator | Group `artpipeline`, door `ArtPipelineKit`; the gym is Places' | Accepted | Every line here is in the grammar. The gym is the last line of a kind's chain, `places gym-start --target {prefab}`, the spelling in CommandLine.md's table and World.md; the claim's "places gym" is read as that. Claim G1 asks Places for the `--asset` argument, which World.md does not list yet |
| 2 | commandline | Results through `ValidationReport` with the status word first; the rig contract implements `IAuthoredDefinition` with no version | Amended | The report and status word were already the design. The contract's integer version is removed: it was not a compatibility path, but it was a version, and the same job (re-check models after an edit) is done by a content hash in `GetVersion`. Cost: hashing is unmeasured; the existing spike measures it. Claim H5 on living is withdrawn |
| 3 | runtime | The ragdoll builder stays in Character; ArtPipeline runs it as a check at import; R5's edit-mode dry run is the preview | Accepted | Already the design. Claim R3 now names R5 as its source. R5 is a backlog epic in Runtime.md, so A2's ragdoll check story waits on it and A2's other stories do not; the scenario's "falls apart at the left knee" finding therefore arrives after R5 |
| 4 | living | No Runtime folder and one test folder; the door in the Editor assembly; group `artpipeline`; the bridge pair test runs in the Matrix | Accepted | The assembly table says so; the Matrix runs the pair on 6000.3 and 6000.4 |
| 5 | pathfinding | The building-piece check may call `NavigationKit`'s fit-footprint method; the result is a `ValidationReport` | Amended | A method call is a compile dependency, which means a bridge assembly (a measured 0.2 to 0.8 s of compile for each, per the audit). The check runs the operation line `navigation fit-footprint --asset {prefab}` through Core's registry and merges the report. Navigation's file lists `reach`, `why` and `path` only, so claim P1 stands: until Navigation registers that operation the check reports itself skipped |
| 6 | workflow | Branch `art/<artist>-<slug>`; subject `feat(art):` or `fix(art):`; changed files and verdicts in the body; the Action opens the pull request; git and Git LFS only; check at Send and in the reviewer's local run; no `art-check` status | Accepted | Written into Send, scenario step 11, W1, W2 and A5. The old CI step is removed. Workflow.md line 392 still says Unity-dependent checks, `artpipeline check` among them, "post a status": that sentence contradicts this claim and belongs to Workflow |

No claim contradicts the amended line. Claim 2 changes a field of the contract table as area 4 wrote it; Character's owner takes the field out of R1 when the contract is built.

### Claims answered at checkpoint 4

| # | From | Claim | Verdict | Reason and change |
|---|---|---|---|---|
| 1 | orchestrator, RedTeam 7.7 item 2 (runtime) | The playable chain ends with a person's approval | Accepted | `worldobjects preset-new` and `inventory definition-new` write drafts; Approve in the window moves each into the folder the kind names under the art folders; an agent's `artpipeline playable` ends `succeeded: 2 drafts waiting for approval, entering play mode`. The gym line needs the prefab only, so it does not wait for approval |
| 2 | orchestrator, item 4 (commandline, world) | The gym is `places gym-start`, `gym-status`, `gym-leave` | Accepted | Every `gym-enter` is respelled; the chain's last line is `places gym-start --target {prefab}`; nothing runs after it |
| 3 | orchestrator, item 7 (roadmap) | A1a, A2 and A4 are Saboteer's class | Accepted | The epic table has a Class column; A4 is flagged against the code freeze |
| 4 | orchestrator, item 8 (workflow) | The first sign-in moves from the first push to the clone; step 0 points at the Artist onboarding form | Accepted | Step 0, Preflight, the setup script wording, the limits and A5's spike say so |
| 5 | runtime | The rig contract is in Unity serialization, so `core validate` reports a removed stored field as an error; the ragdoll dry run and the artist's preview use the game's playable character as the body; the reference frame rename reaches every name of the frame interface or the binding | Amended | The contract and every ArtPipeline definition already keep their data in Unity serialization and the stale-field error already covers them (types section). The body is amended: a prop or a worn piece is previewed on the contract's reference figure, a playable character of the game; a character model is its own body, so the dry run on it runs on its own rig, since a stand-in would check a rig other than the one being sent. The rename touches nothing here: this file names no `IFrame`, `FrameId`, `FrameDirectory` or `FrameBinding` (searched on 2026-10-24); Character's bridge reads the binding through Character, so the rename lands in Character's story |
| 6 | world | The last line of a kind's chain is `places gym-start --target {prefab}`; the character that plays the prop is a playable character of the game | Accepted | Already the design (scenario step 10, claim G1). Nothing changed |
| 7 | pathfinding | The footprint check skips itself until N5 lands, after the Corsairs milestone; Art's own milestone work does not wait on it | Accepted | The check row and the limits say so. No art epic lists N5 as a dependency, so A1a to A7 are placed by their own dependencies; the scenario is complete without the footprint check, which adds a finding for building pieces when N5 lands |
| 8 | workflow | Send adds only the files the artist changed under the art folders, on a branch pushed to the game's own repository whose main is protected; the Action under the organisation's GitHub App opens the pull request; the first sign-in is the clone's | Accepted | Already the design (Send and Get latest, scenario steps 0 and 11, A5); the sign-in is claim 4. Nothing changed |
| 9 | commandline | A check over another package's type uses `IDefinitionCheck<T>` in Core.Editor | Accepted for one check | The Character bridge registers one over Character's rig contract type. `IArtCheck` stays: it judges imported subjects, a different thing from a definition |

No claim contradicts the decided line.

### Claims answered at checkpoint 5

| # | From | Claim | Verdict | Reason and change |
|---|---|---|---|---|
| 1 | roadmap (RedTeam 8.8 item 5) | A5 is split into A5a, a minimal Send (the send set, the commit subject, the push, no window, no checks) in Saboteer's class, and A5b, the rest; A1b and A3 are in Saboteer's class | Accepted | The epic table carries A5a (6 stories after the third pass) and A5b (4) and the class of every epic. For A5a to end before A1a begins it lives in Studio.Tools and needs no ArtPipeline code: its art folders are a list on the destination asset until A5b reads them from the rule set's patterns, and the destination base type arrives with A5b. Until then nothing blocks a send of a model the rules would refuse; the review catches it |
| 2 | unity (RedTeam 8.8 item 8), model-import pages | The 6000.7 model-import hook pages were not found, so the importer repairs cite the 6000.4 pages and the 6.7 probe checks them | Accepted | The survey says so; every importer repair already cites 6000.4. Claim N4 asks the probe to re-run the four importer behaviours and the importer members the checks use on the beta |
| 3 | unity (RedTeam 8.8 item 8), SSAO | The SSAO renderer feature becomes a Volume setting in 6.7, which touches any look check that reads the renderer asset | Accepted, nothing to change in the checks | No check in the table reads the renderer asset or a Volume. The one place a look could matter is the verdict picture's preview; whether it depends on the renderer asset is part of the existing preview spike, and N4 has the beta probe confirm it. A future check of look settings reads the Volume |
| 4 | commandline | Respell the rig-contract check as `IDefinitionCheck<T>`; the registered name `artpipeline.rig-contract` is unchanged | Accepted | Every place that drew the check already reads `IDefinitionCheck<T>` with `RegisteredDefinitionCheckAttribute` (the checks table, epic A2 and claim C7); the name is unchanged. Nothing further to respell |
| 5 | runtime | The rig contract validates itself, and its reference figure must be a playable character's prefab, checked with `CharacterKit.Body.IsPlayable`; the marker is `IPlayableCharacter` on the game's controller, which ArtPipeline's playable chain must expect | Amended | Accepted for the contract: its own `Validate` in Character does the test (claim R11 on runtime), and the bridge check no longer reads the marker, so there is one test in one place. Amended for the rule set: a default contract's figure is empty and the row fills it, so the contract cannot see the figure it will be used with; a second `IDefinitionCheck<T>` over `ArtRuleSet`, `artpipeline.rule-set-figure`, asks `IsPlayable` of the row's figure. `artpipeline playable` asks it again before the variant is made and refuses in a sentence. A2 holds both checks with no story added |
| 6 | world | The last step of an artist's chain, `places gym-start --target {prefab}`, exists only once W4c lands, behind Saboteer's milestone | Accepted | Already how the epics stand (A7 waits for W4c, no earlier art epic does). Now stated in the operation table: no chain has the line before W4c, and the hold test in the window is the artist's last look until then |
| 7 | workflow | A5a lands in a game repository with its caller and WF1 switches the artist ruleset on in the same sitting; A5a pushes `art/<artist>-<slug>`, the only shape the ruleset lets an artist create | Accepted | A5a's row says it lands with its caller and lists WF1 in the same sitting. The destination makes the slug from lower case letters, digits and hyphens so the branch always matches the shape, and the A5a spike now also proves that a push of any other shape is refused. Four stories as before |

The binding answers of 2026-10-24 that touch this area (folded above): the window and hold test in front of the milestone, the gym behind it; the gym character and the figure are playable characters marked by `IPlayableCharacter`; a shared place is edited in StudioDev only; a renamed serialized field of an authored type after first ship is a major; the check seam is `IDefinitionCheck<T>`; the stale-field error carries the stored value text; the release promise to a buyer. The two cadences, the clock, the writes-on-the-decider rule and the linked move are not described in this file, because the package has no runtime part.

### Open between areas (RedTeam.md section 4), as they touch this area

| Item | Answer |
|---|---|
| 1. One grammar | Applied: group `artpipeline`, door `ArtPipelineKit`, `spellbound_run`, status word first, kebab-case operations. `art gym` is gone as an ArtPipeline operation: the gym is the last line of a kind's chain, `places gym-start` |
| 2. The bar check | `core check` and `packagecheck check` are not used in this file; ArtPipeline relies on `core validate` for its definitions |
| 3. The shipped AGENTS.md | This package's file follows Living's six headings with generated operation blocks; the backticked lines above resolve against the catalog |
| 9. Location | `Packages/ArtPipeline` after the probe, as decided |
| 12. Claims the fix round created on others | Kept and respelled in "Claims on other areas": the WorldObjects preset operation and the Inventory item operation (runtime), `places gym-start` with a prefab (world), the template `setup.sh` (workflow), Navigation's footprint fit as a `ValidationReport` (pathfinding) |

## Limits

- The shape of the `ValidationReport` calls shown in examples is area 2's to fix; the examples follow it.
- The Action that opens the pull request runs as a GitHub App the organisation owns; it is area 10's and unverified here, including whether an App's pull requests start their checks without a person's approval: how it reaches each game repository, what triggers it, and that it can take the title and body from the commit are settled in A5a's spike against GitHub's documentation. If it cannot, Send still pushes the branch and an engineer opens the pull request.
- The artist cannot see whether the Action ran. A failed Action is reported to engineers by area 10; the artist's window says "Sent" and names the branch.
- The sign-in happens at the clone. Git for Windows' credential helper is expected to open the GitHub sign-in in the browser; unverified on the artists' machines, and A5a checks that the clone's sign-in covers the push. The setup script installs nothing and signs nobody in.
- The merged-or-removed test (branch gone from the server, files equal to the default branch) is unproven on a squash-merged clone with Git LFS; it is now an A5a spike, because A5a holds the branch-point rule. The repository setting that deletes head branches on merge is area 10's.
- The unmatched report covers models and textures under `Assets`; a file outside `Assets` is not seen.
- Unity cannot repair a scale or pivot baked into an FBX through the importer; those findings carry hints, not fixes.
- Models only, plus textures; audio, animation clips and VFX have no checks in the first release.
- The cost of a contract edit (reimporting every model of a kind, and hashing the contract to know it changed) is unmeasured; a spike measures it on 167 files.
- Three Unity behaviours are unverified until their spikes: first-import detection, edit-mode animation sampling and preview rendering. They were read against 6000.4; the 6000.3 floor and 6000.7 have not been read, the 6.3 test row runs them and the 6.7 beta probe re-runs them.
- Mesh LOD generation (`ModelImporter.generateMeshLods`) is listed on the 6000.4 scripting reference; whether it exists on the 6000.3 floor is unverified, so the check stays a kind option, off by default, behind a version define if the member is absent.
- The two Saboteer player prefabs are unpacked copies; an engineer rebuilds them as variants of the model (A4).
- ArtPipeline hosts one bridge per mechanism with art rules (Character now; Instancing, Horizon and Decals may follow), and each bridge assembly is a measured 0.2 to 0.8 s of compile.
- A stacked send carries the earlier send's files until it is merged; if the earlier one is rejected, an engineer says what to drop.
- Make playable gives a prefab variant with bounds colliders plus whatever other packages' operations add; the final prefab for a shipping scene (components, layers, networking) stays with engineers. Whether the first release includes it is settled when A7 starts, and the approved sentence is not widened for it.
- `PrefabUtility.SaveAsPrefabAsset` makes a Prefab Variant when the input is a prefab instance root (Unity 6000.4 scripting reference); the page does not address a model asset directly, so the model case is a spike in A7.
- If a socket added in `OnPostprocessModel` does not survive into prefabs, the socket step degrades to a finding and the artist authors the locator; there is no runtime fallback, by direction C.
- Mecanim-specific code (avatar, animation type, clip sampling) is confined to the Character bridge, so a second animation system is a second bridge; the base assembly names no animation type.
- Hint wording for Maya and Blender (units, apply scale) is illustrative; the Unity manual does not state either application's defaults, and the story that writes each hint checks it in the application.
- A renamed check class leaves an unresolved entry in every kind that used it. There is no redirect: the kind's validation reports the unresolved entry, using a Unity serialization call that must be confirmed in 6000.4 and 6000.3, and the owner re-authors the entry.
- No file locking: two artists editing one FBX is settled by the repository, not the tool.
- Blender and Maya integration is backlog epic A8, unpriced.
- Keep as a new material is a design, not a measurement: how a material embedded in a model becomes a material file, and that the importer then resolves the slot to it, is the A1b spike. Keep refuses when the row adds no palette, when the palette's first folder is inside a package (read-only), when the naming check rejects the name, and for a caller without the audience `approver`.
- The palette is a set of folders, so Keep adds one file and edits no list; two artists keeping the same name on two branches meet as an add/add conflict in git, which is visible. A material name in both the game's folder and the studio's palette is a warning, and the game's is used.
- GitHub's repository roles give no branch-only permission: the Write role pushes to any unprotected branch, and no role is limited to creating branches (GitHub Docs, repository roles for an organization). So the earlier wording "permission to create branches and nothing else" is withdrawn. Protected main branches are what stops a push to one; whether a ruleset can limit an artist to `art/**` names is Workflow's to verify.
- Files Make playable approves live where the kind names, under the art folders, so Send carries them; an engineer moves them to the game's own folders in review. A file the artist changed anywhere else is never sent, by the developer's answer.
- The contract's reference figure is the game's playable character, supplied by the game's rule set row because Studio.Presentation ships its contracts with the figure empty; a game with several rigs has one contract per rig. If the gym's character and the contract's figure differ, the hold test and the gym can disagree; the contract check cannot see that.
- A4 rebuilds game prefabs and so cannot fall inside Saboteer's code freeze (bug fixes and media only, from mid January 2027); the roadmap dates it.
- Neither game needs this package to play the same or better beyond A1a, A1b, A2, A3, A4 and A5a; Corsairs also needs A4c; the rest (A5b, A6, A7) is off both milestones' critical paths and comes before Corsairs Isle launches.
- Until A7 and the gym land, behind Saboteer's milestone, the artist's last look at a held prop is the hold test in the window; the gym adds the running game.
- A5a has no gate and no Preflight: a model the rules would refuse can be sent, and a missing git shows as one sentence made from the failing command's message. A5b adds both. A5a answers in sentences from its two menu items; the "1 send waiting for review" line and the stale-model line wait for A5b's window.
- Until A4c lands, a held prop sent to Corsairs is checked and held by the hold test in the window, and sits at its pivot in the game; A4c is Corsairs' class, so it ends before Corsairs' soak. Which of the six prefab files is Corsairs' playable character is the game's fact and A4c's first step; none carries a playable marker today.
- The release check that reads the fields of authored types is Living's; it is not built here. Renaming a serialized field of the five authored types of this package after first ship is a major, so field names are settled before the first ship.
- The 6000.7 model-import pages were not found; the four importer behaviours (first-import detection, socket survival into prefabs, edit-mode animation sampling, preview rendering) and the Mesh LOD members are read against 6000.4 only, and the 6.7 beta probe re-runs them. The SSAO feature moving to a Volume in 6.7 touches no check here; whether the verdict picture's preview depends on it is unverified.

## Claims on other areas

| Key | Claim |
|---|---|
| runtime | R1. Character.Rig owns the rig contract asset with the fields in "The rig contract", open socket ids and no version field; its reference figure is the prefab of a playable character of the game, and an artist may make a new instance from the Create menu in the game's rules folder, validated through `IAuthoredDefinition`. R2. A hold function (prop, socket id) that aligns the prop's grip node to the socket, callable in edit mode with no scene object, no singleton and no Play mode; ArtPipeline.Character calls it. R3. The edit-mode ragdoll dry run that Runtime's epic R5 lists: it returns an error string without adding components and is callable at import; the builder and its button stay in Character. R4. A worn-piece rebind by bone name callable in edit mode. R5. Sockets are resolved by id once at spawn, never per frame. R6. No MonoBehaviour is required on the imported root; sockets are plain transforms. R7. `worldobjects preset-new --prefab {prefab}` writes a draft through `DefinitionDrafts` and returns the preset's id in a `ValidationReport`, callable in edit mode with no scene. R8. `inventory definition-new --prefab {prefab}` does the same for an item definition. R9. A draft can be approved into a folder the caller names, which the window's Approve button calls. R10. `IPlayableCharacter` on the game's controller component, and `CharacterKit.Body.IsPlayable(prefab)` answering from it in edit mode with no scene, so the rule set row's reference figure and the contract check can tell a playable character from any other prefab. R11. The rig contract's own `Validate` reports a non-empty reference figure that fails `IsPlayable`; an empty figure is valid on a default contract |
| commandline | C1. The group `artpipeline` with the operations in "Operations", including `receive`, `setup`, `playable` and `unmatched` beyond the table in CommandLine.md; `send` and `receive` are `Writes`, `check`, `audit`, `unmatched`, `rules`, `setup` and `explain` are `Reads`; all callable with no window and in batch mode, `fix` and `send` honour `--dry-run` with `previewed:`; `fix` takes `--pick <material>` or `--keep`. C2. The finding record has a stable code, a severity, a subject path, an optional node path, a message, an optional hint per DCC and an optional fix code, and the subject may be an asset path. C3. A check can report its milliseconds as an observation with a budget, and the window can read them back in the editor. C4. `ValidationReport` and `IAuthoredDefinition` exist in Core with the shape claim C2 lists, with no format version on the definition; `artpipeline check`, `fix` and `send` return a report an agent reads. C5. An operation line may carry a `{prefab}` or `{asset}` placeholder that the caller fills before the host runs it, and the host runs a chain of lines with the caller's audience. C6. `artpipeline fix --keep` needs the audience `approver`, which a person in the ArtPipeline window holds and an agent's caller does not. C7. `IDefinitionCheck<T>` and its attribute `RegisteredDefinitionCheckAttribute` in Core.Editor run a bridge's check over a definition type another package owns, and the report names the check as `artpipeline.rig-contract (ArtPipeline)` |
| unity | N1. Say whether Unity's Preset Manager default presets by folder filter can replace the importer-requirement half of a kind (answered: half, for new imports only). N2. Verify `importSettingsMissing` in `OnPreprocessModel`, `SampleAnimation` and preview rendering in edit mode, and the remap API, against 6000.3 and 6000.7 as well as 6000.4. N3. Confirm in the 6000.3, 6000.4 and next LTS manuals which mesh types Mesh LOD generation supports (skinned meshes unverified) and the version it arrived in. N4. The 6.7 beta probe re-runs the four importer behaviours of A1a and A2 and the importer members the checks use, and confirms the verdict picture's preview does not depend on the renderer asset's SSAO feature, which becomes a Volume setting in 6.7 |
| workflow | W1. The commit format `GitLfsDestination` uses is the studio's convention: subject `feat(art): <message>` or `fix(art): <message>`, the changed files and each verdict in the body (a kept material is named there), on a branch named `art/<artist>-<slug>`. W2. The reviewer's local run (`run-local-tests.sh`) runs `artpipeline check` on changed models; there is no CI step and no `art-check` status. W3. The template repository carries Saboteer's LFS patterns as the baseline `.gitattributes`. W4. The title rule accepts `feat(art)` and `fix(art)`. W5. The template's `setup.sh` (bash, run once by an artist after the clone) installs nothing: it fetches the large files, checks them and prints each missing piece as a sentence; the Artist onboarding form installs Git for Windows, Unity Hub and the Editor, and the sign-in is the clone's. W6. A GitHub Action in the organisation's `.github` repo, running as the GitHub App the organisation owns, opens a pull request when a branch with the artist's naming is pushed, taking the title from the commit subject and the body from the commit body, and reports its own failure to the engineers; the repository deletes head branches on merge. W7. Every main branch is protected; artists have write access to the game's repository and push only branches named `art/<artist>-<slug>`; whether a ruleset can limit them to that pattern is Workflow's to verify. W8. Whoever merges an artist's pull request runs the Unity tests first, with `artpipeline check` in the run. W9. The artist ruleset in a game repository switches on when A5a lands there; the Artist onboarding form and the template's `setup.sh` exist by then, because A5a reports a missing tool only as the failing command's message |
| living | H1. The ArtPipeline repo from the template without a `Runtime` folder, at `Packages/ArtPipeline`. H2. The bridge pair test compiles `ArtPipeline.Character` with Character at its latest. H3. `core sample-import` serves `Samples~/Reference`. H4. The stranger projects include a dedicated-server project that installs ArtPipeline and must compile without it. H5. Withdrawn: the rig contract has no version field, so `PackageCheck` has nothing to read. H6. The release check's scan of authored types covers `ArtRuleSet`, `ArtKind`, `MaterialPalette`, `ArtDestination` and Character's rig contract, and its surface-file diff catches a renamed public check class |
| ui | U1. Core.Editor's `ReportView` shows, per finding, a plain sentence, a hint and up to two action buttons that each call a delegate (a material finding has two), and `HeaderBar` takes a title and a colour state. If it does not, that is a Core.Editor story, never a copy in ArtPipeline |
| pathfinding | P1. Navigation registers a fit-footprint operation in Core's registry that returns a `ValidationReport`, and says which kind of piece it applies to |
| world | G1. `places gym-start --target {prefab}` accepts a prefab asset; when the prefab is a held prop (it has the grip node of a contract socket) the gym's playable character holds it with Character's hold function. The character is the prefab the project names (Places' neutral default), or one of the studio's playable characters offered by Studio.Content's profile, or the game's own profile, which wins; the profile names no game. With no character set the answer is `refused: no gym character is set` and the field to set. O1. Instancing, Horizon and Decals may publish their mesh and material constraints as readable data (Horizon's answer, shaders and material properties, is accepted), so ArtPipeline can host a check for each in a bridge. G2. The gym and `places gym-start` sit behind Saboteer's milestone (W4c) and before any Corsairs launch; no art epic before A7 waits on them |
| roadmap | The epic table above, with sizes, classes and dependencies by epic id: A1 split as A1a and A1b and A5 as A5a (6, with the branch point and Get latest) and A5b (4), A4c added in Corsairs' class (2), 56 stories in all; A1a, A1b, A2, A3, A4 and A5a are in Saboteer's class, A5a after the demo build; A4c waits for A4, A2 and A3 and ends before R7c; A4 waits for A1b and A3 and changes game prefabs, which the code freeze from mid January 2027 does not allow, so it is dated outside the freeze; A5b, A6 and A7 follow the Corsairs milestone and come before its launch; A7 waits for the gym (W4c), which sits behind Saboteer's milestone; A5a lives in Studio.Tools and waits only on Workflow and the Studio packages shell; A8 is the only unpriced epic |

## Against revision 4

Read after the draft above existed. Revision 4's `Art.md` is an opinion; this is what I took and what I did not.

Took:

- Validation at import with findings in the artist's plain words, with the sentence style ("Socket missing. Add an empty named ... under the right hand bone"). My findings carry a hint per DCC for the same reason.
- A destination seam (revision 4 called it a publisher) so a buyer swaps git for Perforce or a share, and a refusal when a check fails.
- An export contract the artist can read. Mine is generated from the rules, so it cannot drift from them.
- Operations over the same checks (`art validate` there, `artpipeline check` here) so an agent and the release audit see one result.
- The cuts: no custom model importer, no DCC plugin (my direction B), no baking cosmetics into a model.
- Rejecting "validation in the release audit only" (my idea 14 goes the other way: the audit calls the pipeline).
- Rejecting "rules inside Character" (my direction D).

Rejected, and why:

- An `ImportReport` asset written beside each model, and a `SocketMap` asset per model. Each is a second file per model that can disagree with the model. Mine keeps sockets as nodes in the hierarchy (from the file or from the contract) and derives the verdict, caching it under `Library`.
- A `GripOffset` asset on the item prefab. It brings back the per-item hand tuning the scenario removes. The grip is a node in the item's own file.
- A fixed `socket_<name>` naming and a fixed required set (`hand_right`, `hand_left`, `back`, `head`) in the package. They are our values; a farming sim's sockets are different. Ids come from the contract asset.
- One `ArtRules` object with defaults for scale, axes and URP-only shaders. Defaults of that kind belong in a kind asset a game can replace, and "URP shaders only" is a rule of one render pipeline.
- Moving Saboteer's ragdoll builder into ArtPipeline. A ragdoll is a body falling, which the line gave to Character; the art tool runs its dry run as a check and owns none of it.
- A `CosmeticManifest` asset and a `<model>_<variant>` naming rule. Wearing is Character's mechanism and variants are data in Inventory or Studio; a manifest is a second system. The wear test checks the skeleton, which is the part that fails.
- "Studio supplies the branch and remote" as the whole destination: kept in spirit (Studio.Tools), but the LFS check and branch naming are the destination's work, with a plain failure message.

Not decided by me and not carried: revision 4's note on Unity's animation system and Animation Rigging. That is Character's seam (area 3). I only keep Mecanim-specific code in one bridge so either outcome costs a bridge.

Unverified lead from revision 4: "Corsairs issues 68 to 72, an artist's assets hooked up by an engineer, one issue per asset." I did not read those issues and the design does not rest on them.

## Red team (checkpoint 2b, kept as the record; where it differs from the design above, the design above wins)

Mode: self red-team by the area owner, Sonnet 5.5. The Sonnet reader tool was not available in this thread, so each lens was run by me, with the strongest claim written down first and then attacked. Lenses run: Ambition, Stranger, Agent, Designer and artist, Performance, Time, Roadmap, Scale. Skipped: none. Every finding below was fixed in the draft above unless it says otherwise.

### Ambition: what is the boldest version, and why is it not on the page

Strongest claim attacked: "the scenario is won for everything the artist does."

1. Serious: the boldest version has the artist never open Unity. They push an FBX to a branch, a build machine runs the same `artpipeline check` and `artpipeline preview` in batch mode, and the pull request comment carries the verdict card and the hold test picture. The draft's operations already run without a window, but nothing said so on the page and nothing named the cost. Fix: a Beyond section below. Not in the proposal, because it needs a licensed editor and a GPU on a build machine and an unmeasured import time for the whole project.
2. Minor: the draft treats the artist as the only author of models. An agent that produces a model through a generative tool needs exactly the same gate, and the operations already give it. Fix: stated in the Beyond section as a use of the same operations, not a feature.
3. Minor: the ghost overlay of the previous version of a model was cut without saying when it comes back. Fix: it is the first candidate after A6, said in the ideas table (idea 21).

### Beyond the brief (not the proposal)

| Idea | Gains | Costs |
|---|---|---|
| The artist never opens Unity: a pull request runs `artpipeline check` and `artpipeline preview` in batch mode and comments with the verdict card. Not proposed: it would be the CI status that Workflow decided against | Artists work in their DCC and a browser; engineers see a picture before merging | A licensed editor and a GPU on a build machine; the whole project imports on every run unless the library is cached; unmeasured. Area 10 owns the machine |
| The same gate for a model an agent generated | One rule set judges every source of art | Nothing beyond the operations; the risk is volume, not design |
| A ghost overlay of the previous version of a model | An artist sees what changed | A cached render per version under `Library`; waits for the first artist week |

### Stranger

Strongest claim attacked: "no kind, socket, folder or number is in the package."

1. Serious: a card game artist drops card faces and sprites. The approved sentence says "model export", so ArtPipeline had nothing for the card game. Evidence: the draft's first checks all read models. Fix: `TextureSubject` and the texture checks are in A1, the release audit's texture check moves in, and the sentence widens to "art export" (claim K1).
2. Serious: an underwater game has no floor. Evidence: the draft's axis and pivot check assumed Y up and a base pivot. Fix: the up direction and the pivot anchor (base, centre, named node) are kind fields.
3. Minor: a studio on 3ds Max gets no hints, because the hints were keyed to two applications. Fix: the DCC is an open id on the rule set and a check supplies hints by id; the check can be subclassed for a new one.
4. Minor: a buyer renames one of their check classes and every kind that used it silently loses the entry. Fix: the kind's validation reports unresolved entries; confirmation of the Unity call is in Limits.

Walked and found nothing further: the racing game (Generic rig kind, the wheel check above), the farming sim (sockets named Tool and Basket in its own contract), a buyer on Perforce (a destination of their own).

### Agent

Strongest claim attacked: "an agent can do the job with only the command line."

1. Serious: an agent asked to "add a kind for crops and check it" must add a check to a managed-reference list. Evidence: the Unity CLI's `set_serialized_field` is not documented to write managed references. Fix: `art kind new` and `art kind add-check`.
2. Minor: an agent that cannot read an image gets nothing from `artpipeline preview`. Fix: `artpipeline check --measure` prints heights, triangle counts and socket positions as text.
3. Minor: an agent cannot tell which findings it may fix. Fix: a finding carries a fix code only when `artpipeline fix` can act, and `artpipeline explain <code>` says what a fix changes.

### Designer and artist

Strongest claim attacked: "an artist new to Unity gets a model into the game alone."

1. Serious: the artist drops a file and nothing visible happens unless they know to open a window. Evidence: step 2 to 3 of the walk. Fix: the window opens itself on the first matching import of a session, by a rule set field.
2. Serious: "Blocker" and "Warning" are engineers' words. Fix: the window says "Fix before sending" and "Worth fixing".
3. Serious: a push can fail (no network, no rights) and the artist cannot read a git error. Fix: the destination returns a plain sentence, never discards the artist's files, and says where they are saved.
4. Minor: the sample must be the artist's first hour too. Fix: the sample opens on six broken models in the same window the artist will use.
5. Not fixed: file locking when two artists change one FBX (Limits).

### Performance

Strongest claim attacked: "nothing at runtime, nothing without a rule set."

1. Serious: a contract bump or a bulk reimport runs the checks on 167 files in one editor tick and freezes the editor. Fix: checks queue and run one asset per update inside a time budget that is a field; the window shows progress.
2. Minor: the render of the reference picture on every selection. Fix: on demand and cached under `Library`.
3. Minor: requirement 11, a package shows what it costs. Fix: each check reports its milliseconds through Core's observation model (claim C3).
4. Not fixed, stated: the `GetVersion` reimport cost over a project and the bridge assembly's 0.2 to 0.8 s of compile are measured only as a figure from the audit; the A1 spike measures the first on 167 files.

### Time

Strongest claim attacked: "the checks read the imported result, so they outlive any exporter."

1. Serious: Unity's animation system may change under the humanoid checks. Evidence: revision 4 cites Unity staff on a paused replacement. Fix: Mecanim types are confined to the Character bridge; the base subjects name none.
2. Minor: a contract bump leaves old models stale with nothing marking them. Fix: no stamp is written; `artpipeline audit` re-checks and lists them, and `GetVersion` reimports the kinds the contract touches.
3. Minor: a Blender exporter default changes. Fix: the checks read the import, not the exporter, so only hint wording ages.
4. Not fixed: if the Unity manual's behaviour for first-import detection or edit-mode sampling differs from what the spike finds, A2 and A3 change shape (Limits).

### Roadmap

Strongest claim attacked: "A1 and A5 can start before Character."

1. Serious: the first draft put importer repairs and first-import application in A4, behind Character, though they need none of it. Fix: they moved to A1; A4 is now only the game rewire.
2. Serious: the first draft held the docs page and AI context in a last epic, though the line says every package ships its six parts at its first release. Fix: they are in A1; A6 covers only the bridge.
3. Minor: A3, the hold picture, is a polish over A2's checks. It stays because the scenario asks for the sword in the hand and the picture is how an artist sees it; A3 can slip without breaking A2.
4. Minor: decision 3 (make playable) could look like a gate. It gates only A7; A1 to A6 stand without it.

### Scale

Strongest claim attacked: "the MMO server pays nothing."

No findings. Walked: a dedicated server build of a project that has ArtPipeline installed (editor-only assemblies, no runtime assembly, so nothing compiles into a player build); a repository with thousands of models (the audit streams one asset at a time inside the time budget); a build machine running the operations in batch mode (Beyond).

### Could not fix

- Whether a socket added during import survives into prefabs, first-import detection, edit-mode clip sampling and preview rendering are unproven; spikes in A1 and A2 settle them and the fallbacks are in Limits.
- Cost of a contract bump over a real project is unmeasured.
- File locking between two artists.
- The two Saboteer player prefabs cannot be converted mechanically; an engineer rebuilds them (A4).
- Make playable is probably in the first release and is settled when A7 starts; the approved sentence is not widened for it.
- This was a self red-team; no separate reader attacked it. The orchestrator's lens readers do that next.

### Answers to the lens readers (checkpoint 2b; where this differs from the design above, the design above wins)

1. Serious, the artist cannot get a model into the game alone (two readers, same finding). Fixed. The recommendation on decision 3 changes to option (c): a prefab variant of the model with bounds colliders, made by ArtPipeline, then the operation names the kind lists (claims R7 and R8) make a WorldObjects preset and an Inventory item definition, and the last operation line, `places gym-start` (claim G1), opens Places' gym holding the new prop. The scenario now ends in the gym at step 10, not at a pull request. The suggested fix said WorldObjects and Inventory own the actions and ArtPipeline invokes them; that is what the design does, through Core's registry so ArtPipeline names no package. Partly not fixed: the variant is a starting point, not a shipping prefab, and the claims are unanswered until areas WorldObjects, Inventory and Places accept them. That a variant of an imported model survives reimport is cited only for ordinary prefabs; spike in A7.
2. The reader's wording, "take option (c)": taken, as above. Idea 20 (components listed in a rule asset) stays cut, because naming components in a rule asset is a second system; idea 24 gives the same result without it.
3. Serious, Send has no way back. Fixed. The destination seam has a Receive half, `ArtPipelineKit.Delivery.Receive` and a Get latest button; it refuses on unsent changes, pulls with LFS, reports conflicts in plain words and resolves nothing itself. One part of the suggested fix is rejected: a fresh branch from the default branch for every send. While an earlier send waits for review that would take yesterday's files off the artist's disk. A send is instead cut from the earlier branch while it waits, stacked on the default branch with the earlier title in the body, and measured against its branch point so a set never repeats files. Not proven: pull behaviour on a stacked branch with LFS; the A5 story runs it on a clone.
4. Minor, art outside the rule set's folders is silently ignored. Fixed. A model or texture under `Assets` that matches no folder gets an amber finding and opens the window; the Send tab and the commit body list art files that were not included. The rule set has ignore patterns so samples and tests stay quiet. Files outside `Assets` stay unseen (Limits).
5. Minor, nothing sets up git, LFS and credentials. Fixed. `ArtDestination.Preflight` returns a report naming each missing piece, shown as a setup check in the Send tab and by `artpipeline setup`; the template's `setup.sh` (claim W5, area 10; since checkpoint 4 it installs nothing and the Artist onboarding form installs the tools) fetches the large files. Not fixed: a sign-in is the artist's own act, and an artist cannot be given a machine; the check only makes the gap readable.

## Red team, checkpoint 3

Mode: self red-team by the area owner, Sonnet 5.5, on what this revision changed; the Opus readers attack the page next. Lenses run: Designer and artist, Time, Roadmap, Agent, Stranger. Skipped: Performance, Scale and Ambition (nothing they judged changed). Every finding below is fixed above unless it says otherwise.

### Designer and artist

Strongest claim attacked: "the artist's machine holds git and Git LFS and nothing else, and the artist never sees a git word."

1. Serious: an artist new to Unity presses Send on the first day and the push needs a sign-in and the right to create a branch. Evidence: the Preflight list names "no sign-in for the remote"; Git Credential Manager asking once in the browser is unverified. Fix: the sign-in is a preflight finding in plain words, the permission is open decision 1, and A5 checks the sign-in on the artists' machines. Not fixed: until A5's check, the sign-in is a belief.
2. Serious: the Action fails or is switched off, the artist sees "Sent" and no pull request ever appears. Evidence: "the window ... cannot see the pull request". Fix: claim W6 makes the Action report its own failure to the engineers, and the window names the branch so a person can be told. Not fixed: the artist has no confirmation of their own.
3. Minor: the first wording of a failed push said "branch". Fix: "saved on this computer under the name X".

### Time

Strongest claim attacked: "the destination knows by git alone whether the earlier send was merged."

1. Serious: a squash merge, which the title rule makes the normal merge, leaves the artist's commits unreachable from the default branch, so a test by ancestry would call every merged send waiting and strand the artist on a stale branch. Evidence: the title is the commit, so merges are squashes (Workflow.md, first kept idea). Fix: merged means the branch is gone from the server and every file of the send equals the default branch; a send removed without merging keeps the artist where they are. Not proven on a clone with Git LFS: an A5 spike.

### Roadmap

Strongest claim attacked: "Send is one epic that stands alone."

1. Serious: Send now depends on an Action that does not exist, so A5 could block on area 10. Evidence: claim W6 is unanswered. Fix: Send stands alone as a branch push; if the Action is late an engineer opens the pull request, and A5's value does not change.
2. Minor: neither game needs this package, yet the epic table could be read as part of the milestones. Fix: stated in the epics section and as a claim on the roadmap that A1 to A7 are off both critical paths.

### Agent

Strongest claim attacked: "an agent can make a model playable with only the command line."

1. Minor: the chain's lines name a prefab that only exists after the variant is made, and `places gym-start` needs it. Evidence: the chain is an ordered list of text lines. Fix: `{prefab}` and `{asset}` placeholders the caller fills, claim C5.

### Stranger

Walked and found nothing: a card game (textures only, a folder destination), a racing game (Generic rig kind and its own wheel check), a studio on Perforce (a destination of its own; nothing in the package names git or GitHub).

Could not check: GitHub's documentation for what triggers an Action on a push and how it takes a pull request title from a commit; the Unity manuals for 6000.3 and 6000.7; any real repository. Nothing in the design leans on them being a particular way except through the three A5 spikes.


## Red team, checkpoint 4

Mode: self red-team by the area owner, Sonnet 5.5, on what this fold changed; no reader tool was available, so each finding is mine and was checked against the files named. Lenses run: Designer and artist, Time, Agent, Roadmap, Stranger. Skipped: Performance, Scale and Ambition (nothing they judged changed). Every finding below is fixed above unless it says otherwise.

### Designer and artist

Strongest claim attacked: "an artist keeps a new material without an engineer and nothing wrong reaches the game."

1. Serious: Keep takes any name, so a DCC default such as `Mat_1` joins the palette and every later model with that name passes the check. Fix: Keep refuses a name the kind's naming check rejects, with a sentence, and the artist names the material in the DCC. Not fixed: a kind with no naming rule accepts any name.
2. Serious: a wrong material is kept and merged because nothing makes the reviewer look. Fix: the commit body names every kept material and rig contract, so the pull request shows them. The review is the approval.
3. Minor: the row adds no palette, or the palette's first folder is inside a package, so Keep has nowhere to write. Fix: Keep says so in a sentence and changes nothing; the one-time step is an engineer adding a palette to the rule set.

### Time

Strongest claim attacked: "the game's own assets extend the studio's defaults without conflict."

1. Serious: the studio later adds a material with the name a game already kept; the slot remap by name could pick either. Fix: the game's wins and one warning names both.
2. Serious: the earlier text said artists get "permission to create branches and nothing else". GitHub's repository-roles page lists no such role: Write pushes to any unprotected branch, and only protected branches stop a push (GitHub Docs, repository roles for an organization; fetched 2026-10-24, the page implies the unprotected-branch part rather than stating it). Fix: the wording is withdrawn, claim W7 asks Workflow to verify a ruleset limited to `art/**`, and Send itself only ever pushes `art/<artist>-<slug>`.

### Agent

Strongest claim attacked: "an agent can make a model playable with only the command line."

1. Serious: `artpipeline playable` run twice stops at the first line, because `worldobjects preset-new` answers `failed:` for a draft that exists, so the gym never opens. Fix: the chain stops there as the host's chain does, the result names the line, and `places gym-start --target {prefab}` alone is the second look (the window's Open in gym).
2. Minor: an agent calls `artpipeline fix --keep`. Fix: `refused:` with the audience named, and the hint says a person presses the button.

### Roadmap

Strongest claim attacked: "A4 is Saboteer's class and fits."

1. Serious: A4 rebuilds Saboteer's player prefabs, and the code freeze from mid January 2027 allows bug fixes and media only. Fix: stated as a claim on the roadmap, which dates A4 outside the freeze. Not fixed here: the date is the roadmap's.
2. Minor: the last revision's line totals did not match its rows. Fix: recomputed, and the correction is stated in the table's note.

### Stranger

Walked and found nothing: a card game (no kinds with rigs, no palette, so no Keep and no gym), a racing game (a Generic rig contract of its own, a row that names it), a studio on Perforce (a destination of its own; nothing names GitHub in the package).

### Answers to the Opus readers (checkpoint 4)

Designer and artist, minor: the default rig contracts in Studio.Presentation cannot point at a game's playable character, so Saboteer's artist trying a held prop or a ragdoll preview on the dwarf before an engineer authors a contract gets a red finding on a read-only asset or a figure that is not the game's.

1. Fixed, with part of the suggested fix. The reader is right that a Studio package may not reference a game's prefab. Studio.Presentation now ships each default contract with the bones, sockets, ragdoll profile and hips heights filled in and the reference figure empty, and the rule set row gains an optional reference figure, the prefab of the game's playable character, that fills it (types, the rig contract table and the layers table above). The artist never authors a contract: the studio's numbers are already in the default.
2. Fixed: with no figure set anywhere, the checks that need no figure (scale, bones, sockets) still run, and each preview says in one sentence that the project has not named its playable character and an engineer sets Reference figure on the row. It is never a red finding on the artist's model, and it is not on a read-only asset.
3. Fixed in the epics: A2 gains the story for the row's figure and the skip sentence (10 stories, 54 in all, 25,700 lines read and 13,650 written), and A4 names the dwarf as Saboteer's figure when it rewires the prefabs. Each game's one-time engineer step is therefore one field on one row, the same kind of step as adding a palette for Keep.
4. Not fixed, and said plainly: the first previews in a new game still need that one engineer step. An artist cannot pick the figure alone, because which prefab is the game's playable character is the game's fact (checked with `CharacterKit.Body.IsPlayable`, claim R1), and the contract check reports a figure that is not playable. Nothing the developer decided is reopened: the studio's contracts remain the defaults the game extends (question 7) and the gym character remains a playable character of the game (question 6).

Could not check: Unity's APIs for extracting an embedded material (the A1b spike), GitHub's ruleset limits, whether an App's pull requests start their checks, and a real clone with Git LFS.

## Red team, checkpoint 5

Mode: two serious findings from independent Opus readers (lens Designer and artist), answered by the area owner, Sonnet 5.5. Nothing decided on 2026-10-23 or 2026-10-24 is reopened.

### Answers to the Opus readers (checkpoint 5)

1. Serious, the minimal Send has no way back and no branch-point rule, and it is the artist's only Send for about 16 months. Fixed, taking the reader's first suggestion. The reader is right: from the first merge the artist's clone sits on the first art branch, the second send either carries the squash-merged commit again or starts from a stale default branch, and the artist has no button to receive anything, so the only road back was git by hand, which the scenario forbids. A5a now holds the branch-point rule (the default branch when the earlier send was merged, the earlier branch while it waits, the merged-or-removed test, stacked sends) and Get latest as its second menu item, with a plain sentence for every outcome and a stop, naming the files, on a conflict. A5a grows from 4 to 6 stories (1,700 lines read and 1,500 written, estimates by analogy to the 4-story figures) and A5b shrinks from 6 to 4 (1,600 and 1,200); the pair still totals 10 stories and 3,300 read and 2,700 written. The merged-or-removed spike and the Get latest spike on a squash-merged Saboteer clone move into A5a. What still waits for A5b is the window: the "1 send waiting for review" line, Get latest beside Send in the Send tab, and the stale-model line (which models a changed rig contract makes stale). The limits now say so. The split the developer decided is kept: A5a is still the minimal Send, in Saboteer's class, after the demo build; the developer's phrase covers one more button and one rule. Cost to the plan: Saboteer's gates grow by 2 and the roadmap re-dates A5a; that is the orchestrator's and is returned as a hand-off finding.
2. Serious, no epic moves Corsairs' prefabs onto the rig contract, so a held prop sent to Corsairs sits at its pivot with no end date. Fixed. The reader is right: A4 rebuilds only Saboteer's two prefabs and said Corsairs was "started". New epic A4c, in Corsairs' class, 2 stories: the playable character of Corsairs rebuilt as a variant of its model with contract nodes, its controller carrying `IPlayableCharacter`, its rule set row naming it as the reference figure; then a first held prop, a cutlass with a `grip_MainHand` locator, passing the hold test and held in Corsairs by the function the game calls. Source read: Corsairs has one character model, `PolygonSyntyCharacter.fbx`, and six prefab files in `CorsairAssets/Prefabs` reference it (2,200 to 2,300 lines each); I did not find which one is the playable character, and none carries `IPlayableCharacter`, so naming it is the story's first step and the game's fact, not mine. It depends on A4, A2, A3 and Runtime's L4 and R5a, and R7c's soak waits for it with every Corsairs-class part. The total goes from 54 to 56 stories, 31,200 lines read and 14,450 written; A4's row now says "Corsairs follows in A4c" instead of "started". The prop's equipment visuals (what the player wears and holds as an item) are Studio.Gameplay's L11a1, not this epic; A4c proves only that a held prop is held. Until A4c lands the limits say plainly that the game holds the prop at its pivot.

Could not check: that Get latest and the merged-or-removed test behave as described on a squash-merged clone with Git LFS (the A5a spike), and which of Corsairs' six prefabs is the playable character.
