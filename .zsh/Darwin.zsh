# Local (move to a separate file).
export EDITOR="atom"

#export GIT_EDITOR="atom -w" # Or use git config --global core.editor "vim" instead?

# CDPATH
export cdpath=(. ~/Dropbox/Projects/{Software,Webs,Writing})

test "$PWD" = "$HOME" && cd Desktop

flashcards has-not-run-today && flashcards
