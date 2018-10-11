if test $UID -eq 0; then
  user_colour=red
else
  user_colour=green
fi

PROMPT="%F{cyan}%1~%f %F{$user_colour}%#%F{reset} "
RPROMPT='[%F{yellow}%?%f]'

# source ~/.zsh/Darwin.prompt.zsh
