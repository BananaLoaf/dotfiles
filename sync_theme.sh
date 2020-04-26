#!/bin/bash
. ./scripts/funcs.sh --source-only
confirm_path

################################################################
# SDDM THEME
sudo cp -r $HOME/.icons/PearDarkCursors /usr/share/icons/
sudo cp files/kde_settings.conf /etc/sddm.conf.d/kde_settings.conf
sudo cp -r files/sugar-candy /usr/share/sddm/themes/sugar-candy

################################################################
cd theme
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
