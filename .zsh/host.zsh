# This file is only being used as a minimal setup on the host machine
# when using docker-project-manager.

export cdpath=(. ~/projects)
export EDITOR=vim

# History.
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it.
#setopt share_history

setopt HIST_IGNORE_ALL_DUPS  # Remove old duplicates.

# Prompt.
PROMPT="%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# "
RPROMPT='[%F{yellow}%?%f]'

# From aliases.zsh.
function e () {
  test "$#" = 0 && $EDITOR . || $EDITOR $*
}

# Core.
alias ls="ls --color=auto"
alias df='df -h'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'

alias ghist="cat ~/.history | egrep"

alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'

du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}

# Update
function update () {
  wget --no-cache https://raw.githubusercontent.com/botanicus/dotfiles/master/.zsh/host.zsh -O ~/.zshrc
}

echo "~ Updating ~/.zshrc from ~/.zsh/host.zsh"
update
