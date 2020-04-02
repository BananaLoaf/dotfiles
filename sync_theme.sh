#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd theme

################################################################ 
echo_green "Linking theme files"
for dirname in ".local/share/aurorae/themes" ".local/share/plasma/desktoptheme" ".local/share/plasma/look-and-feel" ".local/share/color-schemes"
do
    link $PWD/$dirname $HOME/$dirname
done
link $PWD/.local/share/color-schemes $HOME/.kde4/apps/color-schemes
