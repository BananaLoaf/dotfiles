#!/bin/bash
. ./scripts/funcs.sh --source-only

create_subvolume ()
{
    local SUBVOLUME_PATH=$1
    local TEMP_PATH="$SUBVOLUME_PATH"_temp
    if sudo btrfs subvolume list -a / | grep -q $(basename $SUBVOLUME_PATH)
	then
		echo_red "Subvolume at $SUBVOLUME_PATH alredy exists!"
    else
    	echo_green "Creating subvolume at $SUBVOLUME_PATH"

    	if ls $(dirname $SUBVOLUME_PATH) | grep -q $(basename $SUBVOLUME_PATH)
    	then
	    	mv $SUBVOLUME_PATH $TEMP_PATH
	    	btrfs subvolume create $SUBVOLUME_PATH > /dev/null
	    	mv $TEMP_PATH/* $SUBVOLUME_PATH/ > /dev/null
	    	rm -r $TEMP_PATH
	    else
	    	btrfs subvolume create $SUBVOLUME_PATH > /dev/null
	    fi
	fi
} 

confirm_path

create_subvolume $HOME/Desktop
create_subvolume $HOME/Documents
create_subvolume $HOME/Downloads
create_subvolume $HOME/Music
create_subvolume $HOME/Pictures
create_subvolume $HOME/Projects
create_subvolume $HOME/Videos
