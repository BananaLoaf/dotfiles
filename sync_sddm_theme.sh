#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd sddm_theme

################################################################
echo_green "Setting up SDDM theme"

sudo cp $HOME/.dotfiles/kde/.face.syncpoint /usr/share/sddm/faces/$USER.face.icon
sudo cp -r $HOME/.dotfiles/kde_theme/.icons.syncpoint/PearDarkCursors /usr/share/icons/
sudo cp -r $PWD/* /usr/share/sddm/themes/

sudo python -c "\
import configparser;\
config = configparser.ConfigParser();\
config.optionxform=str;\
config.read('/etc/sddm.conf.d/kde_settings.conf');\
\
config['General']['Numlock'] = 'on';\
config['Theme']['Current'] = 'sugar-light';\
config['Theme']['CursorTheme'] = 'PearDarkCursors';\
\
file = open('/etc/sddm.conf.d/kde_settings.conf', 'w');\
config.write(file);\
file.close()"
