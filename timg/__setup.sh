#!/bin/bash

trap "exit 1" ERR

git clone https://github.com/hzeller/timg.git
cd timg/src
sudo apt-get install libwebp-dev libgraphicsmagick++-dev    # required libs.
make
sudo make install
cd ../..
rm -rf timg
