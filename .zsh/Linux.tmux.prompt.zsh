if test $UID -eq 0; then
  user_colour=red
else
  user_colour=green
fi

PROMPT="%F{cyan}%1~%f $(ruby -v | awk '{ print $2 }' | sed 's/p.*//') %F{$user_colour}%#%F{reset} "
RPROMPT='[%F{yellow}%?%f]'

# source ~/.zsh/Darwin.prompt.zsh
