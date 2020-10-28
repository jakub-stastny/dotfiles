# https://stackoverflow.com/questions/27613209/how-to-automatically-start-tmux-on-ssh-session
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
  # Without -d (detach other clients), the screen wouldn't resize to fit
  # the current terminal resolution.
  tmux attach-session -d -t $USER@$HOST || tmux new-session -s $USER@$HOST
fi
