#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install git git-svn gitk kdiff3 git-gui
