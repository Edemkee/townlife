# Town Life

An indirect real-time strategy game. You govern a colony town for a distant kingdom: gather resources, build and upgrade, and expand across island territories. You cannot recruit an army. Instead you post bounties, and independent heroes (warriors, priests, rogues, wizards) decide whether the gold is worth the danger.

Status: early setup (see [PLAN.md](PLAN.md) and [CHANGELOG.md](CHANGELOG.md)). Target platform: Steam (Windows, Linux / Steam Deck).

## Tech stack

| Area | Choice |
|---|---|
| Engine | Godot 4.7 (Forward+ renderer) |
| Language | GDScript, statically typed |
| Art | Low-poly 3D, glTF (`.glb`) models |
| Tests | GdUnit4 (vendored in `addons/gdUnit4`), run headless |
| CI | GitHub Actions: tests on every PR, automatic version tags on `main` |
| Steam | GodotSteam GDExtension (planned, milestone 0.11) |

The reasons behind each choice are logged in [CLAUDE.md](CLAUDE.md).

## Run

1. Install [Godot 4.7.x](https://godotengine.org/download) (standard build, not .NET).
2. Open `project.godot` in the editor and press F5, or from a terminal:

```sh
godot --path .
```

## Test

```sh
godot --headless --path . --import   # first time only, builds the .godot cache
GODOT_BIN=/path/to/godot bash addons/gdUnit4/runtest.sh --headless --ignoreHeadlessMode -a res://tests
```

On Windows use `addons\gdUnit4\runtest.cmd` with the same arguments. Tests can also be run from the GdUnit4 panel inside the editor.

## Layout

```
src/        game code and scenes
  core/     engine-independent helpers and simulation logic
  main/     boot scene
tests/      GdUnit4 test suites, mirroring src/
assets/     models, textures, audio
tools/      asset generation scripts
scripts/    repository automation (release tagging)
addons/     third-party Godot plugins
```

## Documents

- [PLAN.md](PLAN.md): todos, ideas and their state
- [GAME_DESIGN_DOCUMENT.md](GAME_DESIGN_DOCUMENT.md): vision, core loop, design decisions
- [ARCHITECTURE.md](ARCHITECTURE.md): system structure
- [FEATURES.md](FEATURES.md): features and their test coverage
- [CHANGELOG.md](CHANGELOG.md): what changed in each version
- [CLAUDE.md](CLAUDE.md): operative decisions

## Versioning

`MAJOR.MINOR.PATCH` in `VERSION`, kept in sync with `application/config/version` in `project.godot`. Each pull request raises the version once; merged versions are tagged `v<VERSION>` on `main` by the `tag-release` workflow.

## Third-party

- [GdUnit4](https://github.com/godot-gdunit-labs/gdUnit4) v6.2.3, MIT license (`addons/gdUnit4/LICENSE`)
