#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd apps

################################################################
echo_green "Setting up applications"

# autostart apps and scripts
link $PWD/.config/autostart $HOME/.config/autostart
link $PWD/.config/autostart-scripts $HOME/.config/autostart-scripts


# fish
link $PWD/.config/fish $HOME/.config/fish
# Change shell if not changed
NEW_SHELL=/usr/bin/fish
if [[ $SHELL != $NEW_SHELL ]]
then
    echo_green "Changing default shell to fish"
    chsh -s $NEW_SHELL
fi


# fusuma
link $PWD/.config/fusuma $HOME/.config/fusuma
if groups $USER | grep -q -v input
then
    echo_green "Adding $USER to input group"
    sudo gpasswd -a $USER input        
fi


# latte-dock
link $PWD/.config/latte $HOME/.config/latte
link $PWD/.config/lattedockrc $HOME/.config/lattedockrc


# ulauncher
link $PWD/.config/ulauncher $HOME/.config/ulauncher


# dolphin
link $PWD/.config/dolphinrc $HOME/.config/dolphinrc
link $PWD/.local/share/user-places.xbel $HOME/.local/share/user-places.xbel


# konsole
link $PWD/.local/share/konsole $HOME/.local/share/konsole
