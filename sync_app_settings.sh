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

if [[ $PWD == *dotfiles ]]
then
    cd apps

    ################################################################
    echo_green "Linking config files"
    link $PWD/.config/fish $HOME/.config/fish
    link $PWD/.config/fusuma $HOME/.config/fusuma
    link $PWD/.config/latte $HOME/.config/latte
    link $PWD/.config/ulauncher $HOME/.config/ulauncher
    link $PWD/.config/dolphinrc $HOME/.config/dolphinrc
    link $PWD/.config/lattedockrc $HOME/.config/lattedockrc

    link $PWD/.local/share/konsole $HOME/.local/share/konsole
    link $PWD/.local/share/user-places.xbel $HOME/.local/share/user-places.xbel
    
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
