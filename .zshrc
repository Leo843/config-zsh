#!/usr/bin/env zsh

# Store the path to the directory for zsh configuration files for later use.
ROOT_ZSH=~/.config/zsh

# Abort zsh configuration when the configuration file is not at the expected
# location.
if [[ ! -f "$ROOT_ZSH/.zshrc" ]]; then
  echo "ERROR .zshrc must be located at $ROOT_ZSH/.zshrc"
  exit 1
fi

# load extensions
for file in "$ROOT_ZSH/extensions/"*; do
  source "$file"
done

# Load zsh-syntax-highlighting; should be last.
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
