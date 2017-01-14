dotfiles remote update

if [ $(dotfiles rev-parse @) = $(dotfiles merge-base @ "$UPSTREAM") ]; then
  dotfiles pull -r && exec zsh || echo "Cannot update dotfiles."
fi
