#!/bin/sh

echo "~ Running post-checkout hook $*.\n"
echo $1
echo $2
echo $3
echo "~ Changed files: $(git diff-tree -r --name-only --no-commit-id $1 $2)\n"

if git diff-tree -r --name-only --no-commit-id HEAD@{1} | grep vim; then
  echo "~ Updating Vim plugins."
  vim +PluginInstall +qall
fi
