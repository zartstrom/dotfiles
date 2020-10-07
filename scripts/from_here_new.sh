#!/bin/bash

swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused==true) | .name, .pid, .app_id // empty'
#"phil@iyumi: ~/dotfiles"
#7732
#"gnome-terminal-server"
