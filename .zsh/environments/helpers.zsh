emacs-session-name() { basename $PWD }

verify-emacs-session() {
  if test -S /tmp/emacs$(id -u)/$(emacs-session-name); then
    return 0
  else
    echo "No such session: $(emacs-session-name)"
    return 1
  fi
}

verify-absence-of-emacs-session() {
  if ! test -S /tmp/emacs$(id -u)/$(emacs-session-name); then
    echo "$(tput setaf 2)~$(tput sgr0) Starting Emacs session $(tput setaf 7)$(emacs-session-name)$(tput sgr0)"
  fi
}

###

start-emacs-session() {
  verify-absence-of-emacs-session && emacs --daemon=$(emacs-session-name)
}

stop-emacs-session() {
  verify-emacs-session && kill $(ps aux | grep "emacs --daemon=$(emacs-session-name)" | grep -v grep | awk '{ print $2 }')
}

rename-first-tab() {
  if test $(tmux display-message -p '#I') = "1"; then
    tmux rename-window "E:$(emacs-session-name)"
  fi
}

report-custom-functions() {
  echo "\n  $(tput setaf 2)Functions: $(tput setaf 7)$(get-new-functions)$(tput sgr0)."
}
