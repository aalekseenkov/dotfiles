#!/bin/bash

set -e

shopt -s expand_aliases

sudo apt update
sudo apt install -y git unzip curl

# install JetBrainsMono Nerd Font
sudo mkdir -p /usr/share/fonts/JetBrainsMono
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'JetBrainsMono.zip' | cut -d '"' -f 4)
sudo unzip ./JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono/ && rm -f ./JetBrainsMono.zip

# install RobotoMono Nerd Font
sudo mkdir -p /usr/share/fonts/RobotoMono
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'RobotoMono.zip' | cut -d '"' -f 4)
sudo unzip ./RobotoMono.zip -d /usr/share/fonts/RobotoMono/ && rm -f ./RobotoMono.zip

# install Hack Nerd Font
sudo mkdir -p /usr/share/fonts/Hack
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'Hack.zip' | cut -d '"' -f 4)
sudo unzip ./Hack.zip -d /usr/share/fonts/Hack/ && rm -f ./Hack.zip

# install FiraCode Nerd Font
sudo mkdir -p /usr/share/fonts/FiraCode
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'FiraCode.zip' | cut -d '"' -f 4)
sudo unzip ./FiraCode.zip -d /usr/share/fonts/FiraCode/ && rm -f ./FiraCode.zip

# install SauceCodePro Nerd Font
sudo mkdir -p /usr/share/fonts/SourceCodePro
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'SourceCodePro.zip' | cut -d '"' -f 4)
sudo unzip ./SourceCodePro.zip -d /usr/share/fonts/SourceCodePro/ && rm -f ./SourceCodePro.zip

# set the correct name for the default profile into Linux Mint Gnome Terminal
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

# install Gogh's colorschemes
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/catppuccin-frappe.sh
export TERMINAL="gnome-terminal"
export GOGH_NONINTERACTIVE=
export GOGH_USE_NEW_THEME=
chmod u+x ~/apply-colors.sh
bash ~/catppuccin-frappe.sh
rm apply-colors.sh
rm ~/catppuccin-frappe.sh

# set the font and its size into all the profiles
profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
for i in ${!profiles[*]}; do
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ font 'JetBrainsMono Nerd Font Mono 16'
done

# install CLI tools
sudo apt install -y dconf-cli uuid-runtime xclip wget bat eza fzf
sudo apt install -y tmux zsh vim neovim mc

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Catppuccin Frappe Theme for BAT
mkdir -p "$(batcat --config-dir)/themes"
wget -P "$(batcat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
batcat cache --build

# Install Catppuccin Frappe Theme for EZA
mkdir -p ~/.config/eza
wget -P ~/.config/eza/ https://raw.githubusercontent.com/eza-community/eza-themes/refs/heads/main/themes/catppuccin.yml
mv ~/.config/eza/catppuccin.yml ~/.config/eza/theme.yml

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
