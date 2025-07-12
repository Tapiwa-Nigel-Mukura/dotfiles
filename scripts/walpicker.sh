#!/bin/bash

# Set wallpaper
WALL=$(find ~/wallpapers -type f | shuf -n1)

# Start swww if not already running
pgrep -x swww-daemon > /dev/null || swww-daemon &

# Give swww a sec to initialize (first run)
sleep 1

# Set the wallpaper using swww (with a smooth transition)
swww img "$WALL" --transition-type any --transition-fps 60 --transition-duration 0.7

# Generate theme with wal
wal -i "$WALL"

# Wait for wal to finish generating files
sleep 1

# Copy wal-generated CSS to Waybar config
cp ~/.cache/wal/colors.css ~/.config/eww/colors.css

# Reload Waybar
pkill waybar && sleep 0.8 && waybar &

# (Optional) Sync to Firefox if you have pywalfox set up
pywalfox update
