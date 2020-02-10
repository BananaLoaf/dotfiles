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
    cd kde

    ################################################################
    echo_green "Linking KDE config files"
    link $PWD/.config/autostart $HOME/.config/autostart
    link $PWD/.config/autostart-scripts $HOME/.config/autostart-scripts
    link $PWD/.config/gtk-3.0 $HOME/.config/gtk-3.0
    link $PWD/.gtkrc-2.0 $HOME/.gtkrc-2.0

    for file in $(find .config -maxdepth 1 -type f)
    do
        link $PWD/$file $HOME/$file
    done

    cd ..
else
	echo_green "You must be inside dotfiles directory!"
fi
