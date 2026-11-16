# Plan

States: `open`, `in progress`, `rejected`, `done`. Milestone versions are targets, not promises.

| # | Item | State | Notes |
|---|------|-------|-------|
| 1 | Repository setup: docs, Godot project, GdUnit4, CI, automatic tagging | done | v0.1.0 |
| 2 | Game design document interview | open | Start with how heroes choose bounties. Open questions are listed in GAME_DESIGN_DOCUMENT.md |
| 3 | Art pipeline: script-generated low-poly `.glb` models, shared palette, first models (town center, worker, tree) | open | Milestone 0.2. See CLAUDE.md for why models are generated in code |
| 4 | Map and camera: island terrain, territories as regions, pan/zoom/rotate camera, pathfinding | open | Milestone 0.2 |
| 5 | Fixed-tick simulation core with game-speed control | open | Milestone 0.2 to 0.3. Foundation for items 6 to 8 |
| 6 | Economy: town center, workers, 3 resources, building placement | open | Milestone 0.3 |
| 7 | Heroes and bounties: warrior guild, autonomous heroes, kill and explore bounties, basic combat | open | Milestone 0.4 |
| 8 | Prototype gate: one island, one kingdom demand, win/lose | open | Milestone 0.5. Decide whether the loop is fun before adding content |
| 9 | Four classes: priest, rogue, wizard with distinct bounty preferences and party behaviour | open | Milestone 0.6 |
| 10 | Objectives: tombs, shrines, spells, landmarks, territory claiming | open | Milestone 0.7 |
| 11 | Town progression: blacksmith, temple, library, market and hero-strengthening upgrades | open | Milestone 0.8 |
| 12 | Campaign framework: level select, 3 islands, save/load, kingdom demand scripting | open | Milestone 0.9 |
| 13 | Vertical slice: final-quality art, audio and UI on 3 islands | open | Milestone 0.10. Decide here whether to keep generated art, move to Blender, or contract an artist |
| 14 | Steam integration: GodotSteam, store page, achievements, cloud saves, demo | open | Milestone 0.11 |
| 15 | Content and balance: remaining islands, monsters, tutorial, options, localization hooks | open | Milestones 0.12 onward |
| 16 | Export builds in CI (Windows, Linux) and SteamPipe upload | open | Before milestone 0.11 |
| 17 | Multiplayer | rejected | Out of scope for 1.0 |
| 18 | Direct unit control | rejected | Contradicts the core fantasy |
| 19 | Map editor | rejected | Out of scope for 1.0 |
| 20 | 2D art direction | rejected | Owner chose low-poly 3D on 2026-11-16 |
