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

