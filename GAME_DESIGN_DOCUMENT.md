# Game design document

Built from the owner's brief and the design interview of 2026-11-16. Sections marked "open" are still to be settled (PLAN.md item 2).

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
5. Heroes spend their earnings in the town's shops, returning part of the gold to the player.
6. Success yields territory, loot and progress on the kingdom's demands.
7. The kingdom raises its demands; the player expands further.

## Mechanics

### Town
- Starts with a town-center-like building and a few workers.
- Resources are gathered to progress technologically and economically.
- Buildings and upgrades make heroes stronger so they can take on harder challenges.
- Shops (blacksmith, market, inn and similar) sell gear, potions and training to heroes. The player earns part of what heroes spend, so shops are an economic engine as well as a power source.

### Territories
- Every level is an island divided into territories. Expanding into a new territory requires fighting, which the player cannot do directly.

### Heroes
- No recruitable armies. Classes: warrior, priest, rogue, wizard.
- **Origin:** a trickle of wandering heroes arrives on its own. Guild buildings (one per class) raise the number of heroes the town can hold and let the player favour a class.
- **Growth:** heroes are individuals. They gain levels and buy gear with their own gold.
- **Death is permanent.** Losing a veteran is a real cost, so pricing a dangerous bounty is a risk decision.
- Heroes act both inside and outside the player's territory, through bounties or adventures of their own.

### Bounties
- The player posts a bounty: gold for a goal (kill, explore, loot, bless, defend and so on).
- **Choice by personality:** each hero scores every open bounty on gold, danger, distance and class fit. The weights differ per class and vary per hero: rogues lean towards gold, warriors towards fights, and so on. The hero takes the bounty that scores best for them, or none.
- **Parties:** heroes usually govern themselves. They go alone or band together depending on the type of goal, and town upgrades influence how they group (for example how large or how well-mixed a party can be). Party members split the reward. Exact rules: open.

### Monsters and town defence
- Monster lairs send raids against the town.
- Guard towers hold off small raids. Larger ones need a defence bounty that heroes answer.

### Kingdom demands (level objectives)
- Expand to more territories
- Collect resources for the kingdom
- Loot tombs
- Bless shrines
- Complete spells
- Defeat monsters
- Build landmarks or other required structures
- Potentially others

### Difficulty modes
- **Easy:** demands have no timers. The level is lost only if the town center is destroyed.
- **Challenge:** demands have deadlines and the kingdom keeps a royal favour meter. Missing a deadline costs favour; meeting a demand early restores it. The level is lost when favour reaches zero or the town center is destroyed.

### Win / lose
- Win: meet the kingdom's demands for the level.
- Lose: town center destroyed (both modes), or royal favour at zero (challenge mode).

### Progression
- Several levels in a single-player campaign, each with its own progressive expansion.
- **Carry-over:** when a level is won, the player picks a small number of surviving heroes to sail to the next island. The town starts fresh each level; new building types unlock as the campaign advances.
- Working scope for 1.0: 8 to 10 islands, 5 to 6 resources, about 20 buildings, about 12 monster types, 30 to 60 minutes per level.

## Controls

Mouse and keyboard: camera pan, zoom and rotate; click to select; build menu; bounty placement on targets or map locations. Controller support for Steam Deck: open.

## Art and audio direction

- Low-poly 3D, flat-shaded, limited shared palette, fixed three-quarter camera.
- Readability first: distinct silhouette and colour per hero class, bounty flags visible when zoomed out, territory borders as tinted overlays, fog of war on unexplored land.
- UI theme: royal decrees on parchment for kingdom demands; a bounty board as the central panel.
- Audio: open.

## Open questions

1. Which resources exist, and which are paid as tribute?
2. Party rules in detail: which upgrades change party size or composition, and which goal types call for a party?
3. How many veteran heroes carry over, and do they keep their gear?
4. Controller support for Steam Deck?
5. Audio direction.

## Design decision log

| Date | Decision |
|---|---|
| 2026-11-16 | Two difficulty modes: easy (no timers, lose only when the town center falls) and challenge (deadlines plus a royal favour meter). |
| 2026-11-16 | Monsters raid the town. Guard towers handle small raids; larger ones need a defence bounty. |
| 2026-11-16 | A few surviving veteran heroes, chosen by the player, carry over to the next island. The town starts fresh. |
| 2026-11-16 | Heroes form self-governed parties, depending on goal type and town upgrades. |
| 2026-11-16 | Heroes choose bounties by weighted personality: gold, danger, distance and class fit, with weights per class and per hero. |
| 2026-11-16 | Heroes come from both sources: wanderers arrive on their own, guilds raise the cap and favour a class. |
| 2026-11-16 | Heroes level up individually and death is permanent. |
| 2026-11-16 | Heroes spend bounty gold in the town's shops; the player earns part of it back. |
| 2026-11-16 | Low-poly 3D art direction, chosen over 2D. |
| 2026-11-16 | No direct unit control and no recruitable armies; heroes are steered only through bounties and town upgrades. |
| 2026-11-16 | Four hero classes: warrior, priest, rogue, wizard. |
| 2026-11-16 | Single-player campaign of island levels; multiplayer and map editor out of scope for 1.0. |
