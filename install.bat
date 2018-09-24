@echo off

set DOTFILES=%~dp0

mklink %HOMEDRIVE%%HOMEPATH%\_vimrc  %DOTFILES%\.vimrc
mklink /D %HOMEDRIVE%%HOMEPATH%\vimfiles %DOTFILES%\vim
mklink /D %HOMEDRIVE%%HOMEPATH%\AppData\Local\nvim %DOTFILES%\vim
