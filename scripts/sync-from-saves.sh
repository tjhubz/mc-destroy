#!/bin/bash

# Destroy Sync from Saves Script
# Syncs changes from Minecraft saves folder back to repository

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

# Sync datapacks from saves to repo
sync_datapacks_from_saves() {
    log_info "Syncing datapacks from saves to repo..."

    local saves_datapacks_dir="$DEV_WORLD_PATH/datapacks"
    
    if [ ! -d "$saves_datapacks_dir" ]; then
        log_warning "No datapacks directory found in saves: $saves_datapacks_dir"
        return
    fi

    # Ensure repo datapacks directory exists
    mkdir -p "$DATAPACKS_DIR"

    # Remove existing datapacks in repo (we'll replace them completely)
    if [ -d "$DATAPACKS_DIR" ]; then
        rm -rf "${DATAPACKS_DIR}"/*
        log_info "Cleared existing datapacks from repo"
    fi

    # Copy datapacks from saves to repo
    local pack_count=0
    for item in "$saves_datapacks_dir"/*; do
        if [ -e "$item" ]; then
            # Get the basename for the item
            local item_name=$(basename "$item")
            
            # Copy the item (directory or file)
            cp -r "$item" "$DATAPACKS_DIR/"
            
            if [ -d "$item" ]; then
                log_info "Synced datapack directory: $item_name"
            else
                log_info "Synced datapack file: $item_name"
            fi
            pack_count=$((pack_count + 1))
        fi
    done

    if [ $pack_count -eq 0 ]; then
        log_warning "No datapacks found in saves"
    else
        log_success "Synced $pack_count datapacks from saves to repo"
    fi
}

# Sync world template from saves to repo
sync_world_from_saves() {
    log_info "Syncing world template from saves to repo..."

    # Ensure world template directory exists in repo
    mkdir -p "$WORLD_TEMPLATE"

    # List of files/folders to sync from saves (only the ones we want to preserve)
    local world_items=("data" "entities" "generated" "playerdata" "region" "icon.png" "level.dat")

    local synced_count=0
    for item in "${world_items[@]}"; do
        local src_path="$DEV_WORLD_PATH/$item"
        local dest_path="$WORLD_TEMPLATE/$item"

        if [ -e "$src_path" ]; then
            # Remove existing item in repo
            if [ -e "$dest_path" ]; then
                rm -rf "$dest_path"
            fi

            # Copy from saves to repo
            cp -r "$src_path" "$dest_path"
            log_info "Synced world item: $item"
            synced_count=$((synced_count + 1))
        else
            log_warning "World item not found in saves: $item"
        fi
    done

    if [ $synced_count -gt 0 ]; then
        log_success "Synced $synced_count world items from saves to repo"
    else
        log_warning "No world items were synced"
    fi
}

# Show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Syncs changes from Minecraft saves folder back to repository."
    echo ""
    echo "Options:"
    echo "  (no options)      Sync only datapacks (default)"
    echo "  --world           Sync both datapacks and world template"
    echo "  --help            Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                      # Sync datapacks only"
    echo "  $0 --world              # Sync datapacks and world template"
    echo ""
    echo "Note: The world template sync only includes these files/folders:"
    echo "  - data/, entities/, generated/, playerdata/, region/"
    echo "  - icon.png, level.dat"
    echo ""
    echo "Other world files (like logs, session.lock) are ignored."
}

# Check for uncommitted changes
check_git_status() {
    if [ -d ".git" ]; then
        if ! git diff --quiet --cached; then
            log_warning "You have staged changes in git. Syncing will modify repository files."
            echo "Continue anyway? [y/N]"
            read -r response
            if [[ ! "$response" =~ ^[Yy]$ ]]; then
                log_info "Sync cancelled by user"
                exit 0
            fi
        fi
    fi
}

# Main execution
main() {
    local sync_world=false

    # Parse arguments
    case "${1:-}" in
        "")
            # Default: sync datapacks only
            ;;
        --world)
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

    echo -e "${GREEN}Destroy: Sync from Saves${NC}"
    echo "=========================="
    echo ""

    load_dev_config
    check_git_status

    # Always sync datapacks
    sync_datapacks_from_saves

    if [ "$sync_world" = true ]; then
        sync_world_from_saves
    fi

    echo ""
    log_success "Sync from saves complete!"
    
    if [ -d ".git" ]; then
        echo ""
        echo "Next steps:"
        echo "1. Review your changes: git status"
        echo "2. Test the build: ./scripts/build.sh --validate-only"
        echo "3. Commit your changes: git add . && git commit -m 'your message'"
    fi
}

main "$@"