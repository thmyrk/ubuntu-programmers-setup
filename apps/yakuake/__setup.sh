#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install yakuake konsole
cp yakuakerc kglobalshortcutsrc ~/.config/
cp org.kde.yakuake.desktop ~/.config/autostart/

# Makes sure gnome-shell does not use Alt-ESC
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows "['<Super>Escape']"
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows-backward "['<Shift><Super>Escape']"


