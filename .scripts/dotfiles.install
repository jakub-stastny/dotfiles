#!/usr/bin/env zsh

# This script should have ~/.zshenv loaded.

if [ $(uname) = "Darwin" ]; then
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

dotfiles config --local status.showUntrackedFiles no
dotfiles config --local alias.list '!git ls-files | sed "s/^/~\//"'
dotfiles config --local alias.uninstall '!git ls-files | xargs rm' # This doesn't work with the above, but it doesn't matter.

dotfiles install-hooks

gem install bundler pry

# Install Vim plugins.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Set shell to ZSH.
chsh -s $(which zsh)

ln -s ~/.scripts/dotfiles.update.sh ~/dotfiles.git/hooks/post-merge

echo "! Use ssh-keygen -t rsa -b 4096 -C your@email.com to create a new SSH key and add it to https://github.com/settings/keys"
