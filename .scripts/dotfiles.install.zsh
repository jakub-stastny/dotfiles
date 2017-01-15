#!/usr/bin/env zsh

# This script should have ~/.zshenv loaded.

if [ $(uname) = "Linux" ]; then
  echo "~ Linux specific."
  # Set shell to ZSH.
  chsh -s $(which zsh)

  # Install Vim plugins.
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall

  apt-get install ack-grep
else if [ $(uname) = "Darwin" ]; then
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
gem install bundler pry # Which Ruby? Install Ruby on OS X and switch to it.
dotfiles config --local status.showUntrackedFiles no

# dotfiles config alias.list '!git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME ls-tree --full-tree --name-only -r HEAD| sed "s/^/~\//"'
# dotfiles untracked -> .* (don't expand dirs)
#
# # TBD: atom tries to index the whole dropbox when cd ~, vim sucks for many files.
# #dotfiles config alias.edit '!sh -c vim $(git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME list)'
#
# ####################################
# # Make Sure Dropbox Symlinks Exist #
# ####################################
#
# echo "~ SKIPPING 'CAUSE THIS SHIT IS BROKEN: Updating symlinks ..."
# # ln -sf "$HOME/Downloads" "$HOME/Dropbox/Inbox/Downloads/$(uname -n)"
# # ln -sf "$HOME/Dropbox/Projects" "$HOME/projects"
# # ln -sf "$HOME/Dropbox/Code/sources" "$HOME/sources"
#
#
# ####################
# # Install SSH Keys #
# ####################
#
# PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----\n
# MIIEowIBAAKCAQEAy/M2dnFRb1LIRjnIP99Pe0TPOCXoAZR+aD4u9wu0OHrOeuqb\n
# lKteLa7O5JF6TY8I9K3vHRxGr5r3boZ64uCyAWKF9Czwso76Oj7Ahh7ukQ170YxQ\n
# 0R0sbt034ctRttEsQUHhNLzTzRNFQxzlcDyc7sGKvg0pJRaTGnL1byFgkU0niF4A\n
# ci9/CMkfJ89bp7QEeshfM/V/yp0VfftSpttf0JMZqulD4GGzkRn5rKPFXnxfX5CW\n
# FBIvz0LlqnuoBohCriPUZssnqdD8Msszx2uYvP3ReI3cFwbD5qMVaitctBlFmUki\n
# mnktIVvH99cgXuuXS9pYbUOdRW2NkDyQhkWaUwIDAQABAoIBAHsVAVZDlvDHFcSD\n
# 1JzvaKks4p2xCq4BbrP8ax1+e7nmKzw038W+Ee0h5Qw924B5BN+dJIP9747Ex/R0\n
# xi6rieGaEttET9KCxPJnsop+ml0BtSrGMnOw1oLlkHb83Ainfby4RHAuUOgfbBpP\n
# kwvEGLViKhf+G0mdsRMyM3pouz2ULaTPY4GzFR7pri5UgZuQMJ50GnwLCafgdszQ\n
# c5ZpjrWY+JMgDQNFDUyZ3da2eq0ocltslCDnz86uJnCKH7jLHxwHOTcDOqUieAut\n
# iylux+hjTtcCGnm2gd/l4VVTIScDu6983u8/1y8IZkakXYK/+ABZgmIeRjmgEEqE\n
# XfY/e9ECgYEA6E497GIL8oT4ZzJL7Jr1N6v7tPUig0zBK4ysGWaRDi+D+a73d+YZ\n
# dwkZ+a1UuuQuTQCO2cNQyEcNgzzoANkmPyC1BH732wL7SHpprRgTXC7CEhE6jr41\n
# RsdqCaThAHAUK+LTZaLTb1xiJQ0LGirGCAp6NTHGxMHyd/7MyfmSjLkCgYEA4MCT\n
# OZCmTd24xo+wB+G1vlz3eBZ9WuIHcc1GSezyjIKHlh9YjJ8JZxdZTOUp5E+UAw7C\n
# W7bjTbdHKFnU3qyi49KSVR4lw2WNA1BDtSb8UO/YmsKGhgrIujpJXldMMhAkb77v\n
# fG8o9WjBZLvuSHNZXktNIREChfZFf2e8Ss7QkWsCgYAhqsU6rvMAUNkXS6jJP6Pu\n
# T5SJI0W/Na6BOz/t5nl7TtOXqg3faI+kOsNy9fXjqBI1wrDxSmc4v2Nr87XD+bSb\n
# TYgugKA3M3VriaIrHeQgZf5mU+zipxpdiaUKhMS/JX8m5RayEikGaKMor30+a5iL\n
# rckMUIx4E4uqbFkNpIfisQKBgQC6kcHlQFl9O/g+BFtJP6nB+6SGcIzg2874PkIB\n
# 7gsubtCk4yJ7oS2KAYzk0zsiRpkErMTUo44vHlyYd3HI4yBY5J0KwXrxqCQVwxRh\n
# lZpQibmSRrarINqeFPKAuREMYfANPz/IWPJ0PeCEgaj9RZvDNdkyAM/KarQoXfGl\n
# W+cxPwKBgGh5VDuJvkuy5KptVO1AlI+/zMxngyG2WzngtSoNAJI2GdJC0kCsczz2\n
# AzstuUypfDeh6zaX/+wFcxCF64UJItLA6iEeDKg6V70MJzoj+bBs9Lm5uKM/+ppL\n
# no956IRjf94PHUQDlGs+gZ3eF9nc6yZAr+51c7YumIkqDxhpdpZD\n
# -----END RSA PRIVATE KEY-----\n"
#
# PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDL8zZ2cVFvUshGOcg/3097RM84JegBlH5oPi73C7Q4es566puUq14trs7kkXpNjwj0re8dHEavmvduhnri4LIBYoX0LPCyjvo6PsCGHu6RDXvRjFDRHSxu3Tfhy1G20SxBQeE0vNPNE0VDHOVwPJzuwYq+DSklFpMacvVvIWCRTSeIXgByL38IyR8nz1untAR6yF8z9X/KnRV9+1Km21/Qkxmq6UPgYbORGfmso8VefF9fkJYUEi/PQuWqe6gGiEKuI9Rmyyep0PwyyzPHa5i8/dF4jdwXBsPmoxVqK1y0GUWZSSKaeS0hW8f31yBe65dL2lhtQ51FbY2QPJCGRZpT james@101ideas.cz"
#
#
# function ensure_exists () {
#   if ! test -f "$1"; then
#     echo "$2" > "$1"
#     chmod "$3" "$1"
#     echo "~ $1 ... installed (permissions: $3)"
#   else
#     echo "~ $1 ... found"
#   fi
# }
#
# # The -p argument is so it doesn't fail if it already exists.
# mkdir -p ~/.ssh
# chmod 700 ~/.ssh
# 
# ensure_exists ~/.ssh/id_rsa $PRIVATE_KEY 600
# ensure_exists ~/.ssh/id_rsa.pub $PUBLIC_KEY 644
#
#
# ###############################
# # Update & Reinstall Dotfiles #
# ###############################
#
# echo "~ Updating dotfiles."
# cd "$HOME/Dropbox/Code/dotfiles"
# git push origin master; git pull --rebase
# echo "~ Reinstalling dotfiles."
# ./install.rb --update
#
# # I read that Launchd won't execute daemons which regularly
# # exits "too soon" where too soon means less than 10s.
# sleep 11
