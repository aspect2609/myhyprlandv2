#!/bin/bash
pkill waybar || true
sleep 0.5
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css > /dev/null 2>&1 &
waybar -c ~/.config/waybar/config-bottom.jsonc -s ~/.config/waybar/style-bottom.css > /dev/null 2>&1 &