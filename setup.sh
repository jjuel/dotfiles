#!/bin/bash
#Simple script to setup the dotfiles

cd $HOME
if [ -d ./dotfiles/ ]; then
	mv dotfiles dotfiles.old
fi

#git clone https://github.com/jjuel/dotfiles.git
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.inputrc .
ln -sb dotfiles/.vim .
