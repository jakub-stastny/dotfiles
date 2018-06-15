# Dependencies: chruby to be loaded first (so we can test if pry is in the PATH).

function launch() {
  ~/.scripts/projects/$1
}

# Dotfiles-related.
alias reload="source ~/.zshrc"
alias zshrc="vim ~/.zshrc && reload && echo ZSH config reloaded."
alias vimrc="vim ~/.vimrc"

# Core.
alias df='df -h'
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -a'

# Git.
alias g='git'
alias gp='git push'
alias gst='git status'

# Others.
alias nettest='ping -c 3 www.google.com'

function e () {
  test "$#" = 0 && $EDITOR . || $EDITOR $*
}
#e() { (test "$#" -eq 0) && $EDITOR . || $EDITOR $@ }

# Ruby.
which pry &> /dev/null && alias irb="pry"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"

alias ghist="cat ~/.history | egrep"

alias GET="curl -X GET"
alias POST="curl -X POST"
alias HEAD="curl -X HEAD"
alias OPTIONS="curl -X OPTIONS"

alias gem_search="gem query --remote --name-matches"

alias .='cd .' # reload (e.g.: you're in app/current)
alias ..='cd ..'
alias ...='cd ../..'

stash () {
  git stash && $* && git stash pop
}

du() {
  for item in $* ; do
    /usr/bin/du -h $item | tail -1
  done
}

function mkpasswd() {
  ruby -e "puts Array.new(16) { rand(256) }.pack('C*').unpack('H*').first"
}

# https://github.com/jingweno/ccat
alias cat=ccat

function fvim () {
  nvim $(fzf)
}
