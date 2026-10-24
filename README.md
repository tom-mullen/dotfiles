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

`install.sh` also offers to replace `~/.claude/settings.json` and `~/.claude/CLAUDE.md`
with team starters. Answer N, and do not set `ONBOARDING_ASSUME_YES`, or the stow links to this repo are replaced and personal
settings (e.g. plugins) stop syncing. Check with `ls -l ~/.claude/settings.json`.

Personal items live in this repo:

- **CLIs**: `Brewfile`
- **Marketplace plugins** (e.g. `hey@37signals`): `enabledPlugins` and
  `extraKnownMarketplaces` in `claude/.claude/settings.json`
- **Skills and agents**: `claude/.claude/skills/<name>/` and `claude/.claude/agents/<name>.md`,
  linked by stow

Skills that a vendor CLI installs (e.g. `hey skill install`) are not committed. Use the
vendor's plugin instead, and remove the vendor CLI copy so the skill does not load twice
(for HEY: `~/.claude/skills/hey` and `~/.agents/skills/hey`).

To see where a skill comes from, run `ls -l ~/.claude/skills`. The link target is the team
repo (team), `dotfiles/...` (personal) or `~/.agents/skills/...` (vendor CLI, remove it).

On a new machine, if `/plugin` does not list a plugin after the first `claude` start, run
`claude plugin marketplace add basecamp/claude-plugins` and
`claude plugin install hey@37signals`. Sign the HEY CLI in once with `hey auth login`.

This repo is public. Keep client and org details out of it, including the `autoMode` block
of `settings.json`.

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
