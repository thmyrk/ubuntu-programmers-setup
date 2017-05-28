#!/bin/bash

sudo apt-get -y install fonts-hack-ttf

# Tabs on bottom
gsettings set org.gnome.Terminal.Legacy.Settings tab-position bottom

# Don't show menubar
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

# Set keybindings
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ help disabled
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-left '<Primary><Shift>Left'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ move-tab-right '<Primary><Shift>Right'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Primary>t'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Shift>Right'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Shift>Left'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ toggle-menubar '<Primary>m'

dconf load /org/gnome/terminal/legacy/profiles:/ < profiles.dconf
