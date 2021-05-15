export EDITOR="nvim"

# zmv -n '(*)unplug.it*' '$1botanicus.me$2'
autoload -U zmv

# NOTE: alias also gives an interesting list.
# echo; capabilities | sed 's/^/  /'
echo "  $(tput setaf 2)ZSH aliases: $(tput sgr0)${(ok)aliases}\e[0m"
echo "  $(tput setaf 2)ZSH functions: $(tput sgr0)$(get-new-functions)"; echo
  # "\e[#{color_code}m#{text}\e[0m"
# Let's disable Up/down as it's broken and more importantly C-r is more at hand and can be navigated more easily.
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

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
