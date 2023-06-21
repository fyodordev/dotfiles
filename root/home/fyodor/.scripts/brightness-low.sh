#!/bin/bash

ddcutil --bus 3 setvcp 10 60
ddcutil --bus 4 setvcp 10 60

## Run the ddcutil detect command, extract the bus numbers, and loop over them
#ddcutil detect | grep bus | grep -oP '/dev/i2c-\K\d+' | while read bus_num; do
#    # Run the ddcutil command with the extracted bus number
#    ddcutil --bus "$bus_num" setvcp 10 50
#    # echo "$bus_num"
#done
#
#ddcutil detect | grep bus | grep -oP 'Display \K\d+' | while read display_num; do
#    ddcutil --display "$display_num" setvcp 10 50
#done
