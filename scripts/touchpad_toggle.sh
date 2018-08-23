#!/bin/bash

# see https://wiki.archlinux.org/index.php/Touchpad_Synaptics

# the name of the touchpad device may vary
DEVICE_NAME_LENOVO="Synaptics tm2964-001"
DEVICE_NAME_DELL="GlidePoint"

DEVICE_REGEX="($DEVICE_NAME_LENOVO|$DEVICE_NAME_DELL)"


function get_touchpad_id {
    declare -i ID
    ID=$(xinput list | grep -Eio "$DEVICE_REGEX\s*id\=[0-9]{1,2}" | grep -Eo '[0-9]{1,2}$')
    echo "$ID"
}

function get_touchpad_state {
    declare -i STATE
    STATE=$(xinput list-props "$1"|grep 'Device Enabled'|awk '{print $4}')
    echo "$STATE"
}

function touchpad_enable {
    xinput enable "$1"
    echo "Touchpad enabled."
}

function touchpad_disable {
    xinput disable "$1"
    echo "Touchpad disabled."
}

function toggle_switch {
    ID=$(get_touchpad_id)
    STATE=$(get_touchpad_state "$ID")
    if [ "$STATE" -eq 1 ]
    then
        touchpad_disable "$ID"
    else
        touchpad_enable "$ID"
    fi
}

function toggle_off {
    ID=$(get_touchpad_id)
    touchpad_disable "$ID"
}

function toggle_on {
    ID=$(get_touchpad_id)
    touchpad_enable "$ID"
}

function toggle_status {
    ID=$(get_touchpad_id)
    STATE=$(get_touchpad_state "$ID")
    if [ "$STATE" -eq 1 ]
    then
        echo "Touchpad is enabled."
    else
        echo "Touchpad is disabled."
    fi
}


case "$1" in
"off")
    toggle_off
    ;;
"on")
    toggle_on
    ;;
"status")
    toggle_status
    ;;
*)
    toggle_switch
    ;;
esac

