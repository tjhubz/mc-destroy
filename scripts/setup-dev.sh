#!/bin/bash

# Destroy Developer Setup Script
# Sets up development environment for contributors

set -e

# Configuration
DEV_WORLD_NAME="Destroy-dev"
MINECRAFT_SAVES_DIR="$HOME/.minecraft/saves"
WORLD_TEMPLATE="world-template"
DATAPACKS_DIR="datapacks"
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

# Create development scripts and copy to saves folder
create_dev_scripts() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    local scripts_dir="$dev_world_path/.dev-scripts"
    
    log_info "Setting up development scripts in saves folder..."
    
    # Create scripts directory in the development world
    mkdir -p "$scripts_dir"
    
    # Copy sync scripts to the development world (exclude setup and build scripts)
    for script in scripts/*; do
        script_name=$(basename "$script")
        if [[ "$script_name" != "setup-dev.sh" && "$script_name" != "build.sh" ]]; then
            cp -r "$script" "$scripts_dir/"
        fi
    done
    
    # Create a sync script that knows the repo location
    cat > "$scripts_dir/sync-to-repo.sh" << EOF
#!/bin/bash
# Sync changes from saves back to repository
# This script is auto-generated and knows the repo location

set -e

REPO_PATH="$(pwd)"
SAVES_PATH="$dev_world_path"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() { echo -e "\${BLUE}[INFO]\${NC} \$1"; }
log_success() { echo -e "\${GREEN}[SUCCESS]\${NC} \$1"; }
log_warning() { echo -e "\${YELLOW}[WARNING]\${NC} \$1"; }
log_error() { echo -e "\${RED}[ERROR]\${NC} \$1"; }

echo -e "\${GREEN}Sync from Saves to Repository\${NC}"
echo "=============================="
echo ""

# Change to repo directory and run sync-from-saves
cd "\$REPO_PATH"
./scripts/sync-from-saves.sh "\$@"

log_success "Sync complete! Changes saved to repository."
EOF

    # Create a sync script that pulls from repo
    cat > "$scripts_dir/sync-from-repo.sh" << EOF
#!/bin/bash
# Sync changes from repository to saves
# This script is auto-generated and knows the repo location

set -e

REPO_PATH="$(pwd)"
SAVES_PATH="$dev_world_path"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() { echo -e "\${BLUE}[INFO]\${NC} \$1"; }
log_success() { echo -e "\${GREEN}[SUCCESS]\${NC} \$1"; }
log_warning() { echo -e "\${YELLOW}[WARNING]\${NC} \$1"; }
log_error() { echo -e "\${RED}[ERROR]\${NC} \$1"; }

echo -e "\${GREEN}Sync from Repository to Saves\${NC}"
echo "=============================="
echo ""

# Change to repo directory and run sync-to-saves
cd "\$REPO_PATH"
./scripts/sync-to-saves.sh "\$@"

log_success "Sync complete! Repository changes applied to saves."
EOF

    # Create a build/validate script
    cat > "$scripts_dir/validate-build.sh" << EOF
#!/bin/bash
# Validate and build from saves location
# This script is auto-generated and knows the repo location

set -e

REPO_PATH="$(pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() { echo -e "\${BLUE}[INFO]\${NC} \$1"; }
log_success() { echo -e "\${GREEN}[SUCCESS]\${NC} \$1"; }

echo -e "\${GREEN}Validate and Build\${NC}"
echo "=================="
echo ""

# First sync changes to repo
log_info "Syncing current changes to repository..."
cd "\$REPO_PATH"
./scripts/sync-from-saves.sh

# Then validate
log_info "Validating datapacks..."
./scripts/build.sh --validate-only

# Optionally run full build
if [[ "\$1" == "--full-build" ]]; then
    log_info "Running full build..."
    ./scripts/build.sh
fi

log_success "Validation complete!"
EOF

    # Make scripts executable
    chmod +x "$scripts_dir"/*.sh
    
    # Create a VS Code workspace file
    cat > "$dev_world_path/destroy-dev.code-workspace" << EOF
{
    "folders": [
        {
            "name": "Datapacks",
            "path": "./datapacks"
        },
        {
            "name": "World Data",
            "path": "./data"
        },
        {
            "name": "Dev Scripts",
            "path": "./.dev-scripts"
        }
    ],
    "settings": {
        "files.associations": {
            "*.mcfunction": "mcfunction",
            "*.mcmeta": "json"
        },
        "terminal.integrated.cwd": "\${workspaceFolder:Dev Scripts}"
    },
    "tasks": {
        "version": "2.0.0",
        "tasks": [
            {
                "label": "Sync to Repository",
                "type": "shell",
                "command": "./sync-to-repo.sh",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared"
                },
                "options": {
                    "cwd": "\${workspaceFolder:Dev Scripts}"
                }
            },
            {
                "label": "Sync from Repository",
                "type": "shell",
                "command": "./sync-from-repo.sh",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared"
                },
                "options": {
                    "cwd": "\${workspaceFolder:Dev Scripts}"
                }
            },
            {
                "label": "Validate Datapacks",
                "type": "shell",
                "command": "./validate-build.sh",
                "group": {
                    "kind": "build",
                    "isDefault": true
                },
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared"
                },
                "options": {
                    "cwd": "\${workspaceFolder:Dev Scripts}"
                }
            },
            {
                "label": "Full Build Test",
                "type": "shell",
                "command": "./validate-build.sh --full-build",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared"
                },
                "options": {
                    "cwd": "\${workspaceFolder:Dev Scripts}"
                }
            }
        ]
    },
    "extensions": {
        "recommendations": [
            "SPGoding.datapack-language-server",
            "arcensoth.language-mcfunction",
            "Levertion.mcjson"
        ]
    }
}
EOF

    # Create a README for the development environment
    cat > "$dev_world_path/DEV-README.md" << EOF
# 🎮 Destroy Development Environment

This is your development world for the Destroy Minecraft map project.

## 📁 Folder Structure

- **datapacks/** - Edit datapacks here directly
- **data/** - World data (usually don't edit directly)
- **.dev-scripts/** - Development scripts for syncing with repository
- **destroy-dev.code-workspace** - VS Code workspace file

## 🚀 Quick Start

### Option 1: VS Code Workspace (Recommended)
1. Open **destroy-dev.code-workspace** in VS Code
2. This gives you organized folders and built-in tasks
3. Use Ctrl/Cmd+Shift+P → "Tasks: Run Task" to access sync commands

### Option 2: Terminal Commands
Navigate to the **.dev-scripts/** folder and run:

\`\`\`bash
# Save your changes to the repository
./sync-to-repo.sh

# Get latest changes from repository  
./sync-from-repo.sh

# Validate your changes
./validate-build.sh

# Full build test
./validate-build.sh --full-build
\`\`\`

## 🔄 Development Workflow

1. **Edit datapacks** directly in the datapacks/ folder
2. **Test in Minecraft** - changes are immediately available
3. **Sync to repository** when ready to save your work
4. **Validate** before committing to ensure everything works

## 💡 Pro Tips

- Work directly in this folder - no need to edit repository files
- Use the VS Code workspace for the best experience
- Sync frequently to avoid losing work
- Always validate before committing changes

## 📍 Repository Location

Your repository is located at: $(pwd)

---
*This development environment was created by setup-dev.sh*
EOF

    log_success "Development scripts and workspace configured"
}

# Save development configuration
save_dev_config() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    
    log_info "Saving development configuration..."
    
    cat > "$DEV_CONFIG_FILE" << EOF
# Destroy Development Configuration
# This file is generated by setup-dev.sh and used by sync scripts
# Do not edit manually

DEV_WORLD_NAME="$DEV_WORLD_NAME"
MINECRAFT_SAVES_DIR="$MINECRAFT_SAVES_DIR"
DEV_WORLD_PATH="$dev_world_path"
WORLD_TEMPLATE="$WORLD_TEMPLATE"
DATAPACKS_DIR="$DATAPACKS_DIR"
SETUP_DATE="$(date)"
EOF

    log_success "Development configuration saved to $DEV_CONFIG_FILE"
}

# Show next steps
show_next_steps() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    
    echo ""
    log_success "Development environment setup complete!"
    echo ""
    echo -e "${GREEN}🎯 Your Development Workspace:${NC}"
    echo -e "${BLUE}$dev_world_path${NC}"
    echo ""
    echo -e "${GREEN}🚀 Getting Started (Choose One):${NC}"
    echo ""
    echo -e "${YELLOW}Option 1: VS Code Workspace (Recommended)${NC}"
    echo "1. Open VS Code"
    echo "2. File → Open Workspace from File"
    echo "3. Navigate to: $dev_world_path/destroy-dev.code-workspace"
    echo "4. Use Ctrl/Cmd+Shift+P → 'Tasks: Run Task' for sync commands"
    echo ""
    echo -e "${YELLOW}Option 2: Terminal/IDE of Choice${NC}"
    echo "1. Open your IDE and navigate to: $dev_world_path"
    echo "2. Edit datapacks in the datapacks/ folder"
    echo "3. Use scripts in .dev-scripts/ folder for syncing"
    echo ""
    echo -e "${GREEN}🔄 Development Workflow:${NC}"
    echo "1. Edit datapacks directly in the saves folder"
    echo "2. Test immediately in Minecraft (world: $DEV_WORLD_NAME)"
    echo "3. Run sync scripts to save work back to repository"
    echo "4. Validate and commit when ready"
    echo ""
    echo -e "${BLUE}📁 Key Locations:${NC}"
    echo "  Datapacks:     $dev_world_path/datapacks/"
    echo "  Dev Scripts:   $dev_world_path/.dev-scripts/"
    echo "  VS Code File:  $dev_world_path/destroy-dev.code-workspace"
    echo "  Instructions:  $dev_world_path/DEV-README.md"
    echo ""
    echo -e "${BLUE}🛠️ Available Scripts (from .dev-scripts/ folder):${NC}"
    echo "  ./sync-to-repo.sh              # Save changes to repository"
    echo "  ./sync-from-repo.sh            # Get latest from repository"
    echo "  ./validate-build.sh            # Validate your changes"
    echo "  ./validate-build.sh --full-build  # Full build test"
    echo ""
    echo -e "${GREEN}💡 Pro Tip:${NC} Open the VS Code workspace for the best development experience!"
    echo ""
}

# Main execution
main() {
    echo -e "${GREEN}Destroy Development Environment Setup${NC}"
    echo "========================================"
    echo ""

    check_prerequisites
    detect_minecraft
    create_dev_world
    setup_git_hooks
    create_dev_scripts
    save_dev_config
    show_next_steps
}

main "$@"