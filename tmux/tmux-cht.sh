#!/bin/env sh

SELECTED=$(cat ~/.config/tmux/tmux_chtsh_lang ~/.config/tmux/tmux_chtsh_util | fzf)

if [ -z "${SELECTED}" ]; then
  exit 0
fi

read -p "Query: " QUERY

QUERY=$(echo $QUERY | tr ' ' '+')
sh -c "curl -s cht.sh/$SELECTED/$QUERY | less -R"
