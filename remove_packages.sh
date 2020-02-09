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
rm $HOME/home/bark/.config/gwenviewrc
rm $HOME/home/bark/.config/katemetainfos
rm $HOME/home/bark/.config/katerc
rm $HOME/home/bark/.config/kateschemarc
rm $HOME/home/bark/.config/katevirc
