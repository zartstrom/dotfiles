#!/bin/bash

# from https://wiki.archlinux.org/index.php/Touchpad_Synaptics

# the name of the touchpad device may vary
DEVICE_REGEX="GlidePoint"


function get_touchpad_id {
    declare -i ID
    ID=`xinput list | grep -Eio "$DEVICE_REGEX\s*id\=[0-9]{1,2}" | grep -Eo '[0-9]{1,2}'`
    echo $ID
}

function get_touchpad_state {
    declare -i STATE
    STATE=`xinput list-props $1|grep 'Device Enabled'|awk '{print $4}'`
    echo $STATE
}

function touchpad_enable {
    xinput enable $1
    echo "Touchpad enabled."
    # notify-send 'Touchpad' 'Enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
}

function touchpad_disable {
    xinput disable $1
    echo "Touchpad disabled."
    # notify-send 'Touchpad' 'Disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
}

function toggle_switch {
    ID=$(get_touchpad_id)
    STATE=$(get_touchpad_state $ID)
    if [ $STATE -eq 1 ]
    then
        touchpad_disable $ID
    else
        touchpad_enable $ID
    fi
}

function toggle_off {
    ID=$(get_touchpad_id)
    touchpad_disable $ID
}


case "$1" in
"off")
    toggle_off
    ;;
*)
    toggle_switch
    ;;
esac

