#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
echo_green "Removing packages"

PACKAGES="firefox imagewriter gwenview kate konversation spectacle thunderbird yakuake kget zsh"
for pkg in $PACKAGES
do
	sudo pacman -R --noconfirm $pkg
done

################################################################
echo_green "Cleaning up"
# firefox
rm -r $HOME/.cache/mozilla
rm -r $HOME/.mozilla

# gwenview
rm -r $HOME/.config/gwenviewrc
rm -r $HOME/.config/org.kde.gwenviewrc
rm -r $HOME/.kde/share/apps/gwenview
rm -r $HOME/.kde/share/config/gwenviewrc
rm -r $HOME/.kde4/share/apps/gwenview
rm -r $HOME/.kde4/share/config/gwenviewrc
rm -r $HOME/.local/share/gwenview
rm -r $HOME/.local/share/org.kde.gwenview

# kate
rm -r $HOME/.config/katemetainfos
rm -r $HOME/.config/katepartrc
rm -r $HOME/.config/katerc
rm -r $HOME/.config/kateschemarc
rm -r $HOME/.config/katesyntaxhighlightingrc
rm -r $HOME/.config/katevirc
rm -r $HOME/.local/share/kate

# konversation
rm -r $HOME/.config/konversationrc
rm -r $HOME/.kde/share/config/konversationrc
rm -r $HOME/.kde4/share/config/konversationrc

# spectacle
rm -r $HOME/.config/spectaclerc

# thunderbird
rm -r $HOME/.cache/thunderbird
rm -r $HOME/.thunderbird
rm -r $HOME/.icedove

# kget
rm -r $HOME/.config/kgetrc
rm -r $HOME/.config/kioslaverc
