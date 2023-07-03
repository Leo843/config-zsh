# load extensions
for file in ~/.zsh/extensions/*; do
  source "$file"
done

# Load zsh-syntax-highlighting; should be last.
source $HOME/.zsh/plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
