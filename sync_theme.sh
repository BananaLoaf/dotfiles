#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd theme

################################################################
# SDDM THEME
sudo cp -r $HOME/.icons/PearDarkCursors /usr/share/icons/
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

link $PWD/.local/share/color-schemes $HOME/.local/share/color-schemes
link $PWD/.local/share/color-schemes $HOME/.kde4/apps/color-schemes

link $PWD/.local/share/aurorae $HOME/.local/share/aurorae
link $PWD/.local/share/plasma/desktoptheme $HOME/.local/share/plasma/desktoptheme
link $PWD/.local/share/plasma/look-and-feel $HOME/.local/share/plasma/look-and-feel
link $PWD/.local/share/emoticons $HOME/.local/share/emoticons

link $PWD/.icons $HOME/.icons
link $PWD/.local/share/icons/PearBlue $HOME/.local/share/icons/PearBlue
link $PWD/.local/share/icons/PearBlueDark $HOME/.local/share/icons/PearBlueDark
