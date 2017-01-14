dotfiles remote update

# @ refers to HEAD and @{u} to its upstream (origin/master).
if [ $(dotfiles rev-parse @) = $(dotfiles rev-parse @{u}) ]; then
  # TODO: Maybe handle push as well in case we're ahead.
  # How about git stash?
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
