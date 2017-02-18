# http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Initialization

fpath=($HOME/.zsh/completions $fpath)

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'r:|[._-/]=** r:|=**'
zstyle :compinstall filename ~/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Travis completion.
test -f ~/.travis/travis.sh && source ~/.travis/travis.sh
