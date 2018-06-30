nvim() {
  # Set the name of NeoVim's socket.
  local fn="$(mktemp -u "/tmp/nvimsocket-XXXXXXX")"
  NVIM_LISTEN_ADDRESS=$fn /usr/local/bin/nvim $@
}

# nvr comes from https://github.com/mhinz/neovim-remote
# pip3 install neovim-remote
reload_nvim () {
  for nvim_inst in /tmp/nvimsocket-*; do
    nvr --servername "$nvim_inst" --remote-send '<Esc>:so $HOME/.config/nvim/init.vim<CR>' &
  done
}
