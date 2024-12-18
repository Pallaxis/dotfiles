#!/usr/bin/env bash

fastfetch
sudo pacman -Syu --noconfirm
yay -a
echo
read -p "Update Flatpak packages? [Y/n]"$'\n> ' yn
case $yn in
	[yY] )
		printf "\nUpdating Flatpaks...\n\n"
		flatpak update -y;;
	[nN] )
		printf "\nSkipping Flatpaks.\n\n"
		read -p "Press enter to exit" 
		exit;;
	* ) 
		printf "\nUpdating Flatpaks...\n\n"
		flatpak update -y;;
esac

echo
read -p "Press enter to exit" 
