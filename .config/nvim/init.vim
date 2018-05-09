" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugins')

Plug 'SirVer/ultisnips', { 'for': ['sh', 'ruby'] }
let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/snippets']

Plug 'kassio/neoterm'

" Git & GitHub.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jaxbot/github-issues.vim'

" Extended regexps for / & ? search.
Plug 'othree/eregex.vim'

Plug 'tpope/vim-commentary'

Plug 'benmills/vimux'
command! RunTests call VimuxRunCommand("clear; bundle exec rspec " . expand("%"))
command! RunFocus call VimuxRunCommand("clear; bundle exec rspec " . expand("%") . ":" . line("."))
" https://8thlight.com/blog/chris-jordan/2016/06/13/running-tests-in-vim.html
" https://github.com/benmills/vimux
" https://github.com/pgr0ss/vimux-ruby-test
" https://github.com/bronson/vim-runtest
" https://github.com/janx/vim-rubytest
" https://github.com/janko-m/vim-test
" http://adamalbrecht.com/2016/02/01/run-your-ruby-tests-using-vim-and-tmux/
" https://github.com/tpope/vim-dispatch/tree/master/autoload
" https://github.com/skalnik/vim-vroom/blob/master/doc/vroom.txt

Plug 'brooth/far.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" gem install solargraph
" pip install solargraph-utils.py --user
Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
"Plug 'hackhowtofaq/vim-solargraph'
"  Plug 'dbakker/vim-projectroot'

Plug 'keith/rspec.vim' " defines rspec apart from ruby, so snippets then can use rspec.snippets instead of the ruby one.

" Probably can be deprecated due to polyglot.
"Plug 'vim-scripts/nginx.vim', { 'for': 'vhost' } " TODO: Disable for not .vhost files.

Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
"Plug 'vim-airline/vim-airline-themes'
"AirlineTheme simple

" Requires GH credentials in ~/.netrc file.
Plug 'keith/gist.vim'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'tpope/vim-bundler', { 'for': 'ruby' }
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

" Click tabs in terminal.
set mouse=a

" Indentation.
set expandtab " no tabs
set shiftwidth=2
