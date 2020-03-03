#!/bin/bash

SRC="$HOME/.dotfiles/wallpapers/"
DST="$HOME/.local/share/wallpapers/User-Wallpapers"

rsync -rtvu --delete $SRC $DST
while inotifywait -qr --event modify,create,delete,move $DST
do
	rsync -rtvu --delete $DST/ $SRC
done
