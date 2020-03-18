#!/bin/bash

SRC="$HOME/.dotfiles/wallpapers"
DST="$HOME/.local/share/wallpapers/user-wallpapers"

mkdir $DST

rsync -rtvu --delete $SRC/ $DST
while inotifywait -qr --event modify,create,delete,move $SRC
do
	rsync -rtvu --delete $SRC/ $DST
done
