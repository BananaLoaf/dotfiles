#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
mkdir $HOME/Pictures/Screenshots
mkdir $HOME/.local/share/wallpapers/User-Wallpapers

################################################################
confirm_path
cd apps

################################################################
echo_green "Linking applications config files"
for dirname in ".local/share" ".config"
do
	for basename in $(ls $dirname)
	do
  		link $PWD/$dirname/$basename $HOME/$dirname/$basename
	done
done

################################################################
# Change shell
NEW_SHELL=/usr/bin/fish
if ! [ $SHELL == $NEW_SHELL ]
then
    echo_green "Changing default shell to fish"
    chsh -s $NEW_SHELL
fi

################################################################
# For touchpad gestures
if groups $USER | grep -q -v input
then
    echo_green "Adding $USER to input group"
    sudo gpasswd -a $USER input        
fi
