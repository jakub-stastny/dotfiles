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
  _start-emacs-session $(emacs-session-name) --load $PWD/.env/emacs.el
}

functions[_stop-emacs-session]=$functions[stop-emacs-session]
stop-emacs-session() {
  _stop-emacs-session $(emacs-session-name)
}

# TODO: should also be in shared.aliases.zsh like the other fns.
restart-emacs-session() {
  stop-emacs-session
  start-emacs-session
}

rename-first-tab() {
  if $(in-first-tab); then
    tmux rename-window "E:$(emacs-session-name)"
  fi
}

e() {
  verify-emacs-session && (test "$#" -eq 0) && emacsclient -s $(emacs-session-name) . || emacsclient -s $(emacs-session-name) $@
}

# Send file to the running Emacs session, preventing "Waiting for Emacs".
s() {
  verify-emacs-session && emacsclient -s $(emacs-session-name) -n $@
}
