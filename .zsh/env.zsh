# Local (move to a separate file).
export EDITOR="atom"
#export GIT_EDITOR="atom -w" # Or use git config --global core.editor "vim" instead?

# ZSH history.
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it.
#setopt share_history

# PATH
path-add()        { path+=("$@") }
path-del()        { for i ("$@") { path[(r)$i]=() } }
path-clear()      { path=() }

path-add ~/.scripts
path-add ~/Dropbox/Projects/Software/*/bin

# Make $RUBYLIB and $rubylib behave like $PATH/$path.
typeset -T -U -gx -a RUBYLIB rubylib ':'

rubylib-add()    { rubylib+=("$@") }
rubylib-delete() { for i ("$@") { rubylib[(r)$i]=() } }
rubylib-clear()  { rubylib=() }

rubylib-add ~/Dropbox/Projects/Software/*/lib
