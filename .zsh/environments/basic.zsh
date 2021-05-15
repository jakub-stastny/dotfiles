# Git.
alias gp='git push'
alias gst='git status'

alias GET="curl -X GET"
alias POST="curl -X POST"
alias HEAD="curl -X HEAD"

e() {
  verify-emacs-session && (test "$#" -eq 0) && emacsclient -s $(emacs-session-name) . || emacsclient -s $(emacs-session-name) $@
}

# Send file to the running Emacs session, preventing "Waiting for Emacs".
s() {
  verify-emacs-session && emacsclient -s $(emacs-session-name) -n $@
}

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
