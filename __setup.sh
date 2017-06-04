#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
for SCRIPT in fish_shell git gnome_shell gnome_terminal google_chrome konsole maven midnight_commander nerd_fonts timg vim yakuake; do
	$SCRIPT/__setup.sh
done
