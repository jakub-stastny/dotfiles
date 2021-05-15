# This file is loaded after ~/.zshenv.

save-function-list() {
  flist=${(ok)functions}
}

save-function-list

identifier() {
  test -f /.dockerenv && ([[ -z "$TMUX" ]] && echo dpm || echo dpm.tmux) || echo host
}

get-new-functions() {
  /opt/rubies/ruby-3.0.1/bin/ruby -e 'puts (ARGV[1].split(" ") - ARGV[0].split(" ")).join(", ")' "$flist" "${(ok)functions}"
}

function load () {
  echo "$(tput setaf 2)~$(tput sgr0) Loading $(tput setaf 7)$1$(tput sgr0)" && source $1
}

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
test -f .profile.zsh && load .profile.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
