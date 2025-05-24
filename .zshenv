# Essential environment variables loaded for ALL zsh instances
# This file is sourced for both interactive and non-interactive shells

# Homebrew setup (for Apple Silicon Macs)
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add custom bin from dotfiles
export PATH="$HOME/bin:$PATH"

# Set default editor
export EDITOR="nvim"

# Disable Homebrew auto-update for faster commands
export HOMEBREW_NO_AUTO_UPDATE=1