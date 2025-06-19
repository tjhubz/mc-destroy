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

# Detect operating system
detect_os() {
    # Check for Windows first using multiple methods
    if [[ -n "$WINDIR" ]] || [[ -n "$windir" ]] || [[ "$OS" == "Windows_NT" ]]; then
        OS_TYPE="windows"
    else
        case "$(uname -s)" in
            CYGWIN*|MINGW*|MSYS*)
                OS_TYPE="windows"
                ;;
            Darwin*)
                OS_TYPE="macos"
                ;;
            Linux*)
                OS_TYPE="linux"
                ;;
            *)
                # Try to detect Windows through other means
                if command -v cmd.exe >/dev/null 2>&1; then
                    OS_TYPE="windows"
                else
                    OS_TYPE="unknown"
                fi
                ;;
        esac
    fi
}

# Convert path to VS Code workspace format
convert_path_for_vscode() {
    local input_path="$1"
    
    case "$OS_TYPE" in
        "windows")
            # Convert Windows paths for VS Code workspace
            # Handle multiple Windows path formats
            if [[ "$input_path" =~ ^/[a-zA-Z]/ ]]; then
                # Git Bash style path: /c/Users/... -> C:/Users/...
                echo "$input_path" | sed 's|^/\([a-zA-Z]\)/|\1:/|'
            elif [[ "$input_path" =~ ^[a-zA-Z]:\\ ]]; then
                # Windows style path with backslashes: C:\Users\... -> C:/Users/...
                echo "$input_path" | sed 's|\\|/|g'
            elif [[ "$input_path" =~ ^[a-zA-Z]:/ ]]; then
                # Already in correct Windows format: C:/Users/...
                echo "$input_path"
            else
                # Try to handle other formats or relative paths
                # Convert backslashes to forward slashes
                echo "$input_path" | sed 's|\\|/|g'
            fi
            ;;
        *)
            # Unix-like systems (macOS, Linux) - use path as-is
            echo "$input_path"
            ;;
    esac
}

# Detect Minecraft installation
detect_minecraft() {
    log_info "Detecting Minecraft installation..."

    # Detect OS first
    detect_os
    log_info "Detected OS: $OS_TYPE"

    # Common Minecraft directories based on OS
    local possible_paths=()
    
    case "$OS_TYPE" in
        "windows")
            possible_paths=(
                "$HOME/AppData/Roaming/.minecraft/saves"
                "/c/Users/$USER/AppData/Roaming/.minecraft/saves"
                "$USERPROFILE/AppData/Roaming/.minecraft/saves"
            )
            ;;
        "macos")
            possible_paths=(
                "$HOME/Library/Application Support/minecraft/saves"
                "$HOME/.minecraft/saves"
            )
            ;;
        "linux")
            possible_paths=(
                "$HOME/.minecraft/saves"
            )
            ;;
        *)
            possible_paths=(
                "$HOME/.minecraft/saves"
                "$HOME/Library/Application Support/minecraft/saves"
                "$HOME/AppData/Roaming/.minecraft/saves"
                "/c/Users/$USER/AppData/Roaming/.minecraft/saves"
            )
            ;;
    esac

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

# Setup git hooks
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

# Create unified development workspace
create_unified_workspace() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    local repo_path="$(pwd)"
    
    log_info "Creating unified development workspace..."
    
    # Convert paths to VS Code workspace format
    local vscode_dev_world_path=$(convert_path_for_vscode "$dev_world_path")
    local vscode_datapacks_path=$(convert_path_for_vscode "$dev_world_path/datapacks")
    
    log_info "VS Code workspace paths:"
    log_info "  Development World: $vscode_dev_world_path"
    log_info "  Live Datapacks: $vscode_datapacks_path"
    
    # Create the unified VS Code workspace in the repository root
    cat > "destroy-dev.code-workspace" << EOF
{
    "folders": [
        {
            "name": "📁 Repository",
            "path": "."
        },
        {
            "name": "🎮 Development World",
            "path": "$vscode_dev_world_path"
        },
        {
            "name": "📦 Live Datapacks",
            "path": "$vscode_datapacks_path"
        }
    ],
    "settings": {
        "files.associations": {
            "*.mcfunction": "mcfunction",
            "*.mcmeta": "json"
        },
        "files.exclude": {
            "**/.git": false
        },
        "search.smartCase": true,
        "search.collapseResults": "auto",
        "search.showLineNumbers": true,
        "git.enabled": true,
        "git.path": "git",
        "terminal.integrated.cwd": "\${workspaceFolder:📁 Repository}",
        "terminal.integrated.defaultProfile.linux": "bash",
        "terminal.integrated.defaultProfile.osx": "bash",
        "terminal.integrated.defaultProfile.windows": "Git Bash",
        "workbench.tree.indent": 20,
        "explorer.compactFolders": false,
        "workbench.colorTheme": "Default Dark+",
        "workbench.iconTheme": "vs-seti",
        "editor.minimap.enabled": true,
        "editor.bracketPairColorization.enabled": true,
        "editor.guides.bracketPairs": true
    },
    "tasks": {
        "version": "2.0.0",
        "tasks": [
            {
                "label": "💾 Save Work to Repository",
                "type": "shell",
                "command": "./scripts/sync-from-saves.sh",
                "group": {
                    "kind": "build",
                    "isDefault": true
                },
                "detail": "Sync your datapack changes from Minecraft saves back to the repository",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            },
            {
                "label": "💾 Save Work + World to Repository",
                "type": "shell",
                "command": "./scripts/sync-from-saves.sh --world",
                "group": "build",
                "detail": "Sync both datapacks and world template changes to the repository",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            },
            {
                "label": "🔄 Get Latest from Repository",
                "type": "shell",
                "command": "./scripts/sync-to-saves.sh",
                "group": "build",
                "detail": "Pull latest datapack changes from repository to your Minecraft world",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            },
            {
                "label": "🔄 Reset Everything from Repository",
                "type": "shell",
                "command": "./scripts/sync-to-saves.sh --all",
                "group": "build",
                "detail": "Reset your development world to match the repository exactly (fresh start)",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            },
            {
                "label": "🧪 Validate Build",
                "type": "shell",
                "command": "./scripts/build.sh --validate-only",
                "group": "test",
                "detail": "Test and validate your datapack changes without creating a build",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            },
            {
                "label": "📤 Create Commit",
                "type": "shell",
                "command": "git add . && git status",
                "group": "build",
                "detail": "Stage all changes and show git status to prepare for commit",
                "presentation": {
                    "echo": true,
                    "reveal": "always",
                    "focus": false,
                    "panel": "shared",
                    "showReuseMessage": false,
                    "clear": true
                },
                "options": {
                    "cwd": "\${workspaceFolder:📁 Repository}"
                }
            }
        ]
    },
    "extensions": {
        "recommendations": [
            "SPGoding.datapack-language-server",
            "arcensoth.language-mcfunction",
            "Levertion.mcjson",
            "GitLens.gitlens"
        ]
    }
}
EOF

    # Create a development README in the saves folder for quick reference
    cat > "$dev_world_path/DEV-README.md" << EOF
# 🎮 Destroy Development Environment

> ✨ **Welcome to your unified development workspace!** ✨  
> This setup gives you the best of both worlds: instant testing and seamless git workflow.

## 🏗️ Your Workspace Structure

- **📁 Repository**: Source code, git history, scripts
- **🎮 Development World**: Your live Minecraft world
- **📦 Live Datapacks**: Edit these directly - changes are instant!

## 🔄 Simple Workflow

### 1. Edit Datapacks
- Work in the **📦 Live Datapacks** folder
- Changes apply immediately in Minecraft
- Use \`/reload\` in-game to refresh datapacks

### 2. Save Your Work
- **Ctrl/Cmd+Shift+P** → "Tasks: Run Task" → "💾 Save Work to Repository"
- Or run: \`./scripts/sync-from-saves.sh\` from the repository folder

### 3. Review & Commit
- Check changes in the **📁 Repository** folder
- Use VS Code's integrated git tools
- Or run: \`git status\`, \`git add .\`, \`git commit -m "message"\`

## 💡 Available Tasks (Ctrl/Cmd+Shift+P → Tasks)

- **💾 Save Work to Repository** - Save datapacks (most common)
- **💾 Save Work + World to Repository** - Save datapacks + world template
- **🔄 Get Latest from Repository** - Pull latest changes
- **🔄 Reset Everything from Repository** - Fresh start
- **🧪 Validate Build** - Test your changes
- **📤 Create Commit** - Stage changes and see status

## 📍 Key Locations

- **Repository**: $(pwd)
- **Development World**: $dev_world_path
- **Live Datapacks**: $dev_world_path/datapacks

---
*Elegant, simple, powerful development experience ✨*
EOF

    log_success "Unified development workspace created"
}

# Save development configuration
save_dev_config() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    
    log_info "Saving development configuration..."
    
    # Convert paths for cross-platform compatibility
    local converted_minecraft_saves_dir=$(convert_path_for_vscode "$MINECRAFT_SAVES_DIR")
    local converted_dev_world_path=$(convert_path_for_vscode "$dev_world_path")
    
    cat > "$DEV_CONFIG_FILE" << EOF
# Destroy Development Configuration
# This file is generated by setup-dev.sh and used by sync scripts
# Do not edit manually

DEV_WORLD_NAME="$DEV_WORLD_NAME"
MINECRAFT_SAVES_DIR="$converted_minecraft_saves_dir"
DEV_WORLD_PATH="$converted_dev_world_path"
WORLD_TEMPLATE="$WORLD_TEMPLATE"
DATAPACKS_DIR="$DATAPACKS_DIR"
SETUP_DATE="$(date)"
EOF

    log_success "Development configuration saved to $DEV_CONFIG_FILE"
}

# Show next steps
show_next_steps() {
    local dev_world_path="$MINECRAFT_SAVES_DIR/$DEV_WORLD_NAME"
    local repo_path="$(pwd)"
    
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    log_success "🎉 Unified Development Environment Setup Complete!"
    echo "════════════════════════════════════════════════════════════════"
    echo ""
    echo -e "${GREEN}🚀 Getting Started:${NC}"
    echo ""
    echo -e "${YELLOW}1. Open VS Code Workspace:${NC}"
    echo "   • Open VS Code"
    echo "   • File → Open Workspace from File"
    echo "   • Select: ${BLUE}$repo_path/destroy-dev.code-workspace${NC}"
    echo ""
    echo -e "${YELLOW}2. Start Developing:${NC}"
    echo "   • Edit datapacks in the '📦 Live Datapacks' folder"
    echo "   • Test immediately in Minecraft (world: '$DEV_WORLD_NAME')"
    echo "   • Use tasks (Ctrl/Cmd+Shift+P → Tasks) for easy sync"
    echo ""
    echo -e "${GREEN}🔄 Development Workflow:${NC}"
    echo "1. 📝 Edit datapacks → Changes are live instantly"
    echo "2. 🎮 Test in Minecraft → Use '/reload' to refresh"
    echo "3. 💾 Save work → Run 'Save Work to Repository' task"
    echo "4. 📤 Review & commit → Use VS Code's git integration"
    echo ""
    echo -e "${BLUE}✨ Key Features:${NC}"
    echo "• Work directly in saves folder (instant testing)"
    echo "• Unified workspace (no folder switching)"
    echo "• One-click sync tasks"
    echo "• Integrated git workflow"
    echo "• Smart release detection"
    echo ""
    echo -e "${GREEN}💡 Pro Tips:${NC}"
    echo "• The workspace shows both repo and saves folders"
    echo "• Use tasks instead of manual script running"
    echo "• Git operations work from the Repository folder"
    echo "• Check DEV-README.md in your development world for quick reference"
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    echo -e "${GREEN}✨ Happy coding! Your development environment is ready! ✨${NC}"
    echo "════════════════════════════════════════════════════════════════"
    echo ""
}

# Main execution
main() {
    echo -e "${GREEN}🎮 Destroy Unified Development Setup${NC}"
    echo "========================================"
    echo ""

    check_prerequisites
    detect_minecraft
    create_dev_world
    setup_git_hooks
    create_unified_workspace
    save_dev_config
    show_next_steps
}

main "$@"