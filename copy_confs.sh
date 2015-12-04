#!/bin/bash

# use with care
# use with sudo


DOTFILES=/home/phil/dotfiles


cp $DOTFILES/conf/pacman.conf /etc/pacman.conf
cp $DOTFILES/conf/slim.conf /etc/slim.conf
cp $DOTFILES/conf/locale.conf /etc/locale.conf
cp $DOTFILES/conf/10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
cp $DOTFILES/conf/vconsole.conf /etc/vconsole.conf

