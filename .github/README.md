# Dotfiles

Dotfiles are hidden configuration files in Unix-like systems that store settings for shells, editors, and other tools. By managing our dotfiles, we'll ensure a consistent experience across systems and save time reconfiguring tools.

**All tools and configurations were tested under** `Linux Mint 22.1` Cinnamon.

## Automatic Installation

Download [install.sh](https://github.com/aalekseenkov/dotfiles/blob/master/.github/install.sh) into your newly home directory to install and test this configuration in some seconds:
- `wget https://github.com/aalekseenkov/dotfiles/raw/refs/heads/master/.github/install.sh`
- `chmod u+x install.sh`
- `bash install.sh`

![Dotfiles](./dotfiles.png)

## Installed Tools
- [wezterm](https://wezterm.org/) - a powerful cross-platform terminal emulator and multiplexer
- [fish](https://fishshell.com/) - a smart and user-friendly command line shell
- [zsh](https://www.zsh.org/) -  a shell designed for interactive use
- [starship](https://starship.rs/) - a cross-shell prompt
- [omb](https://ohmybash.nntoan.com/) - a framework for bash configuration
- [ble](https://github.com/akinomyoga/ble.sh) - a bash command line editor
- [omf](https://github.com/oh-my-fish/oh-my-fish) - a framework for fish configuration
- [omz](https://ohmyz.sh/) - a framework for zsh configuration
- [neovim](https://neovim.io/) - a hyperextensible Vim-based text editor
- [vifm](https://vifm.info/) - a file manager with curses interface

*The list is updated as it develops.*

## Manual Installation

### GNOME Terminal

#### Gogh color's schemes

1. In GNOME Terminal *Preferences* rename `Unnamed` Profile's name to `Default`
2. Run pre-install and the Gogh script's commands
```
sudo apt update && sudo apt-get install -y dconf-cli uuid-runtime wget
bash -c "$(wget -qO- https://git.io/vQgMr)"
```
3. Input the numbers of the themes: Selenized Dark, Selenized Light (`280 281`)

#### Hack Nerd Font

1. ```sudo apt update && sudo apt-get install -y unzip curl```
2. ```sudo mkdir -p /usr/share/fonts/Hack```
3. ```curl -fsSLO $(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep browser_download_url | grep 'Hack.zip' | cut -d '"' -f 4)```
4. ```sudo unzip ./Hack.zip -d /usr/share/fonts/Hack/ && rm -f ./Hack.zip```
5. In GNOME Terminal *Preferences > Selenized Light > Custom Font* - set `Hack Nerd Font Mono` - 16
6. In GNOME Terminal *Preferences > Selenized Dark > Custom Font* - set `Hack Nerd Font Mono` - 16
7. In GNOME Terminal *Preferences* - set `Selenized Light` as default theme

[All Nerd Fonts Downloads](https://www.nerdfonts.com/font-downloads)

## Dotfiles Installing

1. ```echo ".dotfiles" >> .gitignore```
2. ```git clone --bare https://github.com/aalekseenkov/dotfiles $HOME/.dotfiles```
3. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
4. ```dotfiles config --local status.showUntrackedFiles no```
5. ```test -e ~/.bashrc && mv ~/{.bashrc,.bashrc.save}```
6. ```test -e ~/.zshrc && mv ~/{.zshrc,.zshrc.save}```
7. ```dotfiles checkout```
8. ```source ~/.bashrc```
9. ```vim +PlugInstall +qall```
10. ```git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
11. ```~/.tmux/plugins/tpm/bin/install_plugins```

**To change a shell for the current user to zsh or fish:**

12. chsh -s /usr/bin/zsh
13. kill -9 -1

## Additional actions (optional)

### Generating a new SSH key
1. ```ssh-keygen -t ed25519 -C "your_email@example.com"```
2. ```eval "$(ssh-agent -s)"```
3. ```ssh-add ~/.ssh/id_ed25519```

### Adding the SSH public keys to account on GitHub
We should add two ssh-keys (authentication one and signing one) to the account on GitHub

### Configuring Git for SSH commit signature verification
1. ```git config --global user.name "your_user"```
2. ```git config --global user.email "your_email@example.com"```
3. ```git config --global commit.gpgsign true```
4. ```git config --global gpg.format ssh```
5. ```git config --global user.signingkey "~/.ssh/id_ed25519.pub"```
6. ```git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers```
7. ```touch ~/.ssh/allowed_signers```
8. ```echo "your_email@example.com <~/.ssh/id_ed25519.pub>" >> ~/.ssh/authorized_signatures```

### Switching remote URLs from HTTPS to SSH
1. ```git remote set-url origin git@github.com:OWNER/REPOSITORY.git```
2. ```git remote -v```

## Articles

* [The best way to store your dotfiles: A bare Git repository EXPLAINED](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
* [Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
* [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## Storing using a bare repository (initial step):

1. ```git init --bare $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc```
4. ```dotfiles config --local status.showUntrackedFiles no```
5. ```dotfiles add .vimrc```
6. ```dotfiles commit -S -m "add .vimrc"```
7. ```dotfiles remote add origin git@github.com:aalekseenkov/dotfiles.git```
8. ```dotfiles push -u origin master```
