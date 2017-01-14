syntax on

" Indentation defaults.
set shiftwidth=2 " When you press >> in normal mode and also for smart indent.
set softtabstop=2

" Enable language-specific indentation.
if has("autocmd")
  filetype plugin indent on
endif

" Fix backspace in insert mode.
set backspace=2

" https://github.com/postmodern/chruby/wiki/Vim
