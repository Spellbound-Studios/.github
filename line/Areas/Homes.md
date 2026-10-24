# The homes test, revisited (2026-10-23)

The rules a person, a skill or an agent uses to say where a thing belongs. It replaces revision 4's `Homes.md` for every revisited session. What changed: the procedure separates a type from its value before anything else, the three homes are the sharpened ones from `Corrections.md`, Studio has four packages instead of one, and two rules the old test lacked are added: where a join between two libraries lives, and when a hard dependency is allowed.

## The three homes

| Home | Holds | Depends on | Reads it |
|---|---|---|---|
| Library (a published package) | One mechanism and its neutral defaults, a sample, operations, context | Unity, Core, the Unity packages its sentence requires, the one third-party package its sentence names, bridges downward | Strangers who paid |
| Studio (four private packages in one repo) | Our values for library seams, glue for the services we chose, mechanisms only our games want, shared assets, house tools | Anything, through public surfaces only | Us |
| Game (one `*Dev` game project) | One world's content and rules | Libraries, Studio | The team on that game |

## The procedure

For any X, in order, stopping at the first home.

0. **Separate the type from the value.** `ItemDefinition` is a type, `copper_ore` is a value of it. `SwitchboardProfile` is a type, the pink whisper is a value. A closed enum of kinds is a type that should be an open id set; its members are values. Run the questions on each half.
1. **Library.** Could a farming sim, a racing game or a card game use it without editing the package, and is it a mechanism rather than a value? Yes: the library whose sentence covers it. No sentence covers it: a new package or a new seam, raised to the line, never invented in silence.
2. **Studio.** Would we want this identical in every game we ship, or is it glue for a service we chose? Yes: the Studio cluster whose dependencies it needs (Gameplay, Online, Presentation, Tools). A buyer would want it: back to question 1, it is a library gap.
3. **Game.** Everything else: the game that wants it. A second game copying it sends it up.

Two more rules, for things that sit between packages:

4. **A join between two libraries** is an assembly compiled only when the other package is installed. It lives in the higher of the two layers (a composer reading a mechanism: `WorldForge.GeoForge`); between two packages of the same layer it lives in the one whose data crosses (`Inventory.UITK`, `GeoForge.Networking`). UI, Networking and Persistence never host a join to a data package.
5. **A hard dependency** between two libraries is allowed only when one's sentence names the other. Everything else is a join under rule 4.

## What each home may know

- A library knows nothing of Studio or any game: no assembly reference, no string, no `versionDefines` entry. What it needs from the consumer arrives through a seam with a neutral default.
- Studio knows every library and no game, and only their public surfaces. `InternalsVisibleTo` is never the answer.
- A game knows both and edits neither. A library gap is raised with a boundary sheet; a Studio gap is a Studio story.

## Smells a check can find

In a library's `Runtime` or `Editor`: a string that is a scope, scene, tag, layer, key, URL or colour a game would change; a `Resources.Load` of a fixed path; a `const` a game would tune; an enum of kinds a game would extend; a `using` or reference to a Studio, game or un-named third-party assembly; a type named for one game; a sample under `Samples/` instead of `Samples~`; a hard reference to a package the sentence does not name.

In Studio: an interface with no implementation in Studio (a seam in the wrong home); a reference to a game assembly; an asset one game loads; a type that duplicates a library type with small changes.

In a game: a package edited from inside the game; a type that duplicates a library type; a `using` of a package's internals.

## Worked on the line

The full table, one row per thing on the line and every lift candidate, is in `Line.md` under "The homes test and the stranger test, in writing". Every row has one answer.
