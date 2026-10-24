# dotfiles

Modern dotfiles managed with GNU Stow for clean, organized configuration management.

## Features

- **Stow-managed packages**: Organized by application for selective installation
- **Comprehensive Brewfile**: All development dependencies in one place
- **One-command setup**: Automated installation script
- **Clean symlinks**: No cluttered home directory

## Quick Start

```bash
git clone https://github.com/tom-mullen/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

That's it! The setup script will:
- Install Homebrew (if needed)
- Install all packages from Brewfile
- Create symlinks for all configurations

## Manual Installation

If you prefer manual control:

1. **Install dependencies**:
   ```bash
   brew bundle
   ```

2. **Install all packages**:
   ```bash
   stow -t ~ */
   ```

3. **Or install selectively**:
   ```bash
   stow -t ~ git vim tmux zsh  # Just the essentials
   ```

## Package Structure

- `alacritty/` - Terminal emulator config
- `git/` - Git config and lazygit settings
- `nvim/` - Neovim configuration
- `tmux/` - Terminal multiplexer config
- `vim/` - Vim configuration
- `zsh/` - Shell configuration and aliases

## Managing Packages

```bash
# Add new package
stow -t ~ package_name

# Remove package
stow -t ~ -D package_name

# Restow all packages
stow -t ~ -R */
```

## Personal vs Team Claude Config

Team (Standard Innovation) agents and skills live in `~/code/automation/onboarding/claude/`.
`setup.sh` runs its `install.sh`, which links each one into `~/.claude/agents` and
`~/.claude/skills`. Do not add team items here.

Personal items live in this repo:

- **CLIs**: `Brewfile`
- **Marketplace plugins** (e.g. `hey@37signals`): `enabledPlugins` and
  `extraKnownMarketplaces` in `claude/.claude/settings.json`
- **Skills and agents**: `claude/.claude/skills/<name>/` and `claude/.claude/agents/<name>.md`,
  linked by stow

Skills that a vendor CLI installs (e.g. `hey skill install`) are not committed. Use the
vendor's plugin instead.

To see where a skill comes from, run `ls -l ~/.claude/skills`. The link target shows
the team repo under `~/code/automation` (team) or `dotfiles/...` (personal).

This repo is public. Keep client and org details out of it, including the `autoMode` block
of `settings.json`.

Before you add the first personal skill or agent, make sure `~/.claude/skills` and
`~/.claude/agents` exist as real directories (`mkdir -p`). If they do not, stow links the
whole directory into this repo, and `install.sh` then writes team links into it.

## Requirements

- macOS (tested on Apple Silicon)
- Zsh as default shell: `chsh -s $(which zsh)`

## Update

```bash
cd ~/dotfiles
git pull
./setup.sh  # Re-run to get any new packages
```

## License

The code is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
