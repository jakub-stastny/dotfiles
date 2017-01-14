dotfiles remote update

# @ refers to HEAD and @{u} to its upstream (origin/master).
# if [ $(dotfiles rev-parse @) = $(dotfiles rev-parse @{u}) ]; then
#
# There's a bug, on the cloned repo the upstream ref doesn't work, origin/master
# doesn't work either. git branch -a shows only master, not remotes/origin/master
# etc.
#
# This is a work-around:
if [ $(dotfiles rev-parse @) != $(dotfiles rev-parse refs/heads/master) ]; then
  # TODO: Maybe handle push as well in case we're ahead.
  # How about git stash?
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
