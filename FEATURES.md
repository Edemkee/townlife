# Features

What exists in the game and the repository today, how it is configured and how it is tested. PLAN.md covers what is still to be built; GAME_DESIGN_DOCUMENT.md (GDD) covers what it must do.

## How to maintain this file

- When a task from PLAN.md ships, move its row in the registry from `planned` to `shipped` with the version, and add or extend a detail section below using the template.
- Record every test that covers the feature, and say plainly what is not covered.
- Record changes to a feature under that feature, with the version.
- A bug fix adds its regression test to the feature's test list.
- Statuses: `shipped`, `partial` (say what is missing), `planned`.

## Registry

| ID | Feature | Kind | Status | Since | GDD rules | Plan task |
|---|---|---|---|---|---|---|
| F-VERSION | Versioning | auxiliary | shipped | v0.1.0 | | 1 |
| F-TAGGING | Release tagging | auxiliary | shipped | v0.1.0 | | 1 |
| F-CI | Continuous integration | auxiliary | shipped | v0.1.0 | | 1 |
| F-BOOT | Boot scene (placeholder) | core | shipped | v0.1.0 | | 1; replaced by 4.2 |
| F-SIM | Simulation clock and game speed | core | planned | | UI-3 | 5.1 |
| F-MAP | Map, terrain and territories | core | planned | | TERR-1, TERR-5 | 4.1 |
| F-ART | Model generator and models | auxiliary | planned | | ART-1 to ART-3 | 3.1 |
| F-ISLAND | Island diorama view | core | planned | | ART-2, ART-5 | 4.2 |
| F-CAMERA | Camera rig | core | planned | | UI-1 | 4.3 |
| F-PATH | Pathfinding | core | planned | | | 4.4 |
| F-MINI | Miniatures and code-driven motion | core | planned | | ART-3, ART-4 | 3.2 |
| F-STOCK | Stockpile and resources | core | planned | | ECON-1, ECON-2 | 6.1 |
| F-BUILD | Buildings and placement | core | planned | | TOWN-1, TOWN-2, TOWN-9 | 6.2 |
| F-WORK | Workers and job assignment | core | planned | | WORK-1 to WORK-6 | 6.3 |
| F-HUD | Town HUD and player commands | core | planned | | UI-2, UI-3, UI-5 | 6.4 |
| F-COMBAT | Combat, monsters, lairs, raids, towers | core | planned | | CMBT-1 to CMBT-7, TOWN-8 | 7.1 |
| F-HERO | Heroes: classes, levels, roster | core | planned | | HERO-2, HERO-4, HERO-12 | 7.2 |
| F-BOUNTY | Bounty board and scoring | core | planned | | BNTY-1 to BNTY-9 | 7.3 |
| F-BRAIN | Hero behaviour, downed state, rescue, death | core | planned | | HERO-6, HERO-9, HERO-13 to HERO-17 | 7.4 |
| F-SHIP | Royal ship | core | planned | | SHIP-1 to SHIP-5 | 7.5 |
| F-BOUNTYUI | Bounty and hero interface | core | planned | | UI-4, BNTY-5, BNTY-7 | 7.6 |
| F-FOG | Fog of war and explore bounties | core | planned | | TERR-4, BNTY-9 | 8.1 |
| F-CLAIM | Territory claiming, decrees, win and lose | core | planned | | TERR-3, KING-1 to KING-5 | 8.2 |
| F-PROTO | Prototype island and playtest build | core | planned | | GDD section 7 | 8.3 |

Features of M6 and later are added to the registry when their tasks are specified.

## Template

```markdown
## F-ID: Name  (core | auxiliary)
- Description: what it does, in two or three sentences.
- GDD rules: IDs implemented, and any implemented only in part.
- Code: main files.
- Config: data resources, project settings, input actions, environment variables, timeouts.
- Interface: buttons, panels, keys (if any).
- Signals and events: what it emits that other systems use.
- Tests: file::test (unit | scenario | smoke); not covered: ...
- Manual checks: anything that cannot be automated.
- Changes:
  - vX.Y.Z: ...
```

## Shipped features

## F-VERSION: Versioning  (auxiliary)
- Description: the game version is stored in `VERSION` and in `application/config/version` (`project.godot`). `GameVersion.current()` reads it at runtime; the boot scene shows it.
- Code: `src/core/game_version.gd`.
- Config: `VERSION` file; `application/config/version`. Both must be changed together in every pull request.
- Interface: version label in the boot scene.
- Tests: `tests/core/game_version_test.gd` (unit): `test_version_file_is_semver`, `test_project_version_matches_version_file`, `test_is_valid_rejects_malformed_versions`, `test_is_valid_accepts_semver`. Not covered: the label text in the scene.
- Changes:
  - v0.1.0: introduced.

## F-TAGGING: Release tagging  (auxiliary)
- Description: on every push to `main`, the `tag-release` workflow runs `scripts/tag_release.sh`, which creates the annotated tag `v<VERSION>` if it does not exist.
- Code: `.github/workflows/tag-release.yml`, `scripts/tag_release.sh`.
- Config: `PUSH=0` creates the tag without pushing; `VERSION_FILE` overrides the file path.
- Tests: none automated.
- Manual checks: verified in a throwaway repository on 2026-11-16 (new version creates a tag, existing tag is a no-op, `0.1`, `v1.2.3` and `01.2.3` are rejected). Verified live: tags v0.1.0 to v0.1.3 were created by the workflow.
- Changes:
  - v0.1.0: introduced.

## F-CI: Continuous integration  (auxiliary)
- Description: the `ci` workflow downloads the pinned Godot build, imports the project and runs every GdUnit4 suite under `tests/` headless, on each pull request and each push to `main`.
- Code: `.github/workflows/ci.yml`.
- Config: `GODOT_VERSION` in the workflow (4.7.2-stable). No secrets.
- Tests: the workflow is its own check; a failing test fails the pull request.
- Changes:
  - v0.1.0: introduced.

## F-BOOT: Boot scene  (core, placeholder)
- Description: `src/main/main.tscn` shows an island disc, a stand-in town center built from primitive meshes, a fixed camera and a sun light. It will be replaced by the island view in task 4.2.
- Code: `src/main/main.tscn`, `src/main/main.gd`.
- Tests: none automated.
- Manual checks: the scene loads and runs headless without errors.
- Changes:
  - v0.1.0: introduced.
