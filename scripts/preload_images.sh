#!/bin/bash

dir="$HOME/dotfiles/wallpapers/"

for file in "$dir"*; do
    echo $file
    if [ -f "$file" ]; then
        hyprctl hyprpaper preload $file 
    fi
done
