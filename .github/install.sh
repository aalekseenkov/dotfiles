#!/bin/bash

set -e

shopt -s expand_aliases

sudo apt update
sudo apt install -y dconf-cli uuid-runtime wget xclip
sudo apt install -y git tmux zsh fzf vim neovim

git clone https://github.com/powerline/fonts.git --depth=1
bash "$HOME/fonts/install.sh"
rm -rf "$HOME/fonts"

echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/aalekseenkov/dotfiles $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
mv .bashrc .bashrc.save
dotfiles checkout
source ~/.bashrc
vim +PlugInstall +qall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
bash ~/.tmux/plugins/tpm/bin/install_plugins

# Gogh's color schemes to input numbers manually (280 281)
bash -c "$(wget -qO- https://git.io/vQgMr)"
