dotfiles remote update &> /dev/null

# This setup was necessary: dotfiles branch --set-upstream-to=origin/master master
# and dotfiles config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
#
# This solves the following issue:
#
# There's a bug, on the cloned repo the upstream ref doesn't work, origin/master
# doesn't work either. git branch -a shows only master, not remotes/origin/master
# etc.
#
# @ refers to HEAD and @{u} to its upstream (origin/master).
if [ $(dotfiles rev-parse @) != $(dotfiles rev-parse @{u}) ]; then
  # We are not handligh pushing, since we have the auto-push hook installed anyway.
  # How about git stash?
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
