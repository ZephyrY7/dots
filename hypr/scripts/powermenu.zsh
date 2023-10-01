#!/usr/bin/env zsh

selection=$( echo -e " Lock\n Shutdown\n󰜉 Reboot\n Suspend\n Logout" | wofi -n --height 320 --width 300 --dmenu | awk '{print tolower($2)}' )

case $selection in
    poweroff)
        systemctl poweroff now
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
