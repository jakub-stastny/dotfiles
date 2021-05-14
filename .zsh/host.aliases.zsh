dpm-init() {
  test -d ~/projects || mkdir ~/projects
  docker run -it --rm -v ~/projects:/projects jakubstastny/docker-project-manager init $1 ~/projects
}

p() {
  cd ~/projects/$(test "$#" -eq 0 && ls ~/projects | fzf || $1)
}

a() {
  p $* && ./runner start && ./runner attach
}

stop() {
  cd ~/projects/$(test "$#" -eq 0 && ls ~/projects | fzf || $1) && ./runner stop && cd -
}
