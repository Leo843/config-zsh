#!/usr/bin/env zsh

# setup nvm (node version manager)
export NVM_DIR="$HOME/.nvm"

# use lazy loading to speed up zsh launch
lazy_load_nvm() {
  unset -f node nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  node $@
}
