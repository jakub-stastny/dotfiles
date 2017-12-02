path-add ~/Dropbox/Projects/Software/*/bin
# FIXME: Warning: /usr/bin occurs before /usr/local/bin.
path-add /usr/local/bin
path-add ~/Dropbox/Data/Scripts

export rubylib=(~/Dropbox/Projects/Software/*/lib)
export projects=(~/Dropbox/Projects/{Software,}/*)

chruby 2.4.2
