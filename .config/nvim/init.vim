" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugins')

Plug 'tpope/vim-commentary' | Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'jceb/vim-orgmode'

set path=.,**
" nnoremap <silent> <C-p> :FZF<CR>

" " Switching buffers using Ctrl+s.
" function! s:buflist()
"   redir => ls
"   silent ls
"   redir END
"   return split(ls, '\n')
" endfunction

" function! s:bufopen(e)
"   execute 'buffer' matchstr(a:e, '^[ 0-9]*')
" endfunction

" nnoremap <silent> <C-s> :call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>

" Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
" Plug 'mtth/scratch.vim'

" source ~/.config/nvim/settings/git.vim
" source ~/.config/nvim/settings/search.vim
" source ~/.config/nvim/settings/themes.vim

" Initialize plugin system
call plug#end()

source ~/.config/nvim/settings/settings.vim

" " This has to come after the plugins are initialised,
" " otherwise filetypes such as ruby.rake won't be set.
" source ~/.config/nvim/settings/ftypes.vim
