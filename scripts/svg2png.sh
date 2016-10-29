#!/bin/bash

for i in *; do inkscape $i --export-png=`echo $i | sed -e 's/svg$/png/'`; done

