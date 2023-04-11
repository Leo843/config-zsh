# Luke's config for the Zoomer Shell

# set library path
export LD_LIBRARY_PATH=~/.local/lib
# set path
export PATH=$PATH:$HOME/.local/bin

# enable colors and change prompt:
autoload -U colors && colors

# allow expressions within PS1 to be evaluated
setopt PROMPT_SUBST

# generate a branch tag for the prompt
function parse_git_branch() {
  local BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -z "$BRANCH_NAME" ]; then
    echo ""
  else
    local RED="%{$fg[red]%}"
    local CYAN="%{$fg[cyan]%}"
    echo "${RED}(${CYAN}${BRANCH_NAME}${RED})"
  fi
}

# prompt definition
PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]$(parse_git_branch)%{$reset_color%}$%b '

# history configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh/history

# basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.zsh/compdump
_comp_options+=(globdots)

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
zle-line-init() {
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

# load colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.zsh/.dircolors && eval "$(dircolors -b ~/.zsh/.dircolors)" || eval "$(dircolors -b)"
fi

# load aliases
[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh

for file in ~/.zsh/extensions/*; do
  source "$file"
done

# Load zsh-syntax-highlighting; should be last.
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
