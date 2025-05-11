#!/bin/sh
# A script to change refresh rate on wlroots compositors based on AC status

if [ ! -e ~/.prev_bat ]; then
    echo 2 > ~/.prev_bat
fi

current_status=`cat /sys/class/power_supply/ACAD/online`
if [ $current_status != `cat /home/sabari/.prev_bat` ]; then
    if [ $current_status == "0" ]; then
        notify-send "AC Unplugged"
        hyprctl keyword monitor eDP-1, 3200x2000@60.00, auto, 2
        # wlr-randr --output eDP-1 --mode 3200x2000@60.000999
        # wlr-randr --output eDP-2 --mode 3200x2000@60.000999
    elif [ $current_status == "1" ]; then
        notify-send "AC Plugged In"
        hyprctl keyword monitor eDP-1, 3200x2000@165.00, auto, 2
        # wlr-randr --output eDP-1 --mode 3200x2000@165.001999
        # wlr-randr --output eDP-2 --mode 3200x2000@165.001999
    fi
fi
echo $current_status > /home/sabari/.prev_bat
