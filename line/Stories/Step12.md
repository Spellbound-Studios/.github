## The stories of step 12: the authoring contract, the check seam, drafts and approve (CL4)

Step 12 gives Core the authoring contract a definition type in any package implements, the check seam through which one package adds findings to another package's definitions, the runner and its report, the previewer, drafts and approve, `core validate`, and the inspector banner, and puts Modifiers on the contract as the first package. Ten stories, CL4-1 to CL4-10. The split is the planner's; the outcomes are the epic's. Stories 1 to 9 succeeded in one pull request into Core's `dev`: Core pull request 126 from `cl4-authoring-contract`, merged on 2026-10-26 as 92ba4ed, closing Core issues 117 to 125. Story 10 is open: Modifiers pull request 31, a draft into Modifiers' `main` from the side branch `definition-contract`, closing Modifiers issue 30, which waits for the festival. Two repositories change: Core (the package `Packages/Core` in CoreDev) and Modifiers (in ModifiersDev); neither game changes. Facts are marked **verified** with the date or **verify before building on it**; the facts of stories 1 to 9 carry the date of their merge.

Applies to every story of the step:

- **Rules:** `Runtime/Authoring` holds the contract and references nothing of `UnityEditor`; `Editor/Authoring` holds the check seam, the runner, drafts, the operations and the banner.
- **Rules:** nothing under `Assets`, `ProjectSettings` or the manifest changes; the package versions are not touched and each CHANGELOG gains its entries under Unreleased; Core's `AGENTS.md` names the contract and the four operations under Front door and drops them from Gaps.
- **Rules:** the Modifiers side branch `definition-contract` merges after step 19 has rewired `StatData`, never beside it (the Roadmap's row 12); pull request 31 itself says it is not merged before the festival's last gate (estimated 2027-03-02). Nothing follows the branch, and both games install Modifiers from `main`.
- **Regression contract:** Core's edit mode tests pass unchanged: 358 of 358 in the resident CoreDev editor (6000.4.8f1), and 350 of 350 on the 6000.3.10f1 floor in a throwaway project with no Pipeline, where the 8 bridge tests compile out.
- **Regression contract:** Core's play mode tests pass: 3 of 3.
- **Regression contract:** `core help`, `core about`, `core context` and `core ledger` answer as before, gaining lines only: the step 9 tests for them pass unchanged, and `core help --group core` lists the four new operations (test `TheFiveOperationsJoinTheCoreGroup`).
- **Regression contract:** every public type stays public under its name and namespace: no file outside the new folders changed except `OperationSettings.cs` (one field added) and the test assembly definition (one reference added).
- **Regression contract:** `OperationSettings` keeps every field and an old asset loads with the new default: the field has an initialiser and `Load()` is untouched.
- **Regression contract:** a project without a definition type runs `core validate` and answers `succeeded:` with no assets (`AnEmptyFolderIsAnEmptyRun`, and the `--drafts` case before a draft exists).
- **Regression contract:** neither game's code, scene, prefab or manifest changes; nothing outside CoreDev and ModifiersDev was opened for writing.
- **Done, for each story:** compiles clean in the CoreDev editor after a refresh with zero `error CS` lines in the editor log, the edit mode and play mode tests pass, and the merge of the pull request (`gh pr merge --squash`) is the sign-off for stories 1 to 9.

### CL4-1 The contract

- **Outcome:** a definition type implements `IAuthoredDefinition.Validate(ValidationReport)`; `ValidationReport`, `ValidationFinding` and `FindingSeverity` sit in `Spellbound.Core.Authoring`.
- **Rules:** a finding's code is `<package>.<kebab-name>` and any other code is refused; the report writes one line per finding, code first, errors, then warnings, then information.
- **Done:** succeeded.

### CL4-2 The TypeCache proof

- **Outcome:** it is known that `TypeCache` finds a registered check from an assembly nobody references, so the check seam stands as drawn. Written go.
- **Verified (2026-10-26):** `TypeCache.GetTypesWithAttribute` finds an attributed class implementing a closed generic interface, on 6000.4.8f1 and on the 6000.3.10f1 floor; the marked-assembly scan finds the same class, so the fallback works.
- **Done:** the written result below, a go.

### CL4-3 The check seam

- **Outcome:** a package's editor assembly implements `IDefinitionCheck<T>` (`Check`, and `PreviewLines` with a default of none) for a definition type it does not own and marks it with `RegisteredDefinitionCheckAttribute(name)`, which carries `RunsWhileEditing`; `DefinitionCheckDescription`, `DefinitionCheckRegistry` and `PackageLabel` find and name the checks.
- **Rules:** the registry's type source is swappable; a duplicate name is logged and the first kept; `For(type)` matches by assignability.
- **Rules:** a check's package label is its package's display name without the `Spellbound.` prefix (`Core`, `Modifiers`), or its assembly name outside a package.
- **Rules:** `IDefinitionCheck<T>` constrains `T` to `ScriptableObject`, not to the contract, so a check over `ScriptableObject` itself applies to every definition; the runner only ever runs checks over assets whose type implements the contract.
- **Done:** succeeded; the nine `DefinitionCheckRegistryTests` pass on 6000.4.8f1 and on the 6000.3.10f1 floor.

### CL4-4 The runner and the report

- **Outcome:** `DefinitionValidationRunner` validates and writes a `ValidationRun` with its `ValidationTiming` entries, and `DefinitionReportCache` keeps the last report; a thrown validator or check is reported as `core.validation-threw` or `core.check-threw`.
- **Verify before building on it:** the observation model did not exist at step 12; step 17 shipped it. The runner's timings still sit on `ValidationRun.Timings` and `core validate --timings` until a later story reports them. Nothing was worked around.
- **Done:** succeeded.

### CL4-5 A package folder as a subject

- **Outcome:** a package folder can be the subject of a validation: `DefinitionAssets.ResolveFolder` maps `Packages/<Name>` to `Packages/<id>` through the package manager.
- **Verified (2026-10-26):** `AssetDatabase.FindAssets` with a `Packages/<id>` folder lists a package's definition assets; `Packages/<Name>` is not a valid folder and is mapped to the id. The packaged fixture asset is found through both spellings.
- **Done:** succeeded.

### CL4-6 The previewer and `core preview`

- **Outcome:** `DefinitionPreviewer<T>`, `DefinitionPreview` and `DefinitionPreviewerRegistry` give a definition its preview, and `core preview --target` prints it.
- **Rules:** the most specific previewer wins; a type with none gets its name and type.
- **Rules:** a previewer is registered by deriving `DefinitionPreviewer<T>` and is found through `TypeCache.GetTypesDerivedFrom`, with no attribute: one generic base carries the type, so a second declaration of it would be a place to disagree.
- **Done:** succeeded.

### CL4-7 Drafts and approve

- **Outcome:** `DefinitionDrafts.Create<T>` makes a draft and returns `Draft<T>`, `List` lists the drafts and `TryApprove` moves one through `AssetDatabase.MoveAsset`; `ProjectPaths` sits beside them; `core drafts` lists them and `core approve --target --to` approves, with the audience `approver`, refused while an error finding exists, and `--dry-run` previews.
- **Rules:** `OperationSettings.draftsFolder`, default `Assets/Drafts`, as the design says.
- **Verified (2026-10-26):** `AssetDatabase.MoveAsset` keeps the GUID, confirmed by test; an `OperationException` becomes `failed:` with the hint on the next line, and an `OperationResult` returned directly is rendered as is, which is how `refused:` is answered.
- **Done:** succeeded.

### CL4-8 `core validate`

- **Outcome:** `core validate [--path] [--drafts] [--timings]` answers `succeeded:` or `failed:`, the `checks:` line second and the findings after it.
- **Rules:** a path outside `Assets` and `Packages`, or one that names nothing, answers `invalid:`.
- **Done:** succeeded.

### CL4-9 The inspector banner

- **Outcome:** `DefinitionInspectorBanner` inserts a UI Toolkit element into every Inspector window above the editors when the selected asset is a definition, showing the cached report (a header with counts and time, one line per finding, the checks line) and a Run checks button; `DefinitionSaveWatcher` revalidates a saved definition through a deferred call.
- **Verified (2026-10-26):** `Editor.finishedDefaultHeaderGUI` cannot host a UI Toolkit element (it is IMGUI); the Inspector window root hosts the element instead.
- **Rules:** the Run checks button and the revalidation after a save are built here, because a cached report that never refreshes is not a report; the editing path (the still delay, the `RunsWhileEditing` subset, the stale labels, the budget demotion) is CL4b story 13.
- **Rules:** an asset selected with no cached report is validated once on the next editor update, never inside the repaint, with the full set.
- **Verify before building on it:** not yet judged by a person's eye: open any `FixtureDefinition` asset (or, once Modifiers is on the branch, a `StatDefinition`) in the Inspector, read the banner above it and press Run checks.
- **Verify before building on it:** Unity exposes no public way to find which `Editor` an Inspector window shows, so the banner follows `Selection.activeObject`, and a locked Inspector showing another asset shows the selection's banner; the step 13 editor controls can take this over if it bites.
- **Done:** succeeded, unjudged by eye; the written result below.

### CL4-10 Modifiers on the contract

- **Outcome:** Modifiers is the first package on Core's authoring contract: `StatDefinition` and `ModifierDefinition` implement `IAuthoredDefinition`, two previewers sit in `Spellbound.Modifiers.Editor`, which now references `Spellbound.Core.Editor`, and four test files sit under `Tests/Authoring`, the test assembly now referencing the editor assemblies.
- **Verify before building on it:** recorded in Modifiers pull request 31, undated: 216 of 216 Modifiers edit mode tests passed (201 before, 15 new), run twice, in ModifiersDev on 6000.4.8f1 with Core from CoreDev's working tree.
- **Verify before building on it:** recorded in Modifiers pull request 31, undated: the definitions report `modifiers.stat-name-empty` (error, `statName`, the stat has no name), `modifiers.modifier-name-empty` (error, `modifierName`, the modifier has no name), `modifiers.contributions-empty` (warning, `contributions`, the modifier changes no stat), `modifiers.contribution-null` (error, `contributions[i]`, a list element is null) and `modifiers.contribution-invalid` (error, `contributions[i]`, a contribution's `IsValid` is false, the message naming the missing stat or amount when it can).
- **Verify before building on it:** recorded in Modifiers pull request 31, undated: the report of a `ModifierDefinition` reads `checks: ModifierDefinition (Modifiers)`; the previewer's summary is the display name and the contribution count, one line per contribution, with the icon's asset path as its picture when one is set.
- **Rules:** every serialized field of the two definitions keeps its name and type; `HashedScriptableObject` stays the base, so the edit-time identity stamp is unchanged.
- **Rules:** ModifiersDev's manifest pointed at `file:../../CoreDev/Packages/Core` for the build and was restored to `Core.git?path=/Packages/Core#dev` afterwards.
- **Regression contract:** Modifiers' tests pass on the branch; `StatDefinition` and `ModifierDefinition` keep every serialized field under the same name (only `IAuthoredDefinition` and `Validate` were added); `HashedScriptableObject`'s edit-time stamp still runs for both (the base class and `OnValidate` are untouched); neither game changes.
- **Verify before building on it:** the branch compiled only against Core's working tree, and ModifiersDev's `packages-lock.json` still names the working tree until the project is next opened and Unity re-resolves it from the manifest. Core's `dev` holds the contract since 2026-10-26; the pull request asks for Modifiers' tests to be re-run on this branch once before merging.
- **Done:** not done: open as the draft Modifiers pull request 31 into `main` from `definition-contract`, closing Modifiers issue 30. It merges after step 19 has rewired `StatData`, never beside it; the pull request says after the festival's last gate (estimated 2027-03-02).

### The written result of the TypeCache proof (CL4-2, 2026-10-26)

`TypeCache.GetTypesWithAttribute<RegisteredDefinitionCheckAttribute>()` returns `Spellbound.Core.Tests.AuthoringFixture.Check.FixtureThresholdCheck`, a class that carries the attribute and implements the closed generic interface `IDefinitionCheck<FixtureDefinition>`, from an editor assembly that `Spellbound.Core.Tests` does not reference (a test asserts the referenced-assembly list). `DefinitionCheckDescription.DefinitionTypesOf` reads `T` as `FixtureDefinition` from `GetInterfaces()`. Verified on 6000.4.8f1 and on 6000.3.10f1 (the floor). `MarkedAssemblyScan.TypesWith<RegisteredDefinitionCheckAttribute>()` finds the same class when the fixture assembly carries `[assembly: OperationGroup]`, so the fallback works and is one constructor argument away (`new DefinitionCheckRegistry(DefinitionCheckRegistry.MarkedAssemblyTypes)`); it is not switched on.

Go: the check seam stands as drawn, on `TypeCache`. Two facts for the record: the type cache returns types in an undefined order, so the registry sorts by full name before reading them and by check name after; and a fixture assembly that is not marked is invisible to the fallback, which is why the fixture carries the group attribute.

### The written result of the banner proof (CL4-9, 2026-10-26)

`Editor.finishedDefaultHeaderGUI` is an IMGUI event: its handler receives the `Editor` and runs inside the header's `OnGUI`, with no element to attach to, so it cannot host a UI Toolkit element. The default the plan named for this case (area 11's report view draws the banner from the cached report) is not needed: the Inspector window itself is UI Toolkit in Unity 6, and `DefinitionInspectorBanner` inserts a `VisualElement` named `spellbound-definition-banner` at the top of each Inspector window's main container (class `unity-inspector-main-container`, falling back to the window root) when the selected asset is an authored definition, and removes it otherwise. The element carries USS classes (`spellbound-definition-banner`, `__header`, `__title`, `__run`, `__finding`, `__finding--error`, `--warning`, `--information`) so a project styles it from its own editor stylesheet.

Proved in a windowed 6000.4.8f1 editor through the Unity command line:

| Case | What the banner showed |
|---|---|
| The packaged fixture selected | The element at index 0 of the main container, reading `Validation at 19:45:28: no findings`, `checks: FixtureDefinition (Core), fixturecheck.threshold-high (Core)` and the button `Run checks` |
| A probe asset with an empty title and a threshold of 500 | `Validation at 19:46:10: 2 errors`, then `error fixture.title-empty at title: the title is empty (Type a title.)` and `error fixturecheck.threshold-high at threshold: the threshold is 500, above 100 (Lower it to 100 or less.)`, each line carrying the `--error` class |
| Deselected | The element removed |

The probe asset was deleted afterwards. Not yet judged by a person's eye.

The step's stop column was the TypeCache proof (a go) and the merge of the Modifiers side branch, which the Roadmap's row 12 places after step 19 has rewired `StatData`, never beside it, and which pull request 31 says waits for the festival's last gate (estimated 2027-03-02). No measurement was asked for in this step: the runner times every validator and check and `core validate --timings` prints the table. Step 17 shipped the observation doors; the runner's timings still sit on `ValidationRun.Timings` and `core validate --timings` until a later story reports them.
