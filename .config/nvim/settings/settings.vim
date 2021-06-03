" Use jj instead of Esc.
inoremap jj <Esc>

" Line numbers.
set number
" 
" " Indentation.
" set smartindent
" set expandtab " no tabs
" set shiftwidth=2
" 
" set tabpagemax=100 " Limit for vim -p *
" 
" " True colours.
" " This works in SSH, but in mosh it breaks the colours.
" " A solution is here https://github.com/vim/vim/issues/993
" " set termguicolors
" 
" " Typo protection.
" cabbrev Q q | cabbrev W w | cabbrev Wq wq | cabbrev Bd bd
" 
" " Remove trailing whitespace on save.
" autocmd BufWritePre * %s/\s\+$//e
" 
" " Start terminal in insert mode.
" autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
" autocmd TermOpen * setlocal statusline=%{b:term_title}
" 
" " Disable the arrow keys.
" map <Up> <nop>
" map <Down> <nop>
" map <Left> <nop>
" map <Right> <nop>
" 
" " This should be in themes.vim, but it breaks when I put it there.
" " http://vim.wikia.com/wiki/Highlight_current_line
" set cursorline
" highlight CursorLine cterm=NONE ctermbg=238
