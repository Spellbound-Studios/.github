# Checkpoint 2 revisited, area 11: UI, text surfaces and editor tooling (2026-10-23)

## Revision 2026-10-24, checkpoint 5, the hand-off fold

The developer's answers of 2026-10-24 to the checkpoint 4 questions folded in one pass, and the two claims on this area from `RedTeam.md` 8.8 answered (section "Claims on this area, answered (checkpoint 5)"). Nothing decided is reopened. What changed:

- Saboteer moves onto the new UI and chat before the mid January 2027 freeze. The open question is gone and is a rule in section 9. The demo shows the new chat window and console, and a tester who saved a HUD layout in an earlier build sees the default HUD once; the demo is exempt from the saves rule. The after-the-festival alternative is removed everywhere.
- U4 is split in two: U4a (the library, the window and console, the chat settings page and Saboteer's cut-over) lands before the freeze and U4b (the networking bridge, the bridge's check and Corsairs' cut-over) follows N4. U6 is split the same way: U6a (input contexts, modal host) and U6b (the layout section and the glue deleted, which needs the first slice of Persistence). Two stories are added to U4a. The area is 68 stories and twelve epics, and section 8 carries the milestone class of each.
- The check seam's interface is `IDefinitionCheck<T>` in section 3k, the drawn example and the limits; the attribute is area 2's `RegisteredDefinitionCheck` with the check's name, and the report's checks line is spelled `<name> (<Package>)`.
- The stale-field error carries the stored value text and nothing is written anywhere to keep it; `ReportView` draws the message as it comes and shows no Fix button.
- `ReachableDepositsCheck` is in `Navigation.Places.Editor`, a Places-gated editor assembly.
- Section 7 gains the Unity-owned list (filters, box shadows, gradients, gap, screen-reader support) and the Unity 7 theme priority rule becomes a probe in the throwaway copy.
- Section 9 is a list of rules, with nothing open. No decision is left for the developer.
- Claims round, second pass: four more claims answered (last table of section 10). The console deletions are split with CL3 (U3 deletes the views, CL3 the old registries and `ConsoleLogger`), and CL3's Saboteer half is named as waiting on U3. The in-flight item over a slot is Inventory.UITK's presentation state, not a UI widget (UI adds no story and no code). UI references no Localization type, so a change in Localization 2.0 lands in the game-side or Studio backing of the seam, and the 6.7 probe decides whether it is a story. Still 68 stories and twelve epics.
- Roadmap reconciliation: the hand-off prices U1 at 11 (UI1 10 and UI1b 1, the Studio.Presentation folder the menu chrome moves into), so U1 is 11 and the area is 68 stories and twelve epics. The other eleven epics match the hand-off story for story.

## Revision 2026-10-24, checkpoint 4, the claims round

Five claims answered (section "Claims on this area, answered (checkpoint 4)", after the limits): one accepted as already folded, three amended, one rejected in part. What changed:

- `ReportView` draws up to two action buttons per finding, each calling a delegate the host supplies. The single `FixHandler` is replaced by a provider, because one fix code cannot name the two outcomes of a material finding (Pick an existing one, Keep as a new material).
- `ReportView` gains a banner form over the same bound report. It is the fallback if `Editor.finishedDefaultHeaderGUI` cannot host a UI Toolkit element; Unity's page for the event shows only IMGUI calls and does not mention UI Toolkit, so the fallback is designed now and area 2's first proof decides whether it is used. How a banner reaches an inspector that has no custom editor is area 2's, and is not solved here.
- Each finding row shows the name of the check that wrote it when the finding carries one, so the Check and Drafts pages name rows by the check.
- U7c grows from 2 to 3 stories: the `Identity.asset` inspector in UI Toolkit. The area is 64 stories and ten epics. The rewritten inspectors are new types with new names and the old types are deleted in the same story, so the Unity ledger's Moved rows stop resolving and the ledger check turns them green.
- Rejected: that this area owns the check seam's interface, attribute and run lines, and the Drafts page content. They are area 2's CL4 story 10 and CL7, already priced. This area draws their output.

## Revision 2026-10-24, checkpoint 4, the fold and the reprice

Folded in one pass from the developer's answers of 2026-10-24 and the open claims of `RedTeam.md` section 7.7. Nothing the developer decided is reopened. What changed:

- The check seam (question 11, yes, the seam only): section 3k gains "The check seam, from the editor's side", with the developer's example (`ReachableDepositsCheck` in `Navigation.Places.Editor` over `PlaceDefinition`, and the `core validate --drafts` report that names both checks). Core.Editor holds one interface, one attribute and the lines that find and run registered checks; every package ships its checks in its own editor assembly. This area draws the output and registers one check of its own, in `Switchboard.Networking.Editor`.
- A stored field the type no longer has (question 12, yes): `core.unknown-key` is an error finding; `ReportView` draws it like any other and shows no Fix button on it, because the scan is detection only.
- The two old-style inspectors (question 33, yes): a new epic U7c, two stories, Core's log settings and GeoForge's material table in UI Toolkit now; U7b no longer waits for them. The area is 63 stories.
- Every reporting door takes the observation context as its last explicit argument (`RedTeam.md` 7.7, item 1): `UIKit.Views`, `SwitchboardKit.Connect`, `SwitchboardKit.Host` and the `TextLog` constructor.
- Saboteer is owner-authoritative: Switchboard no longer reads as a server-side router. Where the router runs, and whether filters and the rate limit run at the sender, the router or both, is a profile setting with no default in the library. The library's strings name no game; Saboteer's say Saboteer.
- Saves: the layout store and the chat settings are sections with Core's header (name, layout fingerprint, length). An older layout is refused by name and the default is used; no section holds a tick rate. After Saboteer's first release built on the line these are a customer's saves, and carrying one across is Persistence's upgrade feature, not UI's.
- Nothing is pinned: open question 2 is rewritten around the mid January 2027 freeze and the Next Fest, with no demo branch.
- Not touched, because this file never held them: the reference frame noun, authority modes beyond Switchboard, gym characters, host answers and escrow.

I had no subagent tool in this pass; every fact is from the files named in the task or from this file. The Unity facts have not changed.

## Revision 2026-10-23, checkpoint 3 apply round

Applied in one pass from `RedTeam.md` section 6 and the amendments at the end of `Line.md`. What changed:

- Decisions 1 to 3 are settled and moved to Decided (section 9): the editor controls live in Core.Editor, UI Toolkit for everything new in editor tooling, moderation as recommended. Two plain questions remain open, both new.
- Compatibility removed: the layout store carries no format version and no migration steps, the Switchboard wire message carries no format version, the theme has no contract version (the validator lists a missing token instead), and nothing in this file keeps a reader for an older layout. A changed layout or setting is re-saved by the player.
- Every operation is spelled in area 2's grammar (`<group> <operation> [arguments]`, group `ui` or `switchboard`, kebab-case, status word first). `ui theme list` and `ui theme set` became `ui themes` and `ui theme`. Examples declare operations with `[assembly: OperationGroup]` and `[Operation(name, summary, effect)]`.
- The front doors are `UIKit` and `SwitchboardKit`; `Switchboard.Connect`, `Switchboard.Host` and `SwitchboardProfile.Create` became `SwitchboardKit.Connect`, `Host` and `NewProfile`.
- `Switchboard.Networking` is a bridge over `Spellbound.Networking.Replication`, the protocol assembly, with no PurrNet type in Switchboard's surface; the name `SwitchboardPurrNet` is gone.
- The floor is 6000.3: the Unity facts this area leans on were read against the 6000.3 pages (runtime binding is documented there, `TabView` has `reorderable` and `tabClosed` there), the 6.3 test row runs U2's tests, and what is still unconfirmed names both versions.
- Epics: U4 grows from 12 to 13 stories (the mute list that decision 3 settles; its first nine stories need no Networking), so the area is 61 stories. Dependencies now name the owning area's epic, and each epic says which game milestone needs it.
- Not touched, because this file never held them: Vehicles, a gym profile, Studio.Content. The only Studio packages named are Studio.Online, Studio.Presentation, Studio.Gameplay and Studio.Tools, none of which names a game.

I had no subagent tool in this pass either; every new fact above was read by me (the two Unity 6000.3 pages named in the sixth item, `RedTeam.md`, `Line.md`, `CommandLine.md`).

## Revision 2026-10-23, checkpoint 3 claims round

Four claims from other areas answered (section "Claims from the fix round, answered (checkpoint 3)", after the limits). What changed:

- Operations: re-checked every operation line, list and example in this file against area 2's grammar; no spelling was left to change.
- Core.Editor's `ReportView` shows per finding the message, the hint and a Fix button that calls a delegate; `HeaderBar` takes a title and a severity. Both are in the stories of U7a.
- U7 split in two so the window shell and the controls do not wait on each other: U7a (Core.Editor's controls, 4 stories) before the shell, U7b (UI.Editor, 5 stories) after it. The area stays 61 stories.
- Tabs reach the window through `[WindowPage]`, found by `TypeCache`; the claim on area 7 is closed.
- The black box and counters windows are Diagnostics.UI over UI.Widgets, fed by `diagnostics blackbox` and `core observations`; the result-to-lines helper that `ConsolePanel` already needs becomes public in U3.

I had no subagent tool in this pass either; every fact below was read by me in `Living.md`, `Art.md`, `Runtime.md` and `CommandLine.md`.

Owner: the UI agent. Designs inside the approved line (`Revisited/Line.md`). A change to the line is a claim, listed at the end of the result and marked "line" here. I read every file named in the task, then `UIDev/Assets/UI`, `ChatDev/Assets/Chat`, Core's `Runtime/Console`, both games' chat, console, tooltip, settings and layout code, and the Unity 6000.4 documentation where a capability is leaned on. I had no subagent tool in this session, so every fact below was read by me in the source, and the red team in the last section was run by me, lens by lens, not by separate readers (said again there).

UI's sentence from the line, which this design serves: "Gives a game, and the editor that builds it, one kit of UI Toolkit widgets, one replaceable theme, and screens composed from them with focus, cursor and escape handled once." Switchboard's: "Gives a game text between players: scopes, delivery to the right receivers, history, moderation, and typed commands routed from the text, over any transport."

## The design in five lines

1. UI sells what Unity does not ship: screens with focus, cursor and escape handled once; a text log and a text entry that get focus right once; styled text that cannot be forged; a tooltip with detail tiers; bound form rows; a theme that is a contract. It stops wrapping controls Unity already has.
2. The console and the chat window are not two systems. They are two arrangements of the same three parts (a log, an entry, a window frame) fed by two feeds: Core's operation directory, and Switchboard's session.
3. Typed commands are operations. `/w` is `switchboard whisper`. Aliases are data in a profile asset. The second command registry dies.
4. Switchboard becomes a real router: scopes pick receivers (today every line reaches every observer and the client hides what it does not want), message kinds are open ids, system lines travel as template plus arguments and each receiver renders them in its own language. Where the router runs, and whether filters and the rate limit run at the sender, the router or both, is the profile's setting; Switchboard assumes no host answer.
5. The editor is a consumer: four shared editor controls and the validation report view live in Core.Editor (decided), UI.Editor skins them and adds the Gallery, the validators, the New View action and the console tab of the Spellbound window. An agent can see and drive the running UI through `ui` operations.

## 1. The scenario, walked

### 1a. Area 1's scenario, for the rows this area owns

A new engineer, ten minutes, no help. Under this design they answer:

| Question | Answer | Why, in one line |
|---|---|---|
| Where does the developer console go? | `UI` draws it (`ConsoleView`, over Core's operation directory). Commands are each package's operations | A console is a list of operations plus a text view; both have owners. No Console package |
| Where does the chat window go? | `Switchboard.UI`, a bridge inside Switchboard, arranges UI's parts and feeds them from a session | Bridges live in the data owner (rule 3). UI never learns Switchboard's name |
| Where does "whispers are pink" go? | A field in the studio's `SwitchboardProfile` asset in `Studio.Online` | A value for a library seam. The library default is neutral |
| Where does the guild tab go? | A Corsairs profile asset that includes the studio profile and adds the guild scope and tab | It names one game's world |
| Where does an affix line in a tooltip go? | The tooltip is UI's; an affix as styled text is `Modifiers.UI`; which affixes show, in what words, is `Studio.Gameplay` | Mechanism, bridge, value |
| Where does a settings screen go? | The screen (UXML, rows, values) is the game's or `Studio.Presentation`; the rows are UI's; the saved values are Persistence sections | A mechanism and its values separated |
| Where does a new package's inspector go? | In that package's Editor assembly, built from Core.Editor's controls; UI.Editor skins it when installed | One look, no per-package bridge |
| Where does the input-mode switch (typing in chat stops the player moving) go? | The seam is UI's (`IInputContextSwitch`); the implementation is the game's, once | Four hand-wired copies today |

### 1b. Area 2's scenario, the last sentence: "reachable by a person in the editor and in the in-game console"

The agent asks `core help` through `spellbound_run`, the one Pipeline command; the answer comes from Core's operation directory. The tester in a development build presses the console key: `ConsoleView` shows the same directory, offers `ui theme` and `ui themes` for `ui th`, hides what the audience tag forbids. The developer opens the Spellbound window in the editor, opens its Console tab (contributed by `UI.Editor`), and types the same line. One list, one parser (Core's), three views. The agent can also read what the player sees: `ui tree` and `ui capture` (epic U8).

### 1c. This area's own scenario: a card game, the stranger with the least to install

Installs Core, UI, Switchboard, Persistence (the line's card game manifest). In an hour:

1. Opens UI's Gallery sample, sees every widget in the default theme, switches to the second shipped theme with one dropdown.
2. Duplicates the default theme asset, edits the token file, assigns it to the Panel Settings. Nothing breaks silently because the theme validator lists any token its copy forgot.
3. Uses the New View action: `LobbyView.cs`, `LobbyView.uxml`, `LobbyView.uss` appear and the view is parented under the manager.
4. Drops a `ConsoleView` and a `ChatView` into the scene, assigns a profile asset (two scopes, three tabs), points Switchboard at its own transport (a class implementing one interface). No PurrNet, no Steam, no Cinemachine, no Entities and no Input System reference compiled.
5. Builds a settings screen from `LabeledSlider` and `LabeledToggle` rows bound to a settings object; Persistence saves it as a section.

## 2. Before, from the code

Everything below was read in source on 2026-10-23. Line counts are `wc -l`. Comments are omitted from quoted code.

### 2a. UI 0.2.10 (`UIDev/Assets/UI`)

| Fact | Evidence |
|---|---|
| Two runtime assemblies: `Spellbound.UI` (pure logic: view manager, cursor, escape, layout store and math, step sequence) and `Spellbound.UI.UITK` (views, elements, manipulators, styles). No Editor assembly and no Editor code at all | `Runtime/Spellbound.UI.asmdef`, `Runtime/UITK/Spellbound.UI.UITK.asmdef`; no `Editor` folder |
| `package.json` says `"dependencies": {}` while both assemblies reference `Spellbound.Core` | `package.json:12`, `Runtime/Spellbound.UI.asmdef` |
| Runtime code is 4,590 lines of C# plus 1,944 of USS and UXML; tests are 1,559 lines, all pure logic (view manager, cursor, escape, layout math, step sequence, tooltip math, perimeter). No test touches an element | `Tests/*.cs` |
| 11 `[UxmlElement]` classes (`AdjustableRegion`, `GridOverlay`, `ElementAnchor`, `PerimeterGlow`, `PerimeterSparkles`, `ResourceBar`, `ScreenLayer`, `SpellboundScrollView`, `Spotlight`, `TabBar`, `TooltipSurface`), not the 14 the audit counted. There is no text field, button, toggle, slider, dropdown, list, window, dialog or toast of the kit's own | `grep UxmlElement` |
| Consumers in the two games and Chat: `Maximizable` 0, `PanZoomable` 0, `TabBar` 0, `IViewTransition` 0 outside the package. `TooltipSurface` 19 files, `AdjustableRegion` 16, `SpellboundScrollView` 7 | `grep -w` over both games and Chat |
| Game-shaped content: `HeroButton.uxml` has `text="ACTION"`; `ResourceBar` has `CastVariantUssClassName`, `InterruptedVariantUssClassName`, `FizzledVariantUssClassName`; `MilestoneChainBinder` counts five bubbles; `CharacterRow`, `WorldRow`, `TraitRow`, `StatRow` templates; `MenuChrome.uss` is 755 lines | `Runtime/UITK/Templates`, `Elements/ResourceBar.cs:13-15`, `Styles/MenuChrome.uss` |
| Tokens are one `:root` block of about 60 custom properties; a theme is a `.tss` that `@import`s the package's sheets by relative path, and only the sample has one | `Styles/Tokens.uss`, `Samples/Demo/SampleTheme.tss` |
| `Samples/` (not `Samples~`) holds an assembly that is auto-referenced and references `Unity.InputSystem`, so it compiles into every consumer | `Samples/Spellbound.UI.Samples.asmdef` |
| A view's identity is the FNV hash of its class's simple name. Two classes already share one: `Spellbound.Chat.UITK.ConsoleView` and `Spellbound.CorsairsWorld.UI.ConsoleView`. The manager warns on a collision at runtime and resolves to the first registered | `Runtime/UITK/Views/View.cs:24`, `ViewManager.RegisterView` |
| The layout store packs through Core, owns its own format byte, and on an unknown version logs "Discarding saved layout" and drops the player's layout | `Runtime/Layout/LayoutStore.cs:83` |
| The cursor arbiter writes `UnityEngine.Cursor` directly. There is no input-mode seam, so no code in the package says "typing in chat stops the player moving" | `Runtime/Cursor/CursorArbiter.cs` |

### 2b. Chat 0.3.11 (`ChatDev/Assets/Chat`)

| Fact | Evidence |
|---|---|
| 4,012 lines of C# and 341 of USS and UXML in four assemblies: engine, UITK, UIIntegration (guarded by `SPELLBOUND_UI` with a version expression of `""`, so any version of UI compiles it), samples. Tests 932 lines | `Runtime/*.asmdef` |
| `ChatClient` is client-only. It validates, hands a `ChatMessage` to an `IChatTransport`, and keeps a ring history. There is no server half: who receives a line is entirely the game's transport | `ChatClient.cs`, `IChatTransport.cs` |
| `ChatMessage` is a flat struct of `channelId`, a closed `ChatMessageKind` enum (Standard, Whisper, System, Emote), `senderId`, `senderName`, `targetId`, `targetName`, `body`, `sentAtUnixMs`. Names travel on every message although a roster already exists | `ChatMessage.cs`; both games' `BroadcastChatObserversRpc(channelId, kind, senderId, senderName, body, NowUnixMs())` |
| Delivery in both games is one `[ObserversRpc]` to every observer. A channel is only a display filter in the client's tab (`ChatTabDefinition.Matches`). A guild or party line would reach every client | `SaboteurDev/.../Chat/ChatNetwork.cs:140`, `ChatTabDefinition.cs:27` |
| Trust: a System-kind line renders with rich text on, so the client downgrades incoming System lines unless `allowIncomingSystemMessages` is set, and `ChatMessageFormatter` escapes plain text for every other kind. Formatting is string concatenation of `<color>`, `<b>`, `<i>` and `<link>` | `ChatClient.cs:252-253`, `ChatMessageFormatter.cs` |
| Colours are code: whisper pink `new Color32(255, 130, 240, 255)` and system amber are literals; channels are registered in code in both games (`Client.RegisterChannel(new ChatChannelDefinition("general", ..., "g", "gen"))`) | `ChatChannels.cs:12,15`, `ChatHud.cs`, `ChatHudView.cs` |
| Typed commands: `ChatInputParser` handles `/w`, `/r`, `/me` and channel aliases with alias arrays in options; every other `/word` becomes an intent for `ChatCommandRegistry`, a second registry with string arguments. Neither game references it | `ChatInputParser.cs`, `ChatCommandRegistry.cs`; `grep` finds no use in `SaboteurDev` or `CorsairsIsleDev` |
| The console in Chat is a UITK `ConsoleElement` (383 lines) over Core's `CommandRegistry.Instance`. Core separately ships a uGUI and TextMeshPro `ConsoleController` (308 lines) with two prefabs (2,225 YAML lines). Corsairs writes its own `ConsoleView` over Chat's controller | `Console/ConsoleElement.cs`, `ConsoleWindowController.cs`, `CoreDev/.../Console/ConsoleController.cs:5-8` |
| Focus: `ChatWindowElement` (780 lines) and `ConsoleElement` hold the same hand-written machinery with the same field and method names: `FocusInput`, `RetryEditFocus`, `_editFocusRetries`, `_refocusPending`, `_focusGainedFrame`, `_submitHandledFrame`, `_inputDismissedFrame`, 20 and 23 references. It exists because focusing a `TextField` in UI Toolkit needs retries and frame-suppressed Enter. A static `FocusTrace` bool turns tracing on | `ChatWindowElement.cs:326-352`, `ConsoleElement.cs:105-131,347` |
| Window chrome: Chat carries its own drag and resize manipulators (`WindowDragManipulator`, `WindowResizeManipulator`) beside UI's `Draggable` and `RegionResizeManipulator` | `Runtime/UITK/Window*Manipulator.cs` |
| Tabs are hand-built `Label`s (`SetTabs`) with add, rename and move logic in `ChatTabCollection` | `ChatWindowElement.cs:245-270` |
| The elements load their template and stylesheet by fixed `Resources.Load` paths | `ChatWindowElement.cs:118,128`, `ConsoleElement.cs:60,71` |
| Strings are one `ChatStrings` class of English literals, overridable by replacing the instance | `ChatStrings.cs` |
| Persistence of chat settings in Saboteer is `JsonUtility.ToJson(this)` encoded as UTF-8. The audit's "no JSON in either game" is wrong on this point | `SaboteurDev/.../Chat/ChatSettingsData.cs:20` |
| The sample registers a console command `hello` that compiles into every consumer | `Samples/Demo/ConsoleDemoCommands.cs` |

### 2c. What the games write around both

| Fact | Evidence |
|---|---|
| Chat glue: Saboteer 1,209 lines in `_Project/Chat` (`ChatSettingsPanel` 504, `ChatNetwork` 205, `ChatHud` 190), Corsairs 346 (`ChatNetwork` 211). The two `ChatNetwork` classes differ in `LocalDisplayName` and formatting only | `diff` of the two files |
| Input mode is hand-wired four times: Saboteer `GameViewManager.HandleViewShown` calls `SwitchToConsoleInput`, `ChatHud.HandleInputFocusGained` calls `SwitchToChatInput`; Corsairs `ConsoleView.OnShow` and `ChatHudView.HandleInputFocusGained` do the same | `GameViewManager.cs:117-122`, `ChatHud.cs`, `ConsoleView.cs`, `ChatHudView.cs` |
| Layout persistence glue is written in each game's view manager (Corsairs `LoadLocalUiLayout` and `SaveLocalUiLayout`, `GameViewManager.cs:89-117`; Saboteer through `UiLayoutService`) | those files |
| Tooltip: Corsairs `TooltipSystem` is 1,934 lines of C# (`TooltipView` 764, `ItemTooltipPayload` 591). Its detail tier reads `Input.GetKey(KeyCode.LeftAlt)` (`TooltipDetail.cs:43`, `TooltipView.cs:221`). Corsairs sets Active Input Handling to Both (`activeInputHandler: 2`); Saboteer uses the Input System only (`activeInputHandler: 1`). Unity's documentation says code calling `UnityEngine.Input` fails when Active Input Handling is the new Input System only (Unity In-App Purchasing documentation on `StandaloneInputModule`), so this tooltip cannot move to Saboteer as written. Saboteer has a second tooltip, `SlateTooltip` | files cited; `ProjectSettings.asset` of each game |
| Settings screen: Saboteer `StartScreen/SettingsView.cs` is 1,045 lines. It declares 46 dropdown, slider and toggle fields and two helper methods, `Dropdown(root, name, labelKey, choices, read, write)` (line 919) and `SliderField(...)` (line 940), which are a private binding mechanism: label key, a read function, a write action, a `_syncing` guard. 42 sites set or listen for a value | file cited |
| Localisation: Saboteer's `Loc` binds `new LocalizedString(table, key)` to an element's `text` with `SetBinding` (28 lines). Unity's Localization package documents this binding for UI Toolkit in UXML and in C# | `StartScreen/Loc.cs`; Localization 1.5 manual, "UI Toolkit (Unity 6+)" |
| Theme switching: Corsairs `ThemeSwitcher` (52 lines) swaps `PanelSettings.themeStyleSheet` across panels; a console command `ui theme` calls it | `UIToolkit/Theme/ThemeSwitcher.cs`, `UiConsoleCommands.cs` |
| Windows made four times: UI's `WindowChrome.uss`, Chat's window, Corsairs' `TooltipWindowHost` (a draggable frame with a close button for a frozen tooltip), Saboteer's settings and report windows | files cited |

### 2d. The editor side today

| Fact | Evidence |
|---|---|
| Editor UI in the line is scattered: UITK inspectors in Core (`ObjectPresetEditor` 342, `SerializeReferenceDropdownDrawer` 97) and VolumetricFog (`VolumetricQualityProfileEditor` 40); IMGUI in Core (`LogConfigEditor` 319), Modifiers (`SerializeReferencePicker` 117), GeoForge (`MaterialSideTable` 254, an inspector inside a Runtime scripts folder). Saboteer: 11 IMGUI files. Corsairs: a UITK talent tree window on GraphView (`TalentTreeGraphView` 469) | file scan, `grep UnityEditor` |
| The same job twice: choosing a concrete type for a `[SerializeReference]` field is a UITK dropdown in Core and an IMGUI popup in Modifiers, and the two differ (one lists by `Type.Name`, one by a `FriendlyName`) | `Core/Editor/SerializeReferenceDropdownDrawer.cs`, `Modifiers/Editor/SerializeReferencePicker.cs` |
| A report of findings with severity exists in a game: Saboteer's `ReleaseAuditReport` (blockers, warnings, a text file in `Logs/`). Core has no such type; the line's validation contract needs one | `SaboteurDev/.../ReleaseAudit/ReleaseAuditReport.cs` |
| Three dev projects carry a 242-line IMGUI `ReadmeEditor` from Unity's project template under `TutorialInfo`; it is scaffolding, not package code | `DecalsDev`, `VolumetricFogDev`, `WorldForgeDev` |

## 3. After

Names are placeholders where noted; every name is spelled out. Operation shapes belong to area 2: where I show an operation I assume `[Operation(group, name, summary)]`, typed parameters, and a result with a success flag, a message and a severity, and I claim only what the surface reads.

### 3a. The map

UI is one package, three assemblies, with bridges hosted by other packages.

| Assembly | Holds | References | Compiles on a server |
|---|---|---|---|
| `Spellbound.UI.Widgets` | Styled text, text log, text entry, window frame, `ConsolePanel` (the console arrangement as one element), tooltip content, host and trigger, labeled fields, the theme tokens and default theme, theme switcher, the existing kit that survives the audit. Stands alone: it needs no manager, no scene layout and no view | Core | No (`!UNITY_SERVER`) |
| `Spellbound.UI.Screens` | View, a concrete `PanelView` that needs no subclass, view manager, cursor arbiter, escape chain, input context seam, modal host, layout store and edit mode, `ConsoleView` (a view wrapping `ConsolePanel`), the `ui` operations. Opt-in: a game that wants only the widgets never references it | Widgets, Core | No |
| `Spellbound.UI.Editor` | Gallery, theme and view validators, New View action, skin for Core.Editor's controls, console tab for the Spellbound window | Widgets, Core.Editor | Editor only, with the same server constraint so it drops out with the assemblies it references |
| `Spellbound.UI.Tests`, `Samples~` | Edit-mode logic tests, play-mode element tests, the Gallery sample | Widgets, Screens | Not shipped |

Bridges other packages host that reference UI: `Switchboard.UI` (the chat view and its feed), `Inventory.UITK` (grid binder, slot styles, and the in-flight stack over a slot, which is presentation state with no data behind it and which UI draws nothing for), `Modifiers.UI` (affix as styled text), `Diagnostics.UI` (overlay). None lives in UI.

The front door is `UIKit`, a static class in `Spellbound.UI` that lives in `UI.Screens`, the top assembly: `UIKit.Views` (the view manager) and `UIKit.Themes` (the switcher, from Widgets). The `ui` operations are declared in the same assembly. The Widgets are plain elements a buyer constructs (`new TextLog()`), so a widgets-only buyer needs no door; putting the door in the top assembly of a package with an opt-in lower one is a claim on area 2.

### 3b. Styled text: one model for every line of text a player reads

```csharp
var line = StyledText.Begin()
    .Role(TextRoles.Muted).Text("[14:02] ")
    .Link("player", senderId).Role(SwitchboardRoles.PlayerName).Text(senderName).End()
    .Text(": ")
    .Plain(body)
    .Build();
```

A line is a list of spans: text, a role (an open id, hashed from a name with Core's hash), an optional link (kind and payload), and an optional detail tier. UI ships neutral roles only (`Plain`, `Muted`, `Emphasis`, `Positive`, `Negative`, `Warning`, `Link`); a package that needs more declares its own, as Switchboard.UI declares `PlayerName`. The renderer is the only code that writes rich-text markup: it escapes every plain span, so a player's `<color=red>` is text. A role's colour, weight and style are USS custom properties on the host (`--sbui-role-playername`), read on the host's `CustomStyleResolvedEvent` through `CustomStyleProperty<Color>` (a struct documented in `UnityEngine.UIElements`; the manual page shows no usage, so the first story of U2 proves the read). A theme change restyles every line with no code.

A localized line is a template span, a mechanism of UI.Widgets:

```csharp
var line = StyledText.Begin()
    .Template("affix.increased",
        Argument.Of("value", 12).Role(TextRoles.Positive),
        Argument.Of("stat", statName))
    .Build();
```

The template id is looked up through one seam, `ITextTemplateResolver`, which returns the pattern for the current language with named placeholders, for example `{value} % mehr {stat}` in German. The renderer splits the pattern at the placeholders and emits literal text as plain spans and each argument as a span with its own role, so word order is the translator's and the number stays in its role in every language. Arguments are typed (text, number, a nested styled line) and are escaped like any plain span. The default resolver reads a `TextTemplateTable` asset (id and pattern, one table per language, picked by a serialized reference). A game that ships several languages implements the seam in about a dozen lines over Unity Localization and keeps the table asset out of it. Plural choice is the resolver's, because it receives the arguments: it may return a different pattern for one and for many. Whether Localization 1.5 can return an unformatted pattern with the placeholders intact is unverified, so the first story of U2 proves the read; if it cannot, the game registers its patterns into a table at locale change, which uses no Localization internals. Switchboard uses this mechanism and owns no resolver of its own (3i).

- Chat lines, console output, tooltip lines, validation reports and the diagnostics log are all `StyledText`. `Modifiers.UI` turns an affix into one with a template span, so tooltip and affix lines are localizable; `Switchboard.UI` turns a message into one.
- Links use `PointerUpLinkTagEvent`, the event Chat already registers (`ChatWindowElement.cs:590`). Unity's reference lists the link events under `UnityEngine.UIElements.Experimental`: the renderer is the single place that depends on them.

### 3c. The three parts

```csharp
var log = new TextLog(capacity: 512, observations);
var entry = new TextEntry(new EntryHistory(capacity: 64));
var frame = new WindowFrame { Title = "Chat", Closable = false, Lockable = true };
frame.Content.Add(log);
frame.Content.Add(entry);

entry.Submitted += text => session.Submit(text);
entry.FocusChanged += focused => inputContexts.Set(focused ? contexts.TextEntry : contexts.Play);
log.Append(styledText);
```

- `TextLog` is a `ListView` with `DynamicHeight` virtualisation (the configuration both elements use today, in `ConsoleElement`'s bind step), a bottom-sticky scroll, a "new lines" pill, `Append(StyledText)` and `Clear()`. No string in, no string out. It reports its flush cost to the observation context passed as the last constructor argument (`ObservationContext.Discard` for a game that wants none).
- `TextEntry` owns everything the two elements copy: acquire focus with the retries, suppress Enter on the focus frame, refocus after submit, Escape cancels, Up and Down walk the history, Tab asks an optional `ITextCompleter`, and it raises `FocusChanged` so a game switches its input map once. Its focus trace is a serialized toggle on the component that hosts it, not a static.
- `WindowFrame` is the one draggable, resizable, lockable, closable window: header, content slot, resize grip. It replaces UI's `WindowChrome` skeleton, Chat's two near-copy manipulators and Corsairs' `TooltipWindowHost` frame. It sits in an `AdjustableRegion` when the manager's layout edit mode is present, as `ChatRegionWindowController` does today.

Two arrangements, one set of parts (drawn concept, figure on the page):

| | Console arrangement (`ConsoleView`, UI) | Chat arrangement (`ChatView`, Switchboard.UI) |
|---|---|---|
| Feed | `OperationConsole`: submits go to Core's operation directory, results and log lines come back | `SwitchboardFeed`: submits go to a session, messages arrive through its history |
| Extras | `ITextCompleter` over the directory, history, the audience filter | tab strip, active-scope pill, unread marks, link actions |
| Default verb | run (every line is a command) | say (a line starting with `/` is a command) |

### 3d. The console over the operation directory

```csharp
public sealed class DeveloperConsole : MonoBehaviour {
    [SerializeField] private ConsoleView view;
    [SerializeField] private string[] audiences = { OperationAudiences.Developer };
}
```

The consumer adds the prefab and a key binding that calls `views.Toggle<ConsoleView>()`. The field is the set of audiences the console's caller holds, an open list of ids, because Core's audience is an open string (`CommandLine.md`): a card game adds `moderator` to Core's constants from its own code and types it here for its table hosts' console, with no edit to UI. UI.Editor gives the field a picker that lists the audiences found in the catalog plus a free entry. There is no development-build value: where a console may open is decided by the game's key binding and by each operation's availability (anytime, while editing, while playing), which is Core's field and not a second one here. `ConsoleView` is a view over `OperationHost` and its catalog (area 2's types) and owns no registry, no parser and no static output event: a submitted line goes to the host, the result comes back as an `OperationResult` whose first word is the status word and whose severity picks the line's role, lines an operation reports through `OperationContext.Report` arrive as live lines (`AppendLive`), and log lines arrive through `Log.AddScopedSink` while the view is open (the scoped sink exists today, `Log.cs:38`). Completion is designed over the catalog's data: `ITextCompleter`'s default implementation reads the catalog's entries (group, name, summary, parameter list, audience) and offers group names, then operation names within the group, then the typed parameter's name and, for an enum parameter, its values. It filters by `audience`, offers `ui theme` and `ui themes` for `ui th`, and prints the signature when an operation is described. The Spellbound window's operation form (area 7) and Switchboard's typed commands are other views over the same host and catalog, and `ITextCompleter` is the part they share, so none of the three keeps a copy of the list. Core's static `ConsoleLogger` events, `GameConsoleSink`, the uGUI `ConsoleController` and both prefabs are deleted; so are Chat's `ConsoleElement` and `ConsoleWindowController`. A game's commands change shape only as area 2 says. This is `ui theme`, spelled the way every operation is (a line is `ui theme Paper`, and its result starts `succeeded:`):

```csharp
[assembly: OperationGroup("ui", "Shows, drives and reads the running interface.")]

[Preserve]
public static class ThemeOperations {
    [Operation("themes", "Lists the themes and marks the current one.", OperationEffect.Reads)]
    public static string Themes() => UIKit.Themes.Listing();

    [Operation("theme", "Swaps every panel to the named theme.", OperationEffect.Writes)]
    public static string Theme([Argument("The theme to apply.")] string themeName) {
        if (!UIKit.Themes.TryApply(themeName))
            throw new OperationException($"No theme matching '{themeName}'.", "Run: ui themes");

        return $"Theme set to {UIKit.Themes.CurrentName}.";
    }
}
```

Corsairs' `ThemeSwitcher` (52 lines) moves into UI.Widgets unchanged in behaviour, and the `ui theme` and `ui themes` operations ship with UI instead of living in one game.

### 3e. Input contexts, once

```csharp
public sealed class GameInputContexts : IInputContextSwitch {
    public void Enter(uint contextId) { if (contextId == InputContexts.TextEntry) input.SwitchToChatInput(); }
    public void Leave(uint contextId) { input.SwitchToPlayerInput(); }
}
```

A view's identity is a serialized id on the view, defaulting to its full type name and hashed with Core's hash, so two classes called `ConsoleView` in different namespaces no longer collide and a view needs no class of its own (`PanelView` takes a UXML asset and a policy in the inspector). `ViewPolicy` gains an optional `InputContextId`, and becomes a type extended by adding a property with a default, not by another positional constructor argument. The view manager calls `Enter` when a view with a context becomes the top view and `Leave` when it stops being it; `TextEntry` raises the same pair when it gains and loses focus. Four hand-wired call sites in the two games become one class each. UI references no Input System type: the seam is an interface and a number.

### 3f. Layout and persistence

`LayoutStore` declares itself a Persistence section through Core's section attribute, with no format version and no migration step. Core writes the section header (name, layout fingerprint, length), so a layout written by an older build is refused by name, the HUD starts from the default and the player places the panels once. The section holds positions and sizes and no tick rate or tick count. A section that fails to read is dropped with one logged warning and the default is used, so a bad file never blocks the game. Once Saboteer ships a release built on the line, its players' layouts are a customer's saves: carrying a changed layout across is Persistence's upgrade feature (designed in the Persistence pitch, built before that first ship) and UI adds none of its own. Saboteer cuts over to the new UI before the mid January 2027 freeze (decided 2026-10-24): the Next Fest demo is built on it, a tester who saved a HUD layout in an earlier build sees the default HUD once, and the demo is exempt from the saves rule. The two games' `LoadLocalUiLayout`, `SaveLocalUiLayout` and `UiLayoutService` go away. UI does not reference Persistence: the attribute is Core's. The section is written when edit mode exits and when the manager is destroyed, not on every record change as both games do today (`HandleLayoutRecordChanged` calls `SaveLocalUiLayout`, `GameViewManager.cs:107-109`), so dragging a panel does not write a save per pointer move.

### 3g. Tooltip: the mechanism, in UI

```csharp
element.AddManipulator(new TooltipTrigger(() => TooltipContent.Titled("Stamina")
    .Line(StyledText.Begin().Role(TextRoles.Value).Text("120").Build())
    .Line(StyledText.Begin().DetailOnly().Text("Regenerates 4 per second").Build())));
```

`TooltipHost` owns the surface (the existing `TooltipSurface` and `TooltipPlacement`), the detail tier, freeze on click and promotion to a `WindowFrame`, and nested keyword tooltips. The tier comes from `IDetailTierSource`, whose default reads modifier-key state through UI Toolkit events and whose Input System implementation is a three-line class the game writes; neither calls `UnityEngine.Input`. `Modifiers.UI` supplies `affix.ToStyledText()`; `Studio.Gameplay` decides which affixes appear and in what words. Corsairs' 1,934 lines split into the host (UI), the affix-to-text rules (Studio.Gameplay) and the payload classes that name items (the game). Corsairs' own comment says an Alt press fires no pointer event (`TooltipView.cs:147`), so the default source needs a keyboard-state poll or a game-supplied source; U5 settles which with a test, and if UI Toolkit offers no keyboard-state read the default is the game-supplied source only.

### 3h. Bound rows, over Unity's own binding

```xml
<sb:LabeledSlider label="SETTINGS_SHADOW_DISTANCE" value-path="shadowDistance" low-value="0" high-value="300"/>
<sb:LabeledToggle label="SETTINGS_VSYNC" value-path="vSync"/>
<sb:LabeledChoice label="SETTINGS_AA" value-path="antiAliasing" choices-from="AntiAliasingMode"/>
```

```csharp
form.dataSource = SettingsService.Video;
```

A labeled field is a label, a Unity control and an optional description and reset button, with the binding Unity already ships (`SetBinding`, `dataSource`; the Unity 6.3 and 6.4 manuals say runtime binding "binds the properties of any plain C# object to the properties of a UI control" in runtime and editor UI). Each row's `value-path` sets a Unity `DataBinding` on its control (the 6000.4 reference documents `DataBinding` with `dataSourcePath`, `dataSource` and a two-way default `bindingMode`). The kit adds no binding system. The label is any text Unity can bind, so a `LocalizedString` works with no UI code, as Saboteer's `Loc` already proves. What the data object must carry for the binding to see it (an attribute or a generated property bag) is not stated on the 6000.3 overview page, which says only that runtime binding "binds the properties of any plain C# `object`" and that a data source can be any C# type, so the first story of U5, run on 6000.3 and 6000.4, ports a slice of Saboteer's `SettingsView` and writes the answer down before anything else is built.

### 3i. Switchboard, seen from the game

```csharp
[SerializeField] private SwitchboardProfile profile;
[SerializeField] private ChatView view;

private void BuildChat() {
    var session = SwitchboardKit.Connect(profile, transport, observations);
    view.Bind(session);
}
```

`transport` is the one `Switchboard.Networking` provides (a bridge over `Spellbound.Networking.Replication`, the protocol assembly; a PurrNet game gets the PurrNet adapter from Networking, and no PurrNet type appears in Switchboard's surface; it replaces the roughly 200 lines both games copy) or any class implementing the client interface. The router side is one call, `SwitchboardKit.Host(profile, delivery, observations)`, where `delivery` implements the router interface (send one line to a receiver set) and `observations` is the observation context, the last explicit argument of every door that reports (`SwitchboardKit.Connect` and `UIKit.Views` take it the same way). The router runs where the game puts it: on the host of a listen game, in a dedicated process, or in the loopback; Switchboard assumes none of them. Switchboard's two small interfaces stay inside Switchboard because the line gives it Core as its only hard dependency; `Switchboard.Networking` implements them over Networking.Replication's `IEventLink` and `IAudience`. An `IMessageScope` resolves to an `IAudience` there, so a scope is an interface and never an enum, and the group and region scopes are audiences Networking already knows how to build. The message is one Core-packed section whose text is UTF-8 inside the payload, never a PurrNet string. Both games' `ChatNetwork` classes are re-seated onto the channel by Networking's own story before Switchboard exists; U4b's bridge stories then replace that re-seated code rather than the original. Before the freeze Saboteer's re-seated `ChatNetwork` stays as a thin class of the game that implements Switchboard's client interface (U4a); U4b replaces it with `Switchboard.Networking` once N4 lands. Switchboard ships an in-process loopback of both, so a test or an agent exercises the whole path with no network, as `LoopbackChatTransport` does for the client half today.

Names are not broadcast as a roster. Today every join sends the full roster to every client (`RosterObserversRpc(ids, names)`, `ChatNetwork.cs:116-120`), which is work proportional to players squared across a shard. A line carries the speaker's id; the first line a receiver gets from a speaker also carries the name, and the bridge keeps the per-receiver set of names already sent. That bookkeeping knows connections, so it lives in the bridge, never in Core (`Rules.md` rule 14).

A profile can also be built in code for a test or an agent (`SwitchboardKit.NewProfile()` with the same fields), because hand-filling nested lists of assets is the slow way to author one. The wire message carries no format version and no reader for an older layout: a changed message means both sides are rebuilt together.

Switchboard's own operations, which are also the typed commands, in the group `switchboard`: `switchboard say <channel> <text>`, `switchboard whisper <player> <text>`, `switchboard reply <text>`, `switchboard emote <text>`, `switchboard channels`, `switchboard history <channel> --count 20`, `switchboard mute <player>`, `switchboard unmute <player>`. Each result starts with its status word, for example `refused: rate limit, 3 lines per 5 seconds`. An agent tests chat with these on the loopback.

What the profile asset holds (inspector fields, not code):

| Field group | Holds |
|---|---|
| Kinds | Message kinds as assets: say, emote, whisper, notice; each says who may send it and whether its text is plain or a template |
| Scopes | Scope assets: everyone, direct, group (needs the game's group directory), region (needs Networking's region bridge); each picks receivers |
| Channels | Name, alias list, scope, colour role, read-only flag, history kept for late joiners |
| Verbs | Alias to operation: `w`, `tell`, `t` to `switchboard whisper`; `r` to `switchboard reply`; `me` to `switchboard emote` |
| Tabs | Default tabs and which channels each shows |
| Limits | Maximum length, rate limit per sender in seconds (on by default), mute list (on by default), history capacity; the rate limit and the mute list each have a switch; one setting says where filters and the rate limit run (sender, router or both), with no default in the library |
| Strings | Template ids with their argument roles, rendered by UI's template span through its `ITextTemplateResolver`; the profile references a `TextTemplateTable` as the default and a game may back the seam with Unity Localization; the library's table names no game, and Saboteer's table says Saboteer in every chat and console line that names the game |
| Includes | Other profiles whose entries this one extends |

The studio's profile (`Studio.Online`) sets whisper to pink, the aliases and the tabs; Corsairs' profile includes it and adds the guild scope and tab. Seams, each with a default: `IMessageScope` (receivers), `IMessageFilter` (veto, both client and server), `IDisplayNameSource` (the one thing the two `ChatNetwork` copies differ in), `ILinkAction` (what clicking a player name does; the default fills the entry with `/w name`). Moderation is the filter seam plus two defaults, a per-sender rate limit and a mute list, each with a switch in the profile; no word lists, reports or moderator panel ship. Networking's per-sender rate in `ReplicationSettings` is the backstop below it, and the mute list is kept with the player's chat settings as a Persistence section. Saboteer's profile runs both limits at the sender: the game is owner-authoritative and a line is checked where it is typed, the router only forwards.

System lines travel as a template id and arguments, never as text. Saboteer already does this by hand (`MatchAnnouncement.Joined` plus a name through `AnnounceObserversRpc`, `MatchAnnouncer.cs`); each receiver renders the line in its own language. Because formatting exists only in the renderer, no message from a client can carry trusted formatting, so `allowIncomingSystemMessages` and the downgrade code have nothing left to do.

### 3j. Agent-drivable UI (U8)

Every line below runs through `spellbound_run` (the one Pipeline command) or is typed in the console; the group is `ui`, and every result starts with its status word.

| Line | Does |
|---|---|
| `ui views` | Lists registered views with open state, identifier and policy |
| `ui show <view>`, `ui hide <view>`, `ui toggle <view>` | Drives the view stack |
| `ui tree --view <view> --depth 3` | Prints the visual tree as indented lines: type, name, classes, text, display state, resolved rect |
| `ui find <name or class>` | Prints matches with their paths |
| `ui click <name>`, `ui set <name> <value>`, `ui focus <name>` | Acts on an element |
| `ui themes`, `ui theme <themeName>` | Lists the themes; the theme switcher |
| `ui capture <path>` | Writes the panel to an image, beside the Unity CLI's `capture_game_view` |

Editor-audience operations beside them, because an agent has no menu: `ui new-view <name>` (the New View action) and `ui validate` (theme and view validators, reporting through Core's contract). UI's shipped context (`core context --package ui`) says: use `TextLog` and `TextEntry`, never a hand-built `ListView` and `TextField` pair; never `Resources.Load` a fixed path; declare roles, not colours, in code; add a view with `ui new-view`; read the screen with `ui tree` before editing UXML.

The tree is plain indented lines in the operation's result, not a new file format. How `ui click` reaches a `Button`'s `clicked` event (a simulated pointer sequence is the likely route; the UI Test Framework package ships runtime and editor assemblies, but its use in a player build is unconfirmed) is the first spike of U8, and whether discovery by reflection finds the `ui` operations in a stripped development build is the first story of area 2's CL1.

### 3k. The editor

What Core.Editor holds (decided at the developer's review of 2026-10-23, see section 9): four controls, each used by more than one package's editor code, each drawn from plain UI Toolkit elements with `sb-` class names and no UI dependency:

| Control | Replaces | Used by |
|---|---|---|
| `TypePickerField` | Core's `SerializeReferenceDropdownDrawer` and Modifiers' `SerializeReferencePicker` | every definition with a polymorphic field |
| `ReportView` | Saboteer's `ReleaseAuditReport` text file; the validation contract's one report | the Spellbound window, every package's Validate action, ArtPipeline's checker window |
| `SectionCard` | the card block hand-built in `ObjectPresetEditor` | inspectors, the Spellbound window's pages |
| `HeaderBar` | per-inspector title rows | inspectors, the window's header slot, ArtPipeline's verdict bar |

`ReportView` binds to a `ValidationReport` and draws, per finding, its message, its hint (the named hint the host asks for, else the plain `Hint`) and, only when the finding has a `FixCode` and the host has set the view's `ActionsFor`, up to two action buttons. `ActionsFor` is a `Func<ValidationFinding, IReadOnlyList<FindingAction>>` and a `FindingAction` is a label and an `Action<ValidationFinding>`: the control knows no fix, the host decides which actions a finding offers and what each does (ArtPipeline offers Pick an existing one and Keep as a new material on a material finding and runs `artpipeline fix`; PackageCheck offers one and runs `packagecheck fix --rule`) and rebinds the report afterwards. The view draws the first two actions and no more. When the finding carries the name of the check that wrote it, set by the runner and not by the check, the row shows that name beside the code. `HeaderBar` takes a `Title` and an optional `Severity` (the severity type of `ValidationFinding`; none draws the neutral state) and sets the class `sb-header--error`, `sb-header--warning` or `sb-header--information`, so the colour is a token and not a property of the control. Neither control references UI, ArtPipeline or the window.

The check seam, from the editor's side (Core.Editor's, decided 2026-10-24; area 2 designs it, this area draws its output). Core.Editor gains one interface, `IDefinitionCheck<T>`, one attribute that registers an implementation under the check's name, and the lines of validation that find and run registered checks; nothing else. A package ships its checks in its own editor assembly, so Core never changes for a new package. The developer's example, drawn (the bodies are placeholders and the interface's preview method is left out of the drawing; the spellings are area 2's):

```csharp
[RegisteredDefinitionCheck("navigation.reachable-deposits")]
internal sealed class ReachableDepositsCheck : IDefinitionCheck<PlaceDefinition> {
    public void Check(PlaceDefinition place, ValidationReport report) {
        report.Error("navigation.deposit-unreachable", "deposits[2]",
            "11 of 14 deposits cannot be reached from the entrance.", "Move it or carve to it.");
    }
}
```

```
$ core validate --drafts
failed: 2 errors
checks: PlaceDefinition (Places), navigation.reachable-deposits (Navigation)
error  places.inside-rock             deposits[7]  inside solid rock, no open voxel within 1.5 m
error  navigation.deposit-unreachable deposits[2]  11 of 14 deposits cannot be reached from the entrance
```

Places never imports Navigation, and `Navigation.Places.Editor` is an editor assembly compiled only where Places is installed (decided 2026-10-24). `ReportView` draws every finding the same whichever check wrote it and shows the `checks:` line as a muted header, in area 2's one format, `<name> (<Package>)`. A missing check is visible there: before Navigation lands the line has no Navigation entry, and the header shows exactly that. A finding uses area 2's report format: the status word first, `failed` for a fault in a valid call. A definition asset that still stores a field its type no longer has is an error, `core.unknown-key`, naming the asset, the key and the stored value text (decided 2026-10-24, detection only), for example `CaveOreVein layers[1].density: stored 0.35, the type has no field density; re-author it under its new name before this asset is saved again`. `ReportView` draws that message as it comes, so the person sees the old value to type into the new field, shows its hint ("re-author the value under the field's new name") and no Fix button. Nothing is mapped, converted or kept, and nothing is written anywhere to remember a lost value (decided 2026-10-24): the error ends when the asset is next saved. This area registers one check, in `Switchboard.Networking.Editor` over `SwitchboardProfile`: a scope that reaches an unbounded set of receivers. Only the bridge knows how many receivers a scope reaches, so Switchboard itself never learns Networking's name.

The inspector banner, if the hook cannot host a UI Toolkit element. Area 2 draws the banner from `Editor.finishedDefaultHeaderGUI` and its first proof asks whether that works. Unity's scripting reference calls it "an event raised while drawing the header of the Inspector window, after the default header items have been drawn" and its example uses `EditorGUILayout.GetControlRect` and `EditorGUI` calls; the page does not mention UI Toolkit, so I treat it as unverified. If the proof fails, `ReportView` has a banner form: the same bound report shown as one `HeaderBar` row (severity colour, counts, the first finding) that expands to the full view, reading the cached report the runner already keeps. What this area does not decide is the mount: an inspector with no custom editor can only get the banner from an editor registered on a base type with `CustomEditor(type, true)` (Unity documents that child classes show the editor; it does not say an interface works) or from one line in a consumer's own inspector. Which of the two is area 2's call in CL4, and this area builds the banner form in U7a only when the proof fails.

What UI.Editor adds when installed: a stylesheet registered with Core.Editor so those controls and the Spellbound window take the active theme's tokens (default Unity styling otherwise); the Gallery window; the theme validator (tokens the default theme declares and a copy lacks) and the view validator (duplicate identifiers by full name, a view outside a manager, a view whose document has no panel settings), both reporting through Core's contract; the New View action; and the Console tab of the Spellbound window, built from `TextLog` and `TextEntry` over the operation directory, as a page: a class marked `[WindowPage]` with a title and an order, found by `TypeCache` (area 7's attribute, accepted by it). Console and Gallery are two such classes; Core never learns UI's name.

The shared surface other areas stand on:

- The Spellbound window in Core.Editor is plain UI Toolkit with named slots (header, tab strip, tab content, footer) and USS custom properties, Core never references UI, and the window never opens a modal; UI.Editor skins it and contributes tabs through the registration, nothing more.
- The editor theme is the `.sb-theme` class plus the token custom properties, nothing else. A tool window (ArtPipeline's, Navigation's profile preview) adopts it by putting the class on its root and reading tokens; that is one story in the adopting package and no dependency, and until UI.Editor is installed the window shows engine defaults.
- Navigation's profile preview panel and Scene overlay are built from Core.Editor's controls; where they need a runtime widget (`TextLog`, `StyledText`, `WindowFrame`) they take UI.Widgets through a `Navigation.UI` bridge hosted in Navigation (rule 3), compiled when UI is installed.
- The black box window and the counters overlay are `Diagnostics.UI`, a bridge hosted by Diagnostics over UI.Widgets under `!UNITY_SERVER` (rule 3). Its text pane is a `TextLog` fed with the result of `diagnostics blackbox` and `core observations` run through the operation host; the lines come from the same public result-to-`StyledText` helper `ConsolePanel` uses, so severity picks the role and a key shows with its description and reason names, never hashes. The timeline per subject is Diagnostics.UI's own element, drawn from the recorder's data; UI has no timeline widget. Until the prediction spike answers, the recorder exists in the editor and development builds only, so the window and the text pane show only those recordings and a shipped build has neither. UI offers no hash-showing path; a role is an id with a name.
- World data (WorldForge's arrays, a minimap) reaches the screen as a texture in a plain `Image` or a game element. UI has no world-aware widget and is not a dependency of WorldForge.

Style scoping: Unity's documentation says the built-in variables apply to editor and runtime UI; one secondary source says `:root` declarations do not reach the Inspector and a class on the inspector's root does. I could not confirm it from Unity's pages, so tokens are declared on a class (`.sb-theme`) that every surface, runtime or editor, puts on its root. That works in both readings.

## 4. What a buyer writes, gets, replaces, and what the editor gives

### UI.Widgets

| | |
|---|---|
| **Writes** | UXML and USS for their screens; `StyledText` for their lines; a theme asset (a copy of the default with changed tokens); an `IDetailTierSource` if they want a different key |
| **Gets for free** | The log, entry (focus solved), window frame, tooltip host, labeled fields, default theme and a second shipped theme, the theme switcher, the surviving kit (resource bar, scroll views, anchors, spotlight, regions) |
| **Can replace** | Any role's look (a custom property), the whole theme (a Theme Style Sheet asset on the Panel Settings), the window frame template (a UXML slot), the tooltip placement (an interface), the detail tier source, the completer |
| **Editor gives** | Gallery with theme switch; theme validator; the UXML elements appear in UI Builder through `[UxmlElement]`; the tokens can be assigned as USS variables in UI Builder (Unity manual, "Assign USS variables in UI Builder", read in its 6000.0 copy) |

### UI.Screens

| | |
|---|---|
| **Writes** | A `View` subclass per screen (or none: a view with only UXML and a policy is a prefab); one `IInputContextSwitch` |
| **Gets for free** | View stack with show, hide, toggle and top view; cursor arbitration; escape chain; input contexts; modal host and confirm dialog; the player's HUD layout edit mode saved as a Persistence section; the console view; the `ui` operations |
| **Can replace** | Transitions (`IViewTransition`), the cursor policy (the arbiter takes a delegate in place of `UnityEngine.Cursor`), the escape steps, the layout anchors |
| **Editor gives** | New View action; view validator |

### UI.Editor

| | |
|---|---|
| **Writes** | Nothing; it is a consumer of the editor's own surfaces |
| **Gets for free** | Skin for every Spellbound inspector and the window; Console and Gallery tabs |
| **Can replace** | The skin (a stylesheet), or by not installing UI |
| **Editor gives** | It is the editor tooling |

### Switchboard (and its bridges)

| | |
|---|---|
| **Writes** | A profile asset; a class naming the player (`IDisplayNameSource`); a transport only if not PurrNet; a group directory only if they want group scopes |
| **Gets for free** | The session and host, scopes everyone and direct, open message kinds, history, the filter chain, a rate limit, a mute list, template messages, the networking bridge (`Switchboard.Networking`, over the protocol assembly), the chat view (`Switchboard.UI`), settings saved as a Persistence section |
| **Can replace** | Any scope, filter, kind, link action, text resolver, transport, the view's arrangement (the parts are public) |
| **Editor gives** | Profile validator (alias collisions, unknown scopes, a channel whose scope needs a bridge that is not installed); a chat preview in the Gallery |

### Core.Editor controls (decided)

| | |
|---|---|
| **Writes** | Editor code that calls `TypePickerField`, `ReportView`, `SectionCard`, `HeaderBar` |
| **Gets for free** | One look, one report, one type picker in every package's editor |
| **Can replace** | The skin, by installing UI.Editor or a stylesheet of their own |
| **Editor gives** | They are the editor |

## 5. The homes test and the stranger test, written out

Procedure (`Homes.md`): separate type from value, then Library, Studio, Game.

| Thing | Type or value | Library? (farming sim, racing game, card game) | Studio? | Home |
|---|---|---|---|---|
| `StyledText`, roles, links, renderer | Mechanism | Card game: every line it shows. Racing game: lap times | | UI.Widgets |
| Role names `Timestamp`, `PlayerName` | Values | A card game names its own | Ours if two games share | Studio.Presentation theme |
| `TextLog`, `TextEntry`, `WindowFrame` | Mechanisms | Card game chat, racing game's pit radio log, farming sim's notes | | UI.Widgets |
| `ConsoleView`, `OperationConsole` | Mechanism over Core's directory | Every stranger's playtest | | UI.Screens (a view); the feed in Widgets |
| Console key binding | Value | | | Game |
| `IInputContextSwitch`, `InputContextId` | Seam | A racing game suspends steering while a menu is open | | UI.Screens |
| The class implementing it | Value | | Two games, each with its own input map | Game (a Studio class only if the maps match) |
| `TooltipHost`, `TooltipTrigger`, `TooltipContent`, `IDetailTierSource` | Mechanism | Racing game's part descriptions; farming sim's crops | | UI.Widgets |
| Alt as the detail key | Value | | Ours | Studio.Presentation |
| `LabeledSlider`, `LabeledToggle`, `LabeledChoice` | Mechanisms | A settings screen is every game | | UI.Widgets |
| The settings objects | Values | | | Game (Persistence gives the section) |
| `ThemeSwitcher` | Mechanism | A racing game's day and night | | UI.Widgets |
| Default theme and tokens | Default | A stranger replaces it | | UI.Widgets, neutral; ours in Studio.Presentation |
| `LayoutStore`, layout edit mode | Mechanism | A card game lets players move panels | | UI.Screens |
| Confirm dialog, modal host | Mechanism | Every game confirms a quit | | UI.Screens |
| `HeroButton "ACTION"`, five-bubble `MilestoneChain`, `CharacterRow` family, `MenuChrome.uss` (755 lines) | Game shapes | A farming sim has no "ACTION" | Ours | Studio.Presentation (the menu chrome); the rest to the game that uses them |
| `Cast`, `Interrupted`, `Fizzled` bar variants | Game words | | | Cut from the class; a bar takes any state class name |
| `Maximizable`, `PanZoomable` | Mechanisms with no consumer | A map screen would want pan and zoom | | Kept only if the Gallery needs them; otherwise cut (story in U1) |
| `TabBar`, `TabStrip` | Overlap with Unity's `TabView` | | | Cut; consumers move to `TabView` (U1) |
| Session, host, kinds, scopes, filters, templates | Mechanisms | Card game table talk; farming sim co-op | | Switchboard |
| `Switchboard.Networking` | Bridge over the protocol assembly | A buyer with Networking | | Switchboard.Networking (bridge, no PurrNet type in Switchboard) |
| Rate limit, mute list | Mechanisms with defaults | Card game table talk | | Switchboard |
| `ChatView` | Arrangement of UI's parts | | | Switchboard.UI (bridge) |
| Whisper pink, `/w` aliases, the default tabs | Values | | Two games | Studio.Online profile |
| Guild scope and tab | Value | | | Corsairs |
| `IDisplayNameSource` implementation (Steam name, character name) | Glue | | Each game | Game |
| `TypePickerField`, `ReportView`, `SectionCard`, `HeaderBar` | Editor mechanisms | Every package's editor needs the first two | | Core.Editor (decided) |
| Gallery, validators, New View, Console tab | Editor tools | A card game developer is the user | | UI.Editor |
| The two old inspectors (Core's log settings, GeoForge's material table) | Editor code | Every package's editor needs one look | | Core.Editor, and GeoForge's editor assembly (the table leaves its runtime folder) |
| `ReachableDepositsCheck` and every other cross-package check | Package-owned checks | A card game's deck judged by its rules package | | The checking package's own editor assembly (here `Navigation.Places.Editor`); Core.Editor holds only the seam |
| The unbounded-scope check on a Switchboard profile | Check | A shard needs it, a card game does not | | `Switchboard.Networking.Editor`: only the bridge knows how many receivers a scope reaches |
| `Loc` (binds a `LocalizedString` to `text`) | Thin helper with a table-name constant | | Ours, the table is "UI" | Studio.Presentation (a bridge would wrap Unity's own binding for nothing) |
| `GameInputContexts`, `UiLayoutService`, `ChatSettingsPanel` | Glue and values | | | Game, then deleted where a library now covers it |

Stranger test on the new public surface: a farming sim, a racing game or a card game can use the log, entry, frame, tooltip host, rows and theme without editing the package; the only game words left in UI after U1 are role names, and those are data.

## 6. Directions

**A. Parts and feeds (taken).** Three public parts, two arrangements, Core's directory and Switchboard's session as feeds. Why it wins: the duplicated focus code becomes one tested class; the console gets completion from the same list the agent reads; chat commands stop being a second registry; every other text surface in the line (diagnostics log, validation report, the editor's Console tab) is a further arrangement for free.

**B. Extract a shared base class, keep two elements (rejected).** Alternative to A. Move the focus code into a `TextInputElementBase` and keep `ChatWindowElement` and `ConsoleElement` as subclasses. It deletes the duplicated focus lines and nothing else: two styling paths remain, chat commands stay outside the registry, the editor still needs a third log, and the base class is an inheritance hook a consumer would use to undo behaviour. Rejected because it fixes the copy and keeps the cause.

**C. No in-game console; the command line is the console (rejected).** Alternative to the console surface. The Unity CLI and the Spellbound command line already run every operation, so delete the in-game view. Rejected: requirement 12 asks for the same capability in the in-game console; a Steam build has no editor and no Unity CLI, and Saboteer already ships a `developerConsole` setting for testers (`GameplaySettingsData.cs:26`, read in `GameViewManager.ToggleConsole`).

**D. Per-package editor bridges to the kit (rejected).** Alternative to "controls in Core.Editor, skin in UI". Every package's Editor assembly gets an `X.Editor.UI` bridge using UI.Widgets directly. Rejected: about twenty more assemblies at the line's measured 0.2 to 0.8 s each; every package's editor forks into two code paths; and the only editor controls that repeat are four. The developer chose Core.Editor for the controls on 2026-10-23, so this stays rejected.

**E. The unbounded-scope rule inside Switchboard's own validator (rejected).** Alternative to a check shipped by the bridge. Switchboard would have to know how many receivers a region or a group holds, which only Networking's audiences know, so it would depend on Networking, against the line (Switchboard depends on Core alone). The seam exists for exactly this.

## 7. Ideas, kept and cut

Kept (the bracket says where it lands):

1. Parts and feeds: log, entry, frame (UI.Widgets).
2. Styled text spans with open roles, escaping in one place (UI.Widgets).
3. `TextEntry` owns focus, history, completion and the input-mode event (UI.Widgets).
4. Typed commands are operations; aliases are profile data (Switchboard, Core).
5. Completion and help from the operation directory, filtered by audience (UI.Screens).
6. Theme as a contract: tokens, validator, second shipped theme, the switcher from Corsairs (UI.Widgets, UI.Editor).
7. Labeled fields over Unity's binding (UI.Widgets).
8. Unity-first audit of the kit, decided from the source: `TabBar` (29 lines, no consumer outside the package) and `TabStrip` (29 lines, a button-to-page toggle used by Corsairs' `SettingsTabsView` and Chat) are cut, and Switchboard.UI's tabs and both consumers move to Unity's `TabView`, which the 6000.3 script reference lists with `reorderable` and a `tabClosed` event (that page does not say how a tab is made closeable); U1's first story reads how, on 6000.3 and 6000.4, and, if a behaviour the chat tabs need is missing, says which and keeps a thin helper for that behaviour alone. `SpellboundScrollView` stays: it is 40 lines that subclass Unity's `ScrollView` and add `WheelOnly` (stop keys and navigation moving the scroll), which Unity's control does not offer as far as I read; it is the one place the kit adds to a Unity control, and it is a subclass, not a wrapper. `ResourceBar` stays as a bar with a lag adapter (157 lines), which `ProgressBar` (a titled value between bounds) is not documented to do; the `Cast`, `Interrupted` and `Fizzled` variants leave it. `TooltipSurface` stays because Unity documents `VisualElement.tooltip` as Editor-only. New bindings use UI Toolkit runtime data binding. Backdrop filter and UI Shader Graph vertex programming are Unity 6.6 features and nothing here uses them at 6.4 or 6.3; the list below names what is never rebuilt.
9. Tooltip host with detail tiers, freeze and promote, no `UnityEngine.Input` (UI.Widgets).
10. Input contexts as a seam on the view policy (UI.Screens).
11. Layout store as a Persistence section, read or defaulted and never migrated (UI.Screens, Core's attribute).
12. Switchboard scopes pick receivers on the server, not the client (Switchboard).
13. Message kinds as open assets instead of an enum (Switchboard).
14. System lines as template id plus arguments, rendered per receiver (Switchboard).
15. Agent-drivable UI: `ui tree`, `ui click`, `ui capture` (UI.Screens).
16. The Spellbound window's Console tab: one command line in the editor (UI.Editor).
17. Four shared editor controls and one report view (Core.Editor, decided).
18. New View action: three files, parent under the manager, in one step (UI.Editor).
19. Profile composition (`Includes`) so a game extends the studio's profile (Switchboard).
20. View identity as a serialized id defaulting to the full type name, a concrete `PanelView` that needs no subclass, and a validator that finds a collision at edit time (UI.Screens, UI.Editor).
21. Theme variants (text scale, high contrast) as a second token layer the switcher stacks on the current theme, with the validator listing any token the default theme declares and a copy lacks (UI.Widgets, UI.Editor). Accessibility is a selling point nobody on the line has built.
22. `ConsolePanel` as one element so a stranger takes the console without the view manager (UI.Widgets).
23. The two old inspectors rewritten in UI Toolkit from the Core.Editor controls, now (U7c; decided 2026-10-24).
24. The one check this area registers, an unbounded scope on a profile, shipped by the bridge through the check seam (U4).

Unity-owned, never rebuilt (the must-not-reinvent list, from the Unity reader's claim at checkpoint 4; I did not read its Unity pages myself, `UnityChanges.md` names them). UI Toolkit grows with every release, and this kit builds a substitute for none of: `TabView` for tabs; runtime data binding (`DataBinding`, `dataSource`) for rows; `ListView` virtualisation; Unity Localization's binding for labels; box shadows (listed in the 7000.0.0a12 notes, no earlier version given); backdrop blur and drop-shadow filters (6.6, the 6.6 what-is-new page); gradients, the `gap` property and experimental screen-reader support (6000.7.0b6, beta). The floor is 6000.3, so the kit's shipped USS uses none of the 6.6 and 6.7 features and fakes none of them: no shadow element, no blur texture, no spacing helper. A buyer on a Unity that has one writes it in their own USS, and the kit's USS adopts it when the floor reaches it. The Unity-first audit repeats the list at each LTS.

Unity 7 theme priority (same source): a theme style sheet outranks built-in styles regardless of selector detail unless Legacy Theme Priority is on. The kit's theme is a Theme Style Sheet, so the rule bears on it directly. It is a probe and no story: U1's theme swap spike leaves its fixture in `Samples~`, and U9's throwaway copy, opened once in the newest Unity 7 alpha (decided 2026-10-24; the working project is never opened in it), runs the fixture with Legacy Theme Priority off and on and records which style wins for a `.sb-theme` token.

Cut:

- A UI.Localization bridge package. Unity's Localization package binds `LocalizedString` to a whole label itself, and Saboteer's `Loc` (28 lines) is Studio's. What was missing was not a bridge but a seam: styled lines with role-tagged arguments, which the template span adds to UI.Widgets. The Unity Localization backing of the seam is a dozen lines in a game or Studio.
- A reflection-driven form generator that draws a whole settings object from attributes. A new system; the labeled rows over Unity's binding cover the job, and a generator can be raised later against a measured need.
- A server-side chat history that outlives a session. Persistence's job, and no game has asked.
- Voice chat, translation, profanity word lists. Products of their own; the filter seam takes any of them.
- A rich-text editor in the chat entry (bold button, colour picker). Spans make it possible; no game wants it.
- `Maximizable` and `PanZoomable` as shipped kit pieces unless the Gallery or a story names a consumer (see U1).

## 8. Epics

Sizes are in stories; "alone" says whether the epic delivers value if nothing after it is built. Lines are my estimates, not measurements: read is the existing code to be read, written is new code including tests, with the basis in the last column. "Depends on" names the owning area and its epic id. "Games" says which milestone needs the epic: the milestones are Saboteer on the line, then Corsairs Isle on the line; the roadmap sets the order and Saboteer's festival freeze.

| Id | Delivers | Depends on | Games | Alone | Stories | Lines read | Lines written | Basis |
|---|---|---|---|---|---|---|---|---|
| U1 | UI is Widgets, Screens and Tests; the package is truthful (declares Core); `Samples~`; game shapes leave; `SlotStyles.uss` goes to Inventory; unused pieces cut or kept by a named consumer; `TabBar` and `TabStrip` cut for Unity's `TabView` (read on 6000.3 and 6000.4 first); tokens under `.sb-theme` with a validator that lists any token a theme copy lacks; `ThemeSwitcher` and theme variants arrive; serialized view identity and `PanelView`; `UIKit`, whose reporting doors take the observation context last | line:L1 | Both | Yes: a stranger can install UI without the Input System and without Chat | 11 | 7,000 | 1,100 | UI runtime 4,590 C# + 1,944 USS and UXML; mostly moved, little new |
| U2 | `StyledText`, `TextLog`, `TextEntry`, `WindowFrame`, with edit-mode logic tests and play-mode element tests (UI Test Framework, a test-only Unity package) on the 6000.4 row and the 6000.3 row; the Gallery sample shows them; `TextLog` has a fixed-height mode beside the dynamic one and a first story measures both with 10,000 lines; its flush cost is reported through the observation context `TextLog` takes as its last constructor argument; `AppendLive` lines; the template span, `ITextTemplateResolver` and `TextTemplateTable`, with a first story that proves the Localization read and the role colour read | ui:U1 | Both | Yes: both games can replace their copies of the focus code | 9 | 3,000 | 2,800 | `ConsoleElement` 383 + `ChatWindowElement` 780 read; parts and tests written |
| U3 | `ConsolePanel` and `ConsoleView` over the operation directory with completion, audience filter, history, the scoped log sink and the public helper that turns an `OperationResult` into styled lines (also used by Diagnostics.UI and the editor pages), and live lines for an operation that reports progress (`OperationContext.Report`); Core's uGUI console and its prefabs and Chat's console deleted (the old registries, attributes, router and `ConsoleLogger` go in CL3, which converts the games' commands and whose Saboteer half waits on this epic) | ui:U2; commandline:CL1 (host, catalog, audience tag, result type); line:L2 | Both | Yes: one console replaces three | 6 | 4,500 | 1,300 | Core console 1,840 C# (the registry is area 2's), Chat console about 700, Core prefabs 2,225 YAML lines deleted |
| U4a | Switchboard, the library and its first views: profile, kinds, scopes, session, host, filters, rate limit, mute list, templates, history, the in-process loopback; `Switchboard.UI` with `ChatView`; the chat settings page (a small view on Unity's own controls over the settings section, which replaces `ChatSettingsPanel`); Saboteer's cut-over: its own profile asset, its `ChatNetwork` kept thin as the client interface's implementation, its input contexts class, the console and chat views in place of its own, and its chat window, settings panel and hand-wired input switches deleted; the name replaces Chat everywhere; `SwitchboardKit`, whose `Connect` and `Host` take the observation context last | ui:U2; ui:U3; ui:U6a; line:L2 (section attribute, operation registry); line:L8 (first slice: write and read a section with Core's header) | Saboteer | Yes: replaces the chat window and the console with no Networking | 11 | 6,500 | 4,900 | Chat 4,353 + Saboteer 1,209 + tests 932 read; about 1,950 core, 1,500 UI bridge, 400 settings page, 150 cut-over, 900 tests written |
| U4b | `Switchboard.Networking` over the protocol assembly, replacing Saboteer's thin `ChatNetwork` and Corsairs' own (two stories: the client and delivery halves, then the region and group scopes); `Switchboard.Networking.Editor`'s check on the profile (a scope that reaches an unbounded set of receivers); Corsairs' cut-over (its chat glue, console view, input switches and layout glue deleted) | ui:U4a; networking:N4 (audiences by region and group, the event link); commandline:CL4 (story 10, the check seam, for the one bridge check) | Corsairs | Yes: the router is placed where the game says | 4 | 500 | 1,000 | Corsairs 346 read; about 600 networking bridge, 100 check, 300 tests written |
| U5 | `TooltipHost`, `TooltipTrigger`, content and tier seam; `LabeledSlider`, `LabeledToggle`, `LabeledChoice` and the settings sample; Saboteer's `SettingsView` and Corsairs' `TooltipView` ported as the proof | ui:U2; line:L6 (the Modifiers bridge supplies affix text); line:L11 (Studio.Gameplay wording) | Both: settings and the Saboteer tooltip for Saboteer, the affix tooltip for Corsairs | Rows alone: yes. Tooltip alone: yes, without affix wording | 7 | 4,500 | 2,000 | `TooltipSystem` 1,934, `SettingsView` 1,045, Saboteer `SlateTooltip` read |
| U6a | `IInputContextSwitch`, `InputContextId` and the view policy's optional context; modal host and confirm dialog; Saboteer's hand-wired input switches replaced by one class of the game | ui:U1; line:L2 | Saboteer | Yes | 2 | 500 | 300 | both `GameViewManager`s 343 read, in part |
| U6b | Layout store as a Persistence section written on edit-mode exit, with no version and no migration; the games' layout glue (`LoadLocalUiLayout`, `SaveLocalUiLayout`, `UiLayoutService`) deleted in Saboteer; a tester who saved a layout in an earlier build sees the default once | ui:U6a; line:L8 (first slice: write and read a section with Core's header) | Saboteer | Yes | 2 | 700 | 400 | layout code 400 read |
| U7a | Core.Editor's controls: `TypePickerField` (Modifiers' picker is replaced in its story), `ReportView` with message, hint, the check's name per finding, the `checks:` line and up to two `ActionsFor` buttons (none on a `core.unknown-key` finding), and its banner form if area 2's first proof says the header hook cannot host a UI Toolkit element, `SectionCard` and `HeaderBar` (title and severity; these two land first, since they need only Core.Editor), and edit-mode tests that bind each to a sample report and check the `sb-` classes; no UI reference | line:L2 (validation contract: its report is data first, a text file an agent reads, and `ReportView` draws it later, so L2 does not wait for U7a); commandline:CL4 (the report type with `Hint` and `FixCode`) | Neither: tooling; the games run without it | Yes: every package's editor can use the controls with UI absent | 4 | 1,300 | 900 | `ObjectPresetEditor` 342, drawers 214, release audit 270 |
| U7b | UI.Editor: the skin for the controls and the window, the Gallery, the theme and view validators, the New View action, the Console and Gallery pages (`[WindowPage]`) | ui:U2; ui:U3; ui:U7a; living:LV2 (the window shell and page discovery, which itself builds on U7a); commandline:CL7 (completion data, Operations page) | Neither: tooling | Skin and pages: need UI installed | 5 | 1,600 | 900 | The Gallery and validators new; the skin over the Core.Editor controls |
| U7c | Three inspectors in UI Toolkit, built from the Core.Editor controls: Core's log settings (`LogConfigEditor`) in Core.Editor, GeoForge's material table (`MaterialSideTable`) moved out of its runtime folder into GeoForge's editor assembly, and `Identity.asset` (`PackageIdentity`) in Core.Editor, grouped as Living's table groups it with the judgment fields marked as needing the owner's review; the first two stories delete the old types and name the new inspectors for what they show, so the Unity ledger's Moved row stops resolving and the ledger check passes; an edit-mode test on each | line:L1; ui:U7a (its `SectionCard` and `HeaderBar` stories); living:LV2 (the `PackageIdentity` type, for the third story only) | Neither: tooling | Yes: each inspector stands alone | 3 | 573 | 900 | `LogConfigEditor` 319 and `MaterialSideTable` 254 read; both rewritten; the Identity inspector is new (about 300, an estimate from Living's 13 fields) |
| U8 | `ui` operations: `views`, `show`, `hide`, `toggle`, `tree`, `find`, `click`, `set`, `focus`, `themes`, `theme`, `capture`; the agent context file | ui:U6a; ui:U3; line:L2; commandline:CL1 | Neither: agents and tests | Yes: an agent can see and drive the UI | 4 | 1,500 | 900 | views, manager and manipulators |

U1 to U8 (U4 as U4a and U4b, U6 as U6a and U6b, U7 as U7a, U7b and U7c) replace the content of the line's L5, except that U7c is new in this fold and was never in L5 (UI split, Chat to Switchboard, the second registry and copied manipulators deleted): L5's eight stories are inside U1, U2, U4 and U6, and the roadmap must not count them twice. Sample profiles for the console and the chat ship under `Samples~` in U3 and U4a. Spikes inside this area, each the first story of its epic: U1 (how a `TabView` tab is closeable, the theme swap and its fixture, `.sb-theme` in the Inspector), U2 (the role colour read, the Localization read, 10,000 lines), U5 (what a bound data object must carry, modifier-key state), U8 (a simulated click in a player).

Order inside the area, with the freeze first. Before 2027-01-14, in this order: U1, then U2, then U3 and U6a in parallel, then U6b and U4a (both wait on the first slice of Persistence's section writer, and U4a on U6a), ending with Saboteer's cut-over, so the demo shows the new chat window and console. Everything after the freeze is additive in the packages (U4b, U5, U7a to U7c, U8) or a game-side port that waits until the festival ends on 1 March 2027 (Saboteer's `SettingsView` and tooltip ports in U5), so no breaking UI merge lands inside the freeze window. After the freeze: U5, then U7a (it needs only L2 and CL4, so it can start with U2; its `SectionCard` and `HeaderBar` need neither) and U8, then U7c as soon as those two controls exist (its Identity story after LV2), then U7b after Living's window shell, and U4b when N4 lands. The first thing a game can feel is U2 plus U3: one console, focus fixed once.

Milestone class of each epic, for the roadmap (the roadmap's classes: Saboteer, Corsairs, undated; "before the freeze" is the demo files class):

| Epic | Class | Why |
|---|---|---|
| U1, U2, U3 | Saboteer, before 2027-01-14 | The demo shows the new console; U1's assembly split is the breaking merge and moves in front of the freeze |
| U4a, U6a, U6b | Saboteer, before 2027-01-14 | The demo shows the new chat window; the deletions of the game's chat and layout glue land with them |
| U5 | Saboteer, after the festival | The library stories are additive; the game-side ports of `SettingsView` and the tooltip wait until 1 March 2027 |
| U7a | Saboteer, by closure | ArtPipeline's verdict bar and Living's window shell stand on its controls; no game code changes |
| U4b | Corsairs | Waits on N4; until it lands Saboteer keeps its thin `ChatNetwork` |
| U7b, U7c, U8 | Undated | Tooling no game waits on; U7c is boosted by the roadmap's rule for the three inspectors |

## 9. Decided

Nothing in this area is open. Each line is a rule.

1. The shared editor controls (type picker, report view, section card, header bar) live in Core.Editor, are plain UI Toolkit with `sb-` classes, and UI.Editor skins them when installed; without UI the editor shows Unity's default styling (2026-10-23).
2. UI Toolkit is the only toolkit for everything new in editor tooling and for any editor code that is touched (2026-10-23).
3. Switchboard's moderation is the filter seam plus a per-sender rate limit and a mute list, each switchable; no word lists, no reports, no moderator panel (2026-10-23).
4. The two old-style inspectors, Core's log settings and GeoForge's material table, are rewritten in UI Toolkit now, and the table leaves its runtime folder: epic U7c, with the `Identity.asset` inspector as its third story (2026-10-24).
5. Core.Editor holds the check seam and only the seam: the interface `IDefinitionCheck<T>`, one attribute, and the lines that find and run registered checks. Each package ships its checks in its own editor assembly and Core never changes for a new package. This area's one check is in `Switchboard.Networking.Editor` (2026-10-24).
6. A stored field the type no longer has is an error, `core.unknown-key`, detection only. The error carries the stored value text, nothing is written anywhere to keep a lost value, and `ReportView` shows no Fix button on it (2026-10-24).
7. A game sold on Steam is a customer from its first release built on the line; the Next Fest demo is exempt from the saves rule. UI's layout and chat sections follow it: header, refused by name, upgrade by Persistence (2026-10-24).
8. Who may write is a configuration, Saboteer is owner-authoritative, nothing is pinned, and Saboteer has a code freeze from mid January 2027. Switchboard assumes no host answer and nothing here names a pin (2026-10-24).
9. Saboteer moves onto the new UI and chat before the mid January 2027 freeze: U1's assembly split and the deletions of the game's chat and layout glue land first, the demo shows the new chat window and console, and a tester who saved a HUD layout in an earlier build sees the default HUD once (2026-10-24).
10. The check that finds unreachable ore is `ReachableDepositsCheck` in `Navigation.Places.Editor`, a Places-gated editor assembly; the report's `checks:` line shows it only once Navigation has landed (2026-10-24).

## 10. Limits

- These Unity facts carry weight and are not confirmed in the 6000.3 and 6000.4 pages I could read: the exact attribute a data object needs for runtime binding (the 6000.3 overview page documents runtime binding itself and says a source can be any C# type); whether `:root` custom properties reach the Inspector; how a `TabView` tab is made closeable (6000.3 lists `reorderable` and a `tabClosed` event, read 2026-10-23); whether UI Toolkit can read modifier-key state without a pointer event; how a simulated click reaches `Button.clicked` in a player. Each is the first story of the epic that leans on it and is run on both versions.
- The theme as a Theme Style Sheet on the Panel Settings is not taken from a manual page alone: Corsairs' `ThemeSwitcher` already swaps `PanelSettings.themeStyleSheet` in shipping code (52 lines). Revision 4's TSS theming idea is otherwise unverified by the unity area; U1's first theme story proves the swap and the `.sb-theme` token read in 6000.3 and 6000.4 and reports what it finds.
- Link events (`PointerUpLinkTagEvent`) sit in the Experimental namespace; a Unity change can break the renderer, which is why one file owns it.
- Define constraints on `!UNITY_SERVER` follow the active build profile, so switching the editor to a Dedicated Server profile drops UI and everything constrained with it, including UI.Editor. That is intended and is a claim on area 7's check (every assembly referencing a constrained assembly carries the same constraint). My source is a Unity discussions thread, which is secondary; a spike confirms it.
- Epic estimates are mine, from line counts; sprint 1 calibrates them.
- What the fold left for a spike or a probe: the authored-key scan that raises `core.unknown-key` rests on Unity keeping an unmatched key in the asset text until the next save, which area 2's CL4 story 11 proves before `ReportView`'s handling of it is worth building (the handling is small and waits on that proof); the interface is `IDefinitionCheck<T>` (decided) and its members, the attribute's exact spelling and the runner's lines are area 2's CL4 story 10, which the drawing follows; U7c's first story reads whether `MaterialSideTable` can move to an editor assembly without a runtime reference (GeoForge's owner confirms); where Saboteer's router runs and which of sender, router or both its profile picks is settled in the first Saboteer chat cut-over, not assumed.
- No claim here is a measurement of runtime cost. `TextLog` virtualises a `ListView` the way both elements do today with dynamic height, which Unity's manual calls more flexible and less performant than fixed height; U2 measures both modes at 10,000 lines before either is recommended.
- Delivery cost in Switchboard is proportional to receivers per line. An "everyone" scope on a shard of thousands is a send to thousands for every line, so a scope must bound its receivers (a region, a group, a zone), the rate limit is per sender, and the bridge profile check flags an unbounded scope. Capacity is area 6's measurement; this page claims none.
- The action buttons know no fix: a finding with a `FixCode` and no `ActionsFor` shows its hint and no button, and at most two are drawn. What an action does, and whether it is safe to run without asking, is the host's.
- Whether `Editor.finishedDefaultHeaderGUI` can host a UI Toolkit element is not in Unity's page (read 2026-10-24, 6000.4); area 2's first proof answers it, and the banner form of `ReportView` is the fallback.
- A layout or chat setting saved by an older build is refused by name by the new one and the default is used; there is no reader for it. Before Saboteer's first release on the line that costs a player one placement of the panels; after it, a changed layout is Persistence's upgrade feature. Saboteer switches before the freeze, so the demo's testers meet that default once and the demo is exempt from the saves rule. Because the demo follows the package branches and nothing is pinned, a breaking UI merge (U1's assembly split, the deletion of Chat) reaches Saboteer when its manifest next resolves; U1 to U4a and U6a to U6b land before 2027-01-14 and every later UI merge is additive until the festival ends.
- UI's package references no Localization type: the default resolver reads a `TextTemplateTable`, and the Unity Localization backing is a dozen lines in a game or Studio.Presentation's `Loc`. The one place UI meets Localization's types is U2's first-story spike, which proves the pattern read on 6000.3 and 6000.4. If probe check 4 of `UnityChanges.md` shows the type names changed in Localization 2.0 and its built-in module, the spike is repeated on 6.7 and the fix is a story in whichever owner holds the backing; nothing is added before the probe answers.
- The floor is 6000.3: the logic tests and the play-mode element tests run on the 6.3 row as well as the 6.4 row, and a Unity feature newer than 6000.3 is not used (backdrop filter, drop-shadow filters and UI Shader Graph vertex programming are 6.6 features, gradients and `gap` are 6.7 beta, and nothing here uses them; section 7 lists what is never rebuilt).
- The chain in front of the freeze is long: L1, L2's operation registry and section attribute, CL1's host and catalog, the first slice of Persistence's section writer, then U1, U2, U3, U6a, U6b and U4a. Whether it fits before 2027-01-14 is the roadmap's estimate. If it does not, that is a disagreement for the developer and not a change this file makes; the decision stands.
- Saboteer's cut-over deletes the game's chat window, settings panel and hand-wired switches before N4. Its `ChatNetwork` stays as a thin class of the game until U4b, so the game keeps about 200 lines of transport glue for the span; that is the game's transport, not a second mechanism.
- Saboteer's profile asset is its own in the demo, because Studio.Online does not exist yet; it moves into Studio.Online when that package lands, which is a game-side change.
- Whether a theme style sheet outranks built-in styles in Unity 7 for the kit's `.sb-theme` tokens, and what Legacy Theme Priority changes, is read from the Unity reader's notes and settled only by the throwaway copy's run of the U1 fixture.
- `UIKit` sits in the top assembly of a package whose lower assembly is opt-in; a widgets-only buyer has no front door and constructs the elements directly. That placement is a claim on area 2.
- The Switchboard receiver queries by region and group are Networking's `IAudience` kinds (participants, region, group, all) in N4; until N4 lands the region scope is a named seam with no implementation.

## Claims from the fix round, answered (checkpoint 3)

| From | Claim | Verdict | Answer |
|---|---|---|---|
| orchestrator (RedTeam section 4, item 1) | Spell every ui operation in area 2's grammar | Accepted, nothing left to change | Re-checked line by line: group `ui` and group `switchboard` equal their package names; operations are kebab-case (`new-view`); arguments are positional or `--name value` (`ui tree --view <view> --depth 3`, `switchboard history <channel> --count 20`); every result starts with its status word; the only Pipeline command named is `spellbound_run`; the doors are `UIKit` and `SwitchboardKit`; the declarations use `[assembly: OperationGroup]` and `[Operation(name, summary, effect)]` as area 2 writes them. `ui validate` returns `failed:` when it finds an error, area 2's rule for validation. No `core check`, flat Pipeline command or dotted spelling appears |
| runtime | The black box window and the text surface read `diagnostics blackbox` and `core observations` over UI.Widgets; the window shows only editor and development-build recordings until the prediction spike answers | Accepted, amended in one place | The text pane is a `TextLog` over those two operations through the host, in `Diagnostics.UI` (section 3k). Amended: the timeline per subject is not a UI widget, Diagnostics.UI draws it from the recorder's data, because UI sells no chart. The window opens only where the recorder exists (editor, development builds); a shipped build has neither until the spike. Costs one public helper in U3 (result to `StyledText` lines) and a `Clear` on `TextLog` in U2, no new story |
| art (U1) | `ReportView` shows per finding a plain sentence, a hint and a Fix button calling a delegate; `HeaderBar` takes a title and a colour state; otherwise a Core.Editor story, never a copy in ArtPipeline | Accepted, amended in two places | Both are Core.Editor stories in U7a (section 3k). Amended: the colour state is the severity type of `ValidationFinding` (or none), not a new enum, so a colour is a token class; the button appears only when a finding has a `FixCode` and the host sets `FixHandler`. Choosing the hint by DCC id is the host's: `ReportView` takes the hint key to prefer and shows the plain `Hint` otherwise, so Core.Editor knows no DCC |
| living | The window shell is built on the four shared editor controls in Core.Editor and pages are found by `[WindowPage]`; the skin is USS custom properties and named slots | Accepted, with a dependency made explicit | Pages by attribute replaces my earlier claim on area 7 for a registration. The window shell is Living's LV2 story and needs `HeaderBar`, `SectionCard` and `ReportView`, so U7 is split: U7a (controls, no UI) precedes LV2, U7b (skin, Gallery, Console page) follows it. Without the split LV2 and U7 would each wait on the other. The skin is a stylesheet on `.sb-theme` with the tokens and the named slots (header, tab strip, tab content, footer); nothing else of the window is UI's |

## Claims made at checkpoint 4

| To | Claim |
|---|---|
| commandline | The seam is one interface, one attribute and the runner lines, as decided on 2026-10-24; `ReachableDepositsCheck` lives in `Navigation.Places.Editor`, an editor assembly compiled only where Places is installed; the `checks:` line names both checks with their package; a check finding starts the report with the status word, `failed` for a fault in a valid call; `core.unknown-key` carries no fix code |
| pathfinding | `Navigation.Places.Editor` ships `ReachableDepositsCheck` over `PlaceDefinition`; Places never imports Navigation |
| runtime | Every reporting door of UI and Switchboard takes the observation context last: `UIKit.Views`, `SwitchboardKit.Connect`, `SwitchboardKit.Host`, the `TextLog` constructor; UI's layout section and Switchboard's settings section hold no tick rate and carry Core's header; carrying them across after the first Saboteer release is Persistence's upgrade feature |
| networking | Switchboard.Networking places the router where the game says and assumes no host answer; the profile says where filters and the rate limit run, with no default; it needs the number of receivers a scope reaches at edit time for its profile check, from the protocol assembly's audiences |
| world | GeoForge's material table inspector leaves its runtime folder for GeoForge's editor assembly in U7c; if L7 changes GeoForge in the same pass, the two stories are coordinated |
| roadmap | U7c is new (2 stories, after the first two U7a stories, no game needs it); U7b shrinks to 900 lines written; the area was 63 stories and is 64 at the claims round (U7c gained the Identity inspector); U1's assembly split and every deletion that breaks Saboteer are ordered against the mid January freeze, since nothing is pinned |
| line | None: nothing here disagrees with the decided line |
| commandline | Claim on the seam's owner stays with you (see the answer below). Two asks: the runner sets the check's name on each finding, so a row can show it; and if the header hook cannot host a UI Toolkit element, the mount of the banner is yours (a base type with `CustomEditor(type, true)` or one line in a consumer's inspector), and `ReportView`'s banner form is what it draws |
| unity | The epic is U7c, not U7b, and has three stories. The rewritten inspectors are new types with new names and the old types are deleted in its first two stories, so the ledger's `Ours (type)` column stops resolving and the Moved row turns green |
| living | The `Identity.asset` inspector is a story in U7c after LV2; the Drafts page content is CL7's (area 2), not this area's; Check page rows show the check's name through `ReportView` |

Claims I leave on others, for the orchestrator: Living's LV2 depends on ui:U7a, and the roadmap lists U7a and U7b in place of U7 (the same 9 stories). Nothing here contradicts the amendments in `Line.md`.

## Claims on this area, answered (checkpoint 4)

| From | Claim | Verdict | Answer |
|---|---|---|---|
| orchestrator (RedTeam 7.7, item 1, from runtime) | Every reporting front door takes the observation context as its last explicit argument | Accepted as is, already folded | `UIKit.Views`, `SwitchboardKit.Connect`, `SwitchboardKit.Host` and the `TextLog` constructor take it last (U1, U2, U4). `ReportView`, the controls and the inspectors report nothing and take none |
| commandline | If `Editor.finishedDefaultHeaderGUI` cannot host a UI Toolkit element (unverified, CL4's first proof), the inspector banner is drawn by area 11's editor controls from the same cached report | Amended | Accepted as the fallback and designed now: `ReportView` has a banner form (one `HeaderBar` row with severity and counts, expandable to the full view) bound to the cached report. Amended: it is not a fifth control, so the decided four stay four, and the mount is area 2's. Unity's page for the event shows only IMGUI calls and never says UI Toolkit; `CustomEditor` documents `editorForChildClasses` but is silent on interfaces. A banner on an inspector with no custom editor needs a base type or one line in the consumer's inspector, and that choice is CL4's, made after its proof. The banner form is built only if the proof fails |
| art | `ReportView` shows per finding a sentence, a hint and up to two action buttons that each call a delegate; a material finding has two | Amended | Accepted in effect, changed in shape: the single `FixHandler` becomes `ActionsFor`, which the host answers per finding with up to two `FindingAction`s (a label and a delegate). A finding still carries one `FixCode`; the host maps it to its actions, so `ValidationFinding` does not change. ArtPipeline's material finding returns Pick an existing one and Keep as a new material. Nothing is drawn for a finding without a fix code, and none for `core.unknown-key` |
| living | Area 11 owns the check seam's interface, attribute and run lines in Core.Editor and the Drafts page content; the Check page rows are named by the check; the Identity.asset inspector is UI Toolkit | Rejected in part, accepted in part | Rejected: the seam and the Drafts content. The seam is CL4 story 10 (the interface, the attribute, the lines that find and run checks, the fixture from a third assembly) and sits in the same runner as the report, the banner and the drafts folder; the Drafts and Operations pages are CL7. Both are priced there, and moving them would leave two owners for one runner and count the stories twice. This area draws their output with `ReportView` and registers one check, as it has. The line decides that Core.Editor holds the seam, not which area writes it, so this contradicts nothing decided; if the orchestrator moves it, it moves with CL4's 11 stories. Accepted: Check page rows show the name of the check that wrote them (the runner sets it; `ReportView` draws it), and the `Identity.asset` inspector is UI Toolkit, a third story in U7c after LV2, built from `SectionCard`, `HeaderBar` and the plain fields |
| unity | Area 11's epic U7b rewrites Core's `LogConfigEditor` and GeoForge's `MaterialSideTable` in UI Toolkit and moves the table out of the runtime folder; the ledger carries the row as Moved and reports it wrong until the rewrite lands | Amended | The epic is U7c; U7b is UI.Editor's skin, Gallery and pages. Accepted that the table leaves its runtime folder in U7c. Amended: the ledger check flags a Moved row whose type still resolves (Unity.md, step 6 and the `Ours (type)` column), so a rewrite that kept the old type name would stay wrong for ever. U7c's first two stories delete the old types and give the new inspectors new names, and the row turns green when the types stop resolving. Whether `MaterialSideTable` can leave without a runtime reference is still the first story's reading, confirmed by GeoForge's owner |

## Claims made at checkpoint 5

| To | Claim |
|---|---|
| roadmap | The epics are twelve and 68 stories: U4 is U4a (11 stories) and U4b (4), U6 is U6a (2) and U6b (2), and two stories are added to U4a (the chat settings page and Saboteer's cut-over). U1, U2, U3, U4a, U6a and U6b are in the demo files class and land before 2027-01-14; U5 is Saboteer's class with its game-side ports after the festival; U7a is Saboteer's class by closure; U4b is Corsairs'; U7b, U7c and U8 are undated. After the freeze every UI merge into a branch Saboteer follows is additive until 1 March 2027 |
| roadmap | U4a and U6b need only the first slice of Persistence's section writer (write and read one section with Core's header), not the whole of L8; the roadmap places that slice in front of the freeze or says it cannot |
| commandline | CL1's host, catalog, audience tag and result type are needed by U3 before 2027-01-14; CL1 joins the demo files class by closure. The drawn example uses `IDefinitionCheck<T>`, `RegisteredDefinitionCheck("navigation.reachable-deposits")` and `Check(T, ValidationReport)`; if the attribute's spelling or the members differ, area 2's wins and the drawing follows. The `core.unknown-key` message carries the stored value text and `ReportView` draws it unchanged |
| networking | N4's event link and audience slice is what U4b stands on; until it lands Saboteer keeps a thin `ChatNetwork` implementing Switchboard's client interface. If N4 is in Saboteer's class, U4b joins it |
| pathfinding | `ReachableDepositsCheck` is in `Navigation.Places.Editor`, registered as `navigation.reachable-deposits`; before Navigation lands the report's `checks:` line has no Navigation entry and `ReportView` draws none |
| unity | U9's throwaway copy in the newest Unity 7 alpha runs the theme fixture U1 leaves in `Samples~`, with Legacy Theme Priority off and on; the must-not-reinvent list in section 7 is the UI half of the ledger's UI Toolkit rows |
| line | None: nothing here disagrees with the decided line |

## Claims on this area, answered (checkpoint 5)

| From | Claim | Verdict | Answer |
|---|---|---|---|
| commandline (RedTeam 8.8 item 4) | Respell the report's checks line as `<name> (<Package>)` in the `ReportView` example and the interface as `IDefinitionCheck<T>` | Accepted as is | Section 3k now draws `checks: PlaceDefinition (Places), navigation.reachable-deposits (Navigation)` and `IDefinitionCheck<T>`; the attribute is area 2's `RegisteredDefinitionCheck` with the registered name, replacing my earlier `[DefinitionCheck]`. The assembly is `Navigation.Places.Editor` in the drawing, the claims rows and the homes table |
| unity (RedTeam 8.8 item 8) | Add backdrop blur and drop-shadow filters (6.6), box shadows, gradients, gap (6.7 beta) and experimental screen-reader support to the must-not-reinvent list; probe the Unity 7 theme priority rule when the kit's theme is first tried there | Accepted, amended in one place | The list is in section 7. Amended: the kit's floor is 6000.3, so the list means the kit builds no substitute and its shipped USS does not use the feature until the floor reaches it; a buyer on a newer Unity may use it in their own USS. The probe is no new story: U1's theme swap spike leaves its fixture in `Samples~` and U9's throwaway copy (decided 2026-10-24) runs it in the Unity 7 alpha with Legacy Theme Priority off and on. I did not read Unity's pages myself; the claim stands on the Unity reader's notes |
| commandline (RedTeam 8.8 item 4, second pass) | Respell the seam as `IDefinitionCheck<T>` in the example; CL3's Saboteer half needs UI's console view before the mid January 2027 freeze so the demo shows the new console | Accepted as is, with one deletion split | The spelling was done in the first pass and is the only one in this file. The dependency is already the plan: U3 is in the class before 2027-01-14 and CL3's Saboteer half waits on it (U3's row now says so). Amended in one place so nothing is counted twice: CL3 deletes the old registries, attributes, router and `ConsoleLogger`; U3 deletes the views (Core's uGUI console and prefabs, Chat's console). No story is added or removed |
| runtime (RedTeam 8.8 item 2) | Inventory's view reads the open linked-move entries, draws the stack in its target slot at once, swaps it for the real item when the host's step replicates with no visible change; a refusal slides it back; the container model is never told a stack is there that the host has not committed | Amended | Accepted as the behaviour and refused as UI's code. It is Inventory.UITK's, a bridge hosted in the data owner (line rule 3); UI has no slot and no inventory type, and a widget here would give UI Inventory's name. UI offers nothing new and needs nothing new: the stack is drawn by Inventory.UITK from the open entries in its own USS classes on tokens, and the slide-back is its animation. Only the games with two writers have the state: Saboteer's inventory is owner-authoritative with no host step, so it draws none. Whether Unity's USS transitions cover the slide-back is Inventory.UITK's first story to read, not a claim here |
| networking (RedTeam 8.8 item 1) | Inventory.UITK shows an item in flight over the destination slot from the click until the replicated record with the same intent key arrives; a presentation state with no data behind it; input never blocked | Amended | Same home as the claim above and the same answer on UI. The two claims describe one state with two start conditions, which the orchestrator should join: runtime starts it from the open linked-move entries, networking from the click and ends it on the record with the same intent key. Both agree that no data model holds it and that input is never blocked, which matches answer 13's note (the move must never read as lag). Which start the bridge uses is for those two owners; UI is agnostic |
| unity (RedTeam 8.8 item 8) | Localization 2.0 and the built-in module replace the package in 6.7; UI's binding gets a story only if probe check 4 shows the type names changed | Accepted, amended in one place | Accepted: no story now, and no epic waits for 6.7 (decided). Amended: UI has no Localization binding of its own. Section 3b's seam is Unity-free and the Localization backing is a game's or Studio.Presentation's `Loc`, so a change in the type names lands there; U2's spike is the one UI-side place that touches them and is repeated on 6.7 only if check 4 shows a change. Section 10 says so |


## 11. Against revision 4

Read only after the draft above existed (`Transcript.md` and the UI and Chat rows of `Line.md`). They are opinions. Revision 4 chose a transcript model with channels, a composer with prefix routes, targets registered by name, sources, a profile with a parent, and two UI assemblies for it (`Spellbound.UI.Transcript`, `Transcript.UITK`), with Chat shrinking to about 1,000 lines.

Taken:

- One surface for chat and console, fed by sources, with the console being a composition and not a package. Same conclusion, reached from the code in both drafts.
- A profile asset with inheritance. Mine is `Includes`, same idea: Corsairs extends the studio's profile and adds the guild.
- Kinds as ids, not an enum, and the view deriving a style from the id's name. Mine: open message kinds and open text roles.
- Links as (kind, payload) with the handler the consumer's. Mine keeps the existing `PointerUpLinkTagEvent` path and adds `ILinkAction`.
- Deleting Chat's hard-coded pink and default aliases from the library. Mine puts them in the studio's profile asset.
- A line a job updates with progress, then completes (`AppendLive`). I had not thought of it. It fits `TextLog` as a handle on an appended line; whether operations can stream progress is area 2's. Added to U3 as a story conditional on that.
- Sample profiles under `Samples~`, and measuring the line list with 10,000 lines in the view's first story. Both added to U2 and U4.

Rejected, with reasons:

- The model in a plain-C# assembly "so a buyer with uGUI or IMGUI uses the model with their own view". `Corrections.md` rule 3 and failure 3 name exactly this. The studio sells UI Toolkit only; there is no such buyer.
- Composer, route table and targets registered by name. A target registry beside Core's operation registry is the second registry the line deleted; the card game's `table` target is an operation (`table play`) and its prefix is an alias in the profile. Their route table is also a second parser, longest-prefix-first, where mine is one alias lookup in front of Core's parse.
- Channel as a display stream mapped one to one to a server scope in a bridge. Mine keeps a channel as profile data that names a scope; a display stream is a tab's filter, and nothing in the simulation needs a second type for it.
- A `TranscriptHost` MonoBehaviour that builds the transcript, the view and the window and registers targets. That is a bootstrap order the consumer must adopt (library-design: no framework demands). Mine exposes three public parts and two ready views.
- Five UI assemblies. The line fixed UI at two runtime assemblies and I add only an editor one.
- "A buyer without the UI package reaches operations through the Unity CLI". True and kept, but it is not a reason to drop the in-game console (direction C).
- Chat shrinking to about 1,000 lines while moving "scopes, permissions, moderation, history, delivery feedback" into a System that still has no server half. Today there is no server half at all (`ChatClient` is client-only); Switchboard has to write one, so U4 is a growth in lines, not a shrink, and it is priced that way.

Not verified: revision 4 says Saboteer's `CrewLogs` is "a scrolling log of crew events, a third text surface". I found `CrewLogRelay`, `CrewLogUploadQueue`, `LogMessageTallyPacker` and a console command, which are a telemetry relay (Diagnostics' area), and no scrolling view. If one exists I did not see it; it would be one more arrangement of `TextLog`.

## 12. Red team

Lenses run: Ambition (first), Stranger, Scale, Agent, Designer and artist, Performance, Time, Roadmap. Skipped: none.
Mode: self red-team, run by the author lens by lens. I had no subagent tool in this session, so there are no separate Sonnet readers; before each pass I wrote the strongest claim the draft makes under that lens and tried to break it against the source. The orchestrator's lens readers are the independent attack. Model: Sonnet 5.5, author: this agent.

### Ambition: what is the boldest version, and why is it not on the page

Strongest claim: UI sells what Unity does not ship, and an agent can drive it.

1. **Serious, fixed.** Who: an accessibility-minded buyer of a card game. Task: let a player enlarge text and raise contrast. Break: the draft has a theme and a switcher and nothing for variants. Evidence: absent from sections 3 and 7. Fix: idea 21, theme variants as a second token layer, in U1.
2. **Serious, fixed.** Who: Saboteer, which has about forty view classes (`UI/*View.cs`). Task: add a read-only screen. Break: `View` is abstract, so each screen needs a class even when it has no logic. Fix: a concrete `PanelView` and a serialized view identity (this also removes the `ConsoleView` name collision), idea 20.
3. **Minor, not fixable here.** The boldest version of all: UI regression tests that an agent writes as a list of `ui` operations plus the expected lines of `ui tree`, run by CI in play mode. It depends on a script runner for operations, which is area 2's. Listed as a Beyond the brief candidate for 2c, with its cost (one runner and a golden-text convention) and gain (UI tests without a person).
4. **Not explored.** Hot reload of UXML and USS in a running build. I read no Unity source or manual page on it and claim nothing.

### Stranger

Strongest claim: any imagined game uses the widgets without editing the package.

1. **Serious, fixed.** Who: the card game developer who wants only the console. Task: show the console without adopting the view manager. Break: `ConsoleView : View` needs a `UserInterfaceManager` parent (`UserInterfaceManager.Awake` logs an error when views are not its children). Fix: `ConsolePanel` is an element in Widgets; `ConsoleView` only wraps it; Widgets stands alone.
2. **Serious, fixed.** Who: the racing game developer. Task: a speedometer readout in a muted style. Break: the first snippet used `TextRoles.PlayerName` and `Timestamp`, chat words in a neutral kit. Fix: UI ships seven neutral roles; Switchboard.UI declares `PlayerName`.
3. **Serious, fixed.** Who: a card game on its own relay. Task: server-side chat with no PurrNet. Break: the draft named one transport interface and no server half. Fix: a client interface and a server delivery interface, plus an in-process loopback of both.
4. **Minor, not fixed.** Who: a buyer on the Input System only. Task: hold a key to see tooltip detail. Break: UI Toolkit may expose no modifier-key state without an event; unverified. Mitigation: the tier source is a seam and a game-supplied source is always available (3g). The default may be absent.
5. **Minor, cannot fix here.** The data object a bound row reads needs some attribute or property bag for Unity's binding; unconfirmed from the 6000.4 pages I read. First story of U5.

### Scale

Strongest claim: UI never compiles on a server and Switchboard's core does.

1. **Blocker, fixed.** Who: the MMO shard with thousands of players. Task: a player joins. Break: the roster broadcast sends every name to every client on each announce, so total work grows with players squared. Evidence: `ChatNetwork.cs:116-120` (`RosterObserversRpc(ids, names)` with `bufferLast: true`). Fix: names travel with a speaker's first line to each receiver, and the per-receiver set lives in the bridge (3i).
2. **Serious, mitigated, not fully fixable.** Who: the same shard. Task: a global channel. Break: an unbounded scope is a send to thousands per line. Fix: scopes must bound receivers, a per-sender rate limit ships on by default, and the profile validator flags an unbounded scope on a server profile. Capacity stays unproven and is area 6's measurement.
3. **Minor, said.** Sending to a receiver list in one call, instead of one RPC per receiver, depends on what Networking offers. A claim on area 6.
4. No finding: UI and `Switchboard.UI` carry `!UNITY_SERVER`; templates are rendered at the receiver, so the server never formats text. Walked: a server build of a Switchboard host, a headless loopback test.

### Agent

Strongest claim: an agent can see and drive the UI and chat with only the command line.

1. **Serious, fixed.** Who: an agent with no menu access. Task: add a view. Break: the New View action was a menu item. Fix: `ui new-view` and `ui validate` as editor-audience operations.
2. **Serious, fixed.** Who: an agent testing chat. Task: send a whisper and read it back. Break: no operations for Switchboard and no transport without a network. Fix: Switchboard's operations (`say`, `whisper`, `history`, `channels`) and the loopback pair.
3. **Serious, partly fixed.** Who: an agent authoring a chat profile. Task: add a channel with an alias. Break: filling nested lists of a ScriptableObject through generic field commands may be slow or impossible (unverified for the Unity CLI's `set_serialized_field` on lists). Fix: a code builder `SwitchboardProfile.Create()` used by tests; the asset route stays the designer's. Not provable here.
4. **Serious, not fixable here.** Who: an agent. Task: press a button and read the result. Break: how a simulated click reaches `Button.clicked` in a player is unconfirmed. First spike of U8; if it fails, `ui click` is limited to elements with registered click handlers and says so.

### Designer and artist

Strongest claim: a designer changes the look and the chat setup without code.

1. **Serious, fixed.** Who: an artist new to Unity. Task: restyle the HUD. Break: sixty tokens in a USS file as `rgba()` text. Fix: the tokens can be assigned as USS variables in UI Builder (Unity manual, 6000.0 copy) and the Gallery shows the result live. Not read in the 6000.4 copy.
2. **Minor, fixed.** The row snippet used `binding-path`, the editor's serialized-object binding name. Changed to `value-path` backed by `DataBinding.dataSourcePath` (6000.4 reference).
3. **Minor, said.** A designer sets a channel's colour as a role in the profile, but the colour of a role lives in the theme: two places for one decision. The profile validator shows the role's current colour beside the field; I found no better answer.

### Performance

Strongest claim: no boundary adds a cost the games do not already pay.

1. **Serious, fixed.** Who: Corsairs, dragging a HUD panel. Task: move a window. Break: both games save on every layout record change (`GameViewManager.cs:107-109`), so every pointer move can write a save. Fix: write on edit-mode exit.
2. **Minor, mitigated.** `TextLog` on dynamic height is documented as less performant than fixed height (Unity manual). A fixed-height mode exists and U2 measures both at 10,000 lines.
3. **Minor, not fixable here.** Rendering a styled line builds one string, as `ChatMessageFormatter.Format` does today, and reading role colours through custom style properties costs something I have not measured. U2 measures per-line cost against today's formatter and reports it through Core's observations; no number is claimed.

### Time

Strongest claim: a buyer ten years on does not meet a break from our choices.

1. **Serious, fixed.** `ViewPolicy` is a struct with three positional booleans; every new field would break every caller. Fix: extend by property with a default.
2. **Serious, fixed.** Removing a token breaks every buyer's copied theme silently. Fix: a validator that lists every token the default declares and a copy lacks. The first version of this fix also kept a contract version on the theme; the apply round of 2026-10-23 removed it, since the validator needs no number.
3. **Minor, isolated.** `PointerUpLinkTagEvent` is Experimental; one renderer file depends on it.
4. **Minor, claimed.** Unity will keep absorbing the kit (`TabView`, binding). The Unity-first audit must repeat at each LTS; a claim on area 8 to list the UI Toolkit features Unity ships.
5. **Minor, said.** Before the package ships, a renamed profile field means the asset is re-authored; there is no `FormerlySerializedAs` and no migration (the line's amendment on compatibility). After it ships, rule 17 and the release diff of area 2 govern.

### Roadmap

Strongest claim: the epics are ordered so value arrives early.

1. **Serious, fixed.** Who: the roadmap pricing. Task: count stories. Break: the line's L5 already includes the UI split and Chat to Switchboard; U1 to U8 would be counted twice. Fix: U1 to U8 replace L5, stated.
2. **Serious, fixed.** `ReportView` is in U7 after L2 while L2's validation contract writes a report. Fix: L2's report is data first (a text file an agent reads); the view draws it later.
3. **Serious, fixed.** U4 waited on L9 as a whole. Fix: nine of its thirteen stories need only U2, U3 and L2 and already replace the chat window; four wait for Networking's N4 (the count was corrected in the apply round of 2026-10-23).
4. **Minor, fixed.** Decision 1 decided a boundary (Core.Editor's contents) that blocked U7 and area 7's window; the developer answered it on 2026-10-23, so U7 has no gate.

### Apply round, 2026-10-23 (self pass over the changes)

Lenses run: Time, Agent. Strongest claim: after the removals nothing in UI or Switchboard needs a path for older data.

1. **Minor, said.** Who: a buyer with a copied theme. Task: upgrade after a token changes meaning without a rename. Break: with no contract version the validator reports a missing token but not a changed one. Accepted: a changed token takes a new name.
2. **Serious, open.** Who: a Saboteer demo player with a saved HUD layout. Task: launch the new build. Break: the layout is not read and the HUD starts from the default. Evidence: section 3f. Decided at checkpoint 5: Saboteer cuts over before the freeze, a tester sees the default HUD once, and the demo is exempt; no shim.
3. **Minor, said.** Who: a card-game developer with only the widgets. Task: reach the front door. Break: `UIKit` lives in `UI.Screens`. Mitigation: the widgets are plain elements; claim on area 2.
4. No finding under Agent: walked `spellbound_run --line "ui themes"`, `ui theme Paper`, `ui tree --depth 3`, `switchboard whisper Ana hello`; each result starts with its status word, each group equals its package name, and the door is `<Name>Kit`.

### Claims round, 2026-10-23 (self pass over the changes)

Lenses run: Time, Roadmap. Strongest claim: the editor controls can land before the window and the window before the skin, with no cycle.

1. **Serious, fixed.** Who: the roadmap. Task: order U7 and Living's LV2. Break: U7 waited on LV6 (the window) while LV2's shell needs U7's controls. Fix: U7a and U7b, with U7a depending only on L2 and CL4.
2. **Minor, said.** Who: a package author with a finding that has a `FixCode` and no handler. Task: offer a fix. Break: no button, only the hint. Accepted: a fix is the host's decision, and the hint says what to do by hand.
3. **Minor, not fixable here.** Who: Diagnostics on a long session. Task: show a timeline of thousands of entries. Break: UI offers no timeline widget and `TextLog` is text. Diagnostics.UI owns the element and its cost; no figure is claimed here.

### Orchestrator findings

1. **Serious, fixed.** Styled text could not be localized: tooltips and affix lines shipped in one language, and Switchboard's template resolver was a second mechanism. Answer: correct, I wrote `.Text` and `.Plain` only and cut the bridge. Fixed in 3b: a template span (id plus typed, role-tagged arguments) resolved through `ITextTemplateResolver`, in UI.Widgets. Roles survive translation because the seam returns a pattern and the renderer applies the roles at the placeholders. Switchboard's `ITemplateTextResolver` is deleted and Switchboard.UI uses the span; the template table in the profile is the default source. Claim for the orchestrator: Modifiers.UI must emit a template span for an affix; that is the Modifiers owner's file. Not provable here: plural inside one sentence and the Localization 1.5 read (U2 first story).
2. **Minor, fixed.** The console's audience was a closed enum with a member that matched no Core constant. Answer: correct. Fixed in 3d: a list of audience ids typed as strings, defaulting to Core's developer constant, with a picker in UI.Editor. `DeveloperBuild` is dropped in favour of the operation's availability.

### Checkpoint 4 fold (self pass over the changes)

Lenses run: Stranger, Time, Agent. Skipped: Scale, Performance (nothing in the fold adds a cost path; the context argument is the existing report call). Strongest claim: UI is a consumer of the check seam and adds nothing to Core.

1. **Serious, open.** Who: Saboteer's developers, two or more in the project, the demo following package branches. Task: keep the game building while U1 splits UI into assemblies and deletes Chat. Break: with no pin and no demo branch, a breaking merge reaches the game when its manifest next resolves, and the freeze from mid January allows bug fixes and media only. Evidence: Line.md "Also decided on 2026-10-24". Not fixable in this file; claim on the roadmap, answered at checkpoint 5 by moving U1 and the glue deletions in front of the freeze.
2. **Serious, fixed.** Who: a card game whose deck definition is judged by its rules package. Task: see that finding in the inspector. Break: if `ReportView` drew only the type's own findings the check would be invisible. Fix: it draws every finding the same whichever check wrote it, and shows the `checks:` line, so a check that did not load is visible.
3. **Serious, fixed.** Who: an artist who renamed a field. Task: read the stale-key error. Break: a Fix button on `core.unknown-key` would offer to rewrite data the scan only detected. Fix: no Fix button; the hint says to re-author the value under the new name. Claim on area 2: the finding carries no fix code.
4. **Minor, fixed.** Who: a stranger who installs Switchboard without Networking. Task: validate a profile. Break: a validator that judged scopes by receiver count would need Networking. Fix: the unbounded-scope rule is a check in `Switchboard.Networking.Editor`; Switchboard's own validator keeps what it can judge alone.
5. No finding under Agent: walked `spellbound_run --line "core validate --drafts"` and `ui validate`; each result starts with its status word (`failed:` when an error is found), and the printed `checks:` line lets an agent see which checks ran.

### Checkpoint 5 fold (self pass over the changes)

Lenses run: Roadmap, Time, Agent. Skipped: Stranger, Scale, Performance (nothing in the fold adds a type, a hot path or a receiver count). Strongest claim: the cut-over can land before the freeze and everything after it is additive. Mode: self, Sonnet 5.5, author this agent; I had no subagent tool.

1. **Serious, fixed.** Who: Saboteer's developers deleting `ChatSettingsPanel` (504 lines) before the freeze. Task: ship the demo with chat settings. Break: no story built a replacement, since the old U4 listed "settings as a section" and no view. Evidence: section 2c names the panel and the old U4 row had no page. Fix: U4a gains a chat settings page and Saboteer's cut-over story.
2. **Serious, fixed.** Who: Saboteer's developers. Task: delete `ChatNetwork` before the freeze. Break: the bridge that replaces it waits on N4, which no one placed before the freeze. Fix: the game's thin `ChatNetwork` implements Switchboard's client interface until U4b; the deletion of the rest of the glue is not blocked.
3. **Serious, open for the roadmap.** Who: the developer with a freeze on 2027-01-14. Task: land L1, L2's registry and attribute, CL1, Persistence's first slice, then U1, U2, U3, U6a, U6b and U4a. Break: the chain is long and I have no measurement of whether it fits. Evidence: section 8's dependencies. Not fixable here; the claim on the roadmap and the limit say so, and the decision is not reopened.
4. **Serious, fixed.** Who: Saboteer's second developer. Task: keep the game building from the freeze to 1 March. Break: U5's ports of `SettingsView` and the tooltip rewrite game code. Fix: only the library stories of U5 and the additive epics land in the window; the ports wait for the festival.
5. **Minor, said.** Who: a stranger with a copied theme on Unity 7. Task: keep the look. Break: if a theme sheet outranks built-in styles regardless of detail, a copied theme may win where it did not. Mitigation: the throwaway-copy probe; nothing is claimed until it runs.
6. No finding under Agent: walked `spellbound_run --line "core validate --drafts"` before and after Navigation; the first has no Navigation token in `checks:` and the agent reads that as not run, which is area 2's CL8 rule.


### Could not fix

- Unity facts unconfirmed in 6000.4 pages: binding data requirements, `:root` in the Inspector, `TabView` in 6000.4, modifier-key state, a simulated click in a player (limits, and the first story of each epic).
- Capacity of a global scope on a shard (area 6 measures).
- Per-line and per-style-read cost (U2 measures).
- UI scenario scripts (need area 2's runner; Beyond the brief).
- Plural forms within one localized sentence, and whether Localization 1.5 returns an unformatted pattern (U2 first story proves it; the table registration is the fallback).
- I could not confirm that Saboteer's `CrewLogs` has a scrolling view (section 11).
- The red team was one mind with eight passes, not eight readers.
- Whether the freeze chain fits before 2027-01-14, and the Unity 7 theme rule (section 10).
