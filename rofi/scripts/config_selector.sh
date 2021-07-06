#!/usr/bin/env bash

myDir="/home/blonteractor/.config"
theme="${myDir}/rofi/themes/top_dropdown_noicons.rasi"

options=$(cd $myDir && /bin/ls -d */ | cut -d " " -f 1)

choice=$(echo -e "${options[@]}" | rofi -dmenu run -p "Config: " -theme $theme) 

files=$(cd $myDir/$choice && find . -maxdepth 1 -type f)

file_to_edit=$(echo -e "${files[@]}" | rofi -dmenu run -p "Config: " -theme $theme)

file_to_edit=$(echo $file_to_edit | cut -c 3-)

full_path_to_file=$myDir/$choice$file_to_edit
alacritty -e nvim $full_path_to_file &
