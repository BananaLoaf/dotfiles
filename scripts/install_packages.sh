#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
echo_green "Installing packages"

PACKAGES="gnome-keyring kgpg seahorse pix gimp lollypop telegram-desktop \
deja-dup timeshift paper-icon-theme-git latte-dock neofetch lolcat gutenprint \
ttf-opensans grub-customizer gparted net-tools zip unzip yay flameshot \
fish gocryptfs etcher time tor torsocks inotify-tools transmission-qt \
graphviz"
sudo pamac install $PACKAGES --no-confirm


################################################################
echo_green "Installing AUR packages"

PACKAGES_AUR="tunnelbear google-chrome gitkraken btrbk sweet-theme-git ruby-fusuma \
sweet-theme-git ruby-fusuma gotop ulauncher trezor-bridge-bin python37 dropbox tor-browser"
yay -S --needed --noconfirm --batchinstall --noredownload --norebuild $PACKAGES_AUR 


################################################################
echo_green "Installing SNAP packages"

PACKAGES_SNAP_CLASSIC="clion pycharm-community sublime-text"
PACKAGES_SNAP="spotify google-play-music-desktop-player whatsdesk \
discord mailspring protonmail-desktop-unofficial"

for pkg in $PACKAGES_SNAP_CLASSIC
do
	sudo snap install $pkg --classic
done

for pkg in $PACKAGES_SNAP
do
	sudo snap install $pkg
done
