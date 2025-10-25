#!/bin/bash

set -e

shopt -s expand_aliases

sudo apt update
sudo apt install -y git unzip curl ca-certificates

#############
### FONTS ###
#############

# install AtkynsonMono Nerd Font
sudo mkdir -p /usr/share/fonts/AtkinsonHyperlegibleMono
curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'AtkinsonHyperlegibleMono.zip' | cut -d '"' -f 4)
sudo unzip ./AtkinsonHyperlegibleMono.zip -d /usr/share/fonts/AtkinsonHyperlegibleMono/ && rm -f ./AtkinsonHyperlegibleMono.zip

# install FiraCode Nerd Font
# sudo mkdir -p /usr/share/fonts/FiraCode
# curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'FiraCode.zip' | cut -d '"' -f 4)
# sudo unzip ./FiraCode.zip -d /usr/share/fonts/FiraCode/ && rm -f ./FiraCode.zip

#############
### GNOME ###
#############
# set the correct name for the default profile into Linux Mint Gnome Terminal
id=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$id/ visible-name 'Default'

# install Gogh's colorschemes Selenized and Avalution
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-antique-green.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-campfire.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-pinewood.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-rosary.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/nord.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-dark.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/selenized-light.sh

export TERMINAL="gnome-terminal"
export GOGH_NONINTERACTIVE=
export GOGH_USE_NEW_THEME=

chmod u+x ~/apply-colors.sh
bash ~/avalution.sh
bash ~/avalution-antique-green.sh
bash ~/avalution-campfire.sh
bash ~/avalution-pinewood.sh
bash ~/avalution-rosary.sh
bash ~/nord.sh
bash ~/selenized-dark.sh
bash ~/selenized-light.sh

rm apply-colors.sh
rm ~/avalution.sh
rm ~/avalution-antique-green.sh
rm ~/avalution-campfire.sh
rm ~/avalution-pinewood.sh
rm ~/avalution-rosary.sh
rm ~/nord.sh
rm ~/selenized-dark.sh
rm ~/selenized-light.sh

# set the font and its size into all the profiles
profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
for i in ${!profiles[*]}; do
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ font 'AtkynsonMono Nerd Font 16'
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ cell-height-scale 1.4
done

############
### BASH ###
############
# Install oh-my-bash
export OSH="$HOME/.config/oh-my-bash"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

# Install BLE (Bash Line Editor)
wget -O - https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
bash ble-nightly/ble.sh --install ~/.local/share
rm -rf ble-nightly

############
### FISH ###
############
# Install fish + oh-my-fish
sudo add-apt-repository --yes ppa:fish-shell/release-4
sudo apt update
sudo apt install -y --quiet fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > ~/fish_install
fish ~/fish_install --noninteractive --yes
rm ~/fish_install

###########
### ZSH ###
###########
# Install zsh + oh-my-zsh
sudo apt install -y zsh
export ZSH="$HOME/.config/oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
curl -fsSL https://raw.githubusercontent.com/aalekseenkov/dotfiles/refs/heads/master/.github/agnoster4avalution.zsh-theme -o $HOME/.config/oh-my-zsh/custom/themes/agnoster4avalution.zsh-theme

##########################
### CROSS-SHELL PROMPT ###
##########################
# install cross-shell prompt
curl -fsSL https://starship.rs/install.sh -o $HOME/starship_install.sh
chmod u+x $HOME/starship_install.sh
sh $HOME/starship_install.sh -y
rm $HOME/starship_install.sh

#############
### TOOLS ###
#############
# install CLI tools
sudo apt install -y dconf-cli uuid-runtime xclip wget
sudo apt install -y tmux vim mc bat fzf vifm htop tree

# Setting up a bat -> batcat symlink
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

###########
### EZA ###
###########
# Install the latest verion of EZA
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

###############
### WEZTERM ###
###############
# Install Wezterm
sudo curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install -y wezterm

##############
### DOCKER ###
##############
# Install Docker
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
if [ $(getent group docker) ]; then
  echo "The docker group exists"
else
  sudo groupadd docker
fi
sudo usermod -aG docker "$USER"

# Docker completions for bash and fish
sudo wget https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/bash/docker -O /etc/bash_completion.d/docker
mkdir -p ~/.config/fish/completions
wget https://raw.githubusercontent.com/docker/cli/refs/heads/master/contrib/completion/fish/docker.fish -O ~/.config/fish/completions/docker.fish

##############
### NEOVIM ###
##############
sudo add-apt-repository --yes ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y make gcc ripgrep unzip git xclip neovim

###############
### LAZYVIM ###
###############
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

###########
### NPM ###
###########
sudo apt install -y npm
sudo npm install --global prettier

# BEGIN - TO CHECK AFTER LINUX_FACTORY SEASON 1
###############
### Ansible ###
###############
sudo apt install -y software-properties-common
sudo add-apt-repository --yes ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
###################################
### YAMLFIX IN NEOVIM VIA MASON ###
###################################
sudo apt install -y python3.12-venv
# END - TO CHECK AFTER LINUX_FACTORY SEASON 1

################
### DOTFILES ###
################
# install dotfiles
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/aalekseenkov/dotfiles $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles config --local status.showUntrackedFiles no
test -e ~/.bashrc && mv ~/{.bashrc,.bashrc.save}
test -e ~/.zshrc && mv ~/{.zshrc,.zshrc.save}
dotfiles checkout
source ~/.bashrc

###########
### VIM ###
###########
# install vim plugins
vim +PlugInstall +qall

############
### TMUX ###
############
# install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
bash ~/.tmux/plugins/tpm/bin/install_plugins

#############
### SHELL ###
#############
# change shell for current user
# CURRENT_USER="$USER"
# sudo chsh -s /usr/bin/zsh $CURRENT_USER
kill -9 -1
