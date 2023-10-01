#!/usr/bin/env zsh

selection=$( echo -e " Lock\n Poweroff\n󰜉 Reboot\n Suspend\n Logout" | wofi -n --height 320 --width 300 --dmenu | awk '{print tolower($2)}' )

case $selection in
    shutdown)
        systemctl poweroff -h now
        ;;
    reboot)
        systemctl reboot
        ;;
    suspend)
        sleep 0.4 && swaylock && systemctl suspend
        ;;
    lock)
        sleep 0.4 && swaylock
        ;;
    logout)
        hyprctl dispatch exit
        ;;
    *)
        echo "Invalid option"
        ;;
esac
