# 🤝 Contributing to Destroy

Thank you for your interest in contributing to Destroy! This guide will help you get started with our streamlined development experience.

## 🚀 Quick Start for Contributors

### 1. Initial Setup

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/mc-destroy.git
cd mc-destroy

# Set up your unified development environment
./scripts/setup-dev.sh
```

### 2. Unified Development Experience

Our development workflow has been designed to be **elegantly simple**. You get a unified VS Code workspace that includes both your repository and your live Minecraft development environment.

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Open the unified workspace
# The setup script will show you the exact workspace file to open

# Start developing immediately!
# - Edit datapacks in the "📦 Live Datapacks" folder
# - Changes apply instantly in Minecraft
# - Use built-in tasks for easy sync and git operations
```

### 3. Streamlined Workflow

**🎯 The Complete Development Flow:**

1. **📝 Edit** - Work directly in the Live Datapacks folder
2. **� Test** - Changes are instantly live in Minecraft world "Destroy-dev"
3. **💾 Save** - Use "Save Work to Repository" task (Ctrl/Cmd+Shift+P → Tasks)
4. **📤 Review & Commit** - Use VS Code's git integration in the Repository folder
5. **🚀 Push** - Create PR as usual

**🔄 Available Tasks (Ctrl/Cmd+Shift+P → Tasks):**
- **💾 Save Work to Repository** - Save your datapacks (most common)
- **💾 Save Work + World to Repository** - Save datapacks + world template
- **🔄 Get Latest from Repository** - Pull latest changes
- **🔄 Reset Everything from Repository** - Fresh start from repo
- **🧪 Validate Build** - Test your changes
- **📤 Create Commit** - Stage changes and see status

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
   - Work directly in the "Destroy-dev" world
   - Test edge cases and multiplayer scenarios
   - Use `/reload` to refresh datapacks after changes

2. **Validation**: Use the validation task before committing
   - **Ctrl/Cmd+Shift+P** → "Tasks: Run Task" → "🧪 Validate Build"

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

### The Unified Development Experience

1. **Setup Development Environment** (one time)
   ```bash
   ./scripts/setup-dev.sh
   ```

2. **Open Unified Workspace**
   - Open the `destroy-dev.code-workspace` file in VS Code
   - You'll see three organized folders:
     - **📁 Repository**: Your git repo with all source code
     - **🎮 Development World**: Your live Minecraft world
     - **📦 Live Datapacks**: Edit these directly - changes are instant!

3. **Develop and Test**
   - Edit datapacks in the "📦 Live Datapacks" folder
   - Changes apply immediately in Minecraft
   - Use `/reload` in-game to refresh if needed
   - Test thoroughly in the "Destroy-dev" world

4. **Save Your Work**
   - **Ctrl/Cmd+Shift+P** → "Tasks: Run Task" → "💾 Save Work to Repository"
   - Your changes are now staged in the Repository folder

5. **Review and Commit**
   - Switch to the Repository folder view
   - Use VS Code's built-in git tools to review changes
   - Commit using the git interface or terminal

### Testing Checklist

- [ ] Changes work as expected in single-player
- [ ] Changes work in multiplayer (if applicable)
- [ ] No conflicts with existing datapacks
- [ ] Performance is acceptable
- [ ] Build validation passes (use the validation task)
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

2. **Save your final changes**
   - Use the "💾 Save Work to Repository" task
   - This ensures all your work is captured in the repository

3. **Run final validation**
   - Use the "🧪 Validate Build" task
   - Fix any issues that arise

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

### Smart Release System

**🎯 Releases are automatically triggered only when you modify:**
- `datapacks/` directory (game mechanics)
- `world-template/` directory (world structure)

**📝 Documentation, script, or other changes won't trigger releases** - keeping our release history clean and meaningful.

## 🎮 Development Environment Features

### Unified Workspace Benefits

- **🎯 Single Location**: Everything you need in one VS Code workspace
- **⚡ Instant Testing**: Edit datapacks and test immediately
- **🔧 Integrated Tools**: All development tasks available via VS Code tasks
- **📊 Git Integration**: Full git workflow within the workspace
- **🔄 Smart Sync**: Easy sync between development and repository

### Available Tasks

All development operations are available via **Ctrl/Cmd+Shift+P** → "Tasks: Run Task":

| Task | Purpose | When to Use |
|------|---------|-------------|
| 💾 Save Work to Repository | Save datapacks to repo | After making changes |
| 💾 Save Work + World to Repository | Save datapacks + world | When world files changed |
| 🔄 Get Latest from Repository | Pull latest changes | To sync with upstream |
| 🔄 Reset Everything from Repository | Complete reset | To start fresh |
| 🧪 Validate Build | Test your changes | Before committing |
| 📤 Create Commit | Stage and view changes | Ready to commit |

### Pro Development Tips

- **Work in Live Datapacks**: Changes are instantly available in Minecraft
- **Use Tasks**: Faster than remembering script commands
- **Git in Repository**: All git operations work in the Repository folder
- **Save Frequently**: Use the save task often to avoid losing work
- **Test Immediately**: No need to run sync scripts - just start Minecraft

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

### 🚀 Quick Start Summary

1. **Fork & Clone** the repository
2. **Run** `./scripts/setup-dev.sh`
3. **Open** `destroy-dev.code-workspace` in VS Code
4. **Edit** datapacks in the Live Datapacks folder
5. **Test** immediately in Minecraft
6. **Save** work using VS Code tasks
7. **Commit & Push** using VS Code git integration

*Simple, elegant, and powerful development experience!*