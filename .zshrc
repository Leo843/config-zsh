# Luke's config for the Zoomer Shell

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
compinit -D -d ~/.zsh/compdump
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

# Load aliases and shortcuts if existent.
# [ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
# [ -f "$HOME/.zsh/alias" ] && source "$HOME/.config/aliasrc"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.zsh/.dircolors && eval "$(dircolors -b ~/.zsh/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -v --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -v --group-directories-first'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# pipe command output to clipboard
alias copy='xclip -sel clip'

# Load zsh-syntax-highlighting; should be last.
source $HOME/.settings/zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
