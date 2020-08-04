#!/bin/bash
. ./scripts/funcs.sh --source-only

if grep -q "options snd-hda-intel dmic_detect=0" /etc/modprobe.d/alsa-base.conf
then
    echo_red "dmic_detect already fixed!"
else
	echo_green "Fixing dmic_detect"
    echo "options snd-hda-intel dmic_detect=0" | sudo tee -a /etc/modprobe.d/alsa-base.conf > /dev/null
fi


if grep -q "blacklist snd_soc_skl" /etc/modprobe.d/blacklist.conf
then
    echo_red "snd_soc_skl already blacklisted!"
else
	echo_green "Blacklisting snd_soc_skl"
    echo "blacklist snd_soc_skl" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
fi
