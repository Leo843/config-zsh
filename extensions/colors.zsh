#!/usr/bin/env zsh

# enable colors
if [ -x /usr/bin/dircolors ]; then

  get_dircolors_file() {
    local FILE

    FILE=~/.zsh/.dircolors
    if [[ -f "$FILE" ]]; then
      echo "$FILE"
      exit 0
    fi

    FILE=~/.config/zsh/.dircolors
    if [[ -f "$FILE" ]]; then
      echo "$FILE"
      exit 0
    fi

    exit 1
  }

  eval "$(dircolors -b $(get_dircolors_file))" || eval "$(dircolors -b)"
fi
