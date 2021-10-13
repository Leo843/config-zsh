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

# convert a plantuml file to svg
function pu2svg () {
  cat $1 | docker run --rm -i think/plantuml
}

# run http-server in current dicrectory
# - option `-p 8081` to use port 8081 instead of 8080 (default)
# - option `-c-1` to disable caching
alias http-server='docker run --rm -it -p 8081:8081 -v $(pwd):/public danjellz/http-server http-server -p 8081 -c-1'

# run grip in current directory
alias markdown-server='docker run --rm -it -p 8082:8082 -v $(pwd):/data --user root mbentley/grip 0.0.0.0:8082'

# connect to hammer with several ports forwarded
alias ssh-hammer='ssh \
  -L 8080:hammer:8080 \
  -L 8081:hammer:8081 \
  -L 8082:hammer:8082 \
  -L 8083:hammer:8083 \
  -L 8084:hammer:8084 \
  -L 4200:hammer:4200 \
  -L 4201:hammer:4201 \
  -L 4202:hammer:4202 \
  -L 4203:hammer:4203 \
  -L 4204:hammer:4204 \
  -L 3000:hammer:3000 \
  -L 3001:hammer:3001 \
  -L 3002:hammer:3002 \
  -L 3003:hammer:3003 \
  -L 3004:hammer:3004 \
  leo@hammer'

# WARNING: The 'sed' version from busybox does not behave well with the script.
alias kcomplete='source <(kubectl completion zsh)'

alias k='kubectl'

alias tf='terraform'
