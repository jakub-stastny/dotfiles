path-add ~/Dropbox/Projects/Software/*/bin
# FIXME: Warning: /usr/bin occurs before /usr/local/bin.
path-add /usr/local/bin

export rubylib=(~/Dropbox/Projects/Software/*/lib)
export projects=(~/Dropbox/Projects/{Software,Webs,Writing}/*)

chruby 2.4.1
