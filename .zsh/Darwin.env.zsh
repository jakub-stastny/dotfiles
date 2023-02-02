export cdpath=(. ~/projects)

path-prepend /opt/homebrew/bin
path-prepend /opt/homebrew/Cellar/ruby/3.2.0/bin
path-prepend /opt/homebrew/opt/node@18/bin
path-prepend ~/Library/Python/3.9/bin

test $PWD = $HOME && cd ~/Documents

alias zshrc="e ~/.zshrc; source ~/.zshrc"
alias emacs="emacs -nw"

# For compilers to find node@18 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
# export (PPFLAGS="-I/opt/homebrew/opt/node@18/include"
