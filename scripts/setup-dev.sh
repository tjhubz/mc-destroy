#!/bin/bash

# MC-Destroy Developer Setup Script
# Sets up development environment for contributors

set -e

# Configuration
DEV_WORLD_NAME="mc-destroy-dev"
MINECRAFT_SAVES_DIR="$HOME/.minecraft/saves"
WORLD_TEMPLATE="world-template"
DATAPACKS_DIR="datapacks"

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

# Check prerequisites
check_prerequisites() {
    log_info "Checking prerequisites..."

    # Check if we're in the right directory
    if [ ! -f "scripts/setup-dev.sh" ]; then
        log_error "Please run this script from the root of the mc-destroy repository"
        exit 1
    fi

    # Check if datapacks directory exists
    if [ ! -d "$DATAPACKS_DIR" ]; then
        log_error "Datapacks directory not found: $DATAPACKS_DIR"
        exit 1
    fi

    log_success "Prerequisites check passed"
}

# Detect Minecraft installation
detect_minecraft() {
    log_info "Detecting Minecraft installation..."

    # Common Minecraft directories
    local possible_paths=(
        "$HOME/.minecraft/saves"
        "$HOME/Library/Application Support/minecraft/saves"  # macOS
        "$HOME/AppData/Roaming/.minecraft/saves"            # Windows (WSL/Git Bash)
        "/c/Users/$USER/AppData/Roaming/.minecraft/saves"   # Windows (Git Bash alt)
    )

    for path in "${possible_paths[@]}"; do
        if [ -d "$path" ]; then
            MINECRAFT_SAVES_DIR="$path"
            log_success "Found Minecraft saves directory: $MINECRAFT_SAVES_DIR"
            return 0
        fi
    done

    log_warning "Could not automatically detect Minecraft saves directory"
    echo "Please manually specify the path to your Minecraft saves folder:"
    read -r MINECRAFT_SAVES_DIR
    
    if [ ! -d "$MINECRAFT_SAVES_DIR" ]; then
        log_error "Directory does not exist: $MINECRAFT_SAVES_DIR"
        exit 1
    fi
}

# Create development world
create_dev_world() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    
    log_info "Creating development world..."

    # Remove existing dev world if it exists
    if [ -d "$dev_world_path" ]; then
        log_warning "Development world already exists, removing..."
        rm -rf "$dev_world_path"
    fi

    # Create base world from template
    if [ -d "$WORLD_TEMPLATE" ]; then
        cp -r "$WORLD_TEMPLATE" "$dev_world_path"
        log_info "Copied world template to development world"
    else
        log_warning "No world template found, creating basic structure..."
        mkdir -p "$dev_world_path/datapacks"
        
        # Create a placeholder level.dat
        cat > "$dev_world_path/level.dat" << 'EOF'
# Placeholder world data
# Replace with proper Minecraft world template
EOF
    fi

    # Ensure datapacks directory exists
    mkdir -p "$dev_world_path/datapacks"

    # Copy all datapacks to the development world
    log_info "Installing datapacks to development world..."
    for item in "$DATAPACKS_DIR"/*; do
        if [ -d "$item" ]; then
            # Copy directory datapacks
            cp -r "$item" "$dev_world_path/datapacks/"
            log_info "Installed datapack: $(basename "$item")"
        elif [ -f "$item" ] && [[ "$item" == *.zip ]]; then
            # Copy zip datapacks
            cp "$item" "$dev_world_path/datapacks/"
            log_info "Installed datapack: $(basename "$item")"
        fi
    done

    log_success "Development world created: $dev_world_path"
}

# Setup git hooks (optional)
setup_git_hooks() {
    log_info "Setting up git hooks..."

    # Pre-commit hook to validate datapacks
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
echo "Validating datapacks before commit..."
if ! ./scripts/build.sh --validate-only; then
    echo "Datapack validation failed! Please fix errors before committing."
    exit 1
fi
EOF

    chmod +x .git/hooks/pre-commit
    log_success "Git hooks configured"
}

# Create development scripts
create_dev_scripts() {
    log_info "Creating development helper scripts..."

    # Create reload script
    cat > scripts/reload-datapacks.sh << 'EOF'
#!/bin/bash
# Quick script to reload datapacks in development world

DEV_WORLD_NAME="mc-destroy-dev"
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
EOF

    chmod +x scripts/reload-datapacks.sh
    log_success "Development scripts created"
}

# Show next steps
show_next_steps() {
    echo ""
    log_success "Development environment setup complete!"
    echo ""
    echo -e "${GREEN}Next Steps:${NC}"
    echo "1. Launch Minecraft and open the world: $DEV_WORLD_NAME"
    echo "2. Make changes to datapacks in the 'datapacks/' directory"
    echo "3. Use './scripts/reload-datapacks.sh' to update the world"
    echo "4. Test your changes in-game"
    echo "5. Run './scripts/build.sh' to test the build process"
    echo "6. Commit and push your changes when ready"
    echo ""
    echo -e "${BLUE}Useful commands:${NC}"
    echo "  ./scripts/build.sh --validate-only  # Check datapack validity"
    echo "  ./scripts/reload-datapacks.sh       # Reload datapacks in dev world"
    echo "  ./scripts/build.sh                  # Test full build process"
    echo ""
}

# Main execution
main() {
    echo -e "${GREEN}MC-Destroy Development Environment Setup${NC}"
    echo "========================================"
    echo ""

    check_prerequisites
    detect_minecraft
    create_dev_world
    setup_git_hooks
    create_dev_scripts
    show_next_steps
}

main "$@"