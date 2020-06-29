#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd sddm_theme

################################################################
echo_green "Setting up SDDM theme"

sudo cp $PWD/../kde/.face.syncpoint /usr/share/sddm/faces/$USER.face.icon
sudo cp -r $PWD/../kde_theme/.icons.syncpoint/PearDarkCursors /usr/share/icons/
sudo cp -r $PWD/sugar-candy /usr/share/sddm/themes/

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
