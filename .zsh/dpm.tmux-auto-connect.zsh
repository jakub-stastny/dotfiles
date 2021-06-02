# Start or connect to a running main Tmux session.
#
# 1. Main Tmux session must have the same name as the host.
#    For instance in an image named "flashcards", the main
#    Tmux session will also be named "flashcards".
#
# 2. A new main session will only be try-to-started if we are in the
#    project directory, which also must match the hostname
#    (in this case "flashcards").

try-to-start-new-main-session() {
  test $(basename $PWD) = "$HOST" && tmux new-session -s $HOST
}

# Without -d (detach other clients), the screen wouldn't resize
# to fit the current terminal resolution.
tmux attach-session -d -t $HOST || try-to-start-new-main-session
