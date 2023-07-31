#!/usr/bin/env zsh

# vi mode
bindkey -v
export KEYTIMEOUT=1

# use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# change cursor shape for different vi modes.
function zle-keymap-select {
  case ${KEYMAP} in
    vicmd) echo -ne '\e[1 q' ;;
    viins) echo -ne '\e[5 q' ;;
    main)  echo -ne '\e[5 q' ;;
    *)     echo -ne '\e[5 q' ;;
  esac
}
function zle-line-init {
  zle -K viins
}
zle -N zle-keymap-select
zle -N zle-line-init

# edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# bind ctrl-p and ctrl-n to navigate the history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
