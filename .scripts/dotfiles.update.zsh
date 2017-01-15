#!/bin/sh

echo post-checkout hook
git diff-tree -r --name-only --no-commit-id HEAD@{1}
if git diff-tree -r --name-only --no-commit-id HEAD@{1} | grep vim; then
  vim +PluginInstall +qall
fi
