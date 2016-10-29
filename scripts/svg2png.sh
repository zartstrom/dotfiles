#!/bin/bash

for i in *; do
    if [[ "$i" == *.svg ]]; then
        inkscape $i --export-png=`echo $i | sed -e 's/svg$/png/'`;
    fi
done

