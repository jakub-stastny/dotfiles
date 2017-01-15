#!/bin/sh

# If we don't set this, the for loop won't be able to work with paths that contain a space.
# So in the loop we get path_no_space, path_to_Happy, Butterly.
IFS=$'\n'

has_untracked_files() {
  git status --porcelain | grep "^?? ";
}

rm -f ~/Desktop/Uncommitted\ changes.txt

for gitdir in $(find ~/Dropbox/Projects -name .git -not -path "*/On Hold/*"); do
  dir=$(dirname $gitdir)

  echo "~ Checking $dir."
  cd "$dir"

  git commit -a -m "Automated commit from $(date +%d/%m/%Y)." &> /dev/null
  git push 2> /dev/null

  git gc

  if has_untracked_files; then
    echo $dir | tee -a ~/Desktop/Uncommitted\ changes.txt
    echo "! $dir has untracked files."
  fi

  echo
done
