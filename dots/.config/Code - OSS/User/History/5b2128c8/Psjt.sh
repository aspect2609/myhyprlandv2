#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"
FILENAME="$SCREENSHOT_DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

# Select region, take screenshot, save + copy to clipboard
grim -g "$(slurp)" "$FILENAME" && wl-copy < "$FILENAME"

# Optional: send a notification
notify-send "Screenshot saved" "$FILENAME" --icon=camera