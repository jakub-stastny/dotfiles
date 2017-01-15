# Sourced in an interactive session.
# http://zsh.sourceforge.net/Intro/intro_3.html
source ~/.zsh/aliases.zsh
source ~/.zsh/$(uname).prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
test -f ~/.zsh/$(uname).zsh && source ~/.zsh/$(uname).zsh
