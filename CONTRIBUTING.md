# 🤝 Contributing to Destroy

Thank you for your interest in contributing to Destroy! This guide will help you get started and ensure a smooth contribution process.

## 🚀 Quick Start for Contributors

### 1. Initial Setup

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/mc-destroy.git
cd mc-destroy

# Set up development environment
./scripts/setup-dev.sh
```

### 2. New Improved Development Process

Our development workflow has been designed to make contributing as easy as possible. You work directly in your Minecraft saves folder using your favorite IDE, with all development tools available right where you need them.

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Open your development environment (VS Code workspace recommended)
# The setup script will show you the exact path and workspace file

# Make your changes directly in the saves folder using your IDE
# Test immediately in Minecraft (world: "Destroy-dev")

# When ready, save your changes back to the repository
# (From your development environment's .dev-scripts/ folder)
./sync-to-repo.sh  # Sync datapacks only
# OR
./sync-to-repo.sh --world  # Sync datapacks + world template

# Validate your changes
./validate-build.sh

# Commit your changes (back in repository folder)
git add .
git commit -m "feat: add new feature description"

# Push and create PR
git push origin feature/your-feature-name
```

### 3. Development Environment

After running `setup-dev.sh`, you get a complete development environment in your Minecraft saves folder:

**🎯 Your Development Workspace:**
- **VS Code Workspace**: `destroy-dev.code-workspace` with organized folders and tasks
- **Datapacks Folder**: Edit datapacks directly here
- **Development Scripts**: All sync tools available in `.dev-scripts/` folder
- **Instructions**: `DEV-README.md` with complete guidance

**🔄 Available Commands (from your development environment):**
```bash
# Save your changes to repository
./sync-to-repo.sh              # Save datapacks only (most common)
./sync-to-repo.sh --world      # Save datapacks + world template

# Get latest changes from repository
./sync-from-repo.sh            # Get datapacks only
./sync-from-repo.sh --all      # Get everything

# Validate and build
./validate-build.sh            # Validate your changes
./validate-build.sh --full-build  # Full build test
```

## 🎯 Types of Contributions

We welcome various types of contributions:

### 🐛 Bug Fixes
- Fix datapack errors or logic issues
- Improve performance or stability
- Resolve compatibility problems

### ✨ New Features
- Add new game mechanics
- Expand existing functionality
- Create new datapacks

### 📚 Documentation
- Improve README or guides
- Add code comments
- Create tutorials or examples

### 🔧 Infrastructure
- Improve build scripts
- Enhance CI/CD pipeline
- Add development tools

## 📋 Development Guidelines

### Datapack Standards

1. **Structure**: Follow Minecraft datapack conventions
   ```
   your-datapack/
   ├── pack.mcmeta
   ├── data/
   │   └── namespace/
   │       ├── functions/
   │       ├── loot_tables/
   │       ├── recipes/
   │       └── ...
   ```

2. **Naming**: Use clear, descriptive names
   - Functions: `snake_case`
   - Namespaces: `lowercase_underscores`
   - Files: `kebab-case.mcfunction`

3. **Documentation**: Comment complex functions
   ```mcfunction
   # This function handles player respawn logic
   # Called when: player dies in game
   # Args: none
   # Returns: sets player spawn location
   ```

### Code Quality

1. **Testing**: Always test changes thoroughly
   - Work directly in the "Destroy-dev" world created by setup
   - Test edge cases and multiplayer scenarios
   - Verify compatibility with existing datapacks

2. **Validation**: Use our tools before committing
   ```bash
   ./scripts/build.sh --validate-only
   ```

3. **Performance**: Consider performance impact
   - Avoid excessive command blocks
   - Use efficient selectors
   - Minimize tick-based operations

### Git Commit Messages

Use conventional commit format for automatic versioning:

```
type(scope): description

Examples:
feat(combat): add new weapon mechanics
fix(spawn): resolve respawn location bug
docs(readme): update installation instructions
refactor(teleport): optimize teleportation logic
```

**Types:**
- `feat`: New feature (minor version bump)
- `fix`: Bug fix (patch version bump)
- `docs`: Documentation only
- `refactor`: Code change without new features/fixes
- `test`: Adding or modifying tests
- `chore`: Build process or auxiliary tools
- `BREAKING`: Breaking changes (major version bump)

## 🧪 Testing Your Changes

### Recommended Development Workflow

1. **Setup Development Environment** (one time)
   ```bash
   ./scripts/setup-dev.sh
   ```

2. **Open Your Development Workspace**
   - **VS Code (Recommended)**: Open the `destroy-dev.code-workspace` file
   - **Other IDEs**: Navigate to the development folder path shown by setup

3. **Develop and Test**
   - Edit datapacks directly in your IDE (in the saves folder)
   - Launch Minecraft and open the "Destroy-dev" world
   - Test your changes immediately - no reloads needed!

4. **Save Changes to Repository**
   ```bash
   # From .dev-scripts/ folder or VS Code tasks
   ./sync-to-repo.sh  # For datapack changes
   ```

5. **Validate Build**
   ```bash
   ./validate-build.sh            # Quick validation
   ./validate-build.sh --full-build  # Full build test
   ```

6. **Reset If Needed**
   ```bash
   ./sync-from-repo.sh --all  # Reset from repository
   ```

### Testing Checklist

- [ ] Changes work as expected in single-player
- [ ] Changes work in multiplayer (if applicable)
- [ ] No conflicts with existing datapacks
- [ ] Performance is acceptable
- [ ] Build validation passes
- [ ] No console errors or warnings

## 📝 Pull Request Process

### Before Submitting

1. **Update your fork**
   ```bash
   git checkout main
   git pull upstream main
   git checkout your-feature-branch
   git rebase main
   ```

2. **Sync your final changes**
   ```bash
   ./scripts/sync-from-saves.sh  # Or --world if needed
   ```

3. **Run final checks**
   ```bash
   ./scripts/build.sh --validate-only
   ./scripts/build.sh
   ```

4. **Clean commit history**
   - Squash related commits if needed
   - Use clear commit messages

### PR Guidelines

1. **Title**: Use descriptive titles
   - ✅ `feat: add new boss mechanics to combat system`
   - ❌ `Update stuff`

2. **Description**: Include:
   - What changes were made
   - Why they were needed
   - How to test the changes
   - Screenshots/videos if relevant

3. **Testing**: Describe how you tested
   - What scenarios were tested
   - Any edge cases considered
   - Performance impact

### PR Template

```markdown
## Description
Brief description of changes made.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring

## Testing
- [ ] Tested in single-player
- [ ] Tested in multiplayer
- [ ] Build validation passes
- [ ] No performance issues

## Screenshots/Videos
If applicable, add screenshots or videos demonstrating the changes.

## Additional Notes
Any additional information that reviewers should know.
```

## 🎮 Development Environment

### Tools and Setup

1. **Required Tools**
   - Git
   - Bash shell (Linux/macOS/WSL on Windows)
   - Minecraft Java Edition
   - Text editor or IDE

2. **Recommended Tools**
   - VS Code with Minecraft function extensions
   - NBT Explorer for world file editing
   - Minecraft Development Kit (MDK) extensions

### Development Scripts

| Script | Purpose |
|--------|---------|
| `./scripts/setup-dev.sh` | Initial development setup |
| `./scripts/sync-to-saves.sh` | Push repo changes to saves (legacy) |
| `./scripts/sync-from-saves.sh` | Pull saves changes to repo (legacy) |
| `./scripts/build.sh` | Build and validate project |

**New Scripts (in your development environment's `.dev-scripts/` folder):**

| Script | Purpose |
|--------|---------|
| `./sync-to-repo.sh` | Save changes from saves to repository |
| `./sync-from-repo.sh` | Get latest changes from repository to saves |
| `./validate-build.sh` | Validate and optionally build your changes |

### Helpful Commands

**From your development environment (`.dev-scripts/` folder):**
```bash
# Most common workflow commands
./sync-to-repo.sh                       # Save your work to repo
./sync-from-repo.sh                     # Get latest from repo
./validate-build.sh                     # Check datapack validity

# Full reset workflow
./sync-from-repo.sh --all               # Complete reset from repo

# Full build test
./validate-build.sh --full-build        # Test full build process
```

**From repository folder (legacy commands still work):**
```bash
./scripts/sync-from-saves.sh            # Save work to repo
./scripts/sync-to-saves.sh --all        # Reset from repo
./scripts/build.sh --validate-only      # Check validity
git status                              # Check git status
```

## 🏷️ Release Process

Releases are automated when PRs are merged:

1. **PR Merged** → Triggers GitHub Actions
2. **Validation** → Datapacks are validated
3. **Build** → Complete minigame package is built
4. **Release** → New GitHub release is created
5. **Assets** → Downloadable zip is attached

Version numbers are automatically determined by commit messages.

## ❓ Getting Help

### Resources

- 📖 **Minecraft Wiki**: [minecraft.fandom.com](https://minecraft.fandom.com)
- 🎮 **Datapack Guide**: [Official Minecraft documentation](https://minecraft.wiki/w/Data_pack)
- 💬 **Discussions**: Use GitHub Discussions for questions
- 🐛 **Issues**: Report bugs via GitHub Issues

### Support Channels

1. **GitHub Discussions** - General questions and ideas
2. **GitHub Issues** - Bug reports and feature requests
3. **PR Comments** - Code review discussions

## 🎉 Recognition

Contributors are recognized in:
- GitHub contributor graphs
- Release notes (for significant contributions)
- Project documentation
- Special thanks in major releases

## 📜 Code of Conduct

Please be respectful and constructive in all interactions. We're all here to make great Minecraft content together!

### Guidelines

- **Be respectful** - Treat everyone with kindness
- **Be constructive** - Provide helpful feedback
- **Be patient** - Everyone is learning
- **Be collaborative** - Work together toward common goals

---

**Ready to contribute?** Run `./scripts/setup-dev.sh` and start building amazing Minecraft content with us! 🎮✨