#!/bin/bash



datetime=$(date +'%Y-%m-%d_%H%M%S')
mkdir -p $(xdg-user-dir PICTURES)/screenshots
target_file=$(xdg-user-dir PICTURES)/screenshots/screenshot_${datetime}.png
#grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $target_file

if [ "$1" == "focused_output" ]; then
    # output=$(python $HOME/scripts/focused_output.py)
    grim -o "$(python $HOME/scripts/focused_output.py)" $target_file
else
    # grim -g "$(slurp)" $target_file
    XDG_CURRENT_DESKTOP=sway QT_QPA_PLATFORM=wayland flameshot gui -p $target_file
fi
