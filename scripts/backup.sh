#!/bin/bash
set -euo pipefail

echo "🔧 Creating/updating dotfiles backup..."

# Define backup destination
DOTFILES_DIR="$HOME/dotfiles"

# Ensure it exists
mkdir -p "$DOTFILES_DIR/.config"

# Backup files and directories using rsync for safety
rsync -a --delete ~/.config/hypr "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/waybar "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/kitty "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/pokemon-coloscripts "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/swww "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/wal "$DOTFILES_DIR/.config/"
rsync -a --delete ~/.config/yay "$DOTFILES_DIR/.config/"
rsync -a --delete ~/scripts "$DOTFILES_DIR/"
rsync -a --delete ~/wallpapers "$DOTFILES_DIR/"

# Simple file copies
cp ~/.zshrc "$DOTFILES_DIR/"
cp ~/.bashrc "$DOTFILES_DIR/"

# Git commit and push
cd "$DOTFILES_DIR"
git add .
git commit -m "Update dotfiles: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit."
git push origin main

echo "✅ Dotfiles backup complete."
