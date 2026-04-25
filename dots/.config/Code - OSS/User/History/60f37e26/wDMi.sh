#!/bin/bash
pkill -SIGUSR2 waybar || (pkill waybar; sleep 0.5; waybar &)