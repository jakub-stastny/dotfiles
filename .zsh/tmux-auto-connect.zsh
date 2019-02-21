# https://stackoverflow.com/questions/27613209/how-to-automatically-start-tmux-on-ssh-session
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
  # Without -d (detach other clients), the screen wouldn't
  # resize to fit the current terminal resolution.
  if test -d $(hostname); then
    tmux attach-session -d -t $(hostname) || (cd $(hostname); tmux new-session -s $(hostname))
  else
    tmux attach-session -d -t sys || tmux new-session -s sys
  fi
fi
