print-docker-containers-usage() {
  echo "$(tput setaf 5)$1: $(tput sgr0)CPU $(tput setaf 7)$2 $(tput sgr0)RAM $(tput setaf 7)$3 $(tput sgr0)($(tput setaf 7)$4$(tput sgr0)) PIDS $(tput setaf 7)$5$(tput sgr0)"
}

echo
print-docker-containers-usage $(docker stats --no-stream | tail -n+2 | awk '{ print $2, $3, $4, $7, $14 }')
echo

test -d ~/projects && cd ~/projects
