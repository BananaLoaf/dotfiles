#!/bin/bash
. ./scripts/funcs.sh --source-only


if grep -q "blacklist pata_legacy" /etc/modprobe.d/blacklist.conf
then
    echo_red "pata_legacy already blacklisted!"
else
	echo_green "Blacklisting pata_legacy"
    echo "blacklist pata_legacy" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
fi
