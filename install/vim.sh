#!/bin/bash

dotfiles=$(cd $(dirname $0); pwd)
vimrc=$dotfiles/.vimrc
vimfiles=$dotfiles/vim

ln -s $vimrc $HOME/.vimrc
ln -s $vimfiles $HOME/.vim
ln -s $vimfiles ~/.config/nvim


