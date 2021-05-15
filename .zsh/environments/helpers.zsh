emacs-server-name() { basename $PWD }

start-emacs-server() {
  if ! test -S /tmp/emacs$(id -u)/$1; then
    echo "$(tput setaf 2)~$(tput sgr0) Starting Emacs session $(tput setaf 7)$(emacs-server-name)$(tput sgr0)"
    emacs --daemon=$1
  fi
}

rename-first-tab() {
  if test $(tmux display-message -p '#I') = "1"; then
    tmux rename-window "E:$(emacs-server-name)"
  fi
}

report-custom-functions() {
  echo "\n  $(tput setaf 2)Functions: $(tput setaf 7)$(get-new-functions)$(tput sgr0)."
}
