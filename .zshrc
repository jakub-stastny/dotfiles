# This file is loaded after ~/.zshenv.

save-function-list

function load () {
  display-loaded-file $1 && source $1
}

# Identifiers:
# host: The host machine.
# dpm: A DPM image, out of the project context.
# project: A DPM image within a project context.
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

test -f ~/.zsh/$(identifier).zsh && load ~/.zsh/$(identifier).zsh

# Per-project configuration.
# The no-project environment is never inherited, since when we launch
# a new session using mksession, a new ZSH instance is loaded.
echo && test -f .profile.zsh && load .profile.zsh || load ~/.zsh/environments/no-project.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
