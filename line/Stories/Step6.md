## The stories of step 6: the console, Saboteer's commands, input contexts, the first slice of Persistence, the layout section (UI3, CL3a, L8a, UI6a, UI6b)

Step 6 puts one console over Core's operation list and takes Saboteer onto it before the freeze, converts Saboteer's ten command classes, gives UI its input-context seam and its modal host, builds the first slice of Persistence under the studio id beside the old package, and saves the HUD layout as a section. Fourteen stories: UI3 six, CL3a two, L8a two, UI6a two, UI6b two. The split is the planner's; the outcomes are the epics'. Facts are marked **verified** with the date or **verify before building on it**. Three repositories change, each on a branch of its own: UI (`beta`), Persistence (a new `beta` beside `main`, which keeps the old package untouched) and Saboteer (a branch off `main` that the developer plays; its manifest points at the three branches and at Core's `dev`).

Applies to every story of the step:

- **Rules:** the rules of steps 1 to 5 hold (spelled-out names, one type per file, explicit access modifiers, no comments or XML docs, logging through Core, the studio's Rider formatting, the copyright line on every new C# file; a gap is raised and stops the story; the lead never touches git; nothing merges to a branch a game follows). Every value a game might tune is a property with a default, a serialized field or a constructor argument.
- **Rules:** UI references Core and the engine modules only; it never references Persistence, the Input System or any data package. Persistence references Core only. Saboteer edits no package; what it needs and a package lacks is raised.
- **Rules:** the console owns no registry, no parser and no static output event: a line goes to `OperationHost.Run`, the result comes back as an `OperationResult`, reports arrive through `OperationRun.Reported`, log lines through `Log.AddScopedSink` while the view is open. The operation grammar of the line text is the only grammar.
- **Rules:** Saboteer's branch compiles against UI `beta`, Chat `beta`, Persistence `beta` and Core `dev`, so the consumer updates step 8 listed for Saboteer (namespaces, UXML namespaces, theme imports, the removed shapes) land on this branch; step 8's LS story becomes the manifest lines alone. Corsairs is untouched.
- **Verified (2026-10-25):** Core `dev` at e0ca89f holds the operation host, catalog, result, caller, context, `OperationRun.Reported`, `OperationTable`, `Log.AddScopedSink`, `SectionAttribute(name)`, `CoreKit.Packing.Describe`, `StableHash.Fnv1A32`, `AssemblyScanning.ScannableAssemblies`; positional arguments bind (`fixture echo one`). UI `beta` at a53b2fc holds Widgets, Screens, Editor, the four text parts and the Gallery; `ViewPolicy` is a three-argument struct; `LayoutStore` packs a format byte 2. Persistence `main` at c5b12eb is the old package at the repository root (`Assets/Persistence` in PersistenceDev), ten files, no tests, installed by Saboteer with no ref. Saboteer `main` at 5fc4bd2 has ten command classes under `ConsoleCommands`, a Console object in `Gym.unity` and `NetworkedScene.unity` carrying Chat's `ConsoleWindowController` and `ConsoleView`, hand-wired input switches in `GameViewManager` (console) and `ChatHud` (chat), and `UiLayoutService` with `UiLayoutData` over the old `SaveSystem`; 38 C# files and 16 UXML files use the old UI namespaces, one `.tss` imports the old style paths; its working tree carries the developer's uncommitted manifest change (Core, Decals and Inventory at `?path=`), which is the baseline and is not touched.
- **Verify before building on it:** Saboteer's `packages-lock.json` pins Core at f5fdc49, a commit GitHub does not know; the branch's lock entry for Core is removed so the editor resolves `dev` afresh.
- **Regression contract:** UI's edit-mode and play-mode tests pass; the view stack, cursor arbiter, escape chain, layout edit mode, the four text parts and the Gallery behave as before; the Gallery opens on the default theme. The old Persistence package is byte-for-byte untouched on `main` and in the working tree, and Saboteer's settings, chat settings and progress keep loading through it. In Saboteer: the player map, console map and chat map switch as before (typing in the console or the chat never drives the player; closing either returns the player map); Escape closes the console; the HUD layout edit mode still moves and resizes regions and Done keeps the layout; every view, scene and prefab that used a moved UI type still resolves (GUIDs kept); the old `uilayout_global_uilayout.bin` is never read or deleted.
- **Done, for each story:** compiles clean in its dev project through the Unity CLI, its tests pass, and the report lists what was built and what was raised.

### UI3-1 OperationLines and the console log sink

- **Outcome:** `OperationLines` in Widgets turns an `OperationResult` into styled lines (the status word in the role its severity picks, the prose plain, a `Run:` hint muted) and a log entry into one line (level as role, source muted); `ConsoleLogSink` is an `ILogSink` that appends to a `TextLog`.
- **Done:** edit-mode tests on the status word, the hint line and each severity's role.

### UI3-2 OperationCompleter

- **Outcome:** `OperationCompleter` implements `ITextCompleter` over an `OperationCatalog` for one `OperationCaller`: group names, then operation names inside the group, then `--argument` names, then an enum argument's legal values; operations the caller may not run are not offered; `TryDescribe(text)` gives the usage line of the operation being typed so the panel can show it.
- **Done:** edit-mode tests on each level and the audience filter, with a custom `ITextCompleter` swapped into the panel.

### UI3-3 ConsolePanel

- **Outcome:** `ConsolePanel` is one element: a `TextLog`, a usage hint, a `TextEntry`; its structure comes from an optional template with named slots and its look from `Console.uss` tokens; it holds an `OperationHost` (default `CoreKit.Operations`), the caller's audiences, the echo prefix and the running text; a submitted line is echoed, run, its reports shown (a live line for a run that outlasts the call), its result appended by `OperationLines`; `AttachLog(level)` adds the scoped sink.
- **Done:** play-mode tests through the UI Test Framework: a line runs and its result shows; an invalid line shows in the negative role; a warning logged while attached appears and one logged after detaching does not; Tab completes a group name.

### UI3-4 ConsoleView and the ui operations

- **Outcome:** `ConsoleView` in Screens is a `View` over a `ConsolePanel` found in its document or built when the document has none; serialized audiences, log level, capacity and the input context; it focuses the entry and attaches the sink on show, detaches and blurs on hide, and raises the text-entry input context while its entry has focus. `ui themes`, `ui theme --theme-name` and `ui clear` ship in Screens under the `ui` group.
- **Done:** compiles; an edit-mode test runs `ui themes` through a host built on the Screens assembly.

### UI3-5 The Gallery console

- **Outcome:** the Gallery has a console view bound to a dock button and a key, so a buyer sees the console over the sample's operations; the dev scene matches.
- **Done:** the Gallery compiles and opens; the developer judges it.

### UI3-6 The deletions

- **Outcome:** Core's uGUI console (`ConsoleController`, `GameConsoleOutput`, the prefabs) and Chat's console (`ConsoleElement`, `ConsoleWindowController`, `ConsoleView`, `ConsoleCommandHistory`, the console sample) are deleted.
- **Rules:** CoreDev and ChatDev are outside this step's directories; the story is raised with the file list and stays open for a session in those repositories.
- **Done:** the file list in the report; `refused` until that session.

### CL3a-1 Saboteer's ten classes as operations

- **Outcome:** the ten `ICommand` classes become static methods under `[assembly: OperationGroup("saboteer", ...)]`: `crew-logs`, `fog`, `gold --amount`, `item --name [--count]`, `items`, `modifier-grant`, `modifier-revoke`, `modifier-status`, `modifier-dispel`, `poi`, `settings-list`, `settings-get`, `settings-set`, `settings-reset`, `spawner`, `world-items`; each names its effect and availability, returns text or an `OperationTable`, and refuses through `OperationException` with a hint. The ten files are deleted.
- **Done:** compiles; `core help --group saboteer` lists sixteen operations.

### CL3a-2 Saboteer's console onto UI's

- **Outcome:** the Console object in both scenes carries UI's `ConsoleView` over a Saboteer `Console.uxml` with a `ConsolePanel` in the game's look; Chat's `ConsoleWindowController` and `ConsoleView` leave the scenes; `GameViewManager` toggles the view on the console key as before and the developer-console setting still gates it; the manifest takes UI, Chat and Persistence from their branches.
- **Done:** compiles; the developer opens the console in the Gym and runs the sixteen operations.

### L8a-1 The package, the store, the header

- **Outcome:** `com.spellboundstudios.persistence` at `Packages/Persistence` inside the Persistence repository (so the install path `?path=/Packages/Persistence` never changes when the repository moves to the settled layout at L8), assembly and namespace `Spellbound.Persistence`, Core as its only reference; `PersistenceKit.Open(storage, settings, sections)` returning `Saves`; `Saves.Load(key, options)` and `Saves.Save(store, options)`; `Store` with `Section<T>()`, `Bind<T>(instance)`, `Has<T>()`, `Carried`; `StoreKey`; `SectionCatalog` built at `Open` through Core's assembly scanning with the four refusals (duplicate name, not a class, no `IPacker`, no parameterless constructor); `SectionHeader` and the fingerprint over the field lines of Core's layout description; the file layout of the pitch; `FileStorage` writing on a worker to a temporary file first.
- **Done:** edit-mode tests: a store round-trips through a file; the fingerprint is equal for two types with the same fields and differs when a field is renamed; `Open` fails naming a duplicate section.

### L8a-2 MemoryStorage, the refusal, the unknown policy, Required

- **Outcome:** `MemoryStorage`; `LoadResult` with `Loaded`, `New`, `Refused`, the `Refused` list with both fingerprints, `Unknown`, and the refusal reason; the unknown-section policy (`Carry` default, `Drop`) through `SaveSettings`; `LoadOptions.Required`; `SaveJob` with `Captured`, `Completed`, `Completion` and `FlushToDisk`.
- **Done:** tests on every door and every extension point: `Storage_CustomImplementation`, refusal by name, carry and drop, a required section refused, a truncated file, a missing file as `New`, a flushed write.

### UI6a-1 Input contexts

- **Outcome:** `IInputContextSwitch` (`Enter(uint)`, `Leave(uint)`) in Screens with `InputContextIds.Of(name)` and the shipped `TextEntry` id; `ViewPolicy.InputContextId` set through `WithInputContext`, never a fourth constructor argument; `View` gets a serialized `inputContext` name; `UserInterfaceManager.InputContexts` holds the switch (default none) and enters the top view's context when it becomes top and leaves it when it stops; `InputContextBinding` raises the same pair from a `TextEntry`'s focus. Saboteer's `SaboteerInputContexts` is the one class that touches `PlayerInputManager`; `GameViewManager` and `ChatHud` stop switching maps themselves.
- **Done:** edit-mode tests with a fake switch (`InputContextSwitch_CustomImplementation`): enter on top, leave on hide, no call for a view with no context; Saboteer compiles and typing never drives the player.

### UI6a-2 The modal host and the confirm dialog

- **Outcome:** `ConfirmDialog` in Widgets (title, message, confirm and cancel, template-replaceable, `Confirmed` and `Cancelled`); `ModalHost` in Screens shows one element over a layer the manager names, claims the cursor, locks the view stack and takes Escape first; `UserInterfaceManager.Modals` and `Confirm(title, message, onAnswer)`.
- **Done:** edit-mode tests on the host (show, answer, escape); the Gallery's quit asks through it.

### UI6b-1 LayoutStore as a section

- **Outcome:** `LayoutStore` carries `[Section("ui.layout")]` and implements `IPacker` (count and records, no format byte); `UserInterfaceManager.LayoutSaveRequested` fires when edit mode exits with its changes kept and when the manager is destroyed with the store dirty, never per record.
- **Regression contract:** the edit mode's revert payload still restores the records on Cancel.
- **Done:** tests on the round trip and the event.

### UI6b-2 Saboteer's layout glue

- **Outcome:** `GameViewManager` opens Saboteer's `Saves` once, loads the `settings` store, binds the layout, and saves on `LayoutSaveRequested`; `UiLayoutService` and `UiLayoutData` are deleted; a layout saved by an earlier build is not read, so the tester sees the default HUD once.
- **Done:** compiles; the developer places a panel, leaves and returns, and sees it kept; the old file is still on disk.

