#!/usr/bin/env bash
set -e

echo "Setting up Alex's dotfiles..."

# Absolute path to repo
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink Bash config
echo "Linking .bashrc..."
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

# Symlink Neovim config
echo "🔗 Linking Neovim config..."
mkdir -p "$HOME/.config/nvim/lua"
ln -sf "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sf "$DOTFILES_DIR/nvim/lua/alex" "$HOME/.config/nvim/lua/alex"

# Optional: install plugins (if using lazy.nvim or packer)
if command -v nvim &>/dev/null; then
  echo "Launching Neovim to install plugins..."
  nvim --headless "+Lazy! sync" +qa
fi

echo "Dotfiles setup complete."
