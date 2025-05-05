#!/bin/bash

set -e

shopt -s expand_aliases

sudo apt update
sudo apt install -y git unzip curl

# install Hack Nerd Font
sudo mkdir -p /usr/share/fonts/Hack
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'Hack.zip' | cut -d '"' -f 4)
sudo unzip ./Hack.zip -d /usr/share/fonts/Hack/ && rm -f ./Hack.zip

# set the correct name for the default profile into Linux Mint Gnome Terminal
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

# install Gogh's colorschemes
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-light.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-dark.sh
export TERMINAL="gnome-terminal"
export GOGH_NONINTERACTIVE=
export GOGH_USE_NEW_THEME=
chmod u+x ~/apply-colors.sh
bash ~/selenized-light.sh
bash ~/selenized-dark.sh 
rm apply-colors.sh
rm ~/selenized-light.sh
rm ~/selenized-dark.sh

# set the font and its size into all the profiles
profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
for i in ${!profiles[*]}; do
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ font 'Hack Nerd Font Mono 16'
done

# install CLI tools
sudo apt install -y dconf-cli uuid-runtime xclip wget bat eza fzf
sudo apt install -y tmux zsh vim neovim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install dotfiles
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/aalekseenkov/dotfiles $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
test -e ~/.bashrc && mv ~/{.bashrc,.bashrc.save}
test -e ~/.zshrc && mv ~/{.zshrc,.zshrc.save}
dotfiles checkout
source ~/.bashrc

# install vim plugins
vim +PlugInstall +qall

# install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
bash ~/.tmux/plugins/tpm/bin/install_plugins

# change shell for current user
CURRENT_USER="$USER"
sudo chsh -s /usr/bin/zsh $CURRENT_USER
kill -9 -1
