# This file is loaded after ~/.zshenv.

save-function-list

function load () {
  display-loaded-file $1 && source $1
}

identifier() {
  test -f /.dockerenv && ([[ -z "$TMUX" ]] && echo dpm || echo project) || echo host
}

display-loaded-file ~/.zshrc && report-custom-functions && echo

# Set basic environment.
load ~/.zsh/shared.setup.zsh

# Sourced in an interactive session.
# http://zsh.loadforge.net/Intro/intro_3.html
load ~/.zsh/shared.aliases.zsh
test -f /.dockerenv || load ~/.zsh/host.aliases.zsh

load ~/.zsh/$(identifier).prompt.zsh

load ~/.zsh/shared.completion.zsh
load ~/.zsh/shared.history.zsh
test -f ~/.zsh/shared.host.zsh && load ~/.zsh/shared.host.zsh

# Add any local changes that shouldn't be committed into ~/.zsh/local.zsh.
#
# Would you change path of the ignored file, don't forget to update ~/.gitignore.
test -f ~/.zsh/local.zsh && load ~/.zsh/local.zsh

# Per-project configuration.
echo && test -f .profile.zsh && load .profile.zsh || load ~/.zsh/environments/no-project.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
