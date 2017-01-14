# PATH
path-add()        { path+=("$@") }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'
