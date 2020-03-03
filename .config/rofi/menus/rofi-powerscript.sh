#!/bin/bash


# options to be displayed
option0="logout"
option1="reboot"
option2="shutdown"

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
            #nohup kitty zsh -c 'echo "blah"; exec zsh' &> /dev/null & disown;;  #zsh -c 'echo "test"'
            pkill -KILL -u $(whoami);;
        $option1)
            reboot;;
        $option2)
            shutdown -h now;;
    esac
fi
