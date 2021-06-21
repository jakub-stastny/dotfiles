mksession() {
  (cd $1 && tmux new -s $(basename $PWD | tr . -))
}

yt='youtube-dl -f '\''bestaudio[ext=m4a]'\'
