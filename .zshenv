# Sourced in both interactive and uninteractive sessions.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/env.zsh
source ~/.zsh/chruby.zsh
test -f ~/.zsh/$(uname).env.zsh && source ~/.zsh/$(uname).env.zsh
