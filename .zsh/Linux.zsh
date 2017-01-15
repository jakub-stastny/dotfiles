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
if [ $(dotfiles rev-parse @) != $(dotfiles rev-parse @{u}) ]; then
  # We are not handling pushing, since we have the auto-push hook installed anyway.
  # Stashing the changes is ignored as well, pressumably I'd commit everything.
  #
  # This can work either:
  #   dotfiles pull --ff with post-merge hook, or
  #   dotfiles pull -r with post-checkout hook.
  #
  # Note that post-rewrite works only when something is actually rewritten,
  # not in fast-forward rebasing scenarios.
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
