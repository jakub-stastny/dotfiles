# This file is loaded after ~/.zshenv.

function load () {
  echo "~ Loading $1"; source $1
}

load ~/.zsh/setup.zsh

# Sourced in an interactive session.
# http://zsh.loadforge.net/Intro/intro_3.html
load ~/.zsh/aliases.zsh

if test -n "$TMUX" && test -f ~/.zsh/$(uname).tmux.prompt.zsh; then
  load ~/.zsh/$(uname).tmux.prompt.zsh
else
  load ~/.zsh/$(uname).prompt.zsh
fi

load ~/.zsh/completion.zsh
load ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && load ~/.zsh/$(uname).zsh

test -f ~/.zsh/ignored.zsh && load ~/.zsh/ignored.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
