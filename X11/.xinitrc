#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# set background image
sh ~/.fehbg &
# disable bell
xset -b

xrdb .Xresources
xmodmap ~/.Xmodmap

source $HOME/.profile
source $HOME/dotfiles/i3/setup_i3_config.sh

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
# exec i3 -V -d all >> ~/.i3/logfile

exec i3

