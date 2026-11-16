# Working in this repository

Town Life is an indirect real-time strategy game for Steam, built with Godot 4.7 and typed GDScript. This file is loaded automatically at the start of a session. Read it fully, then follow "Start of session".

## Start of session

1. Check out `main` and pull. Check the `VERSION` file, the latest tag and any open pull requests. If an earlier pull request is still open, tell the owner before starting new work.
2. Read PLAN.md ("How to use this plan" and "Next up"), then the spec of the task you will work on and the GDD rules it cites.
3. Read ARCHITECTURE.md (rules A1 to A12) before adding files.
4. Tell the owner in two or three sentences where the project stands and what you will do next, then start.

## Documents

| File | Answers | Update when |
|---|---|---|
| PLAN.md | What to build next, and when is it done? | Every pull request |
| GAME_DESIGN_DOCUMENT.md | What must the game do? Rule IDs and statuses | A design decision is made |
| ARCHITECTURE.md | Where does code go, and how do parts talk? | Structure or rules change |
| FEATURES.md | What exists, how is it configured and tested? | A feature ships or changes |
| CHANGELOG.md | What changed per version? | Every pull request |
| CLAUDE.md | How do we work, and what was decided operationally? | A tooling or process decision is made |

## Commands

Set `GODOT` to a Godot 4.7.x standard (non-.NET) binary. In a Claude cloud session, download it once per session:

```sh
curl -sSL -o /tmp/godot.zip https://github.com/godotengine/godot/releases/download/4.7.2-stable/Godot_v4.7.2-stable_linux.x86_64.zip
unzip -oq /tmp/godot.zip -d /tmp/godot && export GODOT=/tmp/godot/Godot_v4.7.2-stable_linux.x86_64
```

```sh
# Import (needed once after cloning and after adding assets or class_name scripts)
$GODOT --headless --path . --import

# Run all tests (exit code 0 means pass)
GODOT_BIN=$GODOT bash addons/gdUnit4/runtest.sh --headless --ignoreHeadlessMode -a res://tests

# Run one suite
GODOT_BIN=$GODOT bash addons/gdUnit4/runtest.sh --headless --ignoreHeadlessMode -a res://tests/core/game_version_test.gd

# Smoke-run the game headless for a few frames; any output line containing ERROR is a failure
$GODOT --headless --path . --quit-after 10

# Regenerate models (from task 3.1 on)
python3 tools/art/build.py
```

## Rules for every change

1. **One PLAN.md task is one pull request** against `main`, from a short-lived branch (`feature/<name>`, `fix/<name>`, `docs/<name>`). Never push to `main`. The owner merges.
2. **Before pushing more work to a branch, check whether its pull request was already merged.** If so, branch again from the updated `main`.
3. **Version:** raise it once per pull request, in both `VERSION` and `application/config/version` in `project.godot` (a test enforces that they match). A feature or meaningful change raises MINOR and resets PATCH. A fix, tweak or documents-only change raises PATCH. MAJOR changes only when the owner asks. Say in the pull request which kind it is.
4. **Tests:** every feature change comes with tests in the same pull request. Every bug gets a regression test that fails before the fix. Run the full suite before committing. If something cannot be tested headless, say so in the pull request and record the manual check in FEATURES.md.
5. **Documents:** update PLAN.md and CHANGELOG.md in every pull request; the others only when the change touches what they describe.
6. **Design:** build DECIDED and ASSUMED rules. Do not build PROPOSED or OPEN ones; ask the owner. If a task needs a design choice the GDD does not cover, pick the simplest option that fits the design pillars, record it in the GDD as ASSUMED, and point it out in the pull request.
7. **Secrets:** review the staged diff before every commit. No keys, tokens, passwords, keystores or personal data. If one was ever committed, tell the owner at once so it can be revoked.
8. **Commits and pull requests** describe what changed, why, how it was tested, and the new version. A `Co-Authored-By: Claude` trailer is fine. Never include a Claude session link.
9. **Never commit** `.godot/`, build or export output, or `reports/`. Do commit `*.import` and `*.uid` files that Godot creates next to tracked files.
10. **Report** every change to the owner with the pull request link, then steer back to the next task in PLAN.md.

## Definition of done

- [ ] The task's "Done when" conditions in PLAN.md hold
- [ ] Tests added or updated; full suite passes; headless smoke run shows no errors
- [ ] ARCHITECTURE.md rules respected (notably A1, A3, A5, A7)
- [ ] Staged diff reviewed for secrets
- [ ] PLAN.md (task state, Next up) and CHANGELOG.md updated; FEATURES.md registry and detail section updated if a feature shipped or changed
- [ ] `VERSION` and `project.godot` bumped once
- [ ] Pull request opened; link given to the owner

## Pitfalls already met

- Editing `project.godot` with a script: read the file fully before opening it for writing. A truncated `project.godot` makes `GameVersion.current()` return `0.0.0` and the version test fail.
- `gh pr ...` commands may be blocked in a Claude session while the REST API works: use `gh api repos/Edemkee/townlife/pulls` (POST to create).
- A shallow clone may lack `origin/main`: fetch it with `git fetch --depth=50 origin '+refs/heads/main:refs/remotes/origin/main'`.
- GdUnit4 needs `--ignoreHeadlessMode` when run with `--headless`.

# Operative decisions

Newest at the top. Each entry: date, decision, reason.

| Date | Decision | Reason |
|---|---|---|
| 2026-11-17 | Milestones are named M1 to M12 instead of by version number. | Every pull request raises the version, so a milestone spans several minor versions and "milestone 0.5" would not match v0.5.0. |
| 2026-11-17 | PLAN.md holds PR-sized task specs with "Done when" conditions; GDD rules carry stable IDs and a status (DECIDED, ASSUMED, PROPOSED, OPEN); ARCHITECTURE.md holds numbered rules; FEATURES.md holds a registry. | Owner asked for the documents to be reworked so another model can pick up tasks without the original conversation. |
| 2026-11-16 | Characters are miniature-style models moved by code (tweens and procedural motion), with no skeletons or animation clips. Islands are built as tabletop dioramas. | Owner chose to try the diorama look; it also fits script-generated models, which cannot easily be rigged. Review at the M5 prototype gate. |
| 2026-11-16 | Prototype art is made by Claude as low-poly models generated by scripts in `tools/art` that write `.glb` files into `assets/models`. Until the first models land, scenes use Godot primitive meshes. | Owner asked for Claude-made art "through Blender or something like that" for the prototype. Blender is not installed in the Claude session and cannot be installed there, so models are generated in code. Revisit if the owner runs Blender locally or art is contracted. |
| 2026-11-16 | Art direction: low-poly 3D, fixed three-quarter camera. | Owner's choice over the 2D recommendation. |
| 2026-11-16 | Renderer: Forward+. | Desktop and Steam Deck target; best 3D lighting and shadows. Switch to Mobile renderer only if Deck performance requires it. |
| 2026-11-16 | Tests: GdUnit4 v6.2.3, vendored in `addons/gdUnit4` without its own `test/` folder. Run headless with `--ignoreHeadlessMode`. | Supports Godot 4.7; vendoring keeps CI and local runs identical with no download step. |
| 2026-11-16 | CI downloads the Godot binary pinned by `GODOT_VERSION` in `.github/workflows/ci.yml` (currently 4.7.2-stable). | Reproducible test runs. Bump it together with the engine version used locally. |
| 2026-11-16 | Simulation (economy, AI, combat) will run on a fixed tick, separate from rendering, in `src/core`. | Game-speed controls, deterministic tests, cheap saves. |
| 2026-11-16 | Tech stack: Godot 4.7, typed GDScript, data in Godot Resources, JSON saves, GodotSteam GDExtension for Steam. | Steam target, free engine with no royalties, fast iteration; owner confirmed. Changing the stack is raised with the owner first. |
| 2026-11-16 | Commits and PRs carry no Claude session link. | Workflow rule. |
| 2026-11-16 | Claude project: "Town Life" in the Claude app holds the chat, artifacts and an overview doc (`claude/overview.md`). | Session is attached to that project. |
| 2026-11-16 | Project size: larger. All documents and CI from the start. | Steam release with a multi-level campaign. |
| 2026-11-16 | Repository: `Edemkee/townlife`, default branch `main`. Every change after the initial commit goes through a pull request; merging is left to the owner. | Workflow rule. |
