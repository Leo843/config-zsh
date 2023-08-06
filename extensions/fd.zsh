#!/usr/bin/env zsh

# [f]ind [d]irectory
fd ()
{
  local preview_cmd='exa      \
    --all                     \
    --long                    \
    --color=always            \
    --sort=Name               \
    --group-directories-first \
    {}'
  local directory=$(                                                \
    find ${1:-.} -type d 2>/dev/null | fzf --preview="$preview_cmd" \
  )

  if [ ! -z "$directory" ]; then
    cd "$directory"
  fi
}
