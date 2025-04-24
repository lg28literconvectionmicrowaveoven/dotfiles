#!/bin/bash
# Script: hyprlock-battery.sh
# Purpose: Display battery status

# Check if we have a battery
if [ -d /sys/class/power_supply/BAT0 ]; then
    # Get battery percentage
    battery_percent=$(cat /sys/class/power_supply/BAT0/capacity)
    # Get charging status
    charging_status=$(cat /sys/class/power_supply/BAT0/status)
    
    # Choose icon based on charging status and battery level
    if [ "$charging_status" = "Charging" ]; then
        icon="🔌"
    else
        if [ "$battery_percent" -ge 90 ]; then
            icon="󰁹"
        elif [ "$battery_percent" -ge 60 ]; then
            icon="󰁦"
        elif [ "$battery_percent" -ge 40 ]; then
            icon="󰁣"
        elif [ "$battery_percent" -ge 20 ]; then
            icon="󰁞"
        else
            icon="󰁛"
        fi
    fi
    
    echo "$icon Battery: $battery_percent%"
else
    # No battery found (desktop PC)
    echo "󱐋 Desktop PC"
fi
