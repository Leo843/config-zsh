# enable colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.zsh/.dircolors && eval "$(dircolors -b ~/.zsh/.dircolors)" || eval "$(dircolors -b)"
fi
