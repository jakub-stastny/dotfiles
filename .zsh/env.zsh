# This can be used by non-interactive scripts as well.
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# PATH
# TODO: make uniq always.
path-add()        { path+=("$@") } # TODO: Change to append.
path-prepend()    { path=("$@" $path) }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'

# Do not do this anymore, move to dev.
#path-prepend ~/.scripts

export EDITOR="nvim"
