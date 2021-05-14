# Dependencies: chruby to be loaded first (so we can test if pry is in the PATH).

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
e() { (test "$#" -eq 0) && nvim . || nvim $@ }

# Ruby.
which pry &> /dev/null && alias irb="pry"
alias bu="bundle update"
alias be="bundle exec"

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
  tmux new -s $(basename $PWD)
}

yt='youtube-dl -f '\''bestaudio[ext=m4a]'\'

# Projects
dpm-init() {
  test -d ~/projects || mkdir ~/projects
  docker run -it --rm -v ~/projects:/projects jakubstastny/docker-project-manager init $1 ~/projects
}

p() {
  cd ~/projects/$(test "$#" -eq 0 && ls ~/projects | fzf || $1)
}

a() {
  p $* && ./runner start && ./runner attach
}

stop() {
  cd ~/projects/$(test "$#" -eq 0 && ls ~/projects | fzf || $1) && ./runner stop && cd -
}

# Emacs
# start_emacs dotfiles
start_emacs() {
  emacs --daemon=$1
}

emacs-list-servers() {
  ls /tmp/emacs$(id -u)
}

#emacsclient -s $1
