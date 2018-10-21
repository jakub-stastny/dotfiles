# nvr comes from https://github.com/mhinz/neovim-remote
# pip3 install neovim-remote

# Here we don't want to use which, because if we're just reloading the session,
# which will print out the alias itself rather than the path.
nvim=$(whereis nvim | awk '{ print $2 }')
# FIXME: This doesn't seem to work reliably, sometimes
# which finds it, but whereis not (it's a symlink).
# But which shows the aliases, so that's not the way either.

# Don't override nvim by a function if nvim hasn't been found.
if test -n "$nvim"; then
  nvim() {
    # Set the name of NeoVim's socket.
    local fn="$(mktemp -u "/tmp/nvimsocket-XXXXXXX")"
    NVIM_LISTEN_ADDRESS=$fn $nvim $@
  }

  reload_nvim () {
    for nvim_inst in /tmp/nvimsocket-*; do
      nvr --servername "$nvim_inst" --remote-send '<C-c>:so $HOME/.config/nvim/init.vim<CR>'
    done
  }
fi
