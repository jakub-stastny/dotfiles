dotfiles remote update &> /dev/null

# This setup was necessary:
#   $ dotfiles config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
#   $ dotfiles fetch
#   $ dotfiles branch --set-upstream-to=origin/master master
#
# Without that the upstream ref doesn't work, whether by @{u} or by origin/master
# and git branch -a shows doesn't show any remote branches either.
#
# @ refers to HEAD and @{u} to its upstream (origin/master).
if [ "$(dotfiles rev-parse @)" != "$(dotfiles rev-parse @{u})" ]; then
  # We are not handling pushing, since we have the auto-push hook installed anyway.
  # Stashing the changes is ignored as well, pressumably I'd commit everything.
  #
  # This can work either:
  #   dotfiles pull --ff with post-merge hook, or
  #   dotfiles pull -r with post-checkout hook.
  #
  # Note that post-rewrite works only when something is actually rewritten,
  # not in fast-forward rebasing scenarios.

  clear

  # STDERR contains any output from the post-merge hook (dotfiles.update).
  # STDOUT contains the standard output of git pull (which we want to silence).
  if dotfiles pull -r > /dev/null; then
    echo "\n$(tput setaf 2)~$(tput sgr0) Reloading the environment." && exec zsh
  else
    echo "\n$(tput setaf 1)Cannot update dotfiles.$(tput sgr0)"
  fi

  # FIXME: If the current repo is AHEAD of origin, this will keep running in a loop.
fi

alias ls="ls --color=auto"

load ~/.zsh/tmux-auto-connect.zsh
