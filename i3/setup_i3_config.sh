#!/bin/sh


HOST_CONF=$HOME/dotfiles/i3/config.host.$HOSTNAME

if [ -f $HOST_CONF ]; then
    echo "Found config for host \"$HOSTNAME\""
    cat $HOME/dotfiles/i3/config.base \
        $HOST_CONF > $HOME/.config/i3/config
else
    echo "No config for host"
    cat $HOME/dotfiles/i3/config.base > $HOME/.config/i3/config
fi

