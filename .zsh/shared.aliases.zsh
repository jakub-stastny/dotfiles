# This file is for shared aliases, ones that are useful
# in a no-project session as well as in a project one.

# Core.
alias df='df -h'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'

# Dotfiles.
alias d='dotfiles'
alias dp='dotfiles push'
alias dst='dotfiles status'

# This defaults to NeoVim.
# It's meant to be overwritten in per-project .profile.zsh files.
e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }

alias ghist="cat $HISTFILE | egrep"

alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'

du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}
