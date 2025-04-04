#!/usr/bin/env zsh

# history configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$ROOT_ZSH/history

# commands starting with a space are not saved in the history
setopt HIST_IGNORE_SPACE
