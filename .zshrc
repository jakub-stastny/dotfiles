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
#which docker && load ~/.zsh/$(identifier).prompt.zsh # FIXME

load ~/.zsh/shared.completion.zsh
load ~/.zsh/shared.history.zsh

test -f ~/.zsh/$(uname).env.zsh && source ~/.zsh/$(uname).env.zsh
test -f ~/.zsh/$(uname).prompt.zsh && source ~/.zsh/$(uname).prompt.zsh

# if test -n "$TMUX" && test -f ~/.zsh/$(uname).tmux.prompt.zsh; then
#   source ~/.zsh/$(uname).tmux.prompt.zsh
# else
#   source ~/.zsh/$(uname).prompt.zsh
# fi

#test -f ~/.zsh/shared.host.zsh && load ~/.zsh/shared.host.zsh
#test -f ~/.zsh/$(identifier).zsh && load ~/.zsh/$(identifier).zsh

(( ${+TMUX} )) || load ~/.zsh/tmux-auto-connect.zsh

if test -f ~/.env; then
  echo "$(tput setaf 2)~$(tput sgr0) Loading ENV vars from $(tput setaf 7)~/.env$(tput sgr0)"
  source ~/.env
fi

# Per-project configuration.
# The no-project environment is never inherited, since when we launch
# a new session using mksession, a new ZSH instance is loaded.
echo && test -f .env/zsh.zsh && load .env/zsh.zsh || load ~/.zsh/environments/no-project.zsh

setopt rm_star_silent # Don't ask for confirmation on rm with glob.
setopt nullglob # Don't fail if one of the globs is not present, such as with rm *.{html,css}

export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"
