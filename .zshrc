# Luke's config for the Zoomer Shell

# set library path
export LD_LIBRARY_PATH=~/.local/lib
# set path
export PATH=$PATH:$HOME/.local/bin

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# history configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.zsh/compdump
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  case ${KEYMAP} in
    vicmd) echo -ne '\e[1 q' ;;
    viins) echo -ne '\e[5 q' ;;
    main)  echo -ne '\e[5 q' ;;
    *)     echo -ne '\e[5 q' ;;
  esac
}
zle-line-init() {
  zle -K viins
}
zle -N zle-keymap-select
zle -N zle-line-init

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# bind ctrl-p and ctrl-n to navigate the history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# load colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.zsh/.dircolors && eval "$(dircolors -b ~/.zsh/.dircolors)" || eval "$(dircolors -b)"
fi

# load aliases
[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh

# setup fzf configuraton for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# setup gcloud cli
[ -f ~/.zsh/gcloudrc ] && source ~/.zsh/gcloudrc

# setup kubectl (disable because of loading time)
# WARNING: The 'sed' version from busybox does not behave well with the script.
# if which kubectl 1> /dev/null; then source <(kubectl completion zsh); fi

# enable DOCKER_BUILDKIT
export DOCKER_BUILDKIT=1

# Load zsh-syntax-highlighting; should be last.
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
