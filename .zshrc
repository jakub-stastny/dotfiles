# This file is loaded after ~/.zshenv.

function load () {
  echo "$(tput setaf 2)~$(tput sgr0) Loading $(tput setaf 7)$1$(tput sgr0)" && source $1
}

# Set basic environment.
if test -f /.dockerenv; then
  load ~/.zsh/$(uname).docker.env.zsh
else
  load ~/.zsh/$(uname).env.zsh
fi

load ~/.zsh/setup.zsh

# Sourced in an interactive session.
# http://zsh.loadforge.net/Intro/intro_3.html
load ~/.zsh/aliases.zsh

if test -n "$TMUX" && test -f ~/.zsh/$(uname).tmux.prompt.zsh; then
  load ~/.zsh/$(uname).tmux.prompt.zsh
elif test -f /.dockerenv && test -f ~/.zsh/$(uname).docker.prompt.zsh; then
  load ~/.zsh/$(uname).docker.prompt.zsh
else
  load ~/.zsh/$(uname).prompt.zsh
fi

load ~/.zsh/completion.zsh
load ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && load ~/.zsh/$(uname).zsh

# Add any local changes that shouldn't be committed into ~/.zsh/local.zsh.
test -f ~/.zsh/local.zsh && load ~/.zsh/local.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
