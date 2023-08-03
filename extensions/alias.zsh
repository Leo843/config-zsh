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

# [f]ind and open [f]iles
ff ()
{
  local preview_cmd="bat --color=always --plain --line-range :200 {}"

  rg --files --hidden                           \
    | fzf --preview="$preview_cmd" \
    | xargs -r ${EDITOR:-vi}
}

# [k]ill [p]rocesses
kp ()
{
  # Show the output of "ps -ef". Use [tab] to select one or multiple processes
  # and press [enter] to kill all selected processes. Press [enter] to kill the
  # process under the cursor (if no processes are selected). Press [escape] to
  # exit.

  ps -ef                                    \
    | sed 1d                                \
    | fzf --multi --header='[kill:process]' \
    | awk '{print $2}'                      \
    | xargs --no-run-if-empty kill -${1:-9}
  }
