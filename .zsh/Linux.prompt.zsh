if test $UID -eq 0; then
  user_colour=red
else
  user_colour=green
fi

PROMPT="%F{cyan}☁  %F{$user_colour}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# "
RPROMPT='[%F{yellow}%?%f]'

# source ~/.zsh/Darwin.prompt.zsh
