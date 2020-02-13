#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
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
link $PWD/.face $HOME/.face
sudo cp $PWD/.face /usr/share/sddm/faces/$USER.face.icon
