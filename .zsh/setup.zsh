if ! test -f ~/.dropbox_uploader; then
  if (( ${+DROPBOX_ACCESS_TOKEN} )); then
    echo "OAUTH_ACCESS_TOKEN=$DROPBOX_ACCESS_TOKEN" | tee ~/.dropbox_uploader
    echo "~ Saving Dropbox access token from the environment to the ~/.dropbox_uploader config."
  else
    echo '~ Dropbox access token is not saved and $DROPBOX_ACCESS_TOKEN is not in the environment.'
  fi
fi
