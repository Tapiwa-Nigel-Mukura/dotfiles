#!/bin/bash
set -euo pipefail

# Pick a random wallpaper
WALL=$(find ~/dotfiles/wallpapers -type f | shuf -n1)

# Start swww daemon if not already running
if ! pgrep -x swww-daemon > /dev/null; then
  echo "Starting swww..."
  swww-daemon &
  sleep 1.5  # Give it time to initialize
fi

# Set the wallpaper with transition
echo "Setting wallpaper: $WALL"
swww img "$WALL" --transition-type any --transition-fps 60 --transition-duration 0.7

# Generate color scheme using pywal
echo "Generating theme with pywal..."
wal -i "$WALL"

# Wait to ensure colors are generated
sleep 0.5

# Update Waybar color scheme (adjust this path if needed)
if [[ -f ~/.cache/wal/colors.css ]]; then
  cp ~/.cache/wal/colors.css ~/.config/waybar/colors.css
else
  echo "❌ pywal did not generate colors.css"
fi

# Reload Waybar
echo "Reloading Waybar..."
pkill -x waybar || true
sleep 0.5
waybar &

# Optional: Sync with Firefox (if using pywalfox)
if command -v pywalfox &> /dev/null; then
  pywalfox update
fi
