# Dotfiles

## Storing using a bare repository:

1. ```git init --bare $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc```
4. ```dotfiles config --local status.showUntrackedFiles no```
5. ```dotfiles add .vimrc```
6. ```dotfiles commit -S -m "add .vimrc"```
7. ```dotfiles remote add origin git@github.com:aalekseenkov/dotfiles.git```
8. ```dotfiles push -u origin master```

## Installing:

1. ```echo ".dotfiles" >> .gitignore```
2. ```git clone --bare https://github.com/aalekseenkov/dotfiles $HOME/.dotfiles```
3. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
4. ```dotfiles config --local status.showUntrackedFiles no```
5. ```dotfiles checkout```
6. ```exec bash```
7. ```vim +PlugInstall +qall```
8. ```git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
9. ```tmux``` and press ```prefix + I``` (capital i, as in Install) to fetch the plugind for tmux

## Articles

* [The best way to store your dotfiles: A bare Git repository EXPLAINED](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
* [Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
* [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

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
