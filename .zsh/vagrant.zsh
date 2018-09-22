export PATH=~/.gem/ruby/2.5.0/bin:$PATH
cd ~/$(cat /etc/projectname)
git install-hooks &> /dev/null # Override if there's something new.
