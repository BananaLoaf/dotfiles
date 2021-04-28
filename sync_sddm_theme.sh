#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path

################################################################
echo_green "Setting up SDDM theme"

sudo cp $HOME/.dotfiles/kde/.face.syncpoint /usr/share/sddm/faces/$USER.face.icon

sudo python -c "\
import configparser;\
config = configparser.ConfigParser();\
config.optionxform=str;\
config.read('/etc/sddm.conf.d/kde_settings.conf');\
\
config['General']['Numlock'] = 'on';\
config['Theme']['Current'] = 'sugar-light';\
config['Theme']['CursorTheme'] = 'DeppinDark-cursors';\
\
file = open('/etc/sddm.conf.d/kde_settings.conf', 'w');\
config.write(file);\
file.close()"
