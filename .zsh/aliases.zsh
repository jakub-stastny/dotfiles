# Dependencies: chruby to be loaded first (so we can test if pry is in the PATH).

# Dotfiles-related.
alias dotfiles="git --git-dir=$HOME/Dropbox/Projects/dotfiles --work-tree=$HOME"
alias reload="source ~/.zshrc"
alias zshrc="vim ~/.zshrc && reload && echo ZSH config reloaded."
alias vimrc="vim ~/.vimrc"

# Core.
alias du='du -h'
alias df='df -h'
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

# Ruby.
which pry &> /dev/null && alias irb="pry"
alias bi="bundle install"
alias bu="bundle update"
