#path-prepend ~/Dropbox/Projects/Software/*/*/bin
path-prepend /usr/local/bin
path-prepend ~/Dropbox/Data/Scripts

# export rubylib=(~/Dropbox/Projects/Software/ruby/*/lib)
# export projects=(~/Dropbox/Projects/{Software,}/*/*)

# Homebrew doesn't link Ruby these days, it's keg-only.
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
