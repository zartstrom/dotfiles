#!/bin/bash


function display_header {
    echo
    echo "--- $1 ---"
}


DOTFILES=$HOME/dotfiles
cd $HOME

# bash
display_header bash
ln -sv $DOTFILES/bash/.bashrc $HOME/.bashrc
ln -sv $DOTFILES/bash/.bash_aliases $HOME/.bash_aliases

# firefox (no Desktop folder please)
display_header firefox
mkdir -p $HOME/.config
ln -sv $DOTFILES/firefox/user-dirs.dirs $HOME/.config/user-dirs.dirs

# git
display_header git
ln -sv $DOTFILES/git/.gitconfig $HOME/.gitconfig

# i3
display_header i3
mkdir -p $HOME/.config/i3
# no I do it with setup_i3_config.sh which is sourced in .xinitc
# ln -sv $HOME/$DOTFILES/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status
ln -sv $DOTFILES/i3/i3status.conf $HOME/.config/i3status/config

mkdir -p $HOME/scripts
ln -sv $DOTFILES/i3/i3exit.sh $HOME/scripts/i3exit.sh
ln -sv $DOTFILES/i3/lock.sh $HOME/scripts/lock.sh

# pylint
display_header pylint
ln -sv $DOTFILES/pylint/pylintrc $HOME/.pylintrc

# scripts
display_header scripts
mkdir -p $HOME/scripts
ln -sv $DOTFILES/scripts/touchpad_toggle.sh $HOME/scripts/touchpad_toggle.sh 

# vim
display_header vim
mkdir -p $HOME/.vim
mkdir -p $HOME/.vimswap
ln -sv $DOTFILES/vim/vimrc $HOME/.vimrc

# X11
display_header X11
ln -sv $DOTFILES/X11/.xinitrc $HOME/.xinitrc
ln -sv $DOTFILES/X11/.xprofile $HOME/.xprofile
ln -sv $DOTFILES/X11/.Xresources $HOME/.Xresources
ln -sv $DOTFILES/X11/.Xdefaults $HOME/.Xdefaults
# mouse config:
ln -sv $DOTFILES/X11/.imwheelrc $HOME/.imwheelrc

# zsh
display_header zsh
ln -sv $DOTFILES/zsh/.zshrc $HOME/.zshrc
mkdir -p $HOME/.oh-my-zsh/themes
ln -sv $DOTFILES/zsh/af-magic-light.zsh-theme $HOME/.oh-my-zsh/themes

