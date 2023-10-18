# dotfiles

A home for my dotfiles

## Setup

### Android

Install Termux

```
termux-setup-storage

echo y | pkg update

pkg install openssh git neovim

git init --bare $HOME/.dotfiles

alias dotfiles='/data/data/com.termux/files/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

echo "alias dotfiles='/data/data/com.termux/files/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc

dotfiles remote add origin git@github.com:tallen116/dotfiles.git
```
