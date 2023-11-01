# dotfiles

A home for my dotfiles

## Setup

### Cloning to new computer

```
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:tallen116/dotfiles.git $HOME/.dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Note:
If conflicting files are found you will have to move them.

### MacOS

```
echo "alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> .bash_profile
```

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
