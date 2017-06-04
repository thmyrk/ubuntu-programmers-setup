#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install konsole
mkdir -p ~/.local/share/konsole
cp "Profile 1.profile" ~/.local/share/konsole/
cp konsolerc ~/.config/
