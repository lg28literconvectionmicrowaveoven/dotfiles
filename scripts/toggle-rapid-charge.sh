#!/bin/sh

current_rapid_status=`cat /sys/bus/platform/drivers/legion/PNP0C09:00/rapidcharge`
if [ $current_rapid_status -eq 0 ]; then
    pkexec sh -c "legion_cli batteryconservation-disable && legion_cli rapid-charging-enable"
elif [ $current_rapid_status -eq 1 ]; then
    pkexec sh -c "legion_cli batteryconservation-enable && legion_cli rapid-charging-disable"
fi
