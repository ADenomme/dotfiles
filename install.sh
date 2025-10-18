#!/usr/bin/env bash

set -e

########## TOOLS ##########
# Install Neovim if not present
if ! command -v nvim &> /dev/null; then
    echo "Installing Neovim..."
    sudo apt update && sudo apt install -y neovim
fi

# Install tmux if not present
if ! command -v tmux &> /dev/null; then
    echo "Installing tmux..."
    sudo apt update && sudo apt install -y tmux
fi

########## DOTFILES ##########
echo "Setting up Alex's dotfiles..."

# Absolute path to repo
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink Bash config
echo "Linking .bashrc..."
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

# Symlink Neovim config
echo "Linking Neovim config..."
mkdir -p "$HOME/.config/nvim/lua"
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/alex" "$HOME/.config/nvim/lua/alex"

# System link TMUX config
echo "Linking tmux config..."
ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

########## Complete ##########
echo "Dotfiles setup complete."
