# enable colors
if [ -x /usr/bin/dircolors ]; then
  alias ls='ls -v --color=auto --group-directories-first'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls -v --group-directories-first'
fi

# list aliases
alias ll='ls -alF'
alias l='ll'

# pipe command output to clipboard
alias copy='xclip -sel clip'

# fast exit
alias q='exit'

# fast vim
alias v='nvim'

# ll right after cd
function cd () {
  builtin cd "$@" && ll
}

alias k='kubectl'
alias tf='terraform'
alias d='docker'
