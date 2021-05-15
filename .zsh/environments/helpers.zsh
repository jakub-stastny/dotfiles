emacs-session-name() { basename $PWD }

functions[_verify-emacs-session]=$functions[verify-emacs-session]
verify-emacs-session() {
  _verify-emacs-session $(emacs-session-name)
}

functions[_verify-absence-of-emacs-session]=$functions[verify-absence-of-emacs-session]
verify-absence-of-emacs-session() {
  _verify-absence-of-emacs-session $(emacs-session-name)
}

functions[_start-emacs-session]=$functions[start-emacs-session]
start-emacs-session() {
  _start-emacs-session $(emacs-session-name)
}

functions[_stop-emacs-session]=$functions[stop-emacs-session]
stop-emacs-session() {
  _stop-emacs-session $(emacs-session-name)
}

rename-first-tab() {
  if test $(tmux display-message -p '#I') = "1"; then
    tmux rename-window "E:$(emacs-session-name)"
  fi
}
