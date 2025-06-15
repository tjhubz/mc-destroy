#!/bin/bash

# Destroy Build Script
# Builds the complete minigame package by integrating datapacks into world template

set -e

# Configuration
BUILD_DIR="build"
TEMP_DIR="temp_world"
WORLD_TEMPLATE="world-template"
DATAPACKS_DIR="datapacks"
VERSION=${GITHUB_RUN_NUMBER:-"dev"}

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

# Validate datapack structure
validate_datapacks() {
    log_info "Validating datapack structure..."
    
    if [ ! -d "$DATAPACKS_DIR" ]; then
        log_error "Datapacks directory not found: $DATAPACKS_DIR"
        exit 1
    fi

    local pack_count=0
    
    # Use find instead of shell globbing for better reliability
    while IFS= read -r -d '' item; do
        if [ -d "$item" ]; then
            # Check for pack.mcmeta in directory
            if [ -f "$item/pack.mcmeta" ]; then
                log_info "Found valid datapack directory: $(basename "$item")"
                pack_count=$((pack_count + 1))
            else
                log_warning "Directory missing pack.mcmeta: $(basename "$item")"
            fi
        elif [ -f "$item" ] && [[ "$item" == *.zip ]]; then
            log_info "Found datapack zip: $(basename "$item")"
            pack_count=$((pack_count + 1))
        fi
    done < <(find "$DATAPACKS_DIR" -maxdepth 1 -mindepth 1 -print0)

    if [ $pack_count -eq 0 ]; then
        log_error "No valid datapacks found!"
        exit 1
    fi

    log_success "Validation complete: $pack_count datapacks found"
}

# Create world template if it doesn't exist
create_default_world_template() {
    if [ ! -d "$WORLD_TEMPLATE" ]; then
        log_warning "World template not found, creating default..."
        mkdir -p "$WORLD_TEMPLATE"
        
        # Create basic world structure
        mkdir -p "$WORLD_TEMPLATE/datapacks"
        
        # Create a basic level.dat (you might want to provide a proper template)
        cat > "$WORLD_TEMPLATE/level.dat" << 'EOF'
# This is a placeholder - replace with actual Minecraft world data
# The world template should contain a properly formatted Minecraft world
EOF
        
        log_info "Created basic world template structure"
        log_warning "Please replace world-template/ with a proper Minecraft world"
    fi
}

# Main build function
build_package() {
    log_info "Starting build process for Destroy v$VERSION"

    # Clean previous builds
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
    fi
    mkdir -p "$BUILD_DIR"

    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi

    # Create temporary world copy
    log_info "Creating temporary world copy..."
    cp -r "$WORLD_TEMPLATE" "$TEMP_DIR"

    # Ensure datapacks directory exists in temp world
    mkdir -p "$TEMP_DIR/datapacks"

    # Copy datapacks to temporary world
    log_info "Integrating datapacks..."
    while IFS= read -r -d '' item; do
        if [ -d "$item" ]; then
            # Copy directory datapacks
            cp -r "$item" "$TEMP_DIR/datapacks/"
            log_info "Copied datapack directory: $(basename "$item")"
        elif [ -f "$item" ] && [[ "$item" == *.zip ]]; then
            # Copy zip datapacks
            cp "$item" "$TEMP_DIR/datapacks/"
            log_info "Copied datapack zip: $(basename "$item")"
        fi
    done < <(find "$DATAPACKS_DIR" -maxdepth 1 -mindepth 1 -print0)

    # Create the final package
    local package_name="Destroy-v$VERSION.zip"
    log_info "Creating package: $package_name"
    
    cd "$TEMP_DIR"
    zip -r "../$BUILD_DIR/$package_name" . -x "*.DS_Store" "*/.git/*" "*/.*"
    cd ..

    # Generate checksums
    cd "$BUILD_DIR"
    sha256sum "$package_name" > "$package_name.sha256"
    cd ..

    # Calculate package size
    local size=$(du -h "$BUILD_DIR/$package_name" | cut -f1)
    
    # Cleanup temp directory
    rm -rf "$TEMP_DIR"

    log_success "Build complete!"
    log_info "Package: $BUILD_DIR/$package_name ($size)"
    log_info "Checksum: $BUILD_DIR/$package_name.sha256"
}

# Show usage
show_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --validate-only    Only validate datapacks, don't build"
    echo "  --help            Show this help message"
    echo ""
    echo "Environment Variables:"
    echo "  GITHUB_RUN_NUMBER  Set version number (default: 'dev')"
}

# Main execution
main() {
    case "${1:-}" in
        --validate-only)
            validate_datapacks
            exit 0
            ;;
        --help)
            show_usage
            exit 0
            ;;
        "")
            # Default behavior - full build
            validate_datapacks
            create_default_world_template
            build_package
            ;;
        *)
            log_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
    esac
}

main "$@"