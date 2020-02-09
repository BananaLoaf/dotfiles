#!/bin/bash 

if grep -q "pam_gnome_keyring.so" /etc/pam.d/sddm
then
    echo "Already in autostart!"
else
    echo "auth		optional	pam_gnome_keyring.so             # gnome-keyring" | sudo tee -a /etc/pam.d/sddm
	echo "session		optional	pam_gnome_keyring.so auto_start  # gnome-keyring" | sudo tee -a /etc/pam.d/sddm
fi
