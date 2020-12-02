# Sourced in both interactive and uninteractive sessions.
# http://zsh.sourceforge.net/Intro/intro_3.html
# Set basic environment.
source ~/.zsh/env.zsh

if test -f /.dockerenv; then
  source ~/.zsh/$(uname).docker.env.zsh
else
  test -f ~/.zsh/$(uname).env.zsh && source ~/.zsh/$(uname).env.zsh
fi
