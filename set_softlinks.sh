#!/bin/bash

DOTFILES=dotfiles

# bash
echo bash
ln -s $HOME/$DOTFILES/bash/.bashrc $HOME/.bashrc

# git
echo git
ln -s $HOME/$DOTFILES/git/.gitconfig $HOME/.gitconfig

# i3
echo i3
mkdir -p $HOME/.i3
ln -s $HOME/$DOTFILES/i3/config $HOME/.i3/config

# vim
echo vim
ln -s $HOME/$DOTFILES/vim/vimrc $HOME/.vimrc

# X11
echo X11
ln -s $HOME/$DOTFILES/X11/.xinitrc $HOME/.xinitrc
ln -s $HOME/$DOTFILES/X11/.Xresources $HOME/.Xresources
ln -s $HOME/$DOTFILES/X11/.Xdefaults $HOME/.Xdefaults

# zsh
echo zsh
ln -s $HOME/$DOTFILES/zsh/.zshrc $HOME/.zshrc


