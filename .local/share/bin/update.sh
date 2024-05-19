if [ "$1" == "up" ] ; then
trap 'pkill -RTMIN+20 waybar' EXIT
command="
fastfetch
$0 upgrade
yay -Syu
flatpak update
read -n 1 -p 'Press any key to continue...'
"
kitty --title systemupdate sh -c "${command}"
fi
#printf "\n\nUpdating Arch + AUR Packages:\n\n"
#yay -Syu
#printf "\n\nUpdating Flatpak Packages:\n\n"
#flatpak update
