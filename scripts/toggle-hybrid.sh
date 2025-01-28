#!/bin/sh
current_hybrid_state=`cat ~/.hybrid_status`
if [ $current_hybrid_state == "False" ]; then
    pkexec legion_cli hybrid-mode-enable && supergfxctl -m Integrated && notify-send "Hybrid mode enabled. Reboot to apply changes."
elif [ $current_hybrid_state == "True" ]; then
    pkexec legion_cli hybrid-mode-disable && supergfxctl -m Hybrid && notify-send "Hybrid mode disabled. Reboot to apply changes."
fi
