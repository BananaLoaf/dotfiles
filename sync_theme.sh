#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd theme

################################################################ 
echo_green "Linking theme files"
for dirname in ".local/share/aurorae/themes/Abyss-Dark" ".local/share/plasma/desktoptheme/Abyss-Dark" ".local/share/color-schemes"
do
    link $PWD/$dirname $HOME/$dirname
done
