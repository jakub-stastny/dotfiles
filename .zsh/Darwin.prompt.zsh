setopt prompt_subst # Eval prompt every single time.
# Note that this evals the $PROMPT, not this file, so ifs here are futile.

if test $UID -eq 0; then
  user_colour=red
else
  user_colour=green
fi

git_info() {
  if git rev-parse --abbrev-ref HEAD &> /dev/null; then
    BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    test "$(git status --porcelain)" != "" && EXTRA='*'
    print "(%F{red}$BRANCH%F{yellow}$EXTRA%F{white})"
  fi
}

PROMPT='%F{green}%1~%F{white}$(git_info)%f %# '
# RPROMPT='`log-time --prompt`[%F{yellow}%?%f]'
RPROMPT='`now active "%F{green}%rd%F{white} %b" 2> /dev/null`'


# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
# PROMPT='${ZSH_THEME_ENV}${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
# RPROMPT='$(date +%H:%M:%S)'
#
# if test -f /etc/vagrant_box_build_time; then
#   ZSH_THEME_ENV="%{$fg_bold[yellow]%}vagrant "
# fi
#
# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
# # Time Vagrant or not
