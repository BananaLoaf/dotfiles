#!/bin/bash

echo_green ()
{
    local TEXT=$1
    echo -e "\e[4;32m$TEXT\e[0m"
}

link ()
{
    local SOURCE=$1
    local DEST=$2
    echo "Linking $SOURCE -> $DEST"
    mkdir -p $(dirname $DEST) # Make parent dir for destination
    rm -r $DEST               # Remove existing destination
    ln -s $SOURCE $DEST       # Link
}

################################################################
mkdir $HOME/Pictures/Screenshots
link $PWD/wallpapers $HOME/Pictures/Wallpapers

################################################################
if [[ $PWD == *dotfiles ]]
then
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

    cd ..
else
	echo_green "You must be inside dotfiles directory!"
fi
