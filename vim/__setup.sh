#!/bin/bash

trap "exit 1" ERR

set -x

sudo apt-get -y install curl git vim
sudo apt-get -y install aspell-pl

# Install Vundle for plugin management
mkdir -p ~/.vim/{bundle,tmp,spell,undodir}
if ! [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install spell checking files
for lang in pl.utf-8 en.utf-8; do
    curl http://ftp.vim.org/pub/vim/runtime/spell/$lang.spl > ~/.vim/spell/$lang.spl
done

# Install custom .vimrc
cp -r .vimrc .vim ~/

vim +PluginUpdate +'q!' +'q!'





