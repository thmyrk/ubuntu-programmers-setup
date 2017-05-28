#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install yakuake konsole
cp yakuakerc kglobalshortcutsrc ~/.config/

