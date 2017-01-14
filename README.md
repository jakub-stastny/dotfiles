# About

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

# Installation

## Ubuntu

```
apt-get install git zsh
apt-get install ack-grep # The ack command doesn't seem to be available despite this.
gem install bundler pry

chsh -s $(which zsh)
#git clone --bare git://github.com/botanicus/dotfiles.git
git clone --bare git@github.com:botanicus/dotfiles.git

alias dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Resync
dotfiles checkout

# Now you can use branches for different settings.
```

## OS X

brew install chruby ruby-install
brew install ack
atom install command (from the menu)
brew install hub # fork PRs etc
brew install vim --with-override-system-vi # I don't think it overrides, make sure /usr/local/bin takes precedence in $PATH.
brew install git

echo /usr/local/bin/zsh | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

brew cleanup
dotfiles config alias.list '!git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME ls-tree --full-tree --name-only -r HEAD| sed "s/^/~\//"'
dotfiles untracked -> .* (don't expand dirs)

# https://github.com/botanicus/internet-usage-limiter
botanicus.wifi.plist is hard-linked

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
run :PluginInstall in Vim.

# TBD: atom tries to index the whole dropbox when cd ~, vim sucks for many files.
#dotfiles config alias.edit '!sh -c vim $(git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME list)'

# Otherwise it'd be loaded on the next boot, but we want to start it immediately.
launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"

brew cask install atom
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install spotify
brew cask install sublime-text3
brew cask install virtualbox
brew cask install vlc

# TODO

- SSH completion from ~/.ssh/config
- SSH secret key, .gem/credentials. ~/.config/hub
- The only thing that's not backed up at the moment is Atom.
