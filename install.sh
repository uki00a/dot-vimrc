#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
vimrc=$script_dir/.vimrc
gvimrc=$script_dir/.gvimrc
vimfiles=$script_dir/vim

ln -s $vimrc $HOME/.vimrc
ln -s $gvimrc $HOME/.gvimrc
ln -s $vimfiles $HOME/.vim


