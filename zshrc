export GOPATH=$HOME/go
export DENO_DIR=$HOME/.cache/deno
export DENO_INSTALL_ROOT=$HOME/.deno
export PATH=$PATH:$GOPATH/bin:$DENO_INSTALL_ROOT/bin:$HOME/bin

if [ -e $HOME/.asdf/asdf.sh ]; then
  . $HOME/.asdf/asdf.sh
fi
