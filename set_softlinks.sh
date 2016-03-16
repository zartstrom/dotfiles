#!/bin/bash


function display_header {
    echo
    echo "--- $1 ---"
}

function softlink {
    src=$1
    target=$2
    echo "ln -s $src $target"
    ln -s $src $target 2&> /dev/null
    #ln -s $src $target
}


DOTFILES=$HOME/dotfiles
cd $HOME

# bash
display_header bash
softlink $DOTFILES/bash/.bashrc $HOME/.bashrc
softlink $DOTFILES/bash/.bash_aliases $HOME/.bash_aliases

# firefox (no Desktop folder please)
display_header firefox
mkdir -p $HOME/.config
softlink $DOTFILES/firefox/user-dirs.dirs $HOME/.config/user-dirs.dirs

# git
display_header git
softlink $DOTFILES/git/.gitconfig $HOME/.gitconfig

# i3
display_header i3
mkdir -p $HOME/.config/i3
# no I do it with setup_i3_config.sh which is sourced in .xinitc
# softlink $HOME/$DOTFILES/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.config/i3status
softlink $DOTFILES/i3/i3status.conf $HOME/.config/i3status/config

mkdir -p $HOME/scripts
softlink $DOTFILES/i3/i3exit.sh $HOME/scripts/i3exit.sh
softlink $DOTFILES/i3/lock.sh $HOME/scripts/lock.sh
softlink $DOTFILES/i3/from_here.sh $HOME/scripts/from_here.sh

# pylint
display_header pylint
softlink $DOTFILES/pylint/pylintrc $HOME/.pylintrc

# scripts
display_header scripts
mkdir -p $HOME/scripts
softlink $DOTFILES/scripts/touchpad_toggle.sh $HOME/scripts/touchpad_toggle.sh 

# vim
display_header vim
mkdir -p $HOME/.vim
mkdir -p $HOME/.vimswap
mkdir -p $HOME/.config/nvim
softlink $DOTFILES/vim/vimrc $HOME/.vimrc
softlink $DOTFILES/vim/init.vim $HOME/.config/nvim/init.vim

# X11
display_header X11
softlink $DOTFILES/X11/.xinitrc $HOME/.xinitrc
softlink $DOTFILES/X11/.xprofile $HOME/.xprofile
softlink $DOTFILES/X11/.Xresources $HOME/.Xresources
softlink $DOTFILES/X11/.Xdefaults $HOME/.Xdefaults
# mouse config:
softlink $DOTFILES/X11/.imwheelrc $HOME/.imwheelrc

# zsh
display_header zsh
softlink $DOTFILES/zsh/.zshrc $HOME/.zshrc
mkdir -p $HOME/.oh-my-zsh/themes
softlink $DOTFILES/zsh/af-magic-light.zsh-theme $HOME/.oh-my-zsh/themes

