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

# local ret_status="%(?:%F{green}%}➜ :%{%F{red}%}➜ %s)"
local ret_status_colour="%(?:%F{green}%}:%{%F{red}%})"
PROMPT='%F{green}%1~%F{white}$(git_info)%f ${ret_status_colour}%#%F{white} '

# If this get re-enabled, use with timeout:
# http://fahdshariff.blogspot.com.es/2013/08/executing-shell-command-with-timeout.html
# Great for forgotten pry statements.
RPROMPT='Task: `now active "%F{green}%rd%F{white} %b" 2> /dev/null`'
RPROMPT='$(date +%H:%M:%S)'

# ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
