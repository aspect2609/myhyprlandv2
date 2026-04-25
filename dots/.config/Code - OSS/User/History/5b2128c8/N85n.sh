#!/bin/bash

# Select region, take screenshot, copy to clipboard
grim -g "$(slurp)" "wl-copy < "$FILENAME"

# Optional: send a notification
notify-send "Screenshot saved" "$FILENAME" --icon=camera