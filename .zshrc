# This file is loaded after ~/.zshenv.
# Add to the OS X install script after ZSH is installed:
# echo | sudo tee /etc/zprofile
# This fucks up the paths, so whatever we set in .zshenv is overriden.

# Sourced in an interactive session.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/aliases.zsh
source ~/.zsh/$(uname).prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && source ~/.zsh/$(uname).zsh

# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

# chruby 2.4.0
# Show the weekly report if it's Sunday.
test $(date +%w) -eq 7 && week
