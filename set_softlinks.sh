#!/bin/bash

DOTFILES=dotfiles
cd $HOME

# bash
echo bash
ln -s $DOTFILES/bash/.bashrc

# git
echo git
ln -s $DOTFILES/git/.gitconfig

# i3
echo i3
mkdir -p .i3
ln -s $DOTFILES/i3/config .i3/config

# vim
echo vim
ln -s $DOTFILES/vim/vimrc .vimrc

# X11
echo X11
ln -s $DOTFILES/X11/.xinitrc
ln -s $DOTFILES/X11/.Xresources
ln -s $DOTFILES/X11/.Xdefaults

# zsh
echo zsh
ln -s $DOTFILES/zsh/.zshrc


