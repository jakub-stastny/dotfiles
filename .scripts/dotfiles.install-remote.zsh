#!/usr/bin/env zsh

# Validate command-line arguments.
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [remote i. e. root@104.236.127.89]"
  exit
fi

# Variables.
REMOTE=$1

# Functions.
command() { echo "\$ $*" && $* }
run_remote() { echo "$REMOTE \$ $*" && ssh $REMOTE $* }

# Main.
run_remote 'apt-get -y update && apt-get -y upgrade'
run_remote 'apt-get -y install git-core zsh'

command scp ~/.ssh/id_rsa $REMOTE:~/.ssh/

# So it doesn't fail on Git asking interactively:
run_remote 'ssh-keyscan github.com >> ~/.ssh/known_hosts'
run_remote 'git clone --bare git@github.com:botanicus/dotfiles.git'

# Note: At this moment the dotfiles alias is available locally, not remotely.
run_remote 'git --git-dir=$HOME/dotfiles.git --work-tree=$HOME checkout'

run_remote 'zsh ~/.scripts/dotfiles.install.zsh'
