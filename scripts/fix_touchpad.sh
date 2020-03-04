#!/bin/bash
. ./scripts/funcs.sh --source-only

sudo systemctl disable tlp  # Not sure
echo_green "Install linux4.19"
echo_green "Add i8042.nomux to kernel parameters"
echo_green "Help: https://wiki.archlinux.org/index.php/Libinput#Touchpad_not_detected_at_all"