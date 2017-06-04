#!/bin/bash

trap "exit 1" ERR

cp google-chrome.list /etc/apt/sources.list.d/
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
apt-get update
apt-get -y install google-chrome-stable
