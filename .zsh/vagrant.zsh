export PATH=~/.gems/bin:$PATH
cd ~/$(cat /etc/projectname)
git install-hooks &> /dev/null # Override if there's something new.

tmux a -t sys
