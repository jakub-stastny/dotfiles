# This file is loaded after ~/.zshenv.
# Add to the OS X install script after ZSH is installed:
# echo | sudo tee /etc/zprofile
# This fucks up the paths, so whatever we set in .zshenv is overriden.

# Sourced in an interactive session.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/aliases.zsh

if test -z "$TMUX"; then
  source ~/.zsh/$(uname).prompt.zsh
else
  source ~/.zsh/$(uname).tmux.prompt.zsh
fi

test $(whoami) = vagrant && source ~/.zsh/vagrant.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && source ~/.zsh/$(uname).zsh
source ~/.zsh/nvim.zsh

# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

# Show the weekly report if it's Sunday.
# test $(date +%w) -eq 7 && week

echo; capabilities; echo "ZSH aliases: ${(ok)aliases}"; #echo "ZSH functions: ${(ok)functions}"; echo

source ~/.zsh/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ignore files from .gitignore.
export FZF_DEFAULT_COMMAND="ag -g ''"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Emacs keybinding. C-a C-e C-k.
bindkey -e

# Without this, 256 colours won't work in tmux,
# at least not in Blink/VPS/tmux combo.
export TERM=xterm-256color
