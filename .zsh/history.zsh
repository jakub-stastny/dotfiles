HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it.
#setopt share_history
#
setopt HIST_IGNORE_ALL_DUPS  # Remove old duplicates.
