#!/bin/bash

# Destroy Sync to Saves Script
# Syncs changes from repository to Minecraft saves folder

set -e

# Configuration file
DEV_CONFIG_FILE=".dev-config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Load development configuration
load_dev_config() {
    if [ ! -f "$DEV_CONFIG_FILE" ]; then
        log_error "Development configuration not found!"
        log_error "Please run './scripts/setup-dev.sh' first to set up the development environment."
        exit 1
    fi

    # Source the configuration file
    source "$DEV_CONFIG_FILE"

    # Verify required variables are set
    if [ -z "$DEV_WORLD_PATH" ] || [ -z "$DATAPACKS_DIR" ] || [ -z "$WORLD_TEMPLATE" ]; then
        log_error "Invalid development configuration. Please run './scripts/setup-dev.sh' again."
        exit 1
    fi

    # Check if dev world exists
    if [ ! -d "$DEV_WORLD_PATH" ]; then
        log_error "Development world not found: $DEV_WORLD_PATH"
        log_error "Please run './scripts/setup-dev.sh' again to recreate the development environment."
        exit 1
    fi

    log_info "Using development world: $DEV_WORLD_PATH"
}

# Sync datapacks from repo to saves
sync_datapacks_to_saves() {
    log_info "Syncing datapacks from repo to saves..."

    # Ensure datapacks directory exists in saves
    mkdir -p "$DEV_WORLD_PATH/datapacks"

    # Remove existing datapacks in saves
    if [ -d "$DEV_WORLD_PATH/datapacks" ]; then
        rm -rf "${DEV_WORLD_PATH}/datapacks"/*
        log_info "Cleared existing datapacks from saves"
    fi

    # Copy datapacks from repo to saves
    local pack_count=0
    if [ -d "$DATAPACKS_DIR" ]; then
        for item in "$DATAPACKS_DIR"/*; do
            if [ -d "$item" ]; then
                # Copy directory datapacks
                cp -r "$item" "$DEV_WORLD_PATH/datapacks/"
                log_info "Synced datapack directory: $(basename "$item")"
                pack_count=$((pack_count + 1))
            elif [ -f "$item" ] && [[ "$item" == *.zip ]]; then
                # Copy zip datapacks
                cp "$item" "$DEV_WORLD_PATH/datapacks/"
                log_info "Synced datapack zip: $(basename "$item")"
                pack_count=$((pack_count + 1))
            fi
        done
    fi

    if [ $pack_count -eq 0 ]; then
        log_warning "No datapacks found in $DATAPACKS_DIR"
    else
        log_success "Synced $pack_count datapacks to saves"
    fi
}

# Sync world template from repo to saves
sync_world_to_saves() {
    log_info "Syncing world template from repo to saves..."

    if [ ! -d "$WORLD_TEMPLATE" ]; then
        log_error "World template directory not found: $WORLD_TEMPLATE"
        exit 1
    fi

    # List of files/folders to sync from world template
    local world_items=("data" "entities" "generated" "playerdata" "region" "icon.png" "level.dat")

    for item in "${world_items[@]}"; do
        local src_path="$WORLD_TEMPLATE/$item"
        local dest_path="$DEV_WORLD_PATH/$item"

        if [ -e "$src_path" ]; then
            # Remove existing item in saves
            if [ -e "$dest_path" ]; then
                rm -rf "$dest_path"
            fi

            # Copy from repo to saves
            cp -r "$src_path" "$dest_path"
            log_info "Synced world item: $item"
        else
            log_warning "World template item not found: $item"
        fi
    done

    log_success "World template synced to saves"
}

# Show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Syncs changes from repository to Minecraft saves folder."
    echo ""
    echo "Options:"
    echo "  --datapacks       Sync only datapacks (default)"
    echo "  --world           Sync only world template"
    echo "  --all             Sync both datapacks and world template"
    echo "  --help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                      # Sync datapacks only"
    echo "  $0 --datapacks          # Sync datapacks only"
    echo "  $0 --world              # Sync world template only"
    echo "  $0 --all                # Sync everything"
}

# Main execution
main() {
    local sync_datapacks=false
    local sync_world=false

    # Parse arguments
    case "${1:-}" in
        --datapacks|"")
            sync_datapacks=true
            ;;
        --world)
            sync_world=true
            ;;
        --all)
            sync_datapacks=true
            sync_world=true
            ;;
        --help)
            show_usage
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac

    echo -e "${GREEN}Destroy: Sync to Saves${NC}"
    echo "========================"
    echo ""

    load_dev_config

    if [ "$sync_datapacks" = true ]; then
        sync_datapacks_to_saves
    fi

    if [ "$sync_world" = true ]; then
        sync_world_to_saves
    fi

    echo ""
    log_success "Sync to saves complete!"
    
    if [ "$sync_datapacks" = true ]; then
        echo "Remember to run '/reload' in-game to apply datapack changes."
    fi
    
    if [ "$sync_world" = true ]; then
        echo "World changes require restarting the world to take effect."
    fi
}

main "$@"