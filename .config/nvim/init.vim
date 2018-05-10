" https://github.com/junegunn/vim-plug
" Plug 'plug_1' | Plug 'dependency'
call plug#begin('~/.local/share/nvim/plugins')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'danro/rename.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim', { 'for': ['html', 'xml'] }

source ~/.config/nvim/git.vim
source ~/.config/nvim/vimux.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/themes.vim
source ~/.config/nvim/settings.vim

" My custom plugins.
Plug '~/Dropbox/Projects/Software/pomodoro/support/vim'

" Initialize plugin system
call plug#end()
