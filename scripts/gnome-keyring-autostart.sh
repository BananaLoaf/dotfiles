#!/bin/bash
. ./scripts/funcs.sh --source-only

if grep -q "pam_gnome_keyring.so" /etc/pam.d/sddm
then
    echo_red "gnome-keyring is already in autostart!"
else
	echo_green "Adding gnome-keyring to autostart"
    echo "auth		optional	pam_gnome_keyring.so             # gnome-keyring" | sudo tee -a /etc/pam.d/sddm > /dev/null
	echo "session		optional	pam_gnome_keyring.so auto_start  # gnome-keyring" | sudo tee -a /etc/pam.d/sddm > /dev/null
fi
