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
    for dirname in ".config" ".kde4/apps" ".kde4/share"
    do
        for basename in $(ls $dirname)
        do
            link $PWD/$dirname/$basename $HOME/$dirname/$basename
        done
    done

    link $PWD/.gtkrc-2.0 $HOME/.gtkrc-2.0

    cd ..
else
	echo_green "You must be inside dotfiles directory!"
fi
