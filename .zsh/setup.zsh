# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

echo; capabilities; echo "ZSH aliases: ${(ok)aliases}"; #echo "ZSH functions: ${(ok)functions}"; echo
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Ignore files from .gitignore.
export FZF_DEFAULT_COMMAND="ag -g ''"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Emacs keybinding. C-a C-e C-k.
bindkey -e

# Without this, 256 colours won't work in tmux,
# at least not in Blink/VPS/tmux combo.
export TERM=xterm-256color

# https://nuclearsquid.com/writings/edit-long-commands/
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line
# Update 2.5.2010: @citizen428 brought the builtin fc (fix command) to my attention. fc allows you to edit commands in your history, and reruns them when you’re finished.

echo $DOCKER_PASSWORD | docker login --username botanicus --password-stdin

if ! test -f ~/.dropbox_uploader && (( ${+DROPBOX_ACCESS_TOKEN} )); then
  echo "OAUTH_ACCESS_TOKEN=$DROPBOX_ACCESS_TOKEN" | tee ~/.dropbox_uploader
  echo "~ Saving Dropbox access token from the environment to the ~/.dropbox_uploader config."
elif ! (( ${+DROPBOX_ACCESS_TOKEN} )); then
  echo '~ Dropbox access token is not saved and $DROPBOX_ACCESS_TOKEN is not in the environment.'
fi
