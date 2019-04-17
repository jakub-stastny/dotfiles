export cdpath=(. ~/projects)
export EDITOR=vim

# From aliases.zsh.
function e () {
  test "$#" = 0 && $EDITOR . || $EDITOR $*
}

# Update
function update () {
  wget https://raw.githubusercontent.com/botanicus/dotfiles/master/.zsh/host.zsh -O ~/.zshrc
}
