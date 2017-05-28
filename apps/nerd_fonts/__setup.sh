#!/bin/bash

trap "exit 1" ERR

set -x

cp -r .config .fonts.conf.d ~/

curl "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/src/glyphs/Symbols-1000-em%20Nerd%20Font%20Complete.ttf" > ~/.fonts/"Symbols-1000-em Nerd Font Complete.ttf"
curl "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/src/glyphs/Symbols-2048-em%20Nerd%20Font%20Complete.ttf" > ~/.fonts/"Symbols-2048-em Nerd Font Complete.ttf"

