#!/bin/sh

current_status=`cat /sys/bus/platform/drivers/ideapad_acpi/usb_charging`
if [ $current_status -eq 0 ]; then
    pkexec sh -c "echo 1 > /sys/bus/platform/drivers/ideapad_acpi/usb_charging" && notify-send "Always on USB enabled"
elif [ $current_status -eq 1 ]; then
    pkexec sh -c "echo 0 > /sys/bus/platform/drivers/ideapad_acpi/usb_charging" && notify-send "Always on USB enabled"
fi
