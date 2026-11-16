# Audit of Inventory and Modifiers after L6 (step 30)

Written 2026-11-15 by the step runner's search task (`search-l6-audit`, Opus) from `_probes/handoff-30/runner/audit.md`; the developer answered its homes on 2026-11-15 (findings 1, 2, 7, 11, 12 and gap 5 to Inventory transactions, R6a; findings 3, 4, 5, 8, 9 and gaps 1 to 4 to Studio.Gameplay, PG; finding 6 waived; findings 10 and 13 fixed in step 30 by `fix-1-1` and `fix-1-2`). The step's report is `line/Reports/Step30.md`.

Trees read: Inventory at `_probes/Inventory30` commit `2e59fbf` over `c092406`, Modifiers at `_probes/Modifiers30` commit `9cb9e16` over `1e9cdb7`. Paths starting `Runtime/` are under each package root (`Packages/Inventory` or `Packages/Modifiers`). The games were read as they stand on 2026-11-15: Corsairs under `CorsairsIsleDev/Assets`, Saboteer under `SaboteurDev/Assets/_Project`.

## 1. The bar before and after

Both readings are `packagecheck check --path Packages/<name>` status lines, from `handoff-30/evidence/*-bar-before.txt` and `*-bar-after.txt`.

| Package | Before | After | Cleared | Still red |
|---|---|---|---|---|
| Inventory | 14 must fix, 3 to confirm, 0 waived, 17 passed, 15 not applicable, 7 not run; compiled: current; values: neutral defaults | 5 must fix, 2 to confirm, 0 waived, 28 passed, 14 not applicable, 7 not run; compiled: current; values: neutral defaults | I4, D1, D3, D9, C7 (UITK, Samples), A3, V1, V2, V3 | I1, A1, A7, P1, V6 |
| Modifiers | 15 must fix, 4 to confirm, 0 waived, 18 passed, 10 not applicable, 9 not run; compiled: current; values: Assets/_Project/Settings/SpellboundLine.asset | 11 must fix, 4 to confirm, 0 waived, 23 passed, 10 not applicable, 8 not run; compiled: current; values: Assets/_Project/Settings/SpellboundLine.asset | D1, D6, C5, C7 (D2 now runs and passes) | I1, I4 (2), D5 (8), D9, C4 (5), A1 (2), A3, A7, V2, V3, P1 |

Edit suites after the builds: Inventory 84 of 84 (68 before), Modifiers 231 of 231 (218 before). After the step's fixes: Inventory 86, Modifiers 235.

## 2. The games' reach

Each figure below is a grep over the game trees today; where it differs from the catalogue's reading, the catalogue's figure is in the last column.

| Measure | Corsairs | Saboteer | Catalogue said |
|---|---|---|---|
| `.cs` files with `using Spellbound.Inventory` | 32 | 15 | 33 and 15 |
| `.cs` files with `using Spellbound.Modifiers` | 39 | 17 | not counted |
| `SetItemAt` sites | 7: `_Project/_GameLogic/ConsoleCommands/CraftingConsoleCommands.cs:111,176`; `_Project/_GameLogic/CorsairsWorld/Inventory/Containers/EquipmentInventory.cs:122`; `.../Inventory/Containers/PlayerInventory.cs:104`; `.../Inventory/Containers/PlayerBagEngine.cs:103,156,172` | none | 7, at `:114,177`, `EquipmentInventory.cs:84`, `PlayerInventory.cs:103`, `PlayerBagEngine.cs:103,156,172` |
| `InventoryEngine.TryTransferItem` sites | 3: `_Project/_GameLogic/CorsairsWorld/Inventory/UI/InventoryUi.cs:146`; `.../Player/Controller/ActionStates/EquipAction.cs:44`; `.../Player/Controller/CorsairsCharacterController.cs:538` | none | 2 |
| `TypedInventory<SlotType>` | `_Project/_GameLogic/CorsairsWorld/Inventory/Containers/EquipmentEngine.cs:8` (`EquipmentEngine`) | `Inventory/Containers/HotbarInventory.cs:6` (`HotbarInventory`) | the same two |
| Stat assets under `Assets/Resources/Stats` | 24 | 30 | 24 and 30 |
| Modifier assets under `Assets/Resources/Modifiers` | 9 | 7 | not counted |
| Resource pool copy | `_Project/_GameLogic/CorsairsWorld/Modifiers/ResourcePool.cs`, 109 lines | `Player/Scripts/Stats/ResourcePool.cs`, 101 lines | the same two; the bodies differ by 13 diff lines today, as before |

## 3. The red team of both public surfaces

Ranked most severe first; each row names the site in the after tree, the rule it breaks and what follows from it. The last column is the developer's home.

| Rank | Finding | Site | Rule | Consequence | Home |
|---|---|---|---|---|---|
| 1 | `InventoryItem` is a mutable struct with public fields `itemId`, `quantity`, `data`; `Equals` compares `data` by reference and `GetHashCode` hashes the array reference | Inventory `Runtime/InventoryItem.cs:6-9,24-25,29` | Line.md:74 (an item is `uint id + int quantity + byte[]` and nobody owns the definition); Line.md:130 (Inventory owns the definition) | Two stacks with equal bytes in two arrays are unequal and hash apart, while `CanStack` compares bytes (`Runtime/InventoryEngine.cs:414-417`); any caller can write a field of a copy and set it back through `SetItemAt` | R6a |
| 2 | `SetItemAt` writes any slot with no `CanAcceptItem` and no bounds message | Inventory `Runtime/InventoryEngine.cs:40` | Line.md:107 (equipment is slots that grant while worn, so a slot kind must hold); R6a closes the raw writers (catalogue, `.github/line/Areas/Roadmap.md:583`) | A `TypedInventory` slot takes an item its kind refuses; Corsairs does this at seven sites (section 2) | R6a |
| 3 | Rolls take `System.Random`, not Core's `SeededStream`, through the whole roll path | Modifiers `Runtime/Modifiers/ModifierGrantSet.cs:24,81`; `ModifierDefinition.cs:75`; `ModifierGrant.cs:19`; `NamedModifierGrant.cs:20`; `ContributionSpecification.cs:24,29`; `Magnitude.cs:12`; `RolledMagnitude.cs:25`; `DerivedMagnitude.cs:35`; `SingleStatContribution.cs:31`; `MultiStatContribution.cs:56`; `StatBandContribution.cs:66` | Line.md:59 (a simulation assembly draws from Core's seeded random stream) | A roll cannot be replayed from Core's stream; changing it touches every grant and magnitude signature | PG |
| 4 | Both registries discover definitions by `Resources.LoadAll` and warm up `BeforeSceneLoad` | Modifiers `Runtime/Stats/StatRegistry.cs:15,41,130`; `Runtime/Modifiers/ModifierRegistry.cs:10,33,101` | Line.md:75 (sample assets under `Resources` leave the package) | Moving the samples to `Samples~` removed them from consumers, but any `Resources/Stats` or `Resources/Modifiers` folder in any installed package still loads into every game; the package itself ships `Tests/Resources` (I4 still red) | PG |
| 5 | `TypedInventory` overrides the base's public virtual `Resize` with a throw, and leaves `ReplaceLayout` virtual over the protected array | Inventory `Runtime/TypedInventory.cs:52,81-83`; base virtuals `Runtime/InventoryEngine.cs:44,46,48,208,332,361`; protected field `:11` | Line.md:107 (Studio.Gameplay composes `TypedInventory`) | Code holding an `InventoryEngine` that calls `Resize` throws on a typed one; a subclass writes `inventoryItems` directly with no acceptance check | PG |
| 6 | The Modifiers sample keeps its own `ItemDefinition` beside Inventory's new one | Modifiers `Samples~/CombatDemo/APIExamples/Items/ItemDefinition.cs:5,13-14` (`Spellbound.Modifiers.Samples`, menu `Spellbound/ModifierLib/Sample Item`); Inventory `Runtime/ItemDefinition.cs:9-10` | Line.md:130 (Inventory owns the definition) | A project that imports the sample has two `ItemDefinition` types and two create menus; the sample's menu keeps the old `ModifierLib` name | waived |
| 7 | `TryTakeItem` hands back a stack that shares `data` with the stack left behind | Inventory `Runtime/InventoryEngine.cs:277-282` | R6a needs a stack owned by no container (catalogue, `.github/line/Areas/Runtime.md:85`) | Writing the taken stack's bytes changes the bytes of the stack still in the slot | R6a |
| 8 | `Modifiable.Parent` rejects a cycle by logging and returning, and a parent change raises no `Changed` | Modifiers `Runtime/Modifiable.cs:20-39` | Line.md:107 (equipment grants while worn) | A listener on the child (a `ResourcePool`, a tooltip) is not told its values moved when the parent is set or cleared; a refused assignment is visible only in the log | PG |
| 9 | `GetValue(StatId)` is virtual, but the parent chain reads each `Stats` block directly | Modifiers `Runtime/Modifiable.cs:42,54-62` | Line.md:107 (Studio.Gameplay composes `GetValue`) | An override on a parent is not seen by its children's values | PG |
| 10 | `ResourcePool.Current` clamps only to `Max`, and `_current` starts at 0 until `ResetToMax` | Modifiers `Runtime/Stats/ResourcePool.cs:9,29,33` | Line.md:75 (the resource pool both games copy) | When `Max` falls below `Min`, `Current` reads under `Min`; a new pool with a `Min` of 0 or more reads depleted before its first reset | fixed, `fix-1-1` |
| 11 | `ItemDefinitionSet.TryGetItemInfo` walks the list and rehashes each name on every call | Inventory `Runtime/ItemDefinitionSet.cs:13-22`; `Runtime/ItemDefinition.cs:15` | Line.md:74 (Inventory gives a game containers) | Every add and transfer pays one FNV hash per listed definition | R6a |
| 12 | `TryRemoveQuantityAt` is named as a try and returns `void` | Inventory `Runtime/InventoryEngine.cs:287` | Line.md:74 | A caller cannot tell whether anything was removed | R6a |
| 13 | The Modifiers runtime still carries XML summaries in 24 files and 13 em-dashes in 9 files, two of them in log strings | Modifiers `Runtime/Modifiers/ModifierGrantSet.cs:9-17,48,59`; the others found by `grep -rl "/// <summary>" Runtime` and `grep -rc` for the em-dash | the studio's code rule (no comments, no XML docs, no em-dashes) | The strings reach the console of every consumer; Inventory's runtime has none | fixed, `fix-1-2` |

## 4. The seam table PG and R6a build on

Each row is a member in the after tree with its verdict. The gaps' homes: `Roll`, `RollAndApply`, `Parent` and `GetValue` to PG; `TryTakeItem` to R6a.

| Member | Site in the after tree | Verdict |
|---|---|---|
| `TypedInventory<TSlotKind>` | Inventory `Runtime/TypedInventory.cs:7` | confirmed |
| `CanAcceptItem` | Inventory `Runtime/InventoryEngine.cs:44` (virtual), `Runtime/TypedInventory.cs:24` (override) | confirmed; consulted by `TryAddItem` (`:95`), `TryTransferItem` (`:187,196,199`) and the intra move (`:219,249,252`) |
| `OnSlotChanged` | Inventory `Runtime/InventoryEngine.cs:20`, raised at `:434` | confirmed |
| `ModifierGrantSet.Roll` | Modifiers `Runtime/Modifiers/ModifierGrantSet.cs:24` | gap: it takes `System.Random`, not Core's `SeededStream` |
| `ModifierGrantSet.Apply` | Modifiers `Runtime/Modifiers/ModifierGrantSet.cs:66` | confirmed |
| `ModifierGrantSet.RollAndApply` | Modifiers `Runtime/Modifiers/ModifierGrantSet.cs:81` | gap: it takes `System.Random`, as `Roll` does |
| `Modifiable.RemoveSource` | Modifiers `Runtime/Modifiable.cs:84` | confirmed; `StatBlock.RemoveBySource` raises `Changed` per stat (`Runtime/Stats/StatBlock.cs:109,126`) |
| `Modifiable.Parent` | Modifiers `Runtime/Modifiable.cs:20` | gap: setting or clearing it raises no `Changed`, so a child's listeners miss the parent's values |
| `Modifiable.Changed` | Modifiers `Runtime/Modifiable.cs:12` | confirmed |
| `Modifiable.GetValue` | Modifiers `Runtime/Modifiable.cs:42` | gap: it is virtual, but the chain at `:54-62` reads each parent's `Stats` directly, so a parent's override is not consulted |
| `SetItemAt` | Inventory `Runtime/InventoryEngine.cs:40` | confirmed as the raw writer R6a closes; it checks neither bounds nor `CanAcceptItem` |
| `TryTakeItem` | Inventory `Runtime/InventoryEngine.cs:261` | gap: the taken stack shares its `data` array with the stack left in the slot (`:277`) |
| `TryTransferItem` | Inventory `Runtime/InventoryEngine.cs:149` (static) | confirmed |

## 5. The raises

Each raise names who takes it; none was changed by this audit.

| Raise | Where | Taken by |
|---|---|---|
| Inventory I1: `packagecheck adopt` writes the ledger under the dev project's `Assets` | outside the package | skeleton adoption (plan 16) |
| Inventory A1: the dev project has no values asset, so Core reads as a bridge and the generated depends block in `AGENTS.md` is wrong | outside the package | the dev project |
| Inventory A7 and Modifiers A7: no operation | inside, forbidden this step (L6-2) | a later Inventory and Modifiers row |
| Inventory P1 and Modifiers P1: no observation | inside, forbidden this step (L6-1) | a later row |
| Inventory V6: version | the version rule | the release |
| Modifiers I1 (no `Identity.asset`), A3 (no `AGENTS.md`), V2 (no `Documentation~/index.md`), V3 (no `Surface.txt`), A1 (no `ModifiersKit`, and the bridge has no kit) | inside | a Modifiers row |
| Modifiers I4 (2): `Samples~/CombatDemo/Resources` and `Tests/Resources` | kept by plan answer 2, the registries keep `Resources` discovery | red-team finding 4 |
| Modifiers D5 (8 GUID references), D9 (known false red), C4 (5 `Debug.LogError` in the sample) | inside | a Modifiers row |
| The games add `using Spellbound.Modifiers.WorldObjects;` where they use `StatData` | Corsairs and Saboteer | their consumer rows |
| The games delete their `ResourcePool` copies; `IResourcePoolOwner` and `ApplyToPoolLeaf` stay in Corsairs | Corsairs and Saboteer | their consumer rows, PG |
| The catalogue's reach figures moved: Corsairs has 32 Inventory files, not 33, and 3 `TryTransferItem` sites, not 2; four `SetItemAt` lines moved | the catalogue | the next plan's catalogue |
| Red-team findings 1 to 13 | Inventory and Modifiers | PG and R6a, as the homes above say |
