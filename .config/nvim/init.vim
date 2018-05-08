" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugins')

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/snippets']

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'benmills/vimux'
command! RunTests call VimuxRunCommand("clear; bundle exec rspec " . expand("%"))
command! RunFocus call VimuxRunCommand("clear; bundle exec rspec " . expand("%") . ":" . line("."))

Plug 'brooth/far.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/nginx.vim' " TODO: Disable for not .vhost files.
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'tpope/vim-bundler'
Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()

" True colours.
set termguicolors

" https://github.com/uptech/alt
"
" Run a given vim command on the results of alt from a given path.
" See usage below.
function! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" Line numbers.
set number
