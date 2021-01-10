export EDITOR=nvim

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

export GOPATH=$HOME/go
export DENO_DIR=$HOME/.cache/deno
export DENO_INSTALL_ROOT=$HOME/.deno
export PATH=$PATH:$GOPATH/bin:$DENO_INSTALL_ROOT/bin:$HOME/.roswell/bin:$HOME/bin

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
if [ "$(uname)" != 'Darwin' ]; then
  alias ls='ls --color=auto'
fi
alias ghq-go='GHQ_ROOT=$GOPATH/src/github.com/uki00a ghq list'

if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
