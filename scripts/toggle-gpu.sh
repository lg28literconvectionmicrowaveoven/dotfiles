#!/bin/sh
current_gpu_state=`supergfxctl -g`
if [ $current_gpu_state == "Integrated" ]; then
    supergfxctl -m Hybrid && notify-send "Switched to Hybrid. Logout to apply changes."
elif [ $current_gpu_state == "Hybrid" ]; then
    supergfxctl -m Integrated && notify-send "Switched to Integrated. Logout to apply changes."
fi
