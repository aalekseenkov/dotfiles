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
6. ```vim```
7. ```:PlugInstall```

## Articles

* [The best way to store your dotfiles: A bare Git repository EXPLAINED](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
* [Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
* [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)
