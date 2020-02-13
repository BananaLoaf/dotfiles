#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
echo_green "Removing packages"

PACKAGES="firefox imagewriter gwenview kate konversation spectacle thunderbird yakuake kget"
for pkg in $PACKAGES
do
	sudo pamac remove $pkg
done

################################################################
echo_green "Cleaning up"
rm -r $HOME/.cache/mozilla
rm -r $HOME/.local/share/gwenview
rm -r $HOME/.local/share/kate
rm $HOME/.config/gwenviewrc
rm $HOME/.config/katemetainfos
rm $HOME/.config/katerc
rm $HOME/.config/kateschemarc
rm $HOME/.config/katevirc
