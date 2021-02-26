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

# Make bluetooth work
sudo systemctl enable bluetooth.service
