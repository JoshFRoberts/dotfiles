#! /bin/sh

DIR=$(pwd)

cp -r ${DIR}/scripts ~/.local/bin/
ln -s ${DIR}/tmux ~/.config/tmux
ln -s ${DIR}/neovim ~/.config/nvim
ln -s ${DIR}/sway ~/.config/sway
ln -s ${DIR}/waybar ~/.config/waybar

echo "source ${DIR}/zsh/global_aliasrc" >> ~/.zshrc
echo 'export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"' >> ~/.zshrc
