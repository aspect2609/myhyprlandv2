#!/usr/bin/env bash

WAYBAR_BAR="dock"
CONFIG="$HOME/.config/waybar/config-bottom.jsonc"
STYLE="$HOME/.config/waybar/style-bottom.css"

sleep 1

waybar --bar "$WAYBAR_BAR" --config "$CONFIG" --style "$STYLE" &

sleep 2

WAYBAR_PID=$(pgrep -nf "waybar.*$WAYBAR_BAR")

if [ -z "$WAYBAR_PID" ]; then
    exit 1
fi

IS_VISIBLE=0

while true; do
    CURSOR=$(hyprctl cursorpos -j 2>/dev/null)
    
    if [ -n "$CURSOR" ]; then
        CUR_Y=$(echo "$CURSOR" | jq -r '.y')
        
        MONITORS=$(hyprctl monitors -j)
        MONITOR_HEIGHT=$(echo "$MONITORS" | jq '.[0].height')
        
        BOTTOM_ZONE=$((MONITOR_HEIGHT - 40))
        
        if [ "$CUR_Y" -ge "$BOTTOM_ZONE" ]; then
            if [ "$IS_VISIBLE" -eq 0 ]; then
                kill -USR1 "$WAYBAR_PID" 2>/dev/null
                IS_VISIBLE=1
            fi
        else
            if [ "$IS_VISIBLE" -eq 1 ]; then
                kill -USR1 "$WAYBAR_PID" 2>/dev/null
                IS_VISIBLE=0
            fi
        fi
    fi
    
    sleep 0.2
done