#!/bin/bash

current_usb_status=$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/usb_charging)
text=""
echo -n "{\"tooltip\":\"Battery mode: }"

if [ $(cat /sys/bus/platform/drivers/legion/PNP0C09:00/rapidcharge) -eq 1 ]; then
    echo -n "Rapid Charge enabled."
    text="$text󱐌 "
fi

if [ $(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode) -eq 1 ]; then
    echo -n "Conservation mode enabled."
    text="$text󰌪 "
fi

echo -n " Always-on USB status: "

if [ $current_usb_status -eq 0 ]; then
    echo -n "Disabled"
elif [ $current_usb_status -eq 1 ]; then
    echo -n "Enabled"
    text="$text󰕓"
fi
echo -n ".\",\"text\":\"$text\"}"
