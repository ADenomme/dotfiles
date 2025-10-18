#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Setting up Alex's dotfiles..."

########## TOOL INSTALLATION ##########

# Install Neovim if not present
if ! command -v nvim &> /dev/null; then
    echo "📦 Installing Neovim..."
    sudo apt update && sudo apt install -y neovim
fi

# Install tmux if not present
if ! command -v tmux &> /dev/null; then
    echo "📦 Installing tmux..."
    sudo apt update && sudo apt install -y tmux
fi

########## DOTFILES SETUP ##########

# Absolute path to repo
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink helper
link_file() {
    local source="$1"
    local target="$2"

    if [ -L "$target" ] || [ -f "$target" ]; then
        echo "🔁 Removing existing file or symlink at $target"
        rm -f "$target"
    elif [ -d "$target" ]; then
        echo "⚠️  Skipping $target — it's a real directory (not a symlink)"
        return
    fi

    ln -s "$source" "$target"
    echo "✅ Linked $target → $source"
}

# Symlink Bash config
echo "🔗 Linking .bashrc..."
link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

# Symlink Neovim config
echo "🔗 Linking Neovim config..."
mkdir -p "$HOME/.config/nvim/lua"

link_file "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Prevent alex/alex nesting
ALEX_TARGET="$HOME/.config/nvim/lua/alex"
if [ -e "$ALEX_TARGET" ] || [ -L "$ALEX_TARGET" ]; then
    echo "🔁 Removing existing $ALEX_TARGET"
    rm -rf "$ALEX_TARGET"
fi
ln -s "$DOTFILES_DIR/nvim/lua/alex" "$ALEX_TARGET"
echo "✅ Linked $ALEX_TARGET → $DOTFILES_DIR/nvim/lua/alex"

# Symlink tmux config
echo "🔗 Linking tmux config..."
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

########## COMPLETE ##########
echo "🎉 Dotfiles setup complete."
