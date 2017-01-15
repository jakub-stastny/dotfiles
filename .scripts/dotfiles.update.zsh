#!/bin/sh

echo "~ Running post-checkout hook.\n\n"
echo "~ Changed files: $(git diff-tree -r --name-only --no-commit-id HEAD@{1})"

if git diff-tree -r --name-only --no-commit-id HEAD@{1} | grep vim; then
  echo "~ Updating Vim plugins."
  vim +PluginInstall +qall
fi
