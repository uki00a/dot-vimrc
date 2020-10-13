export EDITOR=nvim
export GOPATH=$HOME/go
export DENO_DIR=$HOME/.cache/deno
export DENO_INSTALL_ROOT=$HOME/.deno
export PATH=$PATH:$GOPATH/bin:$DENO_INSTALL_ROOT/bin:$HOME/bin

autoload -U compinit
compinit -u

autoload -U colors
colors

PROMPT="%{${fg[blue]}%}[%~@%m] %(!.#.$) %{${reset_color}%}"

setopt print_eight_bit
setopt no_beep
setopt nolistbeep
setopt auto_pushd
setopt pushd_ignore_dups

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

bindkey -e

if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
