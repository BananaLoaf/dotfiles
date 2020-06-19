#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd theme

################################################################
# SDDM THEME
sudo cp -r $PWD/.icons.syncpoint/PearDarkCursors /usr/share/icons/
sudo cp -r $PWD/sugar-candy /usr/share/sddm/themes/sugar-candy

sudo python -c "\
import configparser;\
config = configparser.ConfigParser();\
config.optionxform=str;\
config.read('/etc/sddm.conf');\
\
config['General']['Numlock'] = 'on';\
config['Theme']['Current'] = 'sugar-candy';\
config['Theme']['Theme'] = 'sugar-candy';\
config['Theme']['CursorTheme'] = 'PearDarkCursors';\
\
file = open('/etc/sddm.conf', 'w');\
config.write(file)"

################################################################
echo_green "Setting up KDE theming"

# Link files
for sync_point in $(find . -name "*$SUFFIX")
do
	sync_point=${sync_point#"./"}

    link $PWD/$sync_point $HOME/${sync_point%$SUFFIX}
done
