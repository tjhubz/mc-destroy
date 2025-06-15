#!/bin/bash
# Quick script to reload datapacks in development world

DEV_WORLD_NAME="Destroy-dev"
MINECRAFT_SAVES_DIR="$HOME/.minecraft/saves"
DATAPACKS_DIR="datapacks"

# Find Minecraft saves directory
for path in "$HOME/.minecraft/saves" "$HOME/Library/Application Support/minecraft/saves"; do
    if [ -d "$path" ]; then
        MINECRAFT_SAVES_DIR="$path"
        break
    fi
done

DEV_WORLD_PATH="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"

if [ ! -d "$DEV_WORLD_PATH" ]; then
    echo "Development world not found. Run ./scripts/setup-dev.sh first"
    exit 1
fi

echo "Reloading datapacks in development world..."

# Remove old datapacks
rm -rf "$DEV_WORLD_PATH/datapacks"/*

# Copy current datapacks
for item in "$DATAPACKS_DIR"/*; do
    if [ -d "$item" ] || [[ "$item" == *.zip ]]; then
        cp -r "$item" "$DEV_WORLD_PATH/datapacks/"
        echo "Reloaded: $(basename "$item")"
    fi
done

echo "Datapacks reloaded! Restart your world or run '/reload' in-game"
