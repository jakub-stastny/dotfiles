emacs-session-name() { basename $PWD }

verify-emacs-session() {
  if test -S /tmp/emacs$(id -u)/$(emacs-session-name); then
    return 0
  else
    echo "No such session: $(emacs-session-name)"
    return 1
  fi
}

start-emacs-session() {
  if ! test -S /tmp/emacs$(id -u)/$1; then
    echo "$(tput setaf 2)~$(tput sgr0) Starting Emacs session $(tput setaf 7)$(emacs-session-name)$(tput sgr0)"
    emacs --daemon=$1
  fi
}

rename-first-tab() {
  if test $(tmux display-message -p '#I') = "1"; then
    tmux rename-window "E:$(emacs-session-name)"
  fi
}

report-custom-functions() {
  echo "\n  $(tput setaf 2)Functions: $(tput setaf 7)$(get-new-functions)$(tput sgr0)."
}
