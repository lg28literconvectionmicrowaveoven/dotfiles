#!/bin/sh
if [ `cat /sys/class/power_supply/ACAD/online` -eq 0 ]; then
    systemctl suspend
fi
