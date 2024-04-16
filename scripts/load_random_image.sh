#!/bin/bash

dir="$HOME/dotfiles/wallpapers/"
random_file=$(shuf -n 1 -e "$dir"*)
if [ -f "$random_file" ]; then
    hyprctl hyprpaper wallpaper "eDP-1,$random_file"
else
    echo "Ooof"
fi
