#!/usr/bin/env zsh

# This script should have ~/.zshenv loaded.

if [ $(uname) = "Linux" ]; then
  echo "~ Linux specific."

  apt-get -y install ack-grep

  # Set shell to ZSH.
  chsh -s $(which zsh)

  # Install Vim plugins.
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall

  dotfiles config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
  dotfiles fetch
  dotfiles branch --set-upstream-to=origin/master master
elif [ $(uname) = "Darwin" ]; then
  echo "~ OS X specific."
  # brew cask install atom
  # brew cask install dropbox
  # brew cask install firefox
  # brew cask install google-chrome
  # brew cask install spotify
  # brew cask install sublime-text3
  # brew cask install virtualbox
  # brew cask install vlc
  #
  # brew install chruby ruby-install
  # brew install ack
  # atom install command (from the menu) # or done when installed from brew?
  # brew install hub # fork PRs etc
  # brew install vim --with-override-system-vi # I don't think it overrides, make sure /usr/local/bin takes precedence in $PATH.
  # brew install git
  #
  #
  # # Otherwise it'd be loaded on the next boot, but we want to start it immediately.
  # launchctl load -w "$HOME/Library/LaunchAgents/$PLIST"
  #
  # echo /usr/local/bin/zsh | sudo tee -a /etc/shells
  # chsh -s /usr/local/bin/zsh
  #
  # brew cleanup
  #
  # # https://github.com/botanicus/internet-usage-limiter
  # botanicus.wifi.plist is hard-linked
fi

echo "~ General."
# gem install bundler pry # Which Ruby? Install Ruby on OS X and switch to it. Linux doesn't have any to start with.
dotfiles config --local status.showUntrackedFiles no

# dotfiles config alias.list '!git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME ls-tree --full-tree --name-only -r HEAD| sed "s/^/~\//"'
# dotfiles untracked -> .* (don't expand dirs)
#
# # TBD: atom tries to index the whole dropbox when cd ~, vim sucks for many files.
# #dotfiles config alias.edit '!sh -c vim $(git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME list)'
