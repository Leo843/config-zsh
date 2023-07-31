#!/usr/bin/env zsh

# enable colors
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b $ROOT_ZSH/.dircolors)" || eval "$(dircolors -b)"
fi
