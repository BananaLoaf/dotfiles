#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd kde

################################################################
echo_green "Setting up KDE"

# Link files
for sync_point in $(find . -name "*$SUFFIX")
do
	sync_point=${sync_point#"./"}

    link $PWD/$sync_point $HOME/${sync_point%$SUFFIX}
done

echo_red "Linking user picture to root space"
sudo cp $PWD/.face.syncpoint /var/lib/AccountsService/icons/$USER

echo_red "Making Bluetooth work"
sudo systemctl enable bluetooth.service
