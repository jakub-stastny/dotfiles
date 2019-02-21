# This file is loaded after ~/.zshenv.
# Add to the OS X install script after ZSH is installed:
# echo | sudo tee /etc/zprofile
# This fucks up the paths, so whatever we set in .zshenv is overriden.

# Sourced in an interactive session.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/aliases.zsh

if test -n "$TMUX" && test -f ~/.zsh/$(uname).tmux.prompt.zsh; then
  source ~/.zsh/$(uname).tmux.prompt.zsh
else
  source ~/.zsh/$(uname).prompt.zsh
fi

source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && source ~/.zsh/$(uname).zsh
source ~/.zsh/nvim.zsh
source ~/.zsh/ruby.zsh

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

# https://nuclearsquid.com/writings/edit-long-commands/
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line
# Update 2.5.2010: @citizen428 brought the builtin fc (fix command) to my attention. fc allows you to edit commands in your history, and reruns them when you’re finished.

test -f ~/.zsh/ignored.zsh && source ~/.zsh/ignored.zsh
