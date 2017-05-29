#!/bin/bash

trap "exit 1" ERR

set -x


# Install fish shell and grc
sudo apt-add-repository -y ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get -y install fish grc

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

fish -c "fisher getopts humanize_duration docker-completion done gitignore shark spin oh-my-fish/theme-bobthefish"

cp -r conf.d completions functions ~/.config/fish/
