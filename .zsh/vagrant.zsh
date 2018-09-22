export PATH=~/.gems/bin:$PATH
cd ~/$(cat /etc/projectname)
git install-hooks &> /dev/null # Override if there's something new.

export GEM_HOME=~/.gems
export GEM_PATH=~/.gems

tmux a -t sys
