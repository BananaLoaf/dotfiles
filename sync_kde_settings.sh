#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd kde

################################################################
echo_green "Setting up KDE"

sudo cp $PWD/.face /usr/share/sddm/faces/$USER.face.icon

# Link files
for sync_point in $(find . -name "*$SUFFIX")
do
	sync_point=${sync_point#"./"}

    link $PWD/$sync_point $HOME/${sync_point%$SUFFIX}
done
