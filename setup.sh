#! /bin/sh

DIR=$(pwd)

cp -r ${DIR}/scripts ~/.local/bin/
ln -s ${DIR}/tmux ~/.config/tmux
ln -s ${DIR}/neovim ~/.config/nvim

echo "source ${DIR}/zsh/global_aliasrc" >> ~/.zshrc
