#!/usr/bin/env fish

set mode_path "/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

# Check if the file exists
if test -f $mode_path
    # Read the contents of the file and store it in a variable
    set mode_now (cat $mode_path)
    # Print the contents of the variable
    echo "Mode: $mode_now"
else
    echo "File does not exist"
    exit
end

if test $mode_now -eq 0
    kitty --title "conservation" fish -c "echo 1 | sudo tee $mode_path"
    set mode_now (cat $mode_path)
else
    kitty --title "conservation" fish -c "echo 0 | sudo tee $mode_path"
    set mode_now (cat $mode_path)
end

if test $mode_now -eq 0
    notify-send "Conservation Mode" "Off"
else   
    notify-send "Conservation Mode" "On"
end
