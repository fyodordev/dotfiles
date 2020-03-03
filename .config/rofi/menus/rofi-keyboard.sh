#!/bin/bash


# options to be displayed
option0="English"
option1="Russian"

if [ -z $@ ]
then
    # Script gets called to get list of options.
    options="$option0\n$option1"
    printf $options;
else
    # Script gets called with chosen option. 
    chosen=$@;
    case $chosen in
        $option0)
            setxkbmap us_intl;;
        $option1)
            setxkbmap ru;;
    esac
fi
