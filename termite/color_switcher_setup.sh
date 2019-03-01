#!/bin/bash

REPO_FOLDER="$HOME/repos"
mkdir -p "$REPO_FOLDER"
cd "$REPO_FOLDER" || exit

TERMITE_COLOR_SWITCHER_DIR="termite-color-switcher"
if [ ! -d "$TERMITE_COLOR_SWITCHER_DIR" ]; then
    git clone https://github.com/NearHuscarl/termite-color-switcher.git
fi
pwd
cd "$TERMITE_COLOR_SWITCHER_DIR" || exit
git pull --rebase

pwd
cp "color/*" "$HOME/.config/termite/color/"

# ~/scripts is in $PATH
FOLDER_IN_PATH="$HOME/scripts"
cd "$FOLDER_IN_PATH" || exit
ln -s "$REPO_FOLDER/termite-color-switcher/bin/color"

