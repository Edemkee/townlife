# Game design document

The single source of truth for what Town Life is. PLAN.md says what to build next; this document says what it must do.

## 1. How to read this document

Every rule has a stable ID (for example `BNTY-3`) and a status. Refer to rules by ID in PLAN.md, FEATURES.md, code comments, tests and pull requests. Never renumber an ID; retire it in place instead.

| Status | Meaning | What an implementer does |
|---|---|---|
| **DECIDED** | The owner chose this. | Build it as written. Changing it needs the owner. |
| **ASSUMED** | A working default the owner has not confirmed. | Build it, keep it easy to change (data, not code), and do not treat it as settled. |
| **PROPOSED** | An idea awaiting the owner's decision (section 9). | Do not build it. Leave room for it. |
| **OPEN** | Undecided, no default (section 10). | Do not build anything that depends on it. Ask the owner. |

When a design decision is made: update the rule's status and text, add a line to the decision log (section 12), and update PLAN.md if tasks change. Do this in the same pull request as any code that depends on it.

## 2. Vision

- **Genre:** indirect real-time strategy with town management. Single-player campaign.
- **Pitch:** you govern a colony town for a distant kingdom. The kingdom demands expansion, tribute and heroic deeds, but you command no army. You can only post bounties and build a town good enough that heroes can meet them.
- **References:** Age of Empires for the town and economy; Majesty for indirect control of heroes.
- **Platform:** Steam (Windows, Linux / Steam Deck).
- **Target player:** strategy players who enjoy economy and planning more than unit micro-management.

### Design pillars

Use these to settle any question the rules below do not answer.

1. **Incentives, not orders.** The player never commands a hero or a worker directly. Every lever is economic or infrastructural.
2. **Legible minds.** A player must always be able to find out why a hero is doing what they are doing.
3. **Deaths are the player's risk.** A hero's death should trace back to a decision the player made (a price, a missing building), not to arbitrary AI behaviour.
4. **One game, not two.** The worker economy and the hero adventure must each limit and feed the other.
5. **Small scope, finished.** One developer. Prefer the simplest rule that keeps the pillars.

## 3. Glossary

| Term | Meaning |
|---|---|
| Island | One campaign level. A single map surrounded by sea. |
| Territory | A region of an island. Exactly one is the player's at the start; the rest are wild until claimed. |
| Town center | The player's starting building. Its destruction loses the level. |
| Worker | A townsperson assigned to a job. Never fights. |
| Hero | An autonomous adventurer of one class. Never controlled by the player. |
| Class | Warrior, rogue, priest or wizard. |
| Perk | A positive or negative trait of one hero that changes their behaviour. |
| Bounty | Gold offered by the player for a goal. The only way to direct heroes. |
| Bounty board | The list of open bounties that heroes evaluate. |
| Guild | A building tied to one class that raises how many heroes of that class the town holds. |
| Lair | A monster spawner in a wild territory. Sends raids. |
| Raid | A group of monsters attacking the town. |
| Downed | The state of a defeated hero before permanent death. |
| Royal ship | The kingdom's ship. Arrives on a timer with decrees and heroes; leaves with tribute. |
| Decree | A demand from the kingdom. A level objective. |
| Tribute | Resources or gold the kingdom collects by ship. |
| Royal favour | Challenge-mode meter of the kingdom's patience. Zero loses the level. |
| Miniature | The visual form of any character: a painted figure on a base, moved by code. |
| Tick | One fixed step of the simulation. |

## 4. Core loop

1. Workers gather resources (`WORK`).
2. The player places buildings and buys upgrades (`TOWN`).
3. The player posts bounties (`BNTY`).
4. Heroes decide independently which bounties to take, then fight, explore, loot or bless (`HERO`, `CMBT`).
5. Heroes spend their earnings in the town's shops, returning part of the gold to the player (`ECON`).
6. Success yields territory, loot and progress on decrees (`TERR`, `KING`).
7. The royal ship returns: it collects tribute, delivers the next decree and brings new heroes (`SHIP`).
8. The kingdom raises its demands; the player expands further.

Three time scales: seconds (place, price, react), one ship cycle (scout, price, resolve, pay tribute), one island (three to five territories and a capstone decree).

## 5. Rules

### 5.1 Town (`TOWN`)

| ID | Status | Rule |
|---|---|---|
| TOWN-1 | DECIDED | A level starts with one town center and a few workers. |
| TOWN-2 | DECIDED | The player places buildings on owned territory. Buildings cost resources. |
| TOWN-3 | DECIDED | Buildings and upgrades make heroes stronger, so they can take on harder challenges. |
| TOWN-4 | DECIDED | The town center being destroyed loses the level in both difficulty modes. |
| TOWN-5 | DECIDED | Guild buildings exist, one per class. Each raises the number of heroes of that class the town can hold. |
| TOWN-6 | DECIDED | An infirmary heals downed heroes who are carried to it (`HERO-8`). |
| TOWN-7 | DECIDED | Shops (blacksmith, market, inn and similar) sell gear, potions and training to heroes (`ECON-3`). |
| TOWN-8 | DECIDED | Guard towers attack monsters in range and hold off small raids (`CMBT-5`). |
| TOWN-9 | ASSUMED | Buildings are placed on a square grid, need a free footprint, and take time to construct. Construction is done by workers assigned to the builder job. |
| TOWN-10 | ASSUMED | Starting workers: 4. |

### 5.2 Workers (`WORK`)

| ID | Status | Rule |
|---|---|---|
| WORK-1 | DECIDED | Workers are assigned, not commanded. The player sets how many workers each job or building gets; individual workers are never selected or ordered. |
| WORK-2 | ASSUMED | Jobs in the prototype: idle, builder, woodcutter, forager (food), quarryman (stone). One job per gathered resource. |
| WORK-3 | ASSUMED | A gathering worker walks to the nearest reachable node of their resource inside owned territory, harvests, carries a load to the town center, and repeats. Nodes deplete. |
| WORK-4 | ASSUMED | Workers only work inside owned territory. This is what makes expansion necessary. |
| WORK-5 | ASSUMED | Workers flee to the town center when monsters are near and resume afterwards. Workers can be killed. |
| WORK-6 | ASSUMED | New workers are bought at the town center for food, up to a housing cap raised by houses. |

### 5.3 Economy (`ECON`)

| ID | Status | Rule |
|---|---|---|
| ECON-1 | ASSUMED | Gathered resources: food, wood, stone, iron, mana crystals. The prototype uses food, wood and stone only. |
| ECON-2 | ASSUMED | Gold is the currency. It is not gathered. It comes from shop income, loot sold by heroes and trade with the ship. The player starts each level with a stipend. |
| ECON-3 | DECIDED | Heroes spend the gold they earn in the town's shops, and the player earns part of it back. |
| ECON-4 | ASSUMED | The player's share of hero spending is 50%. |
| ECON-5 | DECIDED | Tribute to the kingdom is the main sink for surplus (`KING-1`). |

### 5.4 Territories (`TERR`)

| ID | Status | Rule |
|---|---|---|
| TERR-1 | DECIDED | Every level is an island divided into territories. |
| TERR-2 | DECIDED | Expanding into a territory requires fighting, which only heroes can do. |
| TERR-3 | ASSUMED | A wild territory is claimable once every lair in it is destroyed. The player claims it by building an outpost there. Claimed territory can be built on and worked. |
| TERR-4 | ASSUMED | Unexplored land is hidden by fog of war. Heroes reveal it by walking through it. |
| TERR-5 | ASSUMED | The prototype island has 3 territories: the home territory and two wild ones. |

### 5.5 Heroes (`HERO`)

| ID | Status | Rule |
|---|---|---|
| HERO-1 | DECIDED | The player cannot recruit, select for orders, or command heroes. |
| HERO-2 | DECIDED | Classes: warrior, rogue, priest, wizard. The prototype has warrior and rogue. |
| HERO-3 | DECIDED | Wandering heroes arrive on their own aboard the royal ship. Guilds raise the cap and let the player favour a class (`TOWN-5`). |
| HERO-4 | DECIDED | Heroes are individuals: each has a name, a level, their own gold and gear. They gain experience and levels. |
| HERO-5 | DECIDED | Heroes have perks, positive and negative, that shape their behaviour. The perk list is OPEN (Q3). |
| HERO-6 | DECIDED | A defeated hero becomes downed for a limited time instead of dying at once. |
| HERO-7 | DECIDED | A priest can revive a downed hero in the field. |
| HERO-8 | DECIDED | A hero with a fitting positive perk can carry a downed hero to an infirmary, where they heal. |
| HERO-9 | DECIDED | A downed hero whom nobody reaches in time dies. Death is permanent. |
| HERO-10 | DECIDED | Heroes act both inside and outside the player's territory. |
| HERO-11 | DECIDED | Heroes usually form parties on their own, depending on the type of goal and on town upgrades. Detailed rules are OPEN (Q4). The prototype has no parties. |
| HERO-12 | ASSUMED | Without a guild the town holds 2 wandering heroes in total. Each guild adds 3 slots for its class. |
| HERO-13 | ASSUMED | A hero flees towards town when their health drops below a personal threshold (default 30%), and rests at the inn or town center to recover. |
| HERO-14 | ASSUMED | With no acceptable bounty, a hero idles in town: rests if hurt, shops if they have gold, otherwise waits. Richer idle behaviour is PROPOSED (P10). |
| HERO-15 | ASSUMED | Downed time is 60 seconds at 1x speed. |
| HERO-16 | ASSUMED | Class baselines for the prototype. Warrior: high health, strong melee, slow. Rogue: low health, fast, reveals more fog. |
| HERO-17 | ASSUMED | Prototype stand-in for rescue: until priests, perks and the infirmary exist, a hero who takes a rescue bounty walks to the downed hero and carries them to the town center, where they recover. |

### 5.6 Bounties (`BNTY`)

| ID | Status | Rule |
|---|---|---|
| BNTY-1 | DECIDED | A bounty is gold offered for a goal. Posting bounties is the player's only way to direct heroes. |
| BNTY-2 | DECIDED | Each hero scores every open bounty on gold, danger, distance and class fit. The weights differ per class and vary per hero. The hero takes the best-scoring bounty, or none. |
| BNTY-3 | DECIDED | Bounty types across the full game: slay, explore, loot (tombs), bless (shrines), defend, rescue. Prototype: slay, explore and rescue. |
| BNTY-4 | DECIDED | The player may post a rescue bounty on a downed hero to draw help. |
| BNTY-5 | ASSUMED | The gold is reserved from the treasury when a bounty is posted and returned if the player cancels it. |
| BNTY-6 | ASSUMED | The reward is paid when the goal is completed and split equally among the heroes who took part. |
| BNTY-7 | ASSUMED | The player can raise or lower the reward of an open bounty at any time. Heroes re-evaluate when it changes. |
| BNTY-8 | ASSUMED | Scoring formula, per hero and bounty: `score = w_gold * gold_term - w_danger * danger_term - w_distance * distance_term + w_fit * fit_term`. The hero accepts the highest score above their `accept_threshold`. Terms and default weights are in section 6. |
| BNTY-9 | ASSUMED | A slay bounty targets one lair or one monster. An explore bounty targets a map location and completes when a hero reveals it. |

### 5.7 Combat and monsters (`CMBT`)

| ID | Status | Rule |
|---|---|---|
| CMBT-1 | DECIDED | The player has no part in combat. |
| CMBT-2 | DECIDED | Monster lairs send raids against the town. |
| CMBT-3 | DECIDED | Larger raids need a defend bounty that heroes answer. |
| CMBT-4 | ASSUMED | Combat is automatic and simple: units in range trade attacks on a cooldown; damage = attack minus armour, minimum 1. No abilities in the prototype. |
| CMBT-5 | ASSUMED | A small raid is one a single guard tower can defeat. Raid size grows with time since the level began. |
| CMBT-6 | ASSUMED | A lair spawns guards that stay near it, and periodically a raid party that walks to the town center. Destroying the lair stops both. |
| CMBT-7 | ASSUMED | Monsters attack the nearest of: heroes, workers, buildings. |

### 5.8 Royal ship (`SHIP`)

| ID | Status | Rule |
|---|---|---|
| SHIP-1 | DECIDED | The royal ship is the heartbeat of every level. It returns on a timer with a visible countdown. |
| SHIP-2 | DECIDED | On each visit it collects tribute, delivers the next decree and brings new wandering heroes. |
| SHIP-3 | DECIDED | In easy mode it only delivers. In challenge mode, tribute not ready when it docks costs royal favour. |
| SHIP-4 | ASSUMED | The ship arrives every 4 minutes at 1x speed and stays docked for 20 seconds. |
| SHIP-5 | ASSUMED | Each visit brings heroes to fill free hero slots, at most 2 per visit. |

### 5.9 Kingdom, difficulty, win and lose (`KING`)

| ID | Status | Rule |
|---|---|---|
| KING-1 | DECIDED | The kingdom's decrees are the level objectives. Types: expand to territories, deliver resources as tribute, loot tombs, bless shrines, complete spells, defeat monsters, build landmarks or other structures. More types may follow. |
| KING-2 | DECIDED | Win: all decrees of the level are met. |
| KING-3 | DECIDED | Easy mode: decrees have no timers. Lose only by `TOWN-4`. |
| KING-4 | DECIDED | Challenge mode: decrees have deadlines and the kingdom keeps a royal favour meter. Missing a deadline costs favour; meeting a decree early restores it. Favour at zero loses the level. |
| KING-5 | ASSUMED | The prototype is easy mode only, with one decree: claim both wild territories. |

### 5.10 Campaign (`CAMP`)

| ID | Status | Rule |
|---|---|---|
| CAMP-1 | DECIDED | A single-player campaign of several island levels, each with its own progressive expansion. |
| CAMP-2 | DECIDED | On winning a level, the player picks a small number of surviving heroes to sail to the next island. The town starts fresh. New building types unlock as the campaign advances. |
| CAMP-3 | ASSUMED | Scope for 1.0: 8 to 10 islands, about 20 buildings, about 12 monster types, 30 to 60 minutes per level. |
| CAMP-4 | DECIDED | Out of scope for 1.0: multiplayer, direct unit control, a map editor. |

### 5.11 Controls and interface (`UI`)

| ID | Status | Rule |
|---|---|---|
| UI-1 | ASSUMED | Mouse and keyboard. Camera: pan (WASD, arrow keys, screen edge, middle-drag), zoom (wheel), rotate (Q/E). |
| UI-2 | ASSUMED | The player can select buildings, heroes and monsters to inspect them. Selecting never grants control. |
| UI-3 | ASSUMED | Game speed: pause, 1x, 2x, 3x. Building and bounty posting work while paused. (Having speed control is part of the stack decision; these exact steps are proposal P14.) |
| UI-4 | ASSUMED | A selected hero shows their current activity and the bounty they are on. The full explain-why interface is PROPOSED (P2). |
| UI-5 | DECIDED | UI theme: royal decrees on parchment for kingdom demands; a bounty board as the central panel. |

### 5.12 Art and audio (`ART`)

| ID | Status | Rule |
|---|---|---|
| ART-1 | DECIDED | Low-poly 3D, flat-shaded, limited shared palette, three-quarter camera. |
| ART-2 | DECIDED | Tabletop diorama: each island looks like a diorama standing on a game table. To be reviewed at the prototype gate. |
| ART-3 | DECIDED | Heroes, workers and monsters are miniatures: painted figures on round bases. |
| ART-4 | DECIDED | Miniatures move through code-driven motion (hop while walking, lunge to attack, wobble when hit, tip over when downed). No skeletal animation. |
| ART-5 | DECIDED | Readability first: a distinct silhouette and base colour per hero class, bounty flags visible when zoomed out, territory borders as tinted overlays, fog of war on unexplored land. |
| ART-6 | ASSUMED | Base ring colours: warrior red, rogue green, priest white, wizard blue, worker brown, monster black. |
| ART-7 | OPEN | Audio direction (Q6). |

## 6. Tunable values

All ASSUMED. Every value here must live in data (a Godot Resource under `data/`), never as a literal in code, so balance changes need no code change. Durations are in seconds at 1x speed.

### Simulation

| Key | Value |
|---|---|
| `tick_rate` | 10 ticks per second |
| `speed_steps` | 0 (pause), 1, 2, 3 |
| `tile_size` | 1 world unit |

### Bounty scoring (`BNTY-8`)

| Term | Definition | Range |
|---|---|---|
| `gold_term` | `reward_per_hero / (reward_per_hero + gold_half_point)`, with `gold_half_point = 100` | 0 to 1 |
| `danger_term` | `clamp(estimated_enemy_power / hero_power, 0, 2) / 2` | 0 to 1 |
| `distance_term` | `clamp(path_length / max_travel_distance, 0, 1)`, with `max_travel_distance = 120` tiles | 0 to 1 |
| `fit_term` | From the class fit table below | 0 to 1 |

`hero_power = max_health * attack / 100`. `estimated_enemy_power` is the sum of the same formula over the monsters known at the target.

| Class | `w_gold` | `w_danger` | `w_distance` | `w_fit` | `accept_threshold` |
|---|---|---|---|---|---|
| Warrior | 1.0 | 0.8 | 0.5 | 0.6 | 0.25 |
| Rogue | 1.5 | 1.4 | 0.3 | 0.6 | 0.25 |
| Priest | 0.8 | 1.2 | 0.5 | 0.8 | 0.25 |
| Wizard | 0.9 | 1.3 | 0.6 | 0.8 | 0.25 |

Each hero's weights are the class weights multiplied by a per-hero random factor between 0.8 and 1.2, fixed when the hero is created.

| Class fit | slay | explore | loot | bless | defend | rescue |
|---|---|---|---|---|---|---|
| Warrior | 1.0 | 0.3 | 0.4 | 0.1 | 1.0 | 0.5 |
| Rogue | 0.4 | 1.0 | 1.0 | 0.1 | 0.3 | 0.3 |
| Priest | 0.3 | 0.3 | 0.2 | 1.0 | 0.6 | 1.0 |
| Wizard | 0.7 | 0.5 | 0.5 | 0.4 | 0.6 | 0.2 |

### Prototype units

| Unit | Health | Attack | Armour | Attack cooldown | Speed (tiles/s) | Range (tiles) |
|---|---|---|---|---|---|---|
| Warrior (level 1) | 120 | 12 | 3 | 1.2 | 2.0 | 1 |
| Rogue (level 1) | 70 | 9 | 1 | 0.8 | 3.0 | 1 |
| Worker | 30 | 0 | 0 | none | 2.0 | none |
| Goblin (monster) | 40 | 6 | 0 | 1.0 | 2.2 | 1 |
| Lair | 300 | 0 | 2 | none | 0 | none |
| Guard tower | 200 | 8 | 2 | 1.0 | 0 | 6 |
| Town center | 1000 | 0 | 5 | none | 0 | none |

Per hero level: +15% health, +10% attack. Experience to next level: `100 * level`. A goblin gives 20 experience, a lair 100.

### Prototype economy

| Key | Value |
|---|---|
| Starting stock | 200 food, 200 wood, 100 stone, 300 gold |
| Worker carry load | 10 |
| Harvest time per load | 4 |
| Node capacity | tree 100 wood, berry bush 150 food, stone outcrop 300 stone |
| Worker cost | 50 food |
| House | 30 wood; +4 housing |
| Warriors' guild | 100 wood, 50 stone |
| Thieves' den (rogue guild) | 100 wood, 50 stone |
| Guard tower | 50 wood, 100 stone |
| Inn | 120 wood; heroes rest and spend here |
| Outpost | 100 wood, 50 stone; claims a cleared territory |

## 7. Level flow of the prototype

One island, easy mode. This is the acceptance scenario for milestone M5.

1. The level starts with the town center, 4 workers and the starting stock. The ship countdown begins.
2. The player assigns workers, builds houses, an inn and a guild.
3. The first ship brings heroes. The decree is announced: claim both wild territories.
4. The player posts an explore bounty into the fog. A rogue takes it and reveals a lair.
5. The player posts a slay bounty on the lair. Heroes take it if the price is right for them.
6. Goblin raids arrive from surviving lairs; a guard tower handles small ones.
7. A hero who loses a fight is downed. They die unless another hero answers a rescue bounty in time (`HERO-17`).
8. With a territory's lair destroyed, the player builds an outpost and claims it. Workers can now gather there.
9. Claiming both wild territories wins the level. Losing the town center loses it.

## 8. Questions the prototype gate must answer

Milestone M5 exists to answer these. Record the answers here when it is played.

1. Is setting a price and watching who bites fun on its own?
2. Can a player tell why a hero refused a bounty?
3. Is there a meaningful decision at least every 30 seconds at normal speed?
4. When a hero dies, does it feel like the player's risk rather than the AI's mistake?
5. Does the tabletop diorama look work, and is code-driven motion readable enough?

## 9. Proposals awaiting decision

PROPOSED. From the brainstorm of 2026-11-16. Do not build these until the owner adopts them. P1, P5, P7, P12 and P13 were adopted and are now rules above.

| # | Proposal | Would change | Answers this risk |
|---|---|---|---|
| P2 | **Explain-why interface.** While setting a bounty's price, hero portraits light up as the reward becomes attractive to them. Each uninterested hero shows a reason: too dangerous, too far, pays too little, not my kind of work. Treated as a core feature. | UI-4, BNTY | Unexplained hero behaviour |
| P3 | **Scouting as a second lever.** Unscouted targets have unknown danger. Cautious heroes avoid them and reckless ones misjudge them. Explore bounties reveal the real danger. | BNTY-8, TERR-4 | Gold as the only lever |
| P4 | **Overpaying is dangerous.** A huge reward tempts greedy low-level heroes into fights they cannot win. | BNTY-8 | Gold as the only lever; fair deaths |
| P6 | **Shops need stock.** The blacksmith needs iron to sell better weapons, the apothecary needs herbs for potions. Worker output caps hero strength. | ECON, TOWN-7 | Economy and adventure feeling like two games |
| P8 | **Upgrades sharpen control.** Town upgrades unlock finer bounty terms (minimum hero rank, shared or winner-takes-all rewards) and larger parties. | BNTY, HERO-11 | Gold as the only lever |
| P9 | **Retention instead of wages.** Bored heroes leave on the next ship. The total gold on the bounty board attracts stronger newcomers. | HERO-3, SHIP-5 | Death spiral |
| P10 | **Idle heroes have a life.** With no appealing bounty they train, shop, rest, hunt weak monsters or wander off, and sometimes cause trouble. | HERO-14 | Passive waiting |
| P11 | **Spells as set pieces.** A wizard channels a ritual at a site while monsters converge, so others must hold them off. | KING-1 | Passive waiting |
| P14 | **Pause and speed controls.** Pause, 1x, 2x, 3x, with building and bounty posting allowed while paused. Currently ASSUMED as UI-3. | UI-3 | Passive waiting |
| P15 | **One new mechanic per island.** Each campaign level introduces one class, bounty type or hazard. | CAMP | Onboarding |
| P16 | **Favour as currency.** In challenge mode, favour can be spent on kingdom aid. | KING-4 | Death spiral |
| P17 | **Named heroes with a chronicle.** Perks set the bounty personality weights; a log records each hero's deeds and a graveyard remembers the dead. | HERO-4, HERO-5 | Attachment to heroes |

## 10. Open questions

OPEN. Each lists what it blocks, so work can be ordered around it.

| # | Question | Blocks | Current default |
|---|---|---|---|
| Q1 | Which resources exist, and which are paid as tribute? | Content beyond food, wood, stone; tribute (M9) | ECON-1, ECON-2 |
| Q2 | Which of the proposals in section 9 to adopt? | P2, P3, P4 affect milestone M4 | None built |
| Q3 | The perk list, and which positive perks make a hero carry the downed home. | Perks (M6) | None |
| Q4 | Party rules: which upgrades change party size or mix, and which goal types call for a party? | Parties (M6) | No parties in the prototype |
| Q5 | How many veterans carry over, and do they keep their gear? | Campaign (M9) | None |
| Q6 | Audio direction. | Vertical slice (M10) | None |
| Q7 | Controller support for Steam Deck? | Steam (M11) | Mouse and keyboard only |
| Q8 | How long does a hero stay downed? | Tuning only | HERO-15 |
| Q9 | Should the player's rescue bounty stay once heroes rescue on their own initiative? | Nothing yet | BNTY-4 stays |

## 11. Known design risks

| Risk | Why it matters | Mitigation |
|---|---|---|
| "Why won't anyone take my bounty?" | The classic frustration of indirect control | UI-4; P2 |
| Gold is the only lever | The game collapses into "raise the price" | P3, P4, P8 |
| Waiting with nothing to do | Posting and watching can be passive | SHIP-1, WORK-1, UI-3 |
| Two games bolted together | Economy and adventure must depend on each other | WORK-4, ECON-3; P6 |
| Death by AI stupidity | Permanent death must feel fair | HERO-6 to HERO-9, HERO-13; P4 |
| Death spiral | All heroes dead means nobody takes bounties | SHIP-5; P9 |
| Gold flood late in a level | Shop income feeds bounties, which feed shop income | ECON-5 |
| Art workload for one developer | Skeletal animation is the bottleneck | ART-3, ART-4 |

## 12. Design decision log

Newest first. All decisions were made by the owner.

| Date | Decision | Rules |
|---|---|---|
| 2026-11-16 | The royal ship paces every level: tribute out, decrees and new heroes in (P1). | SHIP-1 to SHIP-3 |
| 2026-11-16 | Tabletop diorama look with miniature-style characters and code-driven motion; to be tried in the prototype (P12). | ART-2 to ART-4 |
| 2026-11-16 | Workers are assigned to jobs or buildings, not commanded individually (P7). | WORK-1 |
| 2026-11-16 | Defeated heroes are downed before they die. Priests can revive them in the field; heroes with positive perks can carry them to an infirmary (P5, extended by the owner). | HERO-6 to HERO-9, TOWN-6 |
| 2026-11-16 | Heroes have positive and negative perks. | HERO-5 |
| 2026-11-16 | The prototype includes both warrior and rogue (P13). | HERO-2 |
| 2026-11-16 | Two difficulty modes: easy (no timers) and challenge (deadlines plus royal favour). | KING-3, KING-4 |
| 2026-11-16 | Monsters raid the town. Guard towers handle small raids; larger ones need a defend bounty. | CMBT-2, CMBT-3, TOWN-8 |
| 2026-11-16 | A few surviving veteran heroes, chosen by the player, carry over to the next island. The town starts fresh. | CAMP-2 |
| 2026-11-16 | Heroes form self-governed parties, depending on goal type and town upgrades. | HERO-11 |
| 2026-11-16 | Heroes choose bounties by weighted personality: gold, danger, distance and class fit. | BNTY-2 |
| 2026-11-16 | Heroes come from both sources: wanderers arrive on their own, guilds raise the cap and favour a class. | HERO-3, TOWN-5 |
| 2026-11-16 | Heroes level up individually and death is permanent. | HERO-4, HERO-9 |
| 2026-11-16 | Heroes spend bounty gold in the town's shops; the player earns part of it back. | ECON-3 |
| 2026-11-16 | Low-poly 3D art direction, chosen over 2D. | ART-1 |
| 2026-11-16 | No direct unit control and no recruitable armies. | HERO-1, CMBT-1 |
| 2026-11-16 | Four hero classes: warrior, priest, rogue, wizard. | HERO-2 |
| 2026-11-16 | Single-player campaign of island levels; multiplayer and map editor out of scope for 1.0. | CAMP-1, CAMP-4 |
