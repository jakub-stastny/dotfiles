" Vim-only configuration, NeoVim doesn't read this file.

" syntax on

" " Indentation defaults.
" set shiftwidth=2 " When you press >> in normal mode and also for smart indent.
" set softtabstop=2
" set expandtab " It's still necessary, like when pressing Enter after <!-- in XML.

" " Enable language-specific indentation.
" if has("autocmd")
"   filetype plugin indent on
" endif

" " Fix backspace in insert mode.
" set backspace=2

" " Line numbers.
" set number

" " Highlight search
" set hlsearch

" " No temporary files.
" " http://stackoverflow.com/questions/743150/how-to-prevent-vim-from-creating-and-leaving-temporary-files
" set nobackup       " no backup files
" set nowritebackup  " only in case you don't want a backup file while editing
" set noswapfile     " no swap files

" " higlight tabs
" syntax match Tab /\t/
" highlight Tab guibg=red ctermbg=red

" " https://github.com/postmodern/chruby/wiki/Vim
