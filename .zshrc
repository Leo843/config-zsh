#!/usr/bin/env zsh

get_extensions_dir() {
  local DIR

  DIR=~/.zsh/extensions
  if [[ -d "$DIR" ]]; then
    echo "$DIR"
    exit 0
  fi

  DIR=~/.config/zsh/extensions
  if [[ -d "$DIR" ]]; then
    echo "$DIR"
    exit 0
  fi

  exit 1
}

EXTENSIONS_DIR=$(get_extensions_dir)
if [[ $? ]]; then
  # load extensions
  for file in "$EXTENSIONS_DIR"/*; do
    source "$file"
  done
else
  echo "WARNING No extensions directory found! No extensions loaded!"
fi

# Load zsh-syntax-highlighting; should be last.
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
