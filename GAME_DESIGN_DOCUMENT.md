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
7. The royal ship returns: it collects tribute, delivers the next decree and brings new heroes.
8. The kingdom raises its demands; the player expands further.

## Mechanics

### Town
- Starts with a town-center-like building and a few workers.
- Resources are gathered to progress technologically and economically.
- **Workers are assigned, not commanded.** The player sets how many workers each job or building gets; individual workers are never ordered around.
- Buildings and upgrades make heroes stronger so they can take on harder challenges.
- The infirmary heals downed heroes who are carried back to town.
- Shops (blacksmith, market, inn and similar) sell gear, potions and training to heroes. The player earns part of what heroes spend, so shops are an economic engine as well as a power source.

### The royal ship
- The ship is the heartbeat of every level. It returns every few minutes, with a visible countdown.
- On each visit it collects tribute, delivers the kingdom's next decree and brings new wandering heroes.
- In easy mode it only delivers. In challenge mode, tribute that is not ready when it docks costs royal favour.

### Territories
- Every level is an island divided into territories. Expanding into a new territory requires fighting, which the player cannot do directly.

### Heroes
- No recruitable armies. Classes: warrior, priest, rogue, wizard.
- **Origin:** a trickle of wandering heroes arrives on its own, aboard the royal ship. Guild buildings (one per class) raise the number of heroes the town can hold and let the player favour a class.
- **Growth:** heroes are individuals. They gain levels and buy gear with their own gold.
- **Perks:** heroes have perks, positive and negative, that shape how they behave. Details: open.
- **Downed, then dead.** A defeated hero is downed for a limited time. A downed hero survives if a priest revives them in the field, or if a hero with a fitting positive perk carries them back to an infirmary to heal. The player can also post a rescue bounty to draw help. If nobody comes in time, the hero dies.
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

- **Tabletop diorama.** Each island looks like a diorama on a game table. Heroes, workers and monsters look like painted miniatures on bases.
- Miniatures move through code-driven motion (hop, lunge, wobble, tip over when downed). No skeletal animation.
- Low-poly 3D, flat-shaded, limited shared palette, fixed three-quarter camera.
- Readability first: distinct silhouette and colour per hero class, bounty flags visible when zoomed out, territory borders as tinted overlays, fog of war on unexplored land.
- UI theme: royal decrees on parchment for kingdom demands; a bounty board as the central panel.
- Audio: open.

## Proposals awaiting decision

From the brainstorm of 2026-11-16. None of these is decided. Each names the plan item it would become part of. P1, P5, P7, P12 and P13 were adopted on 2026-11-16 and now appear in the sections above and in the decision log.

### Design risks they answer

| Risk | Why it matters | Proposals |
|---|---|---|
| "Why won't anyone take my bounty?" | Unexplained hero behaviour is the classic frustration of indirect control | P2 |
| Gold is the only lever | The game collapses into "raise the price until it works" | P3, P4, P8 |
| Waiting with nothing to do | Posting a bounty and watching can be passive | P1, P6, P14 |
| Two games bolted together | Worker economy and hero adventure must depend on each other | P6, P7 |
| Death by AI stupidity | Permanent death only feels fair if it follows from the player's own risk decision | P2, P4, P5 |
| Death spiral | All heroes dead means nobody takes bounties | P9 |
| Gold flood late in a level | Shop income feeds bounties, which feed shop income | Tribute is the main sink; P6 |
| Art workload for one developer | Skeletal animation for many characters is the bottleneck | P12 |

### Proposals

| # | Proposal | Plan item |
|---|---|---|
| P2 | **Explain-why interface.** While setting a bounty's price, hero portraits light up as the reward becomes attractive to them. Each uninterested hero shows a reason: too dangerous, too far, pays too little, not my kind of work. Every hero shows what they are doing and why. Treated as a core feature, not polish. | 7 |
| P3 | **Scouting as a second lever.** Unscouted targets have unknown danger. Cautious heroes avoid them and reckless ones misjudge them. Explore bounties reveal the real danger, so the cycle becomes scout, assess, price, prepare. | 7, 10 |
| P4 | **Overpaying is dangerous.** A huge reward tempts greedy low-level heroes into fights they cannot win. The right price matters, not just a high one. | 7 |
| P6 | **Shops need stock.** The blacksmith needs iron to sell better weapons, the apothecary needs herbs for potions. Worker output sets how strong heroes can become, which ties the two halves of the game together. | 6, 11 |
| P8 | **Upgrades sharpen control.** Town upgrades unlock finer bounty terms (minimum hero rank, shared or winner-takes-all rewards) and larger parties (a tavern upgrade raises party size). The player's indirect control improves as the town grows. | 9, 11 |
| P9 | **Retention instead of wages.** Heroes cost nothing while idle, but bored heroes leave on the next ship. The total gold on the bounty board attracts stronger newcomers, which is the paid way out of a death spiral. | 7 |
| P10 | **Idle heroes have a life.** With no appealing bounty they train, shop, rest, hunt weak monsters or wander off on their own, and sometimes cause trouble, such as a rogue opening a tomb early. | 9 |
| P11 | **Spells as set pieces.** A wizard channels a ritual at a site for some time while monsters converge, so warriors and priests are needed to hold them off. The player can only prepare and price it. | 10 |
| P14 | **Pause and speed controls.** Pause, 1x, 2x, 3x, with building and bounty posting allowed while paused. | 5 |
| P15 | **One new mechanic per island.** Each campaign level introduces one class, bounty type or hazard, so the campaign doubles as the tutorial. | 12 |
| P16 | **Favour as currency.** In challenge mode, favour can be spent on kingdom aid (supplies, a royal champion on the next ship), trading safety margin for help. | 12 |
| P17 | **Named heroes with a chronicle.** Perks themselves are decided (see Heroes). Still proposed: perks such as greedy, brave, cautious or pious set the bounty personality weights; a log records each hero's deeds and a graveyard remembers the dead, which gives the veteran pick between islands its weight. | 7, 9 |

### Questions the prototype gate must answer

1. Is setting a price and watching who bites fun on its own?
2. Can a player tell why a hero refused a bounty?
3. Is there a meaningful decision at least every 30 seconds at normal speed?
4. When a hero dies, does it feel like the player's risk rather than the AI's mistake?

## Open questions

1. Which resources exist, and which are paid as tribute?
2. Party rules in detail: which upgrades change party size or composition, and which goal types call for a party?
3. How many veteran heroes carry over, and do they keep their gear?
4. Controller support for Steam Deck?
5. Audio direction.
6. Which of the remaining proposals above to adopt.
7. Hero perks: the list, and which positive perks make a hero carry the downed home.
8. How long a hero stays downed.

## Design decision log

| Date | Decision |
|---|---|
| 2026-11-16 | The royal ship paces every level: tribute out, decrees and new heroes in (P1). |
| 2026-11-16 | Tabletop diorama look with miniature-style characters and code-driven motion; to be tried in the prototype (P12). |
| 2026-11-16 | Workers are assigned to jobs or buildings, not commanded individually (P7). |
| 2026-11-16 | Defeated heroes are downed before they die. Priests can revive them in the field; heroes with positive perks can carry them to an infirmary (P5, extended by the owner). |
| 2026-11-16 | Heroes have positive and negative perks. |
| 2026-11-16 | The prototype includes both warrior and rogue (P13). |
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
