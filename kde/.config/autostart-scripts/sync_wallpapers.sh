#!/bin/bash

HOME="/home/bark"

rsync -rtvu --delete $HOME/Projects/dotfiles/wallpapers/ $HOME/Pictures/Wallpapers
while inotifywait -qr --event modify,create,delete,move $HOME/Pictures/Wallpapers/
do
	rsync -rtvu --delete $HOME/Pictures/Wallpapers/ $HOME/Projects/dotfiles/wallpapers/
done
