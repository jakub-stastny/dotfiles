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


export path=(~/.scripts $path)
