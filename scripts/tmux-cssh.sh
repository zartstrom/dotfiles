#!/bin/bash


if [ "$1" = "" ]
then
    cat ~/.tmux-cssh
else
    tmux-cssh -cs $1
fi
