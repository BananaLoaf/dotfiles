#!/bin/bash

echo_red ()
{
	local TEXT=$1
	echo -e "\e[4;31m$TEXT\e[0m"
}

echo_red "Removing packages"

PACKAGES="firefox imagewriter gwenview kate konversation spectacle thunderbird yakuake kget"
sudo pamac remove $PACKAGES

echo_red "Cleaning up"
rm -r $HOME/.cache/mozilla
rm -r $HOME/.local/share/gwenview
rm -r $HOME/.local/share/kate
rm $HOME/.config/gwenviewrc
rm $HOME/.config/katemetainfos
rm $HOME/.config/katerc
rm $HOME/.config/kateschemarc
rm $HOME/.config/katevirc
