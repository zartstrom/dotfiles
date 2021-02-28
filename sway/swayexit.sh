#!/bin/sh

case "$1" in
    lock)
        swaylock-blur
        ;;
    logout)
        swaymsg exit
        ;;
    suspend)
        swaylock-blur && systemctl suspend
        ;;
    hibernate)
        swaylock-blur && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
