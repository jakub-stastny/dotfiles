dotfiles remote update

if [ $(git rev-parse @) = $(git merge-base @ "$UPSTREAM") ]; then
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
