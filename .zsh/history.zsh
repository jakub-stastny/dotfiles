HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.history

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it.
#setopt share_history
#
setopt HIST_IGNORE_ALL_DUPS  # Remove old duplicates.

HISTORY_BLACK_LIST=(
  "launchctl unload ~/Library/LaunchAgents/botanicus.wifi.plist"
  "launchctl unload ~/Library/LaunchAgents/botanicus.reenabler.plist"
  "sudo vim /etc/hosts"
)

zshaddhistory() {
  cmd=$(echo $1 | tr -d '\n')
  index=${HISTORY_BLACK_LIST[(i)$cmd]}
  if (( ${+HISTORY_BLACK_LIST[$index]} )); then
    echo "~ Not adding to history."
    return 1;
  fi
}

# TODO: Dups are still being saved. https://github.com/mattjj/my-oh-my-zsh/blob/master/history.zsh
