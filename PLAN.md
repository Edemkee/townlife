# Plan

States: `open`, `in progress`, `rejected`, `done`. Milestone versions are targets, not promises.

| # | Item | State | Notes |
|---|------|-------|-------|
| 1 | Repository setup: docs, Godot project, GdUnit4, CI, automatic tagging | done | v0.1.0 |
| 2 | Game design document interview | in progress | Heroes, bounties, defence, difficulty and carry-over settled in v0.1.1. Brainstorm proposals P1 to P17 (v0.1.2) await the owner's decision. Remaining open questions are listed in GAME_DESIGN_DOCUMENT.md |
| 3 | Art pipeline: script-generated low-poly `.glb` models, shared palette, first models (town center, worker, tree) | open | Milestone 0.2. See CLAUDE.md for why models are generated in code. Proposed: P12 (tabletop diorama look) |
| 4 | Map and camera: island terrain, territories as regions, pan/zoom/rotate camera, pathfinding | open | Milestone 0.2 |
| 5 | Fixed-tick simulation core with game-speed control | open | Milestone 0.2 to 0.3. Foundation for items 6 to 8. Proposed: P14 (pause and speed controls) |
| 6 | Economy: town center, workers, 3 resources, building placement | open | Milestone 0.3. Proposed: P6 (shops need stock), P7 (assigned workers) |
| 7 | Heroes and bounties: warrior guild, wandering heroes, personality-weighted bounty choice, hero levels and permanent death, kill and explore bounties, basic combat | open | Milestone 0.4. Proposed: P1, P2, P3, P4, P5, P9, P13, P17 |
| 8 | Prototype gate: one island, one kingdom demand, win/lose in easy mode (no timers) | open | Milestone 0.5. Decide whether the loop is fun before adding content. Proposed: P13; gate questions are in GAME_DESIGN_DOCUMENT.md |
| 9 | Four classes: priest, rogue, wizard with distinct bounty preferences; self-governed parties | open | Milestone 0.6. Proposed: P5, P8, P10, P17 |
| 10 | Objectives: tombs, shrines, spells, landmarks, territory claiming | open | Milestone 0.7. Proposed: P3, P11 |
| 11 | Town progression: blacksmith, temple, library, market and hero-strengthening upgrades; heroes spend gold in shops; guard towers and monster raids | open | Milestone 0.8. Proposed: P6, P8 |
| 12 | Campaign framework: level select, 3 islands, save/load, kingdom demand scripting, challenge mode (deadlines and royal favour), veteran hero carry-over | open | Milestone 0.9. Proposed: P1, P15, P16 |
| 13 | Vertical slice: final-quality art, audio and UI on 3 islands | open | Milestone 0.10. Decide here whether to keep generated art, move to Blender, or contract an artist. Proposed: P12 |
| 14 | Steam integration: GodotSteam, store page, achievements, cloud saves, demo | open | Milestone 0.11 |
| 15 | Content and balance: remaining islands, monsters, tutorial, options, localization hooks | open | Milestones 0.12 onward |
| 16 | Export builds in CI (Windows, Linux) and SteamPipe upload | open | Before milestone 0.11 |
| 17 | Multiplayer | rejected | Out of scope for 1.0 |
| 18 | Direct unit control | rejected | Contradicts the core fantasy |
| 19 | Map editor | rejected | Out of scope for 1.0 |
| 20 | 2D art direction | rejected | Owner chose low-poly 3D on 2026-11-16 |
