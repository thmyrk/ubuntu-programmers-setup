#!/bin/bash

# global variables
export CPU_ARCHITECTURE="$( lscpu | awk '/Architecture:/ { print $2 }' | { read arch; if ! [ $arch = "x86_64" ]; then echo "386"; else echo "amd64"; fi } )"

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
for SCRIPT in ${selected_scripts[@]}; do
  echo "Installing: $SCRIPT"
  $SCRIPT/__setup.sh
done
