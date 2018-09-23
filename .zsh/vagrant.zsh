if test -d ~/.gems/bin; then
  export PATH=~/.gems/bin:$PATH
  export GEM_HOME=~/.gems
  export GEM_PATH=~/.gems
fi

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
  tmux attach-session -t sys || tmux new-session -s sys
fi
