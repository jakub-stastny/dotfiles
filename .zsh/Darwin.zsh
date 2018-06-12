# Local (move to a separate file).
export EDITOR="nvim"

#export GIT_EDITOR="nvim " # Or use git config --global core.editor "vim" instead?

# CDPATH
export cdpath=(. ~/Dropbox/Projects/{Software,Work} ~/Dropbox)

test "$PWD" = "$HOME" && cd Desktop

#flashcards has-not-run-today && flashcards
