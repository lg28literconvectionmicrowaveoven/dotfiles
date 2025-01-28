#!/bin/bash
qdbus6 org.kde.KWin /KWin setCurrentDesktop 4
thunderbird & disown
if [ $(cat /sys/class/power_supply/BAT1/status) == "Discharging" ]
then
    sleep 7s
else
    sleep 3s
fi
qdbus6 org.kde.KWin /KWin setCurrentDesktop 1
rclone sync /home/sabari/Sabari/Education/SNU/ gdrive:SNU
