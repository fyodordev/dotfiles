#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
#echo $SCRIPTPATH
pacman -Qqe > $SCRIPTPATH/pkglist.txt;

# For some reason with files-from, the --recursive (-r) option is no longer implied with -a
# so we have to add it again.
# https://stackoverflow.com/questions/16647476/how-to-rsync-only-a-specific-list-of-files
rsync -var --exclude-from=$SCRIPTPATH/exclude-paths --files-from=$SCRIPTPATH/tracked-paths --delete / $SCRIPTPATH/root/
