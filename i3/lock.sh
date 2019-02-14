#!/bin/bash

LOCK_IMAGE=$HOME/mega/docs/pictures/lock-symbol.png

grim /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
#[[ -f ${LOCK_IMGE} ]] && convert /tmp/screen.png ${LOCK_IMAGE} -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
