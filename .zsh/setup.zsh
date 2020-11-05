# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

echo; capabilities | sed 's/^/  /'; echo "  $(tput setaf 2)ZSH aliases: $(tput sgr0)${(ok)aliases}\e[0m"; echo; #echo "ZSH functions: ${(ok)functions}"; echo
  # "\e[#{color_code}m#{text}\e[0m"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ignore files from .gitignore.
# FZF get installed by its Vim plugin.
export FZF_DEFAULT_COMMAND="ag -g ''"

test -f ~/.fzf.zsh && source ~/.fzf.zsh

# Emacs keybinding. C-a C-e C-k.
bindkey -e

# Without this, 256 colours won't work in tmux,
# at least not in Blink/VPS/tmux combo.
export TERM=xterm-256color

# https://nuclearsquid.com/writings/edit-long-commands/
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

if (( ${+DOCKER_USERNAME} )) && (( ${+DOCKER_PASSWORD} )) && echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin; then
  echo "  $(tput setaf 2)✓$(tput sgr0) Logged into Docker Hub as $(tput setaf 7)$DOCKER_USERNAME$(tput sgr0)"
else
  echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into Docker Hub"
fi

if (( ${+GDRIVE_CLIENT_ID} )) && (( ${+GDRIVE_CLIENT_SECRET} )) && ! test -f ~/.gdrive.json; then
  echo "  $(tput setaf 2)✓$(tput sgr0) Google Drive credentials present"
else
  echo "  $(tput setaf 1)✘$(tput sgr0) Google Drive credentials missing"
fi

if which gem &> /dev/null; then
  if (( ${+RUBYGEMS_USERNAME} )) && (( ${+RUBYGEMS_PASSWORD} )); then
    test -f ~/.gem/credentials || ~/.zsh/scripts/rubygems_login "$RUBYGEMS_USERNAME" "$RUBYGEMS_PASSWORD" &> /dev/null
    echo "  $(tput setaf 2)✓$(tput sgr0) Logged into the RubyGems registry as $(tput setaf 7)$RUBYGEMS_USERNAME$(tput sgr0)"
  else
    echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into the RubyGems registry"
  fi
fi

if which npm &> /dev/null; then
  if (( ${+NPM_USERNAME} )) && (( ${+NPM_PASSWORD} )) && (( ${+NPM_EMAIL} )); then
    ~/.zsh/scripts/npm_login "$NPM_USERNAME" "$NPM_PASSWORD" "$NPM_EMAIL"
    echo "  $(tput setaf 2)✓$(tput sgr0) Logged into the NPM registry as $(tput setaf 7)$NPM_USERNAME$(tput sgr0)"
  else
    echo "  $(tput setaf 1)✘$(tput sgr0) Not logged into the NPM registry"
  fi
fi
