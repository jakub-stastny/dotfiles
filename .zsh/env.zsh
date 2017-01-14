# PATH
path-add()        { path+=("$@") }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'

# This has to be here, because it's a dependency of dotfiles, it's not OS X specific.
path-add ~/.scripts
