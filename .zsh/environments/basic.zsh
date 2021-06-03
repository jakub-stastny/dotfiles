# Proxy all Git aliases to ZSH.
# This way "git cam" becames simply "cam".
for galias in $(git config --get-regexp alias | awk '{ print $1 }' | awk -F. '{ print $2 }'); do
  alias g$galias="git $galias"
done

# Proxy all bin commands as aliases.
if test -d bin; then
  for bin in bin/*(*); do
    alias $(basename $bin)=$bin
  done
fi

# Export variables from .env.
if test -f .env; then
  local definitions=$(egrep '^\w+=.*$' .env)
  for vardef in ${(s.\n.)definitions}; do
    export $vardef
  done
fi

v() { nvim $@ }

# NOTE: This has to go to project-specific configuration,
# leaving here for now as a reference.
# if (( ${+DOCKER_USERNAME} )) && (( ${+DOCKER_PASSWORD} )) && echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin &> /dev/null; then
#   echo "  $(tput setaf 2)✓$(tput sgr0) Logged into Docker Hub as $(tput setaf 7)$DOCKER_USERNAME$(tput sgr0)."
# else
#   echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into Docker Hub."
# fi

# if which gem &> /dev/null; then
#   if (( ${+RUBYGEMS_EMAIL} )) && (( ${+RUBYGEMS_PASSWORD} )); then
#     test -f ~/.gem/credentials || ~/.zsh/scripts/rubygems_login "$RUBYGEMS_EMAIL" "$RUBYGEMS_PASSWORD" &> /dev/null
#     echo "  $(tput setaf 2)✓$(tput sgr0) Logged into the RubyGems registry as $(tput setaf 7)$RUBYGEMS_EMAIL$(tput sgr0)."
#   else
#     echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into the RubyGems registry."
#   fi
# fi

# if which npm &> /dev/null; then
#   if (( ${+NPM_USERNAME} )) && (( ${+NPM_PASSWORD} )) && (( ${+NPM_EMAIL} )); then
#     test -f ~/.npmrc || ~/.zsh/scripts/npm_login "$NPM_USERNAME" "$NPM_PASSWORD" "$NPM_EMAIL" &> /dev/null
#     echo "  $(tput setaf 2)✓$(tput sgr0) Logged into the NPM registry as $(tput setaf 7)$NPM_USERNAME$(tput sgr0)."
#   else
#     echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into the NPM registry."
#   fi
# fi

# if (( ${+GDRIVE_CLIENT_ID} )) && (( ${+GDRIVE_CLIENT_SECRET} )) && ! test -f ~/.gdrive.json; then
#   echo "  $(tput setaf 2)✓$(tput sgr0) Google Drive credentials present."
# else
#   echo "  $(tput setaf 1)✘$(tput sgr0) Google Drive credentials missing."
# fi

# echo
