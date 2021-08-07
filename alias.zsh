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
alias v='vim'

# ll right after cd
function cd () {
  builtin cd "$@" && ll
}

# run http-server in current dicrectory
# - option `-p 8081` to use port 8081 instead of 8080 (default)
# - option `-c-1` to disable caching
alias http-server='docker run --rm -it -p 8081:8081 -v $(pwd):/public danjellz/http-server http-server -p 8081 -c-1'

# run grip in current directory
alias markdown-server='docker run --rm -it -p 8082:8082 -v $(pwd):/data --user root mbentley/grip 0.0.0.0:8082'

