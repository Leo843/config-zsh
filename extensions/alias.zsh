#!/usr/bin/env zsh

# ls
alias ls='ls --all --color=auto --group-directories-first'
alias l='ls -l'

# apg
alias randpass='apg -n 1'

# exa
if type exa > /dev/null; then
  alias exa='exa --all --all --color=automatic --sort=Name --group-directories-first'
  alias e='exa --long'
fi

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# pipe command output to clipboard
if type xclip > /dev/null; then
  alias copy='xclip -sel clip'
fi

# fast exit
alias q='exit'

# fast vim
alias v='nvim'

# list content after cd
if type exa > /dev/null; then
  function cd () {
    builtin cd "$@" && exa
  }
else
  function cd () {
    builtin cd "$@" && ls
  }
fi

# shortcuts
if type kubectl > /dev/null; then
  alias k='kubectl'
fi
if type terraform > /dev/null; then
  alias tf='terraform'
fi
if type docker > /dev/null; then
  alias d='docker'
fi

# keyboard layouts
alias nocaps='setxkbmap -option "ctrl:nocaps"'
alias qwer='setxkbmap fr'
alias azer='setxkbmap us'

# find and open files
alias ff='rg --files | fzf --preview="bat --color=always --plain --line-range :200 {}" | xargs -r ${EDITOR:-vi}'
