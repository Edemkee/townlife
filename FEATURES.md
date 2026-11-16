# Features

Major features, their connected minor features, configuration and test coverage.

## Feature: Versioning  (major)
- Description: the game version is stored in `VERSION` and in `application/config/version` (`project.godot`). `GameVersion.current()` reads it at runtime; the boot scene shows it.
- Related minor features: version label in the boot scene; automatic release tags.
- Config: `VERSION` file; `application/config/version`.
- Tests: `tests/core/game_version_test.gd` (unit): VERSION is `MAJOR.MINOR.PATCH`, project setting matches VERSION, validator accepts and rejects the right strings. Not covered: version label text in the scene.
- Changes:
  - v0.1.0: introduced.

## Feature: Release tagging  (auxiliary)
- Description: `.github/workflows/tag-release.yml` runs `scripts/tag_release.sh` on every push to `main` and creates the annotated tag `v<VERSION>` if it does not exist.
- Config: `PUSH=0` creates the tag without pushing; `VERSION_FILE` overrides the file path.
- Tests: manual, in a throwaway repository on 2026-11-16: new version creates a tag, existing tag is a no-op, malformed versions (`0.1`, `v1.2.3`, `01.2.3`) fail. Not covered by automated tests.
- Changes:
  - v0.1.0: introduced.

## Feature: Boot scene  (placeholder)
- Description: `src/main/main.tscn` shows an island disc, a stand-in town center built from primitive meshes, a fixed camera and a sun light.
- Tests: manual: scene loads headless without errors. Not covered by automated tests; it will be replaced by the map in milestone 0.2.
- Changes:
  - v0.1.0: introduced.
