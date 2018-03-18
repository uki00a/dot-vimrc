#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
vimrc=$script_dir/.vimrc
vimfiles=$script_dir/vim

ln -s $vimrc $HOME/.vimrc
ln -s $vimfiles $HOME/.vim


