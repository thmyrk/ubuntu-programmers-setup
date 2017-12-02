#!/bin/bash

trap "exit 1" ERR

sudo add-apt-repository -y "ppa:ubuntu-mozilla-security/ppa"
sudo apt-get update
sudo apt-get -y install firefox
