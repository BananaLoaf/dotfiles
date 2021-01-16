#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd apps

################################################################
echo_green "Setting up applications"

# Link files
for sync_point in $(find . -name "*$SUFFIX")
do
	sync_point=${sync_point#"./"}

    link $PWD/$sync_point $HOME/${sync_point%$SUFFIX}
done


# Change shell if not changed
NEW_SHELL=/usr/bin/fish
if [[ $SHELL != $NEW_SHELL ]]
then
    chsh -s $NEW_SHELL
fi


# fusuma
# if groups $USER | grep -q -v input
# then
#     sudo gpasswd -a $USER input        
# fi
