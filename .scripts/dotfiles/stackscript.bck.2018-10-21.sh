#!/bin/sh

# https://manager.linode.com/stackscripts/edit/348504

cd # Otherwise we're in /.

apt update && apt upgrade -y

# Already installed: git tmux htop
apt install -y zsh neovim mosh build-essential silversearcher-ag
apt remove -y vim nano
apt autoremove --yes

chsh -s $(which zsh)

git clone --bare https://github.com/botanicus/dotfiles.git ~/.dotfiles.git

git --git-dir=$HOME/.dotfiles.git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git --git-dir=$HOME/.dotfiles.git fetch
git --git-dir=$HOME/.dotfiles.git branch --set-upstream-to=origin/master master
git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME checkout
ssh-keyscan github.com >> ~/.ssh/known_hosts

zsh ~/.scripts/dotfiles/dotfiles.install
git --git-dir=$HOME/.dotfiles.git remote set-url origin git@github.com:botanicus/dotfiles.git

# TODO: Install nvr.


cp /usr/share/zoneinfo/America/New_York /etc/localtime

#### USER
# Encrypted password generated by: perl -e "print crypt('password', 'sa');"
useradd -m -p saz0SGr1Q8ZRM -s $(which zsh) botanicus
#usermod -aG admin botanicus
/bin/echo -e "botanicus ALL=(ALL) NOPASSWD:ALL\n" >> /etc/sudoers

su botanicus -c "git clone --bare https://github.com/botanicus/dotfiles.git ~/.dotfiles.git"

# NOTE $HOME must be replaced by /home/botanicus.
su botanicus -c 'git --git-dir=/home/botanicus/.dotfiles.git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"'
su botanicus -c "git --git-dir=/home/botanicus/.dotfiles.git fetch"
su botanicus -c "git --git-dir=/home/botanicus/.dotfiles.git branch --set-upstream-to=origin/master master"
su botanicus -c "git --git-dir=/home/botanicus/.dotfiles.git --work-tree=/home/botanicus checkout"

su botanicus -c "zsh ~/.scripts/dotfiles/dotfiles.install"
su botanicus -c "git --git-dir=/home/botanicus/.dotfiles.git remote set-url origin git@github.com:botanicus/dotfiles.git"
yes | su botanicus -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
cp ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/known_hosts ~botanicus/.ssh/
chown -R botanicus:botanicus ~botanicus/.ssh


cat /dev/zero | ssh-keygen -q -N ""
/bin/echo "~ Your new SSH key:"
# NOTE: cat'ing the key doesn't work, it only shows bit of it (screen-related).
/bin/echo "  Add your new key to https://github.com/settings/keys"
/bin/echo -e "\n\nAlso change /etc/hostname to something meaningful."
/bin/echo -e "\n\nThen restart."
