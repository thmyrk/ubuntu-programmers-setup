#!/bin/bash

trap "exit 1" ERR

echo "Installing ViM executable"
# Install vim-gtk which should have support for Xorg clipboard
sudo apt-get -y install curl git vim-gtk3
sudo apt-get -y install aspell-pl

mkdir -p ~/.vim/{bundle,tmp,spell,undodir}

echo "Installing Vundle for plugin management"
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing ViM spell checking files"
for lang in pl.utf-8 en.utf-8; do
    curl http://ftp.vim.org/pub/vim/runtime/spell/$lang.spl > ~/.vim/spell/$lang.spl
done

echo "Installing custom .vimrc"
cp -r .vimrc .vim ~/

vim +PluginUpdate +'q!' +'q!'


if vim --version | grep -qF -- "-clipboard"; then
	echo "Warning: ViM compiled without Xorg clipboard support"
	echo "See this link for more info: http://vim.wikia.com/wiki/Accessing_the_system_clipboard"
fi




