#!/usr/bin/env bash

COLORS_CSS="/tmp/waybar-colors.css"

# Get wallpaper path
WALLPAPER=$(grep '^wallpaper' ~/.config/waypaper/config.ini | cut -d'=' -f2 | xargs | sed "s|~|$HOME|")
[ -z "$WALLPAPER" ] && exit 1

# Generate palette
wal -i "$WALLPAPER" -n -q --backend haishoku

# Source colors
source "$HOME/.cache/wal/colors.sh"

# Convert color0 hex to rgba with slight transparency
HEX="${color1#\#}"
R=$((16#${HEX:0:2}))
G=$((16#${HEX:2:2}))
B=$((16#${HEX:4:2}))
RGBA="rgba($R, $G, $B, 0.85)"

# Write override CSS
cat > "$COLORS_CSS" << EOF
#window, #mpris, #pulseaudio, #tray,
#idle_inhibitor, #custom-notification,
#custom-power, #custom-weather,
#custom-launcher, #custom-btop, #custom-updates, #workspaces,
#custom-system, #clock, #custom-date,
#custom-keyboard-light, #backlight,
#custom-powerprofile, #battery {
    background-color: ${RGBA};
}
EOF

# Reload main waybar only (not dock)
pgrep -af "waybar" | grep -v "dock" | awk '{print $1}' | xargs -r kill -SIGUSR2
