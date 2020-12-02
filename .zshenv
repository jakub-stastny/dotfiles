# Sourced in both interactive and uninteractive sessions.
# http://zsh.sourceforge.net/Intro/intro_3.html
# Set basic environment.
if test -f /.dockerenv; then
  load ~/.zsh/$(uname).docker.env.zsh
else
  load ~/.zsh/$(uname).env.zsh
fi

source ~/.zsh/env.zsh
test -f ~/.zsh/$(uname).env.zsh && source ~/.zsh/$(uname).env.zsh
