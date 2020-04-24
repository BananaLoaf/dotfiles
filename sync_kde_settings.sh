#!/bin/bash
. ./scripts/funcs.sh --source-only

################################################################
confirm_path
cd kde

################################################################
echo_green "Setting up KDE"

link $PWD/.face $HOME/.face
sudo cp $PWD/.face /usr/share/sddm/faces/$USER.face.icon

link $PWD/.config/plasmarc $HOME/.config/plasmarc
link $PWD/.gtkrc-2.0 $HOME/.gtkrc-2.0
link $PWD/.config/.gtkrc $HOME/.config/.face
link $PWD/.config/gtk-3.0 $HOME/.config/gtk-3.0
link $PWD/.config/gtkrc $HOME/.config/gtkrc
link $PWD/.config/gtkrc-2.0 $HOME/.config/gtkrc-2.0
link $PWD/.config/Trolltech.conf $HOME/.config/Trolltech.conf
link $PWD/.config/ksplashrc $HOME/.config/ksplashrc
link $PWD/.config/kscreenlockerrc $HOME/.config/kscreenlockerrc

link $PWD/.config/kdeglobals $HOME/.config/kdeglobals
link $PWD/.kde4/share/kdeglobals $HOME/.kde4/share/kdeglobals
link $PWD/.kde4/share/config/kdeglobals $HOME/.kde4/share/config/kdeglobals

link $PWD/.config/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc
link $PWD/.config/khotkeysrc $HOME/.config/khotkeysrc

link $PWD/.config/kcminputrc $HOME/.config/kcminputrc
link $PWD/.config/kxkbrc $HOME/.config/kxkbrc
link $PWD/.config/touchpadxlibinputrc $HOME/.config/touchpadxlibinputrc
link $PWD/.config/powerdevilrc $HOME/.config/powerdevilrc
link $PWD/.config/powermanagementprofilesrc $HOME/.config/powermanagementprofilesrc

link $PWD/.config/kactivitymanagerd-pluginsrc $HOME/.config/kactivitymanagerd-pluginsrc
link $PWD/.config/kactivitymanagerd-statsrc $HOME/.config/kactivitymanagerd-statsrc
link $PWD/.config/kactivitymanagerdrc $HOME/.config/kactivitymanagerdrc
link $PWD/.config/ksmserverrc $HOME/.config/ksmserverrc
link $PWD/.config/kwinrc $HOME/.config/kwinrc
link $PWD/.local/kwin/scripts $HOME/.local/kwin/scripts
link $PWD/.local/plasma/plasmoids $HOME/.local/plasma/plasmoids
link $PWD/.config/kwinrulesrc $HOME/.config/kwinrulesrc

link $PWD/.config/plasma-org.kde.plasma.desktop-appletsrc $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc
link $PWD/.config/plasmanotifyrc $HOME/.config/plasmanotifyrc
link $PWD/.config/plasmashellrc $HOME/.config/plasmashellrc

link $PWD/.config/mimeapps.list $HOME/.config/mimeapps.list
