# Changelog

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
