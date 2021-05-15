# Core.
alias df='df -h'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'

# Git.
alias gp='git push'
alias gst='git status'

alias d='dotfiles'
alias dp='dotfiles push'
alias dst='dotfiles status'

# This defaults to NeoVim.
# It's meant to be overwritten in per-project .profile.zsh files.
e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }

alias ghist="cat $HISTFILE | egrep"

alias GET="curl -X GET"
alias POST="curl -X POST"
alias HEAD="curl -X HEAD"

alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'

du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}

function mkpasswd() {
  ruby -e "puts 3.times.map { 2.times.map { rand(256) }.pack('C*').unpack('H*') }.join('-')"
}

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
