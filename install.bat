@echo off

set DOTFILES=%~dp0

mklink %HOMEDRIVE%%HOMEPATH%\_vimrc  %DOTFILES%\.vimrc
mklink %HOMEDRIVE%%HOMEPATH%\_gvimrc  %DOTFILES%\.gvimrc

