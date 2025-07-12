#!/bin/bash
set -euo pipefail

echo "🚀 Starting dotfiles restore..."

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%s)"

CONFIGS=(
  "hypr"
  "waybar"
  "kitty"
  "swww"
  "wal"
  "yay"
)
FILES=(
  ".zshrc"
  ".bashrc"
)
MISC=(
  "scripts"
  "wallpapers"
)

mkdir -p ~/.config
mkdir -p "$BACKUP_DIR"

# Backup and symlink .config directories
for config in "${CONFIGS[@]}"; do
  src="$DOTFILES_DIR/.config/$config"
  dest="$HOME/.config/$config"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up existing $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi
  ln -sf "$src" "$dest"
done

# Backup and symlink dotfiles
for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up existing $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi
  ln -sf "$src" "$dest"
done

# Backup and symlink miscellaneous folders
for item in "${MISC[@]}"; do
  src="$DOTFILES_DIR/$item"
  dest="$HOME/$item"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up existing $dest to $BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
  fi
  ln -sf "$src" "$dest"
done

# Install essential packages
echo "📦 Installing required packages via pacman..."
sudo pacman -Syu --needed \
  hyprland waybar kitty swww zsh python-pywal yay \
  wl-clipboard ripgrep fd fzf neovim

echo "✅ Dotfiles restored. Reboot or restart your session to apply."
