# https://github.com/postmodern/chruby
# sudo chruby-exec ruby-1.9.3-p448 -- rake test # This doesn't work due to /usr/local/bin not being in sudo PATH.
source /usr/local/share/chruby/chruby.sh
chruby ruby-2.4.0
