# Persistence: the pitch (PP, step 3)

What this is: the design of the rewritten Persistence, written before any of it is built, for the lead of L8a, L8, L8c, L8u and L8b. Status: **decisions answered 2026-10-25** (unknown sections are kept, one file per store, the upgrade's timing is the game's door); the developer's judgement of the spike closes the step. Date: 2026-10-25. The binding rules are in `Line.md`; this file designs inside them and says where it applies one without asking.

The sentence (Line.md, the Persistence row): saves and loads a game's state: sections any package or game declares, written as Core-packed bytes through a storage seam that never blocks the game's tick. Depends on Core, bridges nothing. Excluded: a JSON metadata file, a static entry point, knowledge of any section's layout, a migration path before the package ships to a customer, a section without a header, a tick rate in a save, an id it cannot resolve (it reports the id and the consumer's policy decides).

## Before, from the code (verified 2026-10-25)

Persistence 0.1.2, `com.spellbound.persistence`, ten runtime files, no tests, Core pinned at 0.0.2. One static class `SaveSystem` over `Application.persistentDataPath`:

- A file is `uint formatVersion, uint length, payload`; the payload is `int count` then `int id, int length, bytes` per section. The format version is a constant (1); when it changes, `Initialize` deletes every save on the machine. A JSON file `save_metadata.json` records the version and the game version beside the saves.
- A section is a class implementing `IPersistentData` (an integer id, `byte[] Save()`, `Load(byte[])`), marked `[PersistentId(id, scope)]`; the scope is a string a game invents (`settings`, `char`, `world`, `local`), and the id is unique inside a scope only. The registry finds them by scanning `AppDomain.CurrentDomain.GetAssemblies()` in a static constructor, against rule 13.
- A `SaveCollection` is a list of sections; `GetSaveSection<T>()` creates a missing one. A file name is `<name>_<guid>_<suffix>.bin` or `<suffix>.bin` for one-per-game stores; the name and guid are parsed back out of the file name by splitting on underscores.
- Every section writes its own bytes with its own version integer and its own `BinaryWriter` or Core's `Packer`; a mismatched version silently keeps defaults. Saboteer's chat settings section is `JsonUtility.ToJson(this)` as UTF-8 bytes. No section carries its name, its layout or its length; a renamed or reordered field reads wrong values with no report.
- Consumers: Saboteer in 10 files (six settings sections under one static `SettingsService`, the chat settings, the HUD layout, each service holding its own `SaveCollection` and calling `SaveSystem.TryLoad` and `Save` with the name, guid and suffix spelled out); Corsairs in 15 store types (7 character, 7 world, 1 local) and 6 callers (`GameManager`, the start screen views, the chunk manager, the time manager, the controller). Corsairs lists characters by `ListPreviews(suffix)` and loads each to show it.

## After: the surface

Package `com.spellboundstudios.persistence`, folder `Packages/Persistence`, assembly and namespace `Spellbound.Persistence`, front door `PersistenceKit`. The design has four layers: primitives (`StoreKey`, `SectionHeader`, `SectionRecord`), operations (pack a store to bytes, read bytes to records, fingerprint a type), policies (the storage seam, the unknown-section policy, the capture contract, the upgrade steps), and the front door.

```csharp
public static class PersistenceKit {
    public static Saves Open(IStorage storage, SaveSettings settings = null);
}

public sealed class Saves {
    public SectionCatalog Sections { get; }
    public UpgradeRegistry Upgrades { get; }
    public LoadResult Load(StoreKey key, LoadOptions options = default);
    public SaveJob Save(Store store, SaveOptions options = default);
    public Task<IReadOnlyList<StoreKey>> List(string kind);
    public Task Delete(StoreKey key);
}

public readonly struct StoreKey {
    public string Kind { get; }
    public string Id { get; }
    public StoreKey(string kind, string id);
    public static StoreKey Single(string kind);
}

public sealed class Store {
    public StoreKey Key { get; }
    public T Section<T>() where T : class, IPacker, new();
    public bool Has<T>() where T : class, IPacker, new();
    public IReadOnlyList<SectionRecord> Carried { get; }
}
```

- **One instance, no statics.** `PersistenceKit.Open` returns the `Saves` instance a game holds and passes on (through its own singleton or Core's `SingletonManager`, its choice). Nothing in the package is static state; `Open` is where discovery runs, so there is no static constructor and no reliance on domain reload (rule 13).
- **A store** is one saved thing: the settings, a character, a world, a player's record on a server. Its key is a kind and an id (`new StoreKey("character", guid)`), or a kind alone (`StoreKey.Single("settings")`). The storage seam decides what a key becomes on disk; the file default is `<directory>/<kind>/<id>.sbs`, or `<directory>/<kind>.sbs` for a single store. No name is parsed back out of a file name: `List(kind)` asks the storage.
- **A section** is a class marked with Core's `[Section("owner.thing")]` that implements Core's `IPacker` and has a parameterless constructor. `Store.Section<T>()` returns the one instance for the type, creating it with defaults when the store has none, so a first run and a store missing that section behave the same. Section names are dotted lower-case, the owner first (`inventory.containers`, `ui.layout`, `saboteer.settings.video`); the name is the identity and the type's own name is not.
- **Discovery** runs once at `Open` over Core's `AssemblyScanning` (the one internal call rule 13 names), building the `SectionCatalog`: name to type, type to fingerprint. A duplicate name, a marked type that is not a class, does not implement `IPacker` or has no parameterless constructor fails `Open` with the type named, because a save that silently drops a section is worse than a start that stops. Discovery under build stripping is the question CL1's reflection spike answers for Core's registries; Persistence takes the same answer (a no-go moves both to a source generator).

### The header and the fingerprint

```csharp
public readonly struct SectionHeader {
    public string Name { get; }
    public uint LayoutFingerprint { get; }
    public int Length { get; }
}
```

The fingerprint is `StableHash.Fnv1A32` of the field lines of `CoreKit.Packing.Describe(type)`, the first line (the type's own name) left out. So a renamed or reordered field, a changed field type or a changed enum underlying type changes the fingerprint; a renamed type does not, and neither does a change of a method. The surface writer hashes the same text (Line.md rule 23), so the stored-format line in `Surface.txt` and the header in a save agree by construction.

The file opens with a header too, for Persistence's own container type (`store`, the fingerprint of the container's layout type, the payload length), then `int count`, then header and bytes per section. So the container has no format version: a file written by a Persistence whose container layout changed is refused as a whole by the same rule as a section. Everything in the file is written with Core's `Packer`.

```text
store header   name "store", fingerprint of the container layout, payload length
int            section count
per section    header (name, fingerprint, length), then exactly length bytes
```

### The storage seam

```csharp
public interface IStorage {
    Task Write(StoreKey key, ReadOnlyMemory<byte> bytes, bool flushToDisk);
    Task<byte[]> Read(StoreKey key);
    Task<IReadOnlyList<StoreKey>> List(string kind);
    Task Delete(StoreKey key);
}

public sealed class FileStorage : IStorage { public FileStorage(string directory); }
public sealed class MemoryStorage : IStorage { }
```

`FileStorage` is the default (directory default `Application.persistentDataPath/saves`, a setting): it writes on a worker, to a sibling temporary file first and then replaces the final file, so a crash during a write leaves the previous save intact; `flushToDisk` writes through and flushes before the task completes. `MemoryStorage` serves tests and a server's in-memory shard. Unity's Platform Toolkit (console saves) and L8b's database are implementations of this same interface. Persistence never calls the storage on the calling thread.

### Saving: the capture contract

```csharp
public struct SaveOptions {
    public bool FlushToDisk;
    public double BudgetMilliseconds;
}

public sealed class SaveJob {
    public bool Captured { get; }
    public bool Completed { get; }
    public Task Completion { get; }
    public bool Advance();
    public int TicksUsed { get; }
    public double MaxTickMilliseconds { get; }
    public int TicksOverBudget { get; }
}

public interface ISlicedSection : IPacker {
    int ExpectedBytes { get; }
    bool CaptureSlice(SliceBudget budget, SectionBuffer target);
}
```

- A save is a capture followed by a write. The capture runs on the caller's thread because that is where the state is consistent; the write runs behind the seam.
- The capture buffers are sized before the first slice, from each sliced section's `ExpectedBytes`, so no allocation happens inside a tick: the spike's first run grew its buffers while slicing and one tick cost 15 ms to a collection; sized up front, every tick stayed under the budget.
- A plain section (`IPacker`) is packed whole in the first `Advance`. A large section implements `ISlicedSection` and copies a slice per call until it answers done, checking the budget between slices; the budget is `SaveOptions.BudgetMilliseconds`, default from `SaveSettings` (starting value 1 ms), and nothing is derived from it. Dirty-range capture is not in the contract: the owner decides what a slice copies, and Networking's region view gives a WorldObjects owner the regions that changed.
- `Saves.Save(store)` runs `Advance` once before returning. A store with no sliced section is therefore captured on the call, and the call returns with `Captured` true and the write in flight: the one-line case. A store with a sliced section returns `Captured` false and its owner (the world instance, the game loop) calls `job.Advance()` once per tick until it answers true. Persistence owns no tick (Core's `TickClock` is R0's and later; this design needs none).
- When the capture is complete the bytes are assembled and handed to the storage. `Completion` completes when the storage says so; nothing waits on it unless the caller chooses to. A save of a store already being saved queues behind the first.
- `SaveJob` carries the slice measurements; when Core's observation model lands (L2, R0), L8 declares `save slice milliseconds` and `ticks over budget` through it and every reporting door takes the observation context as its last argument (rule 9). L8a ships before that model exists and takes no context parameter; L8 adds it, a public change allowed before 1.0.

### Loading: the report and the policies

```csharp
public struct LoadOptions {
    public IReadOnlyList<string> Required;
    public IReadOnlyList<string> Only;
}

public sealed class LoadResult {
    public LoadStatus Status { get; }
    public Store Store { get; }
    public string Refusal { get; }
    public IReadOnlyList<RefusedSection> Refused { get; }
    public IReadOnlyList<string> Unknown { get; }
    public IReadOnlyList<string> Upgraded { get; }
}

public enum LoadStatus { Loaded, New, Refused }

public readonly struct RefusedSection {
    public string Name { get; }
    public uint StoredFingerprint { get; }
    public uint CurrentFingerprint { get; }
}
```

- `Load` reads through the storage, parses the records, and for each: a name the catalog knows with the same fingerprint is unpacked into the store's section; a name it knows with another fingerprint is **refused by name** and listed in `Refused` with both fingerprints (then offered to the upgrade registry, below); a name it does not know is listed in `Unknown` and handled by the unknown-section policy.
- `Status` is `Loaded`, `New` (no file: a fresh store with defaults, so a first run and a load read the same way) or `Refused` (not a store, a changed container layout, a truncated file, or a section named in `Required` that was refused or missing). Persistence never throws on a bad file; it reports.
- A refused display or preference section costs the player its defaults once and one warning through Core's logger (UI's rule); a refused world section fails the whole load (Runtime's rule), which the game expresses by naming it in `Required`. The decision is the consumer's, as the line says; Persistence only reports.
- **Unknown sections** (decision 1): the default policy is **carry**: the bytes ride in `Store.Carried` and are written again on the next save, so a package uninstalled for a while, or a section a newer build of the game added, loses nothing. The alternative is drop with a report.
- `Only` loads the named sections and skips the rest (the file carries each section's length, so a skip is a seek); it is the partial-load door L8b finishes for region loads and is not built before.

### The durable small record

Networking's lease issuer needs one number made durable before it grants a lease. That is a store of one section saved with `FlushToDisk` and awaited: `await saves.Save(record, new SaveOptions { FlushToDisk = true }).Completion;`. The issuer chooses to wait; Persistence blocks nothing. The record's section carries the header like any other and no tick rate.

### The upgrade of a shipped game's old saves (L8u)

```csharp
public delegate void SectionUpgradeStep(ReadOnlySpan<byte> stored, Store target);

public sealed class UpgradeRegistry {
    public void Add(string sectionName, uint fromFingerprint, SectionUpgradeStep step);
}

public sealed class UpgradeJob {
    public int Total { get; }
    public int Done { get; }
    public IReadOnlyList<(StoreKey Key, string Reason)> Failed { get; }
    public bool Completed { get; }
    public Task Completion { get; }
    public bool Advance();
}
```

`Saves.UpgradeAll(string kind)` returns an `UpgradeJob`.

- A step is the game's code: given the bytes of a section as they were written under an old layout, it fills the current sections of the store (one, several, or a renamed one). The game registers its steps on `saves.Upgrades` at start, keyed by the section name and the old fingerprint.
- When the steps run is the game's choice, through two doors over one mechanism. The default door is the load: a section refused by name whose (name, stored fingerprint) has a step runs it; if the step's result is itself refused by name (an older save, two layouts back), the next step runs, until the current layout or no step (then the section stays refused and reported). Upgraded names are listed in `Upgraded`, and the next save writes the current layout, so with this door alone a player's save is upgraded the first time it is opened and never touched otherwise. The second door is `UpgradeAll(kind)`: a job over every store of a kind, one store per `Advance` (load with the steps, save if anything was upgraded), with `Total`, `Done` and the failures by key, so a game drives it from an "update saves" button, a loading screen or its first start and shows progress however it likes. `persistence upgrade-start --kind <kind>` and `persistence upgrade-status` are its operation pair in CL6a. Persistence prefers neither; a game that never calls the job gets the load door for nothing.
- A game records what it shipped: `persistence sections --write <path>` (CL6a) writes one line per section, `name fingerprint`, and the release keeps that file with the release (Studio.Tools' release audit stores it; LV7d's stored-format gate compares the current list with the last release's and fails a changed line without a major and without a step registered for it). The old fingerprints a step needs come from that file, never from memory.
- A customer extends it by registering steps for their own sections and their own old releases; Persistence ships no step of its own, because it knows no section's layout.
- Today's files (`.bin`, id-keyed, no header) are not a customer's saves and are not carried: L8c re-saves, the demo is exempt, rule 15. The spike below shows that a step of this shape could carry one across if the studio ever wanted to.

### What L8b adds, behind the same seam

- `IStorage.WriteAll(IReadOnlyList<(StoreKey, ReadOnlyMemory<byte>)>, bool flushToDisk)`: one atomic write across several stores (a gift between two characters is written to both or to neither). `FileStorage` implements it with temporary files and one commit marker, rolled forward or back at `Open`; a database implements it as a transaction. `Saves.Save(params Store[] stores)` is the door.
- `LoadOptions.Only` finished for partial region loads; per-entity records are stores keyed per entity (`new StoreKey("player", accountId)`) loaded on login.
- A database implementation of `IStorage` for the MMO; the engine is a decision at L8b (no new dependency without the developer's say), not now.
- The never-blocks measurement on LV5's MMO server project: a server frame over 20 ms attributable to a slice fails.

### Operations (CL6a, names fixed now)

`persistence sections [--write <path>]`, `persistence save --store <kind>[:<id>]`, `persistence load --store <kind>[:<id>]`, `persistence inspect --store <kind>[:<id>]` (each section's name, fingerprint and length; an old layout prints as `failed:` with both fingerprints), and for L8u `persistence upgrade-start --kind <kind>` with `persistence upgrade-status`. No `migrate`.

### Settings and defaults

| Setting | Default | Where |
|---|---|---|
| Storage directory | `Application.persistentDataPath/saves` | `FileStorage` constructor |
| File extension | `.sbs` | `SaveSettings` |
| Unknown-section policy | Carry | `SaveSettings`, decision 1 |
| Capture budget | 1 ms per tick | `SaveSettings`, overridden per save |
| Flush to disk | off | `SaveOptions`, on for the lease record |
| Required sections | none | `LoadOptions`, per load |

## What the consumer writes

Saboteer's video settings today: a class with a `Version` constant, an id, a scope string, a hand-written `BinaryWriter` save and a load that returns silently on a version mismatch; the service calls `SaveSystem.TryLoad("settings", "global", "settings", out _collection)` then `GetSaveSection` six times. After:

```csharp
[Section("saboteer.settings.video")]
public sealed class VideoSettings : IPacker {
    public DisplayMode displayMode = DisplayMode.Borderless;
    public int resolutionWidth;
    public int resolutionHeight;
    public bool vSync = true;
    public float renderScale = 1f;

    public void Pack(ref Span<byte> buffer) {
        Packer.WriteInt(ref buffer, (int)displayMode);
        Packer.WriteInt(ref buffer, resolutionWidth);
        Packer.WriteInt(ref buffer, resolutionHeight);
        Packer.WriteBool(ref buffer, vSync);
        Packer.WriteFloat(ref buffer, renderScale);
    }

    public void Unpack(ref ReadOnlySpan<byte> buffer) {
        displayMode = (DisplayMode)Packer.ReadInt(ref buffer);
        resolutionWidth = Packer.ReadInt(ref buffer);
        resolutionHeight = Packer.ReadInt(ref buffer);
        vSync = Packer.ReadBool(ref buffer);
        renderScale = Packer.ReadFloat(ref buffer);
    }
}

var saves = PersistenceKit.Open(new FileStorage(Path.Combine(Application.persistentDataPath, "saves")));
var settings = saves.Load(StoreKey.Single("settings")).Store;
var video = settings.Section<VideoSettings>();
saves.Save(settings);
```

Corsairs' characters today: `SaveSystem.Save(CharacterSave, identity.Name, identity.Guid, "char")`, and the menu calls `ListPreviews("char")` then `TryLoad` per preview. After:

```csharp
var key = new StoreKey("character", identity.Guid);
saves.Save(characterStore);
foreach (var each in await saves.List("character")) {
    var result = saves.Load(each, new LoadOptions { Only = new[] { "corsairs.character.identity" } });
}
```

A server world: the world instance's save, advanced on its tick.

```csharp
var job = saves.Save(worldStore, new SaveOptions { BudgetMilliseconds = 1.0 });
void OnTick() {
    if (!job.Captured) {
        job.Advance();
    }
}
```

A shipped game's upgrade step, registered once at start:

```csharp
saves.Upgrades.Add("saboteer.settings.video", 0x3fa1c0de, (stored, store) => {
    var old = Packer.FromBytes<VideoSettingsBeforeBrightness>(stored);
    var current = store.Section<VideoSettings>();
    current.resolutionWidth = old.resolutionWidth;
    current.brightness = 0f;
});
```

## The stranger test

- **Card game** (Core, UI, Switchboard, Persistence, Networking, StateMachine): a deck is `[Section("cards.deck")]` on a class with `Pack` and `Unpack`; `saves.Save(saves.Load(new StoreKey("deck", id)).Store)`; nothing names a world, a tick or a transform.
- **Farming sim**: the world's elapsed seconds are a double in the world's section (WorldObjects owns it); a load at another tick rate converts at load; Persistence sees only bytes.
- **MMO server**: `PersistenceKit.Open(new DatabaseStorage(...))` once per process, a `Saves` per shard or one shared, player stores keyed per account, world stores advanced per tick under the budget, the lease record flushed. No camera, no UI, no Steam type anywhere in the package.
- **Racing game**: ghost laps as one section of packed samples; nothing else.

## Rules applied without asking

- Section names are required strings on Core's attribute (L2c): no automatic naming is offered.
- A refused display section defaults with one warning; a refused world section fails the load through `Required` (UI's and Runtime's rules).
- Durations are seconds; a section field of type `Tick`, `TickSpan` or `TickRate` is a PackageCheck failure (Living's claim), not Persistence's concern at run time.
- Nothing is kept for today's files; L8c re-saves (rule 15).
- No tick in Persistence; the owner advances a sliced save (Persistence owns no world).
- Operations come in CL6a with the rest of the packages; L8 ships none.

## Decisions for the developer (answered 2026-10-25: 1 keep, 2 one file per store)

1. **A section no installed package knows: keep its bytes and write them back on the next save, or drop them with a report?** Recommended: keep them, so uninstalling a package for a while or opening a save from a newer build of the game loses nothing. Otherwise: drop with a report, and a save is only ever as wide as the installed packages.
2. **One file per store (a character is one file), or one file per section (a character is a folder of files)?** Recommended: one file per store, as today, with the partial load reading only the named sections out of it (the file carries each section's length). Otherwise: a folder per store, which gives partial loads for free and many small files per character.
3. Withdrawn 2026-10-25: when a shipped game upgrades its saves was put as a decision and is a game's own choice, so it is a door with a default (steps at load) and a second door (`UpgradeAll` as a job the game drives); a stranger wires it to a button, a loading screen or nothing.

## Sizing

| Epic | Plan | Pitch | Stories |
|---|---|---|---|
| L8a (step 6) | 2 | 2 | 1: the package under the studio id at `Packages/Persistence`, `PersistenceKit.Open`, `Saves`, `Store`, `StoreKey`, `SectionCatalog`, the header and fingerprint, `FileStorage`, write and read of one store with plain sections. 2: `MemoryStorage`, the refusal by name with `LoadResult`, the unknown-section policy, `Required`, tests for every door and every extension point |
| L8 (step 31) | 4 | 4 | 3: the repository restructure (`Packages/Persistence`, the shell, the tags). 4: the capture contract (`ISlicedSection`, `SaveJob.Advance`, the budget, the observations) with the never-blocks test. 5: `List`, `Delete`, `FlushToDisk`, the queued save of a store already saving, the durable record test. 6: the surface file's stored-format lines, the sample, the old package deleted from the repository |
| L8c (step 31) | 4 | 4 | 1: Saboteer's settings and progress (six sections, one store). 2: Saboteer's chat settings and the callers of `SaveSystem` deleted (the HUD layout is UI6b's). 3: Corsairs' character stores (seven) and the start screen's list and load. 4: Corsairs' world and local stores, the chunk, time and view managers, both manifests, the old id gone |
| L8u (step 31, before the first Steam release) | 4 | 3 | 1: `UpgradeRegistry`, the step delegate, the chain at load, `UpgradeAll` and its job, `Upgraded` in the report. 2: `persistence sections --write`, the layout list a release keeps, the gate's input (with LV7d). 3: Saboteer's first step on a real old save as the worked test |
| L8b (step 64) | 6 | 6 | 1: `WriteAll` on files with the commit marker and recovery at `Open`. 2 and 3: the database implementation (the engine decided then). 4: partial loads finished for regions. 5: per-entity stores on login. 6: the never-blocks measurement on the MMO server project |

Total 19 gates against the plan's 20; L8u gives one back.

## The spike's result (PP-4)

Run 2026-10-25, 21 play mode tests, all passing on the second run; the row-by-row table is in the Roadmap under "The written result of the Persistence spike". In short: the fingerprint is stable across compiles (video settings 322187b3, the container 3a977eb5) and changes on a renamed field but not on a renamed type; a changed layout is refused by name with both fingerprints; an unknown section keeps its bytes; a 64 MB write returned after 0.024 ms and completed after 32.1 ms off the thread; 622 frames during a 128 MB write had a median of 0.12 ms and a maximum of 0.69 ms; 100 MB of sections were captured in 6 ticks under a 1 ms budget once the buffers were sized up front (the first run's growing buffers cost one tick 15.2 ms); a 64 B flushed record took 2.35 ms; today's Saboteer settings file parsed into its six sections, was refused as a whole by the new reader, and one step carried its video settings into a 116-byte store that read back equal.

## Known limits

- The fingerprint describes the fields, not the `Pack` code. A `Pack` that writes in another order than the fields are declared, or skips a field, is not detected by the header. The convention is that `Pack` writes the fields in declaration order; L8's tests round-trip every section of the package and PackageCheck gets a lead for a `Pack` whose write count differs from the field count only if a later story asks for it.
- Discovery by reflection shares CL1's open question under build stripping; a no-go there moves Persistence's catalog to the same source generator.
- Packing throughput is unmeasured; the spike measures a copy, not a pack of a real world.
- `Describe` lists fields by metadata token order; the probe shows that order is declaration order and equal across compiles on this editor. A compiler that reorders tokens would change every fingerprint at once, which the stored-format gate would catch as a changed line.

## Rejected directions

- **Sections as structs returned by value.** Rejected: the owner mutates its section between saves; a copy would need a write-back door.
- **A version integer on the attribute with ordered migrations.** Rejected by rule 15 and decision 3 of 2026-10-24: detection by fingerprint, upgrade by registered step.
- **Persistence ticking its own saves on a timer.** Rejected: Persistence owns no world and no clock; the owner advances.
- **Dirty-range capture in the contract.** Rejected for now: the slice contract lets an owner copy only what changed; the ranges themselves are the owner's knowledge (Networking's region view), not Persistence's.
- **Keeping a reader for today's `.bin` files.** Rejected by rule 15; the demo is exempt and L8c re-saves.
