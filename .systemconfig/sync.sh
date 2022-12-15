#!/bin/bash


SCRIPT=$(readlink -f "$0")

SCRIPTPATH=$(dirname "$SCRIPT")

sudo pacman -Qqen > $SCRIPTPATH/pkglist.txt

sudo rsync -var --files-from=$SCRIPTPATH/tracked-paths / $SCRIPTPATH/root/
