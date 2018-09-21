# # Here we don't want to use which, because if we're just reloading the session,
# # which will print out the alias itself rather than the path.
# nvim=$(whereis nvim | awk '{ print $2 }')

# nvim() {
#   # Set the name of NeoVim's socket.
#   local fn="$(mktemp -u "/tmp/nvimsocket-XXXXXXX")"
#   NVIM_LISTEN_ADDRESS=$fn $nvim $@
# }

# # nvr comes from https://github.com/mhinz/neovim-remote
# # pip3 install neovim-remote
# reload_nvim () {
#   for nvim_inst in /tmp/nvimsocket-*; do
#     nvr --servername "$nvim_inst" --remote-send '<Esc>:so $HOME/.config/nvim/init.vim<CR>' &
#   done
# }
