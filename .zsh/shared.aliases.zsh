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

# Emacs.
verify-emacs-session() {
  if test -S /tmp/emacs$(id -u)/$1; then
    return 0
  else
    echo "No such session: $1"
    return 1
  fi
}

verify-absence-of-emacs-session() {
  if ! test -S /tmp/emacs$(id -u)/$1; then
    echo "$(tput setaf 2)~$(tput sgr0) Starting Emacs session $(tput setaf 7)$1$(tput sgr0)"
  fi
}

running-emacs-sessions() {
  ps aux | egrep "emacs --daemon=\w+" | grep -v grep | awk '{ print $12 }' | sed -E 's/.*--daemon=(\w+)/\1/'
}

stop-all-emacs-sessions() {
  for session in $(running-emacs-sessions); do
    stop-emacs-session $session
  done
}

start-emacs-session() {
  verify-absence-of-emacs-session && emacs --daemon=$1
}

stop-emacs-session() {
  verify-emacs-session $1 || return 1
  kill $(ps aux | egrep "emacs --daemon=$1" | awk '{ print $2  }')
}
