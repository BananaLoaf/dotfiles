#!/bin/bash
. ./scripts/funcs.sh --source-only

sudo touch /lib/udev/hwdb.d/99-keyboard-lenovo-vol-fix.hwdb
sudo bash -c "echo -e '# Fix for volume keys on Lenovo Yoga S940\nevdev:atkbd:dmi:bvn*:bvr*:svnLENOVO:pn81Q7*:pvrLenovoYogaS940*\n KEYBOARD_KEY_a0=!mute\n KEYBOARD_KEY_ae=!volumedown\n KEYBOARD_KEY_b0=!volumeup' > /lib/udev/hwdb.d/99-keyboard-lenovo-vol-fix.hwdb"
sudo systemd-hwdb update
sudo udevadm trigger --verbose --sysname-match="event*"
echo_red "Reboot is required!"
