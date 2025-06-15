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
    
    # Create the only two scripts developers actually need
    # Script 1: Save work to repository
    cat > "$scripts_dir/save-to-repo.sh" << EOF
#!/bin/bash
# Save your development work back to the repository
# This syncs datapacks from your development world to the git repository

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
log_warning() { echo -e "\${YELLOW}[WARNING]\${NC} \$1"; }

echo -e "\${GREEN}💾 Saving Your Work to Repository\${NC}"
echo "=================================="
echo ""

# Change to repo directory and run sync-from-saves
cd "\$REPO_PATH"

# Determine what to sync based on arguments
if [[ "\$1" == "--world" ]]; then
    log_info "Saving datapacks + world template to repository..."
    ./scripts/sync-from-saves.sh --world
else
    log_info "Saving datapacks to repository..."
    ./scripts/sync-from-saves.sh
fi

echo ""
log_success "✅ Your work has been saved to the repository!"
echo ""
echo "Next steps:"
echo "1. Review changes: git status"
echo "2. Commit: git add . && git commit -m 'your message'"
EOF

    # Script 2: Sync from repository 
    cat > "$scripts_dir/sync-from-repo.sh" << EOF
#!/bin/bash
# Get latest changes from repository to your development environment
# Use --all to reset everything (datapacks + world)

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
log_warning() { echo -e "\${YELLOW}[WARNING]\${NC} \$1"; }

echo -e "\${GREEN}🔄 Syncing from Repository\${NC}"
echo "=========================="
echo ""

cd "\$REPO_PATH"

# Get latest changes from repository
if [[ "\$1" == "--all" ]]; then
    log_info "Getting all changes from repository (datapacks + world)..."
    ./scripts/sync-to-saves.sh --all
else
    log_info "Getting datapack changes from repository..."
    ./scripts/sync-to-saves.sh
fi

echo ""
log_success "✅ Sync from repository complete!"
echo ""
echo "💡 Tip: Run '/reload' in Minecraft if you got datapack updates"
EOF

    # Make scripts executable
    chmod +x "$scripts_dir"/*.sh
    
    # Create a simple VS Code workspace file  
    cat > "$dev_world_path/destroy-dev.code-workspace" << EOF
{
    "folders": [
        {
            "name": "📦 Datapacks",
            "path": "./datapacks"
        },
        {
            "name": "🌍 World Data", 
            "path": "./data"
        },
        {
            "name": "⚡ Dev Scripts",
            "path": "./.dev-scripts"
        }
    ],
    "settings": {
        "files.associations": {
            "*.mcfunction": "mcfunction",
            "*.mcmeta": "json"
        },
        "terminal.integrated.cwd": "\${workspaceFolder:⚡ Dev Scripts}",
        "terminal.integrated.defaultProfile.linux": "bash",
        "terminal.integrated.defaultProfile.osx": "bash",
        "workbench.tree.indent": 20
    },
    "tasks": {
        "version": "2.0.0",
        "tasks": [
            {
                "label": "💾 Save Work to Repository",
                "type": "shell",
                "command": "./save-to-repo.sh",
                "group": {
                    "kind": "build",
                    "isDefault": true
                },
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:⚡ Dev Scripts}"
                }
            },
            {
                "label": "💾 Save Work + World to Repository",
                "type": "shell", 
                "command": "./save-to-repo.sh --world",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:⚡ Dev Scripts}"
                }
            },
            {
                "label": "🔄 Get Latest from Repository",
                "type": "shell",
                "command": "./sync-from-repo.sh",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always", 
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:⚡ Dev Scripts}"
                }
            },
            {
                "label": "🔄 Reset Everything from Repository",
                "type": "shell",
                "command": "./sync-from-repo.sh --all",
                "group": "build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared", 
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:⚡ Dev Scripts}"
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

    # Create a clean README for the development environment
    cat > "$dev_world_path/DEV-README.md" << EOF
# 🎮 Destroy Development Environment

Welcome to your streamlined development setup! This folder contains everything you need to develop Minecraft datapacks efficiently.

## 🚀 Quick Start

### VS Code (Recommended)
1. Open **destroy-dev.code-workspace** in VS Code
2. Use **Ctrl/Cmd+Shift+P** → "Tasks: Run Task" to access development commands
3. Edit datapacks in the **📦 Datapacks** folder

### Terminal
Navigate to **.dev-scripts/** folder and use:
- **\`./save-to-repo.sh\`** - Save your work to repository  
- **\`./sync-from-repo.sh\`** - Get latest changes from repository

## 🔄 Simple Workflow

1. **📝 Edit** - Modify datapacks directly in the datapacks/ folder
2. **🎮 Test** - Changes work immediately in Minecraft world "Destroy-dev"
3. **💾 Save** - Run \`./save-to-repo.sh\` when ready to save work
4. **📤 Commit** - Use git to commit your saved changes

## 💡 Available Scripts

| Script | Purpose | When to Use |
|--------|---------|-------------|
| \`./save-to-repo.sh\` | Save datapacks to repository | After making changes you want to keep |
| \`./save-to-repo.sh --world\` | Save datapacks + world | When you've modified world files too |
| \`./sync-from-repo.sh\` | Get latest changes from repository | To update from repo |
| \`./sync-from-repo.sh --all\` | Full reset from repository | To start fresh or fix issues |

## 💡 Pro Tips

- **Work directly here** - No need to edit repository files
- **Save frequently** - Run save-to-repo.sh often to avoid losing work  
- **Use VS Code workspace** - Gets you organized folders and one-click commands
- **Test immediately** - Changes are live in Minecraft instantly

## 📍 Repository Location
$(pwd)

---
*Simple, elegant, and powerful development setup ✨*
EOF

    log_success "Streamlined development environment configured"
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
    echo "  ./save-to-repo.sh              # Save changes to repository"
    echo "  ./sync-from-repo.sh             # Get latest changes from repository"
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