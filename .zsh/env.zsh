# This can be used by non-interactive scripts as well.
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# PATH
# TODO: make uniq always.
path-add()        { path+=("$@") } # TODO: Change to append.
path-prepend()    { path=("$@" $path) }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# NOTE: This needs to go to per-project configuration, leaving here for now as a reference.
# Make $RUBYLIB and $rubylib behave like $PATH/$path.
#typeset -T -U -gx -a RUBYLIB rubylib ':'

export EDITOR="nvim"
