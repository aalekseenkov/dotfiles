# Dotfiles

Storing using a bare repository:
1. ```git init --bare $HOME/.dotfiles```
2. ```alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
3. ```echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc```
4. ```config config --local status.showUntrackedFiles no```
5. ```config add .vimrc```
6. ```config commit -S -m "add .vimrc"```
7. ```config remote add origin <remote-url>```
8. ```config push -u origin master```

Installing:
1. ```echo ".dotfiles" >> .gitignore```
2. ```git clone --bare <remote-git-repo-url> $HOME/.dotfiles```
3. ```alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
4. ```config config --local status.showUntrackedFiles no```
5. ```config checkout```

## Articles
* [The best way to store your dotfiles: A bare Git repository EXPLAINED](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
* [Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
* [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)
