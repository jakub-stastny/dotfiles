# This can be used by non-interactive scripts as well.
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# PATH
# TODO: make uniq, as in the dev Dockerfile we have: ENV PATH="/root/.scripts:${PATH}"
path-add()        { path+=("$@") } # TODO: Change to append.
path-prepend()    { path=("$@" $path) }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'

path-prepend ~/.scripts

export EDITOR="nvim"
