#!/usr/bin/env zsh

if   type nvim > /dev/null; then
  export EDITOR=$(which nvim)
elif type  vim > /dev/null; then
  export EDITOR=$(which vim)
elif type  vi  > /dev/null; then
  export EDITOR=$(which vi)
fi
