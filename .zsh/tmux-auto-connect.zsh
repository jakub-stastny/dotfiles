# This is meant for running in DPM instances, not for the main VPS.
# We do not want to have tmux-in-tmux, with 2 status lines and having to do C-b twice.
#
# https://stackoverflow.com/questions/27613209/how-to-automatically-start-tmux-on-ssh-session
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ] && test -f /.dockerenv; then
  # Without -d (detach other clients), the screen wouldn't resize to fit
  # the current terminal resolution.
  tmux attach-session -d -t $USER@$HOST || tmux new-session -s $USER@$HOST
fi
