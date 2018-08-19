" https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'vim-airline/vim-airline' " | Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=10

" Other good ones: evening koehler slate
colorscheme desert

" CI build status can be integrated, but changing the colours seems
" a bit tricky, plus the Tmu status bar seems to be a better place
" for it.
"
" Example: https://gist.github.com/aesnyder/7d692b85a51719896237

" Highlight colour.
highlight Search guibg='Purple' guifg='NONE'
