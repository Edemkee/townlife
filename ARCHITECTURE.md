# Architecture

## Current state (v0.1.0)

A single boot scene and one helper class. Everything below "Planned" is the intended structure and is not built yet.

- `src/main/main.tscn` + `main.gd`: boot scene.
- `src/core/game_version.gd`: `GameVersion`, reads the version from project settings.
- `tests/`: GdUnit4 suites mirroring `src/`.
- `.github/workflows/ci.yml`: headless tests. `.github/workflows/tag-release.yml` + `scripts/tag_release.sh`: release tags.

## Planned structure

The guiding rule: the simulation knows nothing about rendering. It advances on a fixed tick and exposes state and signals; the presentation layer (3D scenes, UI, audio) reads that state and sends player commands back.

```mermaid
flowchart TD
    Input[Player input and UI] -->|commands: build, post bounty, upgrade| Sim

    subgraph Sim[Simulation, fixed tick, src/core]
        Clock[Tick clock and game speed]
        Economy[Economy: resources, workers, buildings]
        Bounties[Bounty board]
        Heroes[Hero AI: utility scoring]
        Combat[Combat and monsters]
        Territory[Territories and map]
        Kingdom[Kingdom demands and objectives]
        Clock --> Economy & Heroes & Combat & Kingdom
        Bounties --> Heroes
        Heroes --> Combat
        Combat --> Territory
        Economy --> Bounties
        Territory --> Kingdom
        Economy --> Kingdom
    end

    Data[(Data: Godot Resources for buildings, classes, monsters, levels)] --> Sim
    Sim -->|state and signals| View[Presentation: 3D scenes, animation, UI, audio]
    Sim <-->|versioned JSON| Saves[(Saves in user://, Steam Cloud)]
    Steam[GodotSteam: achievements, cloud] --- Saves
    Kingdom -->|level won or lost| Campaign[Campaign: level select, progression]
```

## Changes

- v0.1.0: initial structure.
