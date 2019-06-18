#!/bin/bash

datetime=$(date +'%Y-%m-%d_%H%M%S')
target_file=$(xdg-user-dir PICTURES)/screenshot_${datetime}.png
#grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') $target_file
grim -g "$(slurp)" $target_file

