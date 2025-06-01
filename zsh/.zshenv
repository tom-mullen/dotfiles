# Essential environment variables loaded for ALL zsh instances
# This file is sourced for both interactive and non-interactive shells

# Homebrew setup (for Apple Silicon Macs)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add custom bin from dotfiles
export PATH="$HOME/bin:$PATH"

# Add homebrew binaries
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=1
