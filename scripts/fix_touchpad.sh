#!/bin/bash
. ./scripts/funcs.sh --source-only

sudo systemctl disable tlp  # Not sure about this
echo_green "Add i8042.nomux to kernel parameters"
