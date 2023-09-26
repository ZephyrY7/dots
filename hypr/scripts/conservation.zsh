#!/usr/bin/env zsh

mode_path="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

# Check if the file exists
if [[ -f $mode_path ]]; then
    # Read the contents of the file and store it in a variable
    mode_now=$(cat $mode_path)
    # Print the contents of the variable
    echo "Mode: $mode_now"
else
    echo "File does not exist"
    exit
fi

if [[ $mode_now -eq 0 ]]; then
    kitty --title "conservation" zsh -c "echo 1 | sudo tee $mode_path"
    mode_now=$(cat $mode_path)
else
    kitty --title "conservation" zsh -c "echo 0 | sudo tee $mode_path"
    mode_now=$(cat $mode_path)
fi

if [[ $mode_now -eq 0 ]]; then
    notify-send "Conservation Mode" "Off"
else   
    notify-send "Conservation Mode" "On"
fi
