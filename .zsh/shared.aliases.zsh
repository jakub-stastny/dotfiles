# This file is for shared aliases, ones that are useful
# in a no-project session as well as in a project one.

save-function-list

# Core
alias df='df -h'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# Dotfiles
# Make ZSH aliases for all the dotfiles aliases.
# This way "dotfiles cav" becaves simply "dcav".
for galias in $(git config --get-regexp alias | awk '{ print $1 }' | awk -F. '{ print $2 }'); do
  alias d$galias="dotfiles $galias"
done

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

report-custom-functions "Aliases" && save-function-list

# Emacs.
verify-emacs-session() {
  [[ -v 1 ]] || error "Usage: verify-emacs-session session-name" || return 1
  ls-emacs-sessions | egrep "^$1$" > /dev/null && return 0
  error "No such session: $1" && return 1
}

verify-absence-of-emacs-session() {
  [[ -v 1 ]] || error "Usage: verify-absence-of-emacs-session session-name" || return 1
  ls-emacs-sessions | egrep "^$1$" > /dev/null && return 1 || return 0
}

ls-emacs-sessions() {
  ps aux | egrep "emacs --daemon=\w+" | grep -v grep | awk '{ print $12 }' | sed -E 's/.*--daemon=(\w+)/\1/'
}

stop-all-emacs-sessions() {
  for session in $(ls-emacs-sessions); do
    stop-emacs-session $session
  done
}

start-emacs-session() {
  (( ${+1} )) || error "Usage: start-emacs-session session-name [emacs-args]" || return 1
  name=$1; shift
  verify-absence-of-emacs-session $name && rm -f /tmp/emacs$(id -u)/$name && emacs --daemon=$name $@
}

stop-emacs-session() {
  [[ -v 1 ]] || error "Usage: stop-emacs-session session-name" || return 1
  verify-emacs-session $1 || return 1
  kill $(ps aux | grep -v grep | egrep "emacs --daemon=$1" | awk '{ print $2  }')
}

report-custom-functions "Emacs" && echo
