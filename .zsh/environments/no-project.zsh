mksession() {
  (cd $1 && tmux new -s $(basename $PWD))
}

yt='youtube-dl -f '\''bestaudio[ext=m4a]'\'

# This should run in a new Tmux session (which is NOT nested).
# We might even want to start the dotfiles session by default in tmux auto connect?
# That way it's always pinned (as in position 0).
edit-dotfiles() {
  test -S /tmp/emacs$(id -u)/dotfiles || emacs --daemon=dotfiles

  if test "$#" -eq 0; then
    emacsclient -s dotfiles ~/.emacs.d/init.org ~/.zshrc ~/.zsh/*.zsh
  else
    emacsclient -s dotfiles $@
  fi
}
