#!/bin/bash

FOLDER="$HOME/Pictures/Wallpapers"

wallpaper=$(find "$FOLDER" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | shuf -n 1)

if [ -z "$wallpaper" ]; then
    echo "No wallpapers found in $FOLDER"
    exit 1
fi

swaybg -i "$wallpaper" -m fill &
waypaper --wallpaper "$wallpaper"