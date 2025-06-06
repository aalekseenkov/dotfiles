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

# install Gogh's colorschemes Nord and Avalution
wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
wget https://github.com/Gogh-Co/Gogh/raw/master/installs/tomorrow.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-antique-green.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-blueberry-violet.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-deep-violet.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-hibiscus-purple.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-midnight-orchid.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-mono.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-nostalgia.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-pine-green-4-blue-tinge.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-pine-green.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-purple-rain.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-twilight-lavender.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-violet-dusk.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-violet-flower.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-violet-indigo.sh
wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/avalution-violet-purple.sh

export TERMINAL="gnome-terminal"
export GOGH_NONINTERACTIVE=
export GOGH_USE_NEW_THEME=

chmod u+x ~/apply-colors.sh
bash ~/tomorrow.sh
bash ~/avalution.sh
bash ~/avalution-antique-green.sh
bash ~/avalution-blueberry-violet.sh
bash ~/avalution-deep-violet.sh
bash ~/avalution-hibiscus-purple.sh
bash ~/avalution-midnight-orchid.sh
bash ~/avalution-mono.sh
bash ~/avalution-nostalgia.sh
bash ~/avalution-pine-green-4-blue-tinge.sh
bash ~/avalution-pine-green.sh
bash ~/avalution-purple-rain.sh
bash ~/avalution-twilight-lavender.sh
bash ~/avalution-violet-dusk.sh
bash ~/avalution-violet-flower.sh
bash ~/avalution-violet-indigo.sh
bash ~/avalution-violet-purple.sh
bash ~/avalution-violet-purple.sh

rm apply-colors.sh
rm ~/tomorrow.sh
rm ~/avalution.sh
rm ~/avalution-antique-green.sh
rm ~/avalution-blueberry-violet.sh
rm ~/avalution-deep-violet.sh
rm ~/avalution-hibiscus-purple.sh
rm ~/avalution-midnight-orchid.sh
rm ~/avalution-mono.sh
rm ~/avalution-nostalgia.sh
rm ~/avalution-pine-green-4-blue-tinge.sh
rm ~/avalution-pine-green.sh
rm ~/avalution-purple-rain.sh
rm ~/avalution-twilight-lavender.sh
rm ~/avalution-violet-dusk.sh
rm ~/avalution-violet-flower.sh
rm ~/avalution-violet-indigo.sh
rm ~/avalution-violet-purple.sh

# install original Nord colorscheme (to compare in the future)
# wget https://raw.githubusercontent.com/nordtheme/gnome-terminal/refs/heads/develop/src/nord.sh
# chmod u+x ~/nord.sh
# bash ~/nord.sh
# rm ~/nord.sh

# set the font and its size into all the profiles
profiles=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
for i in ${!profiles[*]}; do
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ use-system-font false
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ font 'RobotoMono Nerd Font Mono 16'
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"${profiles[i]}"/ cell-height-scale 1.2
done

# install CLI tools
sudo apt install -y dconf-cli uuid-runtime xclip wget bat fzf
sudo apt install -y tmux zsh vim neovim mc

# Install fish + omf
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# Install OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Agnoster4Avalution
curl -fsSL https://raw.githubusercontent.com/aalekseenkov/dotfiles/refs/heads/master/.github/agnoster4avalution.zsh-theme -o $ZSH/custom/themes/agnoster4avalution.zsh-theme

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
# CURRENT_USER="$USER"
# sudo chsh -s /usr/bin/zsh $CURRENT_USER
kill -9 -1
