in-first-tab() {
  test $(tmux display-message -p '#I') = "1"
}
