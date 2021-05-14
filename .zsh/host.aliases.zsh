dpm-init() {
  test -d ~/projects || mkdir ~/projects
  docker run -it --rm -v ~/projects:/projects jakubstastny/docker-project-manager init $1 ~/projects
}

p() {
  cd ~/projects/$(test "$#" -eq 0 && show-projects || $1)
}

a() {
  p $* && ./runner start && ./runner attach
}

stop() {
  cd ~/projects/$(test "$#" -eq 0 && show-projects || $1) && ./runner stop && cd -
}

# This hides plain files such as README.org.
show-projects() {
  for project_path in ~/projects/*(/); do echo $(basename $project_path); done | fzf
}
