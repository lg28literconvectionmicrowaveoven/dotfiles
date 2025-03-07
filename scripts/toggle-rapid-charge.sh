#!/bin/sh

current_rapid_status=`cat /sys/bus/platform/drivers/legion/PNP0C09:00/rapidcharge`
if [ $current_rapid_status -eq 0 ]; then
    # pkexec sh -c "echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode && echo 1 > /sys/bus/platform/drivers/legion/PNP0C09:00/rapidcharge" && notify-send "Rapid charge enabled."
    pkexec legion_cli rapid-charging-enable
elif [ $current_rapid_status -eq 1 ]; then
    # pkexec sh -c "echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode && echo 0 > /sys/bus/platform/drivers/legion/PNP0C09:00/rapidcharge" && notify-send "Rapid charge disabled."
    pkexec legion_cli rapid-charging-disable
fi
