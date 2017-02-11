# Sourced in an interactive session.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/aliases.zsh
source ~/.zsh/$(uname).prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && source ~/.zsh/$(uname).zsh

# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

# added by travis gem
test -f ~/.travis/travis.sh && source ~/.travis/travis.sh

# HACK: This is set in .zshenv, but it doesn't work. Investigate.
chruby 2.4.0

# Show the weekly report if it's Sunday.
test $(date +%w) -eq 7 && week
