#!/bin/bash

set -e

shopt -s expand_aliases

sudo apt update
sudo apt install -y git unzip curl

# install RobotoMono Nerd Font
sudo mkdir -p /usr/share/fonts/RobotoMono
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'RobotoMono.zip' | cut -d '"' -f 4)
sudo unzip ./RobotoMono.zip -d /usr/share/fonts/RobotoMono/ && rm -f ./RobotoMono.zip

# install JetBrainsMono Nerd Font
sudo mkdir -p /usr/share/fonts/JetBrainsMono
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'JetBrainsMono.zip' | cut -d '"' -f 4)
sudo unzip ./JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono/ && rm -f ./JetBrainsMono.zip

# set the correct name for the default profile into Linux Mint Gnome Terminal
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

# install Gogh's colorschemes
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
# wget https://github.com/Gogh-Co/Gogh/raw/master/installs/nord.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/catppuccin-frappe.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/novel.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/paper.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/papercolor-light.sh
export TERMINAL="gnome-terminal"
export GOGH_NONINTERACTIVE=
export GOGH_USE_NEW_THEME=
chmod u+x ~/apply-colors.sh
# bash ~/nord.sh
bash ~/catppuccin-frappe.sh
bash ~/novel.sh
bash ~/paper.sh
bash ~/papercolor-light.sh
rm apply-colors.sh
# rm ~/nord.sh
rm ~/catppuccin-frappe.sh
rm ~/novel.sh
rm ~/paper.sh
rm ~/papercolor-light.sh

# install original Nord colorscheme
wget https://raw.githubusercontent.com/nordtheme/gnome-terminal/refs/heads/develop/src/nord.sh
chmod u+x ~/nord.sh
bash ~/nord.sh
rm ~/nord.sh

# set the font and its size into all the profiles
profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
for i in ${!profiles[*]}; do
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ font 'JetBrainsMono Nerd Font Mono 16'
done

# install CLI tools
sudo apt install -y dconf-cli uuid-runtime xclip wget bat fzf
sudo apt install -y tmux zsh vim neovim mc

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Catppuccin Frappe Theme for BAT
mkdir -p "$(batcat --config-dir)/themes"
wget -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
batcat cache --build

# Install the latest verion of EZA
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

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
