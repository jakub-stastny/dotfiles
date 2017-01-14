dotfiles remote update &> /dev/null

# @ refers to HEAD and @{u} to its upstream (origin/master).
# This setup was necessary: dotfiles branch --set-upstream-to=origin/master master
# and dotfiles config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
#
# This solves the following issue:
#
# There's a bug, on the cloned repo the upstream ref doesn't work, origin/master
# doesn't work either. git branch -a shows only master, not remotes/origin/master
# etc.
#
if [ $(dotfiles rev-parse @) = $(dotfiles rev-parse @{u}) ]; then
  # TODO: Maybe handle push as well in case we're ahead.
  # Then again we have the hook so we may pressume it has been pushed at all times.
  # How about git stash?
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
