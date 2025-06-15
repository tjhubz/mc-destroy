# 🎮 MC-Destroy

An elegant Minecraft minigame with automated build and release system for seamless development and distribution.

## 🚀 Quick Start

### For Players

1. **Download the latest release**
   - Go to the [Releases page](../../releases)
   - Download the latest `mc-destroy-vX.X.X.zip` file

2. **Install**
   - Extract the zip file to your Minecraft saves folder:
     - **Windows**: `%appdata%\.minecraft\saves\`
     - **macOS**: `~/Library/Application Support/minecraft/saves/`
     - **Linux**: `~/.minecraft/saves/`

3. **Play**
   - Launch Minecraft
   - Select the "MC-Destroy" world
   - Everything is pre-configured and ready to go!

### For Developers

Get started in 3 simple commands:

```bash
git clone https://github.com/username/mc-destroy.git
cd mc-destroy
./scripts/setup-dev.sh
```

That's it! The setup script will:
- ✅ Create a development world with all datapacks installed
- ✅ Configure git hooks for quality assurance
- ✅ Set up helper scripts for development

## ⚡ Features

- **🎯 One-Click Download**: Latest minigame always available as a single zip file
- **🤖 Automated Releases**: Auto-build and release on PR merge
- **👨‍💻 Developer-Friendly**: 3-step setup for contributors
- **🔄 Hot Reload**: Quick datapack testing without world restart
- **✅ Quality Assurance**: Automated validation and testing
- **📦 Clean Packaging**: Professional build process with checksums

## 🛠 Development

### Quick Commands

```bash
# Set up development environment
./scripts/setup-dev.sh

# Validate datapacks
./scripts/build.sh --validate-only

# Reload datapacks in dev world
./scripts/reload-datapacks.sh

# Test full build process
./scripts/build.sh
```

### Development Workflow

1. **Make Changes**: Edit datapacks in the `datapacks/` directory
2. **Test Locally**: Use `./scripts/reload-datapacks.sh` to update your dev world
3. **Validate**: Run `./scripts/build.sh --validate-only` to check for errors
4. **Build Test**: Run `./scripts/build.sh` to test the full build process
5. **Submit**: Create a PR - automatic release on merge!

### Project Structure

```
mc-destroy/
├── datapacks/                    # 📦 Source datapacks (edit these!)
├── world-template/               # 🌍 Base world template
├── scripts/
│   ├── build.sh                 # 🔨 Build automation
│   ├── setup-dev.sh             # 🚀 Developer setup  
│   └── reload-datapacks.sh      # ⚡ Hot reload helper
├── .github/workflows/
│   └── release.yml              # 🤖 Auto-release pipeline
└── README.md                    # 📖 You are here!
```

### Datapack Development

The `datapacks/` directory contains all the minigame logic:

- **server/**: Core server-side functionality
- **command_helper/**: Command utilities and helpers  
- **effect_overflow.zip**: Effect management system
- **lock_fixer.zip**: Block state management
- **attribute_reset.zip**: Player attribute handling
- **unwaterloggable_leaves.zip**: Environmental mechanics

Each datapack can be either:
- 📁 **Directory**: For active development (easy to edit)
- 🗜️ **ZIP file**: For stable/external datapacks

## 🎯 Release Process

The repository uses automated releases:

1. **Development**: Make changes to datapacks
2. **Testing**: Use development tools to validate changes
3. **PR Submission**: Open a pull request
4. **Automatic Release**: On PR merge:
   - ✅ Validates all datapacks
   - 🔨 Builds complete minigame package
   - 📦 Creates GitHub release with downloadable zip
   - 🏷️ Auto-generates version tags and changelogs

### Versioning

Versions are automatically generated based on commit messages:
- `feat: new feature` → Minor version bump (1.0.0 → 1.1.0)
- `fix: bug fix` → Patch version bump (1.0.0 → 1.0.1)  
- `BREAKING: major change` → Major version bump (1.0.0 → 2.0.0)

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

### Quick Contribution Steps

1. Fork the repository
2. Run `./scripts/setup-dev.sh` to set up your environment
3. Make your changes to the datapacks
4. Test thoroughly using the development world
5. Submit a pull request

## 📋 Requirements

### For Players
- Minecraft Java Edition
- Compatible version: [specify version]

### For Developers  
- Git
- Bash shell (Linux/macOS/WSL)
- Minecraft Java Edition (for testing)

## 🐛 Issues & Support

- 🐛 **Bug Reports**: [Open an issue](../../issues/new?template=bug_report.md)
- 💡 **Feature Requests**: [Request a feature](../../issues/new?template=feature_request.md)
- 💬 **Questions**: [Start a discussion](../../discussions)

## 📄 License

This project is licensed under the [LICENSE](LICENSE) - see the file for details.

## 🙏 Acknowledgments

- Thanks to all contributors who help make this project better
- Built with ❤️ for the Minecraft community

---

**Ready to play?** [Download the latest release](../../releases/latest) and jump in!

**Want to contribute?** Run `./scripts/setup-dev.sh` and start building!