#!/bin/bash
# comment the scripts you're not interested in

selected_scripts=(
  firefox
  fish_shell
  git
  gnome_shell
  gnome_terminal
  google_chrome
  konsole
  maven
  midnight_commander
  nerd_fonts
  timg
  vim
  yakuake
)

cd "$( dirname "${BASH_SOURCE[0]}" )"
for SCRIPT in ${selected_scripts}; do
  echo "Installing: $SCRIPT"
  $SCRIPT/__setup.sh
done
