#!/usr/bin/env zsh

# ls
alias ls='ls --all --color=auto --group-directories-first'
alias  l='ls -l'

# apg
alias randpass='apg -n 1'

# exa
if type exa > /dev/null; then
  alias exa='exa --all --all --color=automatic --sort=Name --group-directories-first'
  alias   e='exa --long'
fi

# grep
alias  grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# pipe command output to clipboard
type xclip > /dev/null && alias copy='xclip -sel clip'

# fast exit
alias q='exit'

# fast vim
alias v='nvim'

# list content after cd
if type exa > /dev/null; then
  cd () {
    builtin cd "$@" && exa
  }
else
  cd () {
    builtin cd "$@" && ls
  }
fi

# shortcuts
type kubectl   > /dev/null && alias  k='kubectl'
type terraform > /dev/null && alias tf='terraform'
type docker    > /dev/null && alias  d='docker'

# keyboard layouts
alias nocaps='setxkbmap -option "ctrl:nocaps"'
alias   qwer='setxkbmap fr'
alias   azer='setxkbmap us'
