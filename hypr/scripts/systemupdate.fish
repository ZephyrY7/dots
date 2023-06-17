#!/usr/bin/env fish

# Check release
if not test -f /etc/arch-release
    exit 0
end

# Trigger upgrade
if test "$argv[1]" = "pacup"
    kitty --title "󰚰 updates" fish -c 'yay -Syu'
end

# Check for updates
set aur (yay -Qua | wc -l)
set ofc (pacman -Qu | wc -l)

# Calculate total available updates
set upd (math "$ofc + $aur")
echo $upd

# Show tooltip
if test $upd -eq 0
    echo " Packages are up to date"
else
    echo "󱓽 Official $ofc 󱓾 AUR $aur"
end
