# list aliases
alias ls='ls --all --color=auto --group-directories-first'
alias l='ls -l'

# exa
alias exa='exa --color=automatic --all --sort=Name --group-directories-first'
alias e='exa --long'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# pipe command output to clipboard
alias copy='xclip -sel clip'

# fast exit
alias q='exit'

# fast vim
alias v='nvim'

# list content after cd
if [[ "$(exa > /dev/null 2>&1; echo $?)" = "0" ]]; then
  function cd () {
    builtin cd "$@" && exa
  }
else
  function cd () {
    builtin cd "$@" && ls
  }
fi

# shortcuts
alias k='kubectl'
alias tf='terraform'
alias d='docker'
