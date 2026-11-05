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

