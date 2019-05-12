@echo off

set DOTFILES=%~dp0

mklink %HOMEDRIVE%%HOMEPATH%\.agignore  %DOTFILES%\.agignore
mklink %HOMEDRIVE%%HOMEPATH%\.taskbook.json  %DOTFILES%\.taskbook.json
