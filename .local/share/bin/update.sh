#!/bin/bash

fastfetch
#sudo pacman -Syyu --noconfirm
yay --answerdiff All --noconfirm
flatpak update -y

#read -p "Update AUR packages? (Y/n)" yn
#case $yn in
#  [yY] ) echo updating...;
#    yay;;
#  [nN] ) echo exiting...;
#    exit;;
#  * ) echo updating...;
#    yay;;
#esac

read -p "Press enter to exit" 
#printf "\n\nUpdating Arch + AUR Packages:\n\n"
#yay -Syu
#printf "\n\nUpdating Flatpak Packages:\n\n"
#flatpak update
