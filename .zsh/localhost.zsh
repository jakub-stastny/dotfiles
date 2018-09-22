# path-add ~/.linuxbrew/bin
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
# export PATH="$HOME/.linuxbrew/opt/ruby@2.3/bin:$PATH"
export PATH="$HOME/.linuxbrew/lib/ruby/gems/2.3.0/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/botanicus/google-cloud-sdk/path.zsh.inc' ]; then source '/home/botanicus/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/botanicus/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/botanicus/google-cloud-sdk/completion.zsh.inc'; fi
