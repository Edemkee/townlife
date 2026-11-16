# Plan

States: `open`, `in progress`, `rejected`, `done`. Milestone versions are targets, not promises.

| # | Item | State | Notes |
|---|------|-------|-------|
| 1 | Repository setup: docs, Godot project, GdUnit4, CI, automatic tagging | done | v0.1.0 |
| 2 | Game design document interview | in progress | Heroes, bounties, defence, difficulty and carry-over settled in v0.1.1. P1, P5, P7, P12, P13 adopted in v0.1.3; the other brainstorm proposals await the owner's decision. Remaining open questions are listed in GAME_DESIGN_DOCUMENT.md |
| 3 | Art pipeline: script-generated low-poly `.glb` models in the tabletop diorama look, shared palette, first models (table and island base, town center, worker miniature, tree), code-driven miniature motion | open | Milestone 0.2. See CLAUDE.md for why models are generated in code |
| 4 | Map and camera: island terrain, territories as regions, pan/zoom/rotate camera, pathfinding | open | Milestone 0.2 |
| 5 | Fixed-tick simulation core with game-speed control | open | Milestone 0.2 to 0.3. Foundation for items 6 to 8. Proposed: P14 (pause and speed controls) |
| 6 | Economy: town center, workers assigned to jobs, 3 resources, building placement | open | Milestone 0.3. Proposed: P6 (shops need stock) |
| 7 | Heroes and bounties: warrior and rogue, heroes arriving on the royal ship, personality-weighted bounty choice, hero levels, downed state and permanent death, kill and explore bounties, basic combat | open | Milestone 0.4. Proposed: P2, P3, P4, P9, P17 |
| 8 | Prototype gate: one island, warrior and rogue, one kingdom demand delivered by the royal ship, win/lose in easy mode (no timers) | open | Milestone 0.5. Decide whether the loop is fun and whether the diorama look works before adding content. Gate questions are in GAME_DESIGN_DOCUMENT.md |
| 9 | Four classes: priest and wizard join warrior and rogue; self-governed parties; hero perks; priests revive the downed in the field, perked heroes carry them to the infirmary | open | Milestone 0.6. Proposed: P8, P10, P17 |
| 10 | Objectives: tombs, shrines, spells, landmarks, territory claiming | open | Milestone 0.7. Proposed: P3, P11 |
| 11 | Town progression: blacksmith, temple, library, market and hero-strengthening upgrades; infirmary; heroes spend gold in shops; guard towers and monster raids | open | Milestone 0.8. Proposed: P6, P8 |
| 12 | Campaign framework: level select, 3 islands, save/load, kingdom demand scripting, challenge mode (deadlines and royal favour), veteran hero carry-over | open | Milestone 0.9. Royal ship cadence scripted per level. Proposed: P15, P16 |
| 13 | Vertical slice: final-quality art, audio and UI on 3 islands | open | Milestone 0.10. Decide here whether to keep generated art, move to Blender, or contract an artist |
| 14 | Steam integration: GodotSteam, store page, achievements, cloud saves, demo | open | Milestone 0.11 |
| 15 | Content and balance: remaining islands, monsters, tutorial, options, localization hooks | open | Milestones 0.12 onward |
| 16 | Export builds in CI (Windows, Linux) and SteamPipe upload | open | Before milestone 0.11 |
| 17 | Multiplayer | rejected | Out of scope for 1.0 |
| 18 | Direct unit control | rejected | Contradicts the core fantasy. Extended on 2026-11-16 to workers, who are assigned to jobs instead |
| 19 | Map editor | rejected | Out of scope for 1.0 |
| 20 | 2D art direction | rejected | Owner chose low-poly 3D on 2026-11-16 |
