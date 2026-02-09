#!/bin/bash

# Dotfiles Setup Script
# Installs Homebrew packages, Oh My Zsh, and creates Stow symlinks

set -e  # Exit on any error

echo "🚀 Setting up dotfiles..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found."
    read -p "Would you like to install Homebrew now? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📥 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Source Homebrew for Apple Silicon Macs
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    else
        echo "❌ Homebrew is required. Exiting."
        exit 1
    fi
fi

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "📁 Dotfiles directory: $DOTFILES_DIR"

# Install Homebrew packages
echo "📦 Installing Homebrew packages..."
cd "$DOTFILES_DIR"
brew bundle --verbose

# Install Oh My Zsh (if missing)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "📥 Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed."
fi

# Install Oh My Zsh custom plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    echo "📥 Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting already installed."
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]]; then
    echo "📥 Installing zsh-autocomplete..."
    git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
else
    echo "✅ zsh-autocomplete already installed."
fi

# Create symlinks with Stow
echo "🔗 Creating symlinks with Stow..."

PACKAGES="alacritty git git_template gtk iterm2 mise nvim rclone tmux vim zsh"

echo "📋 Packages to stow: $PACKAGES"

for package in $PACKAGES; do
    echo "   Stowing $package..."
    stow -d "$DOTFILES_DIR" -t "$HOME" "$package"
done

echo ""
echo "✅ Dotfiles setup complete!"
echo ""
echo "🔧 To manage packages:"
echo "   Add package:    stow -d $DOTFILES_DIR -t \$HOME package_name"
echo "   Remove package: stow -d $DOTFILES_DIR -t \$HOME -D package_name"
echo "   Restow all:     stow -d $DOTFILES_DIR -t \$HOME -R */"
echo ""
echo "⚠️  Dracula Pro (paid theme) must be installed manually in these locations:"
echo "   1. ~/.oh-my-zsh/custom/themes/       — zsh theme"
echo "   2. ~/dotfiles/vim/pack/themes/start/dracula_pro/ — vim/nvim colorscheme"
echo "   3. ~/.config/alacritty/themes/        — Alacritty terminal theme"
