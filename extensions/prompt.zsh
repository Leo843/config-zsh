#!/usr/bin/env zsh

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
