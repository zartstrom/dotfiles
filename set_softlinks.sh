#!/bin/bash

DOTFILES=$HOME/dotfiles
cd $HOME

# bash
echo bash
ln -s $DOTFILES/bash/.bashrc $HOME/.bashrc
ln -s $DOTFILES/bash/.bash_aliases $HOME/.bash_aliases

# firefox (no Desktop folder please)
echo firefox
mkdir -p $HOME/.config
ln -s $DOTFILES/firefox/user-dirs.dirs $HOME/.config/user-dirs.dirs

# git
echo git
ln -s $DOTFILES/git/.gitconfig $HOME/.gitconfig

# i3
echo i3
mkdir -p $HOME/.config/i3
# no I do it with setup_i3_config.sh which is sourced in .xinitc
# ln -s $HOME/$DOTFILES/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status
ln -s $DOTFILES/i3/i3status.conf $HOME/.config/i3status/config

mkdir -p $HOME/scripts
ln -s $DOTFILES/i3/i3exit.sh $HOME/scripts/i3exit.sh

# scripts
echo scripts
mkdir -p $HOME/scripts
ln -s $DOTFILES/scripts/touchpad_toggle.sh $HOME/scripts/touchpad_toggle.sh 

# vim
echo vim
mkdir -p $HOME/.vim
mkdir -p $HOME/.vimswap
ln -s $DOTFILES/vim/vimrc $HOME/.vimrc

# X11
echo X11
ln -s $DOTFILES/X11/.xinitrc $HOME/.xinitrc
ln -s $DOTFILES/X11/.Xresources $HOME/.Xresources
ln -s $DOTFILES/X11/.Xdefaults $HOME/.Xdefaults

# zsh
echo zsh
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc
mkdir -p $HOME/.oh-my-zsh/themes
ln -s $DOTFILES/zsh/af-magic-light.zsh-theme $HOME/.oh-my-zsh/themes

