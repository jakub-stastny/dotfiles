# if which ruby &> /dev/null; then
#   export PATH=~/.gems/bin:$PATH
#   export GEM_HOME=~/.gems
#   export GEM_PATH=~/.gems
# fi

if test -f /etc/projectname; then
  cd ~/$(cat /etc/projectname)
  git install-hooks &> /dev/null # Override if there's something new.
fi

# This was in Linux.zsh and was working with mosh I think.
# Start the sys session if there's none, so Mosh has somewhere to attach to.
# (Using tmux attach -t sys || tmux new -s sys) as the after-login command didn't work.)
# tmux has-session -t sys || tmux new -d -s sys

# https://stackoverflow.com/questions/27613209/how-to-automatically-start-tmux-on-ssh-session
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
  # Without -d (detach other clients), the screen wouldn't
  # resize to fit the current terminal resolution.
  if test -d $(hostname); then
    tmux attach-session -d -t $(hostname) || (cd $(hostname); tmux new-session -s $(hostname))
  else
    tmux attach-session -d -t sys || tmux new-session -s sys
  fi
fi
