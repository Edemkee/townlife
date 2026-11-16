# Game design document

First draft from the owner's brief of 2026-11-16. Sections marked "open" are to be settled in the design interview (PLAN.md item 2).

## Vision

- **Genre:** indirect real-time strategy with town management. Single-player campaign.
- **Pitch:** you govern a colony town for a distant kingdom. The kingdom demands expansion, tribute and heroic deeds, but you command no army. You can only post bounties and build a town good enough that heroes can meet them.
- **References:** Age of Empires for the town and economy; indirect control in the spirit of Majesty.
- **Platform:** Steam (Windows, Linux / Steam Deck).
- **Target player:** strategy players who enjoy economy and planning more than unit micro-management.

## Core loop

1. Workers gather resources.
2. The player places buildings and buys upgrades.
3. The player posts bounties (gold for a goal).
4. Heroes decide independently which bounties to take, then fight, explore, loot or bless.
5. Success yields territory, loot and progress on the kingdom's demands.
6. The kingdom raises its demands; the player expands further.

## Mechanics

### Town
- Starts with a town-center-like building and a few workers.
- Resources are gathered to progress technologically and economically.
- Buildings and upgrades make heroes stronger so they can take on harder challenges.

### Territories
- Every level is an island divided into territories. Expanding into a new territory requires fighting, which the player cannot do directly.

### Heroes and bounties
- No recruitable armies. The player posts bounties for heroes and adventurers.
- Classes: warrior, priest, rogue, wizard (classic fantasy roles).
- Heroes act both inside and outside the player's territory, through bounties or adventures of their own.

### Kingdom demands (level objectives)
- Expand to more territories
- Collect resources for the kingdom
- Loot tombs
- Bless shrines
- Complete spells
- Defeat monsters
- Build landmarks or other required structures
- Potentially others

### Progression
- Several levels in a single-player campaign, each with its own progressive expansion.
- Working scope for 1.0: 8 to 10 islands, 5 to 6 resources, about 20 buildings, about 12 monster types, 30 to 60 minutes per level.

### Win / lose
- Win: meet the kingdom's demands for the level.
- Lose: open (town center destroyed? demand deadline missed? kingdom's patience runs out?).

## Controls

Mouse and keyboard: camera pan, zoom and rotate; click to select; build menu; bounty placement on targets or map locations. Controller support for Steam Deck: open.

## Art and audio direction

- Low-poly 3D, flat-shaded, limited shared palette, fixed three-quarter camera.
- Readability first: distinct silhouette and colour per hero class, bounty flags visible when zoomed out, territory borders as tinted overlays, fog of war on unexplored land.
- UI theme: royal decrees on parchment for kingdom demands; a bounty board as the central panel.
- Audio: open.

## Open questions

1. How do heroes choose bounties: what do gold, danger, distance and class each weigh?
2. Where do heroes come from: do they arrive on their own, or are they hired through guild buildings? Are they persistent, do they level up, can they die permanently?
3. What do heroes do with earned gold: spend it in the player's shops, returning it to the economy?
4. Which resources exist, and which are paid as tribute?
5. Are kingdom demands timed, and what happens on failure?
6. Do monsters attack the town, and what defends it?
7. What carries over between levels: upgrades, veteran heroes, nothing?
8. Do heroes form parties?

## Design decision log

| Date | Decision |
|---|---|
| 2026-11-16 | Low-poly 3D art direction, chosen over 2D. |
| 2026-11-16 | No direct unit control and no recruitable armies; heroes are steered only through bounties and town upgrades. |
| 2026-11-16 | Four hero classes: warrior, priest, rogue, wizard. |
| 2026-11-16 | Single-player campaign of island levels; multiplayer and map editor out of scope for 1.0. |
