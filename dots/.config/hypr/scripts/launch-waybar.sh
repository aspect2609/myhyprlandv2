#!/usr/bin/env bash
echo "$(date): Starting launch-waybar.sh" >> /tmp/waybar-startup.log
sleep 4
waybar >> /tmp/waybar-launch.log 2>&1 &
echo "$(date): Main waybar started" >> /tmp/waybar-startup.log
sleep 3
~/.config/hypr/scripts/popup-dock.sh >> /tmp/dock-launch.log 2>&1 &
echo "$(date): Dock script launched" >> /tmp/waybar-startup.log