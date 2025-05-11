#!/bin/bash
if [ $(brightnessctl get) -eq 0 ]; then
    brightnessctl set $(cat ~/.prev_brightness)
else
    echo $(brightnessctl get) > ~/.prev_brightness
    brightnessctl set 0
fi
