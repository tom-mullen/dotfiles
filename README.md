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
