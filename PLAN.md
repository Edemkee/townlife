# Plan

What to build, in what order, and how to know a task is done. GAME_DESIGN_DOCUMENT.md (GDD) defines what the game must do; rule IDs such as `BNTY-8` point there. ARCHITECTURE.md defines where code goes.

## How to use this plan

1. Read **Next up**. Take the first task whose dependencies are `done`, unless the owner asks for something else.
2. Set its state to `in progress` in the task table (normally only one task at a time).
3. Read its spec in **Task specs** and every GDD rule it lists. Rules marked ASSUMED are built as data-driven defaults; anything PROPOSED or OPEN is not built.
4. One task is one pull request. Follow the definition of done in CLAUDE.md.
5. When the pull request is opened, set the task to `done` with the version, and update **Next up**.
6. If a task turns out too large for one reviewable pull request, split it into `<id>a`, `<id>b` here first.
7. New ideas go in **Ideas and rejected items**. Check for overlap with existing tasks first and attach the idea to the task it overlaps instead of adding a duplicate.

States: `open`, `in progress`, `done`, `rejected`, `blocked` (say on what).

Milestones are named M1 to M12, not by version number, because every pull request raises the version: a milestone of several tasks spans several minor versions.

## Next up

1. **5.1** Simulation clock
2. **4.1** Map data model
3. **3.1** Model generator and first models

Waiting on the owner: Q1 (resources and tribute) and Q2 (remaining proposals) in the GDD. Neither blocks M2. P2, P3 and P4 should be decided before task 7.3 starts.

## Milestones

| M | Milestone | Outcome | Plan items | State |
|---|---|---|---|---|
| M1 | Setup | Repository, documents, CI, tagging | 1 | done |
| M2 | Map, camera, art pipeline | A diorama island you can look around, with miniatures that can walk on it | 3, 4, 5 | open |
| M3 | Economy | Assign workers, gather three resources, place buildings | 6 | open |
| M4 | Heroes and bounties | Warrior and rogue arrive by ship, weigh bounties, fight, get downed, die | 7 | open |
| M5 | Prototype gate | One winnable island in easy mode; the owner plays it and answers the gate questions (GDD section 8) | 8 | open |
| M6 | Four classes | Priest and wizard, parties, perks, field revival | 9 | open |
| M7 | Objectives | Tombs, shrines, spells, landmarks | 10 | open |
| M8 | Town progression | Shops, upgrades, infirmary, raid scaling | 11 | open |
| M9 | Campaign framework | Level select, 3 islands, save/load, challenge mode, veteran carry-over | 12 | open |
| M10 | Vertical slice | Final-quality art, audio and UI on 3 islands | 13 | open |
| M11 | Steam | GodotSteam, store page, achievements, cloud saves, demo | 14, 16 | open |
| M12 | Content and balance | Remaining islands, monsters, tutorial, options | 15 | open |

Do not start M6 or later before the owner has played M5 and decided to continue. M6 onward is intentionally not broken into tasks yet.

## Task table

| # | Task | M | Depends on | State | Notes |
|---|---|---|---|---|---|
| 1 | Repository setup: docs, Godot project, GdUnit4, CI, automatic tagging | M1 | | done | v0.1.0 |
| 2 | Game design interview | | | in progress | Runs alongside development. Open questions: GDD section 10. Proposals: GDD section 9 |
| 5.1 | Simulation clock: fixed tick, pause and speed steps | M2 | | open | |
| 4.1 | Map data model: grid, terrain, territories, loading from a level resource | M2 | | open | |
| 3.1 | Model generator (`tools/art`) and first models | M2 | | open | |
| 4.2 | Island view: render the map as a diorama | M2 | 4.1, 3.1 | open | |
| 4.3 | Camera rig: pan, zoom, rotate, bounds | M2 | 4.2 | open | |
| 4.4 | Pathfinding on the map grid | M2 | 4.1 | open | |
| 3.2 | Miniature view: code-driven motion following a simulated unit | M2 | 3.1, 4.4, 5.1 | open | Closes M2 |
| 6.1 | Stockpile and resource definitions | M3 | 5.1 | open | |
| 6.2 | Buildings: definitions, placement rules, construction | M3 | 6.1, 4.1 | open | |
| 6.3 | Workers: job assignment and the gathering loop | M3 | 6.2, 4.4 | open | |
| 6.4 | Town HUD: resource bar, build menu, job panel, speed controls | M3 | 6.3 | open | Closes M3 |
| 7.1 | Units and combat: stats, attacks, monsters, lairs, raids, guard tower | M4 | 6.2, 4.4 | open | |
| 7.2 | Hero model: class, level, experience, gold, personal weights | M4 | 7.1 | open | |
| 7.3 | Bounty board and scoring | M4 | 7.2 | open | Decide P2, P3, P4 first |
| 7.4 | Hero behaviour: idle, travel, fight, flee, rest, downed, death, rescue | M4 | 7.3 | open | |
| 7.5 | Royal ship: countdown, arrival, heroes delivered | M4 | 7.2 | open | |
| 7.6 | Bounty and hero interface: post, reprice, cancel, inspect | M4 | 7.4 | open | Closes M4 |
| 8.1 | Fog of war and explore bounties | M5 | 7.4 | open | |
| 8.2 | Territory claiming, the decree, win and lose | M5 | 7.4, 6.2 | open | |
| 8.3 | Prototype island and playtest build | M5 | 8.1, 8.2, 7.5, 7.6 | open | Closes M5. Owner plays it |
| 9 | Four classes: priest and wizard; self-governed parties; hero perks; priests revive in the field, perked heroes carry the downed to the infirmary | M6 | M5 decision | open | Needs Q3, Q4. Proposed: P8, P10, P17 |
| 10 | Objectives: tombs, shrines, spells, landmarks | M7 | 9 | open | Proposed: P3, P11 |
| 11 | Town progression: blacksmith, temple, library, market, upgrades, infirmary, hero spending in shops, raid scaling | M8 | 9 | open | Proposed: P6, P8 |
| 12 | Campaign framework: level select, 3 islands, save/load, decree scripting, challenge mode, veteran carry-over, ship cadence per level | M9 | 10, 11 | open | Needs Q1, Q5. Proposed: P15, P16 |
| 13 | Vertical slice: final-quality art, audio and UI on 3 islands | M10 | 12 | open | Needs Q6. Decide here whether to keep generated art, move to Blender, or contract an artist |
| 14 | Steam integration: GodotSteam, store page, achievements, cloud saves, demo | M11 | 13 | open | Needs Q7 |
| 15 | Content and balance: remaining islands, monsters, tutorial, options, localization hooks | M12 | 14 | open | |
| 16 | Export builds in CI (Windows, Linux) and SteamPipe upload | M11 | 8.3 | open | Can start any time after M5 |

Former items 3 to 8 are now the tasks 3.x to 8.x above.

## Task specs

Each spec is written so the task can be done without any context beyond this repository. "Core" means `src/core`, which must stay free of rendering and scene-tree code (ARCHITECTURE.md, rule A1). Every core task needs GdUnit4 unit tests; view and interface tasks need at least a scene smoke test (the scene loads and runs a few frames headless without errors) plus tests for any logic they contain.

### 5.1 Simulation clock

- **GDD:** UI-3, tunables `tick_rate`, `speed_steps`.
- **Build:** `SimClock`, which turns frame time into whole simulation ticks. `advance(delta_seconds) -> int` returns how many ticks to run this frame, carrying the remainder. Speed steps 0, 1, 2, 3; speed 0 yields no ticks. A cap on ticks per frame (default 10) prevents a spiral after a stall. `Simulation`, the root object that owns the clock and a list of systems, and calls `tick()` on each system in a fixed order. A seeded `RandomNumberGenerator` owned by `Simulation` is the only source of randomness in core.
- **Files:** `src/core/sim/sim_clock.gd`, `src/core/sim/simulation.gd`, `src/core/sim/sim_system.gd` (base class), `data/config/sim_config.tres` + `src/core/config/sim_config.gd`, tests under `tests/core/sim/`.
- **Done when:** at speed 1, 1.0 second of deltas in any chunking yields exactly 10 ticks; speed 2 yields 20; speed 0 yields 0; a 5-second stall yields at most the cap; two `Simulation` objects with the same seed and the same inputs produce identical state after 1000 ticks.
- **Not in this task:** any interface, any gameplay system.

### 4.1 Map data model

- **GDD:** TERR-1, TERR-5, TOWN-9, tunable `tile_size`.
- **Build:** `GameMap`: a rectangular grid of tiles. Each tile has a terrain type (`WATER`, `GRASS`, `FOREST`, `ROCK`, `SAND`), a territory id (or -1 for sea), and a walkable flag derived from terrain. `Territory`: id, name, owner (`PLAYER`, `WILD`), list of tiles. Queries: `in_bounds`, `terrain_at`, `territory_at`, `is_walkable`, `tiles_of(territory)`, `neighbours`. `LevelDefinition` resource holding map size, a terrain layout and territory layout (encode both as compact strings or `PackedByteArray`, one entry per tile), plus the town center position. A hand-authored `prototype_island.tres`: about 64 by 64 tiles, 3 territories, home in the middle.
- **Files:** `src/core/map/game_map.gd`, `territory.gd`, `terrain.gd`; `src/core/level/level_definition.gd`; `data/levels/prototype_island.tres`; a small script `tools/levels/make_prototype_island.gd` or equivalent that generates the resource reproducibly; tests under `tests/core/map/`.
- **Done when:** the prototype level loads into a `GameMap`; every land tile belongs to exactly one territory; every territory is contiguous; all land is reachable from the town center tile; out-of-bounds queries are safe.
- **Not in this task:** rendering, fog, pathfinding.

### 3.1 Model generator and first models

- **GDD:** ART-1 to ART-3, ART-6. CLAUDE.md explains why models are generated in code.
- **Build:** a Python package in `tools/art` (standard library plus `numpy` only) that builds flat-shaded low-poly meshes from primitives (box, prism, cylinder, cone, with per-face colour from a shared palette) and writes binary glTF (`.glb`) with vertex colours and one shared unlit-friendly material. A palette file `tools/art/palette.json` (about 24 named colours). One Python module per model. Models for this task: `table` (wooden table top), `island_base` (a raised slab with a rim), `town_center`, `tree`, `rock`, `berry_bush`, `mini_worker`, `mini_base` (the round base ring, recoloured per unit type in the engine). A command `python3 tools/art/build.py` regenerates every model into `assets/models/`. Output must be deterministic (byte-identical between runs).
- **Scale:** 1 unit = 1 tile. A miniature is about 0.8 tall on a base of 0.35 radius. The town center covers 3 by 3 tiles. Models sit on y = 0 with their origin at the footprint centre.
- **Files:** `tools/art/*.py`, `tools/art/palette.json`, `tools/art/README.md` (how to add a model), `assets/models/*.glb` and their `.import` files, `tests/art/model_import_test.gd`, a CI step that runs `build.py` and fails if `git diff --exit-code assets/models` shows a difference.
- **Done when:** Godot imports every `.glb` without warnings; the test loads each as a `PackedScene`, finds at least one `MeshInstance3D`, and checks its bounding box against the scale rules above; running the build twice changes nothing.
- **Not in this task:** hero and monster miniatures (task 7.1), buildings beyond the town center (task 6.2).

### 4.2 Island view

- **GDD:** ART-2, ART-5.
- **Build:** `IslandView` (a `Node3D`) that takes a `GameMap` and builds the diorama: the table, the island slab shaped by the land tiles, terrain tinted per type, scattered `tree` and `rock` models on forest and rock tiles (seeded, deterministic), a water plane, and a toggleable territory border overlay. Use `MultiMeshInstance3D` for repeated props. Replaces the placeholder content of `src/main/main.tscn`. Lighting and environment tuned for the tabletop look (warm key light, soft shadows, neutral backdrop).
- **Files:** `src/view/island/island_view.gd` + `.tscn`, `src/view/island/terrain_mesh_builder.gd`, `src/main/main.tscn`, tests under `tests/view/island/`.
- **Done when:** the main scene shows the prototype island on a table; the terrain mesh builder has unit tests (vertex count and bounds for a known small map); the scene smoke test passes; a screenshot is attached to the pull request (if a screenshot cannot be taken headless, say so in the pull request).
- **Not in this task:** camera movement, fog of war.

### 4.3 Camera rig

- **GDD:** UI-1, ART-1.
- **Build:** `CameraRig`: a pivot on the ground plane with pan (WASD, arrows, screen edge, middle-drag), zoom (wheel, between a near and far limit, with the pitch steepening as it zooms out), and rotation in 90-degree-free yaw (Q/E, smooth). Pan is clamped to the map bounds. Input actions are defined in `project.godot`, never hard-coded key constants. Pure math (clamping, zoom curve) lives in a testable helper.
- **Files:** `src/view/camera/camera_rig.gd` + `.tscn`, `src/view/camera/camera_math.gd`, `project.godot` (input map), tests under `tests/view/camera/`.
- **Done when:** helper tests cover clamping and the zoom curve; the smoke test passes; camera movement is independent of simulation speed and works while paused.

### 4.4 Pathfinding

- **GDD:** TOWN-9, WORK-3.
- **Build:** `PathService` in core, wrapping `AStarGrid2D` built from `GameMap` walkability, with 8-direction movement and no corner cutting. `find_path(from, to) -> PackedVector2Array`, `path_length`, `nearest_walkable(to)`, and `set_blocked(rect, blocked)` so buildings can occupy tiles later.
- **Files:** `src/core/map/path_service.gd`, tests under `tests/core/map/`.
- **Done when:** tests cover a straight path, a detour around water, an unreachable target (empty result), blocking and unblocking a rectangle, and that paths never cross unwalkable tiles.

### 3.2 Miniature view

- **GDD:** ART-3, ART-4, ART-6.
- **Build:** core `Unit` base data (id, tile position as `Vector2`, facing, speed, state enum `IDLE`, `MOVING`, `ATTACKING`, `HIT`, `DOWNED`, `DEAD`) and a `MovementSystem` that walks units along paths per tick. `MiniatureView` (a `Node3D`) that follows one `Unit`: interpolates position between ticks, and plays code-driven motion per state: hop while moving, lunge on attack, wobble on hit, tip over when downed, sink away when dead. Base ring colour from data. A debug scene that spawns a few worker miniatures walking between random points on the island.
- **Files:** `src/core/units/unit.gd`, `src/core/units/movement_system.gd`, `src/view/units/miniature_view.gd` + `.tscn`, `src/view/units/miniature_motion.gd` (pure functions of time and state), `src/debug/miniature_demo.tscn`, tests under `tests/core/units/` and `tests/view/units/`.
- **Done when:** movement tests show a unit reaches its target in the expected number of ticks at a given speed and stops on an empty path; motion functions are tested (hop height is zero at step boundaries, tip angle reaches 90 degrees); the demo scene smoke test passes; motion looks correct at speeds 1 to 3 and freezes when paused.
- **Closes M2:** update README with a screenshot or a short description of the demo.

### 6.1 Stockpile and resource definitions

- **GDD:** ECON-1, ECON-2, prototype economy tunables.
- **Build:** `ResourceDefinition` resources (id, display name, icon colour) for food, wood, stone and gold. `Stockpile` in core: amounts per resource id, `can_afford(cost)`, `spend(cost) -> bool`, `add`, a `changed` signal, and gold reservation (`reserve`, `release`, `commit`) for bounties later. `Cost` as a typed dictionary or small resource. Starting stock from `LevelDefinition`.
- **Files:** `src/core/economy/stockpile.gd`, `resource_definition.gd`, `cost.gd`; `data/resources/*.tres`; tests under `tests/core/economy/`.
- **Done when:** tests cover spending exactly the balance, refusing overspend without partial deduction, reservation arithmetic, and that amounts never go negative.

### 6.2 Buildings

- **GDD:** TOWN-1, TOWN-2, TOWN-9, TERR-3 (placement on owned territory only), prototype economy tunables.
- **Build:** `BuildingDefinition` resources (id, name, footprint, cost, build time, max health, model path, flags such as `provides_housing`, `hero_slots`). Definitions for town center, house, inn, warriors' guild, thieves' den, guard tower, outpost. `BuildingSystem`: placement validation (in bounds, owned territory, walkable land, footprint free; the outpost is the one exception that may be placed in a cleared wild territory, wired up in task 8.2), spending the cost, a construction-site state that progresses only while builders work on it, completion, damage and destruction. Placed buildings block pathfinding. Models for each building via `tools/art`. A `BuildingView` and a placement ghost that shows valid or invalid.
- **Files:** `src/core/buildings/*.gd`, `data/buildings/*.tres`, `tools/art/` models, `src/view/buildings/*.gd`, tests under `tests/core/buildings/`.
- **Done when:** tests cover each placement rule, cost deduction, construction progress with zero and with two builders, pathfinding blocked after placement, and destruction freeing the tiles.
- **Not in this task:** the build menu (task 6.4), what buildings do for heroes (M4).

### 6.3 Workers

- **GDD:** WORK-1 to WORK-6, TOWN-10.
- **Build:** `Worker` (a `Unit`) with a job. `JobSystem`: the player sets a target count per job; the system reassigns idle workers first, then surplus workers from over-staffed jobs, never the player picking individuals. Resource nodes on the map (tree, berry bush, stone outcrop) with capacity, placed from the level definition. Gathering loop per WORK-3, restricted to owned territory per WORK-4. Builder job walks to the nearest construction site. Buying a worker at the town center, limited by housing. Flee-to-town behaviour (WORK-5) can be a stub that is completed in task 7.1 when monsters exist; note this in FEATURES.md.
- **Files:** `src/core/workers/*.gd`, `src/core/map/resource_node.gd`, tests under `tests/core/workers/`.
- **Done when:** a headless simulation test with 4 workers assigned to woodcutting raises wood by the expected amount after a fixed number of ticks; reassigning counts moves the right number of workers; workers ignore nodes outside owned territory; a depleted node is removed and workers pick another; housing caps purchases.

### 6.4 Town HUD

- **GDD:** UI-2, UI-3, UI-5, WORK-1.
- **Build:** resource bar; build menu listing buildable definitions with costs and disabled states; job panel with plus and minus per job and an idle count; speed controls (pause, 1x, 2x, 3x, with keys Space, 1, 2, 3); selection of a building to see its name, health and construction progress. The interface talks to core only through a `PlayerCommands` facade (`place_building`, `set_job_target`, `buy_worker`, `set_speed`), so every player action is callable from tests.
- **Files:** `src/ui/hud/*.tscn` + `.gd`, `src/core/commands/player_commands.gd`, a theme resource `src/ui/theme/parchment_theme.tres`, tests under `tests/core/commands/` and `tests/ui/`.
- **Done when:** every `PlayerCommands` method has tests for success and refusal; the HUD scene smoke test passes; a full loop is playable by hand: assign workers, gather, build a house, buy a worker.
- **Closes M3.**

### 7.1 Units and combat

- **GDD:** CMBT-1 to CMBT-7, TOWN-8, WORK-5, prototype unit tunables.
- **Build:** `UnitStats` resources per unit type. `CombatSystem`: target selection (CMBT-7), attack cooldowns, damage (CMBT-4), death. `Monster` units, the goblin definition, `Lair` as a building-like entity that keeps a number of guards nearby and periodically sends a raid party towards the town center, with size growing over time (CMBT-5, CMBT-6). Guard tower attacks monsters in range. Workers flee when monsters come near (completes the stub from task 6.3). Town center destruction raises a `level_lost` signal. Miniature models for goblin and lair.
- **Files:** `src/core/combat/*.gd`, `src/core/monsters/*.gd`, `data/units/*.tres`, tests under `tests/core/combat/` and `tests/core/monsters/`.
- **Done when:** deterministic duel tests match hand-computed outcomes from the tunables table (for example how many ticks a level 1 warrior needs to kill a goblin); a tower defeats a raid of the "small" size and loses to a clearly larger one; destroying a lair stops its raids.

### 7.2 Hero model

- **GDD:** HERO-2, HERO-4, HERO-12, HERO-16, bounty weight tunables.
- **Build:** `HeroClassDefinition` resources for warrior and rogue (base stats, per-level growth, class weights, class fit row, base ring colour). `Hero` (a `Unit`): name from a seeded name list, class, level, experience, gold purse, personal weights (class weights times the per-hero factor), flee threshold. Experience and levelling. `HeroRoster`: all heroes, slot counting per HERO-12. Miniature models for warrior and rogue with clearly different silhouettes.
- **Files:** `src/core/heroes/*.gd`, `data/heroes/*.tres`, `data/heroes/names.txt`, tests under `tests/core/heroes/`.
- **Done when:** tests cover level-up thresholds and stat growth, personal weights staying within 0.8 to 1.2 of class weights and being stable for a seed, and slot counts with zero, one and two guilds.

### 7.3 Bounty board and scoring

- **GDD:** BNTY-1 to BNTY-9, scoring tunables. **Before starting, check whether the owner has decided P2, P3 and P4**; they change this task's design.
- **Build:** `Bounty` (id, type, target, reward, state `OPEN`, `TAKEN`, `COMPLETED`, `CANCELLED`, participants). `BountyBoard`: post (reserves gold), reprice, cancel (releases gold), complete (pays and splits per BNTY-6). `BountyScorer`: the BNTY-8 formula as a pure function that returns the score **and its four terms**, so the interface can later explain a decision (pillar 2). All weights and constants come from data.
- **Files:** `src/core/bounties/*.gd`, `data/config/bounty_config.tres`, tests under `tests/core/bounties/`.
- **Done when:** scorer tests pin several hand-computed scores from the tunables; a table-driven test shows the intended personalities (at equal danger a rogue needs less gold than a warrior to accept an explore bounty and more to accept a slay bounty); posting, repricing, cancelling and completing keep the treasury arithmetic exact.

### 7.4 Hero behaviour

- **GDD:** HERO-6, HERO-9, HERO-10, HERO-13 to HERO-15, HERO-17, BNTY-2, BNTY-4, ECON-3, ECON-4.
- **Build:** a state machine per hero: `IDLE_IN_TOWN`, `EVALUATING`, `TRAVELLING`, `FIGHTING`, `FLEEING`, `RESTING`, `SHOPPING`, `DOWNED`, `CARRYING`, `DEAD`. Heroes re-evaluate the board on a staggered interval and when a bounty changes. Slay: travel, fight until the target dies or the flee threshold is hit. Fleeing heroes return to the inn or town center and rest. Downed heroes start a timer (HERO-15); a hero who takes a rescue bounty carries them to the town center (HERO-17); expiry means permanent death. Shopping at the inn transfers gold from purse, with the player's share (ECON-4) going to the treasury. Every hero exposes a short `activity_text` and the last scoring breakdown.
- **Files:** `src/core/heroes/hero_brain.gd`, `hero_states/*.gd`, tests under `tests/core/heroes/`.
- **Done when:** headless scenario tests pass: a hero takes an attractive slay bounty, kills a lone goblin and is paid; a hero refuses an underpaid bounty; a hero flees at the threshold and recovers; a downed hero with no rescue dies after the downed time; a downed hero with a rescue bounty is carried home and recovers; shopping moves the right gold amounts.

### 7.5 Royal ship

- **GDD:** SHIP-1, SHIP-2, SHIP-4, SHIP-5, HERO-3.
- **Build:** `ShipSystem`: countdown, docked period, arrival and departure signals. On arrival, creates heroes for free slots (at most 2), preferring classes with free guild slots. A dock position in the level definition. A ship model and a simple sail-in, sail-out motion. Countdown display in the HUD. Tribute and decrees are hooks only (signals with empty handlers) until task 8.2 and M9.
- **Files:** `src/core/ship/ship_system.gd`, `src/view/ship/*`, `tools/art/` ship model, tests under `tests/core/ship/`.
- **Done when:** tests show arrivals at the configured interval, the per-visit cap, no heroes when slots are full, and class preference following guilds.

### 7.6 Bounty and hero interface

- **GDD:** UI-2, UI-4, UI-5, ART-5, BNTY-5, BNTY-7.
- **Build:** posting flow (pick a type, click a target or location, set the reward with a slider and number field); bounty flags in the world, visible when zoomed out; a bounty board panel listing open bounties with reprice and cancel; a hero panel showing name, class, level, health, gold, `activity_text` and current bounty; a roster list; an event feed (hero arrived, bounty completed, hero downed, hero died). New `PlayerCommands`: `post_bounty`, `reprice_bounty`, `cancel_bounty`.
- **Files:** `src/ui/bounties/*`, `src/ui/heroes/*`, `src/view/bounties/bounty_flag.*`, tests under `tests/core/commands/` and `tests/ui/`.
- **Done when:** command tests cover success and refusal (not enough gold, invalid target); smoke tests pass; by hand: post a slay bounty, watch a hero take it, reprice another until someone accepts.
- **Closes M4.**

### 8.1 Fog of war and explore bounties

- **GDD:** TERR-4, BNTY-9, ART-5, HERO-16.
- **Build:** `FogSystem` in core: per-tile `HIDDEN` or `REVEALED`; heroes reveal a radius as they move (rogues a larger one); owned territory starts revealed. Lairs and monsters in hidden tiles are not targetable by slay bounties and not drawn. Explore bounties complete when their location is revealed by a participant. Fog rendering on the island (a darkened or clouded overlay that fits the diorama look).
- **Files:** `src/core/map/fog_system.gd`, `src/view/island/fog_view.*`, tests under `tests/core/map/`.
- **Done when:** tests cover reveal radius per class, explore completion and payment, and slay bounties being refused on hidden targets.

### 8.2 Territory claiming, the decree, win and lose

- **GDD:** TERR-2, TERR-3, KING-1 to KING-3, KING-5, TOWN-4, WORK-4.
- **Build:** a territory becomes `CLEARED` when its last lair dies; an outpost may then be placed in it; completing the outpost sets the owner to `PLAYER`, which opens it to building and gathering. `Decree` (type, target, progress, met) and `DecreeSystem` with the "claim territories" type; the decree is announced on the first ship arrival. `LevelState`: `PLAYING`, `WON`, `LOST`. Decree panel in the parchment style, plus win and lose screens with "restart".
- **Files:** `src/core/territory/*.gd`, `src/core/kingdom/*.gd`, `src/ui/kingdom/*`, tests under `tests/core/territory/` and `tests/core/kingdom/`.
- **Done when:** tests cover clearing, the outpost exception, ownership change enabling gathering, decree progress, winning on the second claim, and losing when the town center falls.

### 8.3 Prototype island and playtest build

- **GDD:** section 7 (the whole flow), section 8 (gate questions).
- **Build:** tune `prototype_island.tres` (lair positions and strengths, resource node placement, dock) so the level takes 20 to 30 minutes. A main menu with "Play" and "Quit". An end-to-end headless test that scripts `PlayerCommands` through the section 7 flow with a fixed seed and asserts the level is won. Export presets for Windows and Linux (checked for credentials before committing), with build instructions in README. A `PLAYTEST.md` checklist built from the gate questions for the owner to fill in.
- **Done when:** the end-to-end test passes in CI; the owner can download or build the game and play the level through.
- **Closes M5.** Stop here and wait for the owner's verdict on the gate questions before any M6 work.

## Ideas and rejected items

| # | Item | State | Notes |
|---|---|---|---|
| 17 | Multiplayer | rejected | Out of scope for 1.0 |
| 18 | Direct unit control | rejected | Contradicts the core fantasy. Extended on 2026-11-16 to workers, who are assigned to jobs instead |
| 19 | Map editor | rejected | Out of scope for 1.0 |
| 20 | 2D art direction | rejected | Owner chose low-poly 3D on 2026-11-16 |
| 21 | Integration and performance tests: 150 agents at 60 frames per second on mid-range hardware | open | Suggest after M5 |

Design proposals P2 to P17 are tracked in GDD section 9, not here, until the owner adopts them.
