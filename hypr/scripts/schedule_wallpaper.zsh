#!/usr/bin/env zsh

wall_path="/home/zephyr/.config/wallpapers"
interval=500

while true; do
    wall_file=($(ls -1 $wall_path | shuf -n 1))

    if [[ -n $wall_file ]]; then
        echo "Random file: $wall_file"
        full_path="${wall_path}/${wall_file}"
        swww img $full_path --transition-bezier .53,0.77,0.97,.57 --transition-type grow --transition-duration 2 --transition-fps 60 --transition-step 3
    else
        echo "No files found in the folder"
        exit
    fi

    sleep $interval
done
