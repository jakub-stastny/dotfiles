# This can be used by non-interactive scripts as well.
alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# PATH
path-add()        { path+=("$@") } # TODO: Change to append.
path-prepend()    { path=("$@" $path) }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'

# This has to be here, because it's a dependency of dotfiles, it's not OS X specific.
path-prepend ~/.scripts

export EDITOR="nvim"

#export GIT_EDITOR="nvim " # Or use git config --global core.editor "vim" instead?
