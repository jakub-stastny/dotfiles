# This file is only being used as a minimal setup on the host machine
# when using docker-project-manager.

export cdpath=(. ~/projects)
export EDITOR=vim

# Prompt.
PROMPT="%F{cyan}☁  %F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# "
RPROMPT='[%F{yellow}%?%f]'

# From aliases.zsh.
function e () {
  test "$#" = 0 && $EDITOR . || $EDITOR $*
}

# Core.
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
