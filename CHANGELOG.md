# Changelog

## v0.1.4 - 2026-11-17
### Changed
- PLAN.md: milestones renamed M1 to M12; items 3 to 8 split into 20 pull-request-sized tasks with dependencies, files and "Done when" conditions
- GAME_DESIGN_DOCUMENT.md: every rule has a stable ID and a status (DECIDED, ASSUMED, PROPOSED, OPEN); added design pillars, glossary, tunable values, the prototype level flow and what each open question blocks
- ARCHITECTURE.md: layer rules A1 to A12, target directory structure, tick order, naming and testing approach
- FEATURES.md: feature registry with IDs, a template, and CI as a feature
- CLAUDE.md: session start steps, commands, rules for every change, definition of done and known pitfalls, ahead of the decision log

## v0.1.3 - 2026-11-16
### Changed
- Game design document: adopted the royal ship, tabletop diorama look, assigned workers, downed heroes with field revival and infirmary rescue, hero perks, and warrior plus rogue in the prototype
- Plan items and art decisions updated to match

## v0.1.2 - 2026-11-16
### Added
- Game design document: design risks, 17 proposals awaiting decision and the questions the prototype gate must answer
- Plan items annotated with the proposals that would become part of them

## v0.1.1 - 2026-11-16
### Changed
- Game design document: settled hero origin, growth and death, bounty choice, parties, hero spending, town defence, difficulty modes, lose conditions and campaign carry-over
- Plan items updated to match the design decisions

## v0.1.0 - 2026-11-16
### Added
- Godot 4.7 project with a placeholder boot scene: island, stand-in town center, version label
- `GameVersion` helper and tests that keep `VERSION` and `project.godot` in sync
- GdUnit4 v6.2.3 test framework, vendored
- CI workflow running the tests on every pull request and on `main`
- `tag-release` workflow that tags each merged version as `v<VERSION>`
- Project documents: README, PLAN, CLAUDE, FEATURES, ARCHITECTURE, GAME_DESIGN_DOCUMENT
