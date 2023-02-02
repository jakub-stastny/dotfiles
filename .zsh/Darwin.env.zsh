export cdpath=(. ~/Documents/Projects)

path-prepend /opt/homebrew/bin
path-prepend /opt/homebrew/Cellar/ruby/3.2.0/bin
path-prepend /opt/homebrew/opt/node@18/bin
path-prepend ~/Library/Python/3.9/bin
path-add /Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin

test $PWD = $HOME && cd ~/Documents

alias zshrc="e ~/.zsh/Darwin.env.zsh; source ~/.zsh/Darwin.env.zsh"
alias emacs="emacs -nw"

# Required by https://github.com/practicalli/clojure-deps-edn
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME=~/.config

export DROPBOX_DIR=~/Library/CloudStorage/Dropbox
export GDRIVE_DIR=~/Library/CloudStorage/GoogleDrive-jakub.stastny.pt@gmail.com/My\ Drive

# For compilers to find node@18 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
# export (PPFLAGS="-I/opt/homebrew/opt/node@18/include"

# From the old mac:
##path-prepend ~/Dropbox/Projects/Software/*/*/bin
#path-prepend /usr/local/bin
#path-prepend ~/Dropbox/Data/Scripts

## export rubylib=(~/Dropbox/Projects/Software/ruby/*/lib)
## export projects=(~/Dropbox/Projects/{Software,}/*/*)

## Homebrew doesn't link Ruby these days, it's keg-only.
#export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
