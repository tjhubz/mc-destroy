# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

TNT Wars (Destroy) is a team-based TNT combat minigame for Minecraft Java Edition implemented as a Minecraft datapack. Players battle across floating islands in 4-team explosive warfare, protecting their sheep while attempting to eliminate enemy teams.

## Development Workflow

### Initial Setup

Run the setup script to configure your development environment:
```bash
./scripts/setup-dev.sh
```

This creates:
- A development world (`Destroy-dev`) in your Minecraft saves folder
- A `.dev-config` file with paths to development environment
- A VS Code workspace file (`destroy-dev.code-workspace`) for unified development

### Working with the Development Environment

The project uses a unified development workflow where you edit datapacks directly in the Minecraft saves folder, then sync changes back to the repository.

**Development cycle:**
1. Edit datapacks in the live Minecraft world (`Destroy-dev/datapacks/`)
2. Test changes in-game using `/reload` command
3. Sync changes back to repository using save scripts
4. Commit and push using normal git workflow

### Common Development Commands

**Sync datapacks from repo to Minecraft saves:**
```bash
./scripts/sync-to-saves.sh              # Sync datapacks only
./scripts/sync-to-saves.sh --world      # Sync world template only
./scripts/sync-to-saves.sh --all        # Sync both
```

**Sync changes from saves back to repo:**
```bash
./scripts/sync-from-saves.sh            # Sync datapacks only
./scripts/sync-from-saves.sh --world    # Sync world template only
./scripts/sync-from-saves.sh --all      # Sync both
```

**Build release package:**
```bash
./scripts/build.sh                      # Create distributable world package
./scripts/build.sh --validate-only      # Validate datapacks without building
```

**In-game testing:**
```
/reload                                 # Reload datapacks after changes
```

## Architecture

### Datapack Structure

The project contains multiple datapacks in the `datapacks/` directory:

**Main Datapack (`datapacks/server/`):**
- `data/main/function/core.mcfunction` - Entry point, calls main server functions
- `data/main/function/load.mcfunction` - Initialization (teams, scoreboards, forceload chunks)
- `data/main/function/server/` - Server-level systems (lobby, tutorial, credits)
- `data/main/function/tntwars/` - TNT Wars game mechanics
- `pack.mcmeta` - Pack metadata (format: 71 for recent Minecraft versions)

**Supporting Datapacks:**
- `command_helper/` - Player command assistance system
- `attribute_reset.zip` - Attribute management
- `effect_overflow.zip` - Effect handling
- `lock_fixer.zip` - Lock management
- `unwaterloggable_leaves.zip` - Block behavior modification

### TNT Wars Game System

The TNT Wars game is organized into logical modules under `data/main/function/tntwars/`:

**Core Game Flow:**
- `game/starting.mcfunction` - Countdown and preparation
- `game/start.mcfunction` - Initialize match (scoreboards, teams, sheep spawning)
- `game/tick.mcfunction` - Main game loop (runs every second via schedule function)
- `game/active.mcfunction` - Per-tick game logic during active match
- `game/end.mcfunction` - Match conclusion logic
- `game/eliminate.mcfunction` - Team elimination handling

**Game Subsystems:**
- `teams/` - Team joining, assignment, and management
- `map/` - Map selection, borders, bridges
- `settings/` - Game configuration and presets
- `util/` - Utility functions (inventory, spawning, death handling)
- `game/deathmatch/` - Endgame mechanics (chicken rain, rocket launcher)

### Key Game Mechanics

**Team System:**
- Four teams: red, blue, yellow, white (defined in `load.mcfunction`)
- Each team has spawn points marked by armor stands with tags like `redSpawn`, `blueSpawn`
- Teams use Minecraft's native team system with collision rules and friendly fire settings

**Sheep Protection Objective:**
- Each team has sheep that must be protected
- Sheep are summoned at game start and tagged by team color
- Team elimination occurs when sheep are killed (checked in `game/active.mcfunction`)
- Anti-friendly-fire prevents teams from damaging their own sheep

**TNT Combat System:**
- TNT is tagged by team color when placed (`tag_tnt` function)
- Anti-team-grief prevents TNT from damaging own island (checked via spawn point boundaries)
- TNT explosions are neutralized if in water or on own team's island
- Build period disables TNT activation

**Player Death & Respawn:**
- Death detection via `dead` scoreboard objective
- Configurable respawn modes (instant, timed, elimination)
- Spectator mode during respawn cooldown
- Spawnpoint management via `util/spawnpoint.mcfunction`

**Game Timer System:**
- `tntwars_timer` global scoreboard tracks game time in seconds
- `game/tick.mcfunction` scheduled every second using `schedule function`
- Build period, deathmatch, and match limit all time-based via this timer
- Boss bars display time remaining

### Scoreboard System

The game relies heavily on Minecraft scoreboards for state management:

**Global Scoreboards:**
- `global` - Primary game state (timer, team counts, active match flags)
- `settings` - Game configuration values
- `game_id` - Match identification
- `temp` - Temporary calculations

**Player Scoreboards:**
- `dead` - Death detection trigger
- `death` - Respawn timer countdown
- `sheep` - Sheep kill tracking

**Common Patterns:**
```mcfunction
# Check setting value
execute if score *setting_name settings matches 1.. run <command>

# Store count in scoreboard
execute store result score variable_name global if entity <selector>

# Timer comparison
execute if score tntwars_timer global < *match_limit_s settings run <command>
```

### Entity Tags & Selectors

**Critical Entity Tags:**
- `tntwars` - Players in active match
- `queue` - Players in queue/lobby
- `alive` - Players currently alive in match
- `exit` - Players who left their spawn island
- `active` - Active team spawn points
- `sheep` - Spawn points that still have sheep alive

**Spawn Point Armor Stands:**
- Tagged with team color: `redSpawn`, `blueSpawn`, `yellowSpawn`, `whiteSpawn`
- Tagged `spawn` for all spawn points
- Tagged `active` when team is still in the game
- Tagged `sheep` when team's sheep is still alive

**Area Detection:**
Spawn islands are detected using positioned bounding boxes:
```mcfunction
positioned ~-25 0 ~-25 run <command with dx=50,dy=32,dz=50>
```
This creates a 50x32x50 block detection area centered on spawn points.

## Important Conventions

### Datapack Standards

**Naming Conventions:**
- Functions: `snake_case.mcfunction`
- Namespaces: `lowercase_underscores` (main namespace is `main`)
- Scoreboards: `*prefix` for settings, regular names for counters

**Function Organization:**
- Use subdirectories to group related functions
- Private/internal functions go in `zprivate/` subdirectories
- Each major system (tntwars, server, tutorial) has its own directory

**Performance Considerations:**
- Minimize tick-based operations (use `schedule function` instead of always-running tick functions)
- Use entity selectors efficiently (limit selector scope with distance, tags, and bounding boxes)
- Avoid nested `execute` chains when possible
- Use `return` statement at end of functions (Minecraft 1.20+)

### Git Workflow

**Commit Message Format:**
Use conventional commit format for automatic versioning:
```
type(scope): description

Examples:
feat(combat): add new weapon mechanics
fix(spawn): resolve respawn location bug
docs(readme): update installation instructions
refactor(teleport): optimize teleportation logic
```

**Release Triggers:**
Releases are automatically triggered only when these directories are modified:
- `datapacks/` - Game mechanics changes
- `world-template/` - World structure changes

Documentation and script changes do NOT trigger releases.

## Testing

### Local Testing Process

1. Make changes to datapacks in repository or live saves folder
2. If editing in repository, sync to saves: `./scripts/sync-to-saves.sh`
3. Launch Minecraft and open the `Destroy-dev` world
4. Run `/reload` in-game to apply datapack changes
5. Test functionality thoroughly (single-player and multiplayer if applicable)
6. Check for console errors in-game (`F3` console)

### Testing Checklist for Game Changes

- Build period mechanics work correctly
- Team assignment and spawn points function
- Sheep spawning and protection works
- TNT tagging by team operates properly
- Anti-team-grief prevents friendly damage
- Death and respawn system functions
- Game timer and boss bars display correctly
- Elimination and win conditions trigger appropriately
- Map-specific features work (bridges, borders, etc.)

### Validation Before Commit

Run build validation:
```bash
./scripts/build.sh --validate-only
```

This checks:
- Datapack structure is valid
- `pack.mcmeta` files exist
- No obvious structural issues

## File Structure Reference

```
mc-destroy/
├── datapacks/                 # All game datapacks
│   ├── server/               # Main TNT Wars datapack
│   │   └── data/main/
│   │       ├── function/     # Game functions
│   │       │   ├── core.mcfunction
│   │       │   ├── load.mcfunction
│   │       │   ├── server/   # Server systems
│   │       │   └── tntwars/  # Game mechanics
│   │       ├── predicate/    # Game predicates
│   │       └── tags/         # Block/function tags
│   └── command_helper/       # Helper datapack
├── world-template/           # Base world structure
├── scripts/                  # Development scripts
│   ├── setup-dev.sh         # Initial setup
│   ├── sync-to-saves.sh     # Repo → Saves
│   ├── sync-from-saves.sh   # Saves → Repo
│   └── build.sh             # Release builder
└── .dev-config              # Generated dev paths
```

## Common Development Tasks

### Adding a New Game Feature

1. Identify the appropriate function directory under `data/main/function/tntwars/`
2. Create new `.mcfunction` file(s) following naming conventions
3. Integrate into game loop via `game/active.mcfunction` or `game/tick.mcfunction`
4. Add any required scoreboards in `load.mcfunction` or `game/start.mcfunction`
5. Test thoroughly using the development workflow
6. Document any new settings or configuration options

### Modifying Game Settings

Settings are stored in the `settings` scoreboard and prefixed with `*`:
- Define in `settings/` functions or presets
- Reference throughout code: `execute if score *setting_name settings matches <value>`
- Settings typically have corresponding `_s` (seconds) or `_t` (ticks) variants

### Adding a New Map

1. Build the map in `world-template/`
2. Add spawn point armor stands with appropriate tags
3. Create map initialization function in `map/`
4. Add map selection option in `settings/map/`
5. Configure borders, bridges, and map-specific mechanics
6. Test all team spawn points and boundaries

### Debugging In-Game

Use these Minecraft debugging techniques:
- `/scoreboard objectives setdisplay sidebar <objective>` - Display scoreboard values
- `/tag @s add <tag>` - Manually add tags for testing
- `/data get entity @s` - Inspect entity data
- Check entity count: `/execute store result score count temp if entity @e[tag=...]`
- F3 screen shows current position, entity count, and debug info
