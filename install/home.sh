#!/bin/bash

dotfiles=$(cd $(dirname $0); pwd)

ln -s $dotfiles/.agignore $HOME/.agignore
ln -s $dotfiles/.taskbook.json $HOME/.taskbook.json
ln -s $dotfiles/.tmux.conf $HOME/.tmux.conf
