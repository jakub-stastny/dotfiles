docker-login() {
  if (( ${+DOCKER_USERNAME} )) && (( ${+DOCKER_PASSWORD} )); then
    if test -f ~/.docker/config.json; then
      echo "  $(tput setaf 2)✓$(tput sgr0) Already logged into Docker Hub as $(tput setaf 7)$DOCKER_USERNAME$(tput sgr0)."
    else
      docker-force-login
      echo "  $(tput setaf 2)✓$(tput sgr0) Logged into Docker Hub as $(tput setaf 7)$DOCKER_USERNAME$(tput sgr0)."
    fi
  else
    echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into Docker Hub, export $(tput setaf 7)\$DOCKER_USERNAME$(tput sgr0) and $(tput setaf 7)\$DOCKER_PASSWORD$(tput sgr0)"
  fi
}

docker-force-login() {
  echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin &> /dev/null
}
