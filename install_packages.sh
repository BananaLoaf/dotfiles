#!/bin/bash

echo_green ()
{
	local TEXT=$1
	echo -e "\e[4;32m$TEXT\e[0m"
}

################################################################
echo_green "Installing packages"

SECURITY="gnome-keyring kgpg seahorse"
MEDIA="pix gimp	lollypop"
BACKUP="deja-dup timeshift"
RICING="paper-icon-theme-git latte-dock neofetch lolcat"
MISC="gutenprint grub-customizer gparted net-tools zip unzip yay flameshot fish gocryptfs etcher time"

PACKAGES="$SECURITY $INTERNET $MEDIA $BACKUP $RICING $MISC"
sudo pamac install $PACKAGES --no-confirm


################################################################
echo_green "Installing AUR packages"

SECURITY_AUR="tunnelbear"
INTERNET_AUR="google-chrome dropbox tor-browser"
DEVELOPMENT_AUR="gitkraken"
BACKUP_AUR="btrbk"
RICING_AUR="sweet-theme-git chromeos-gtk-theme-git ulauncher"
MISC_AUR="ruby-fusuma gotop"

PACKAGES_AUR="$SECURITY_AUR $INTERNET_AUR $DEVELOPMENT_AUR $BACKUP_AUR $RICING_AUR $MISC_AUR"
yay -S --needed --noconfirm --batchinstall --noredownload --norebuild --nopgpfetch $PACKAGES_AUR 


################################################################
echo_green "Installing SNAP packages"

DEVELOPMENT_SNAP_CLASSIC="clion pycharm-community sublime-text"
PACKAGES_SNAP_CLASSIC="$DEVELOPMENT_SNAP_CLASSIC"

MEDIA_SNAP="spotify google-play-music-desktop-player"
COMMUNICAION_SNAP="telegram-desktop whatsdesk discord mailspring protonmail-desktop-unofficial"
PACKAGES_SNAP="$MEDIA_SNAP $COMMUNICAION_SNAP"

for pkg in $PACKAGES_SNAP_CLASSIC
do
	sudo snap install $pkg --classic
done

for pkg in $PACKAGES_SNAP
do
	sudo snap install $pkg
done
