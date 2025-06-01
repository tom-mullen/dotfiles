#!/bin/bash

# Dotfiles Setup Script
# Installs Homebrew packages and creates Stow symlinks

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

# Create symlinks with Stow
echo "🔗 Creating symlinks with Stow..."

# Get list of available packages (directories that aren't hidden or special files)
packages=$(find "$DOTFILES_DIR" -maxdepth 1 -type d -not -name ".*" -not -name "$(basename "$DOTFILES_DIR")" -exec basename {} \; | sort)

echo "📋 Available packages: $packages"

# Stow each package
for package in $packages; do
    echo "   Stowing $package..."
    stow -d "$DOTFILES_DIR" -t "$HOME" "$package"
done

echo "✅ Dotfiles setup complete!"
echo ""
echo "🔧 To manage packages:"
echo "   Add package:    stow -d $DOTFILES_DIR -t \$HOME package_name"
echo "   Remove package: stow -d $DOTFILES_DIR -t \$HOME -D package_name"
echo "   Restow all:     stow -d $DOTFILES_DIR -t \$HOME -R */"