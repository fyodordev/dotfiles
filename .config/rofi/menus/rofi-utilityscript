#!/bin/bash


# options to be displayed
option0="Screenshot"

if [ -z $@ ]
then
    # Script gets called to get list of options.
    options="$option0\n$option1\n$option2"
    printf $options;
else
    # Script gets called with chosen option. 
    chosen=$@;
    case $chosen in
        $option0)
            nohup "screenshot_area_rofi" &>/dev/null & disown;;
    esac
fi
