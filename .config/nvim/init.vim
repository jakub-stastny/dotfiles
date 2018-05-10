" Specify a directory for plugins.
" Avoid using standard Vim directory names like 'plugin'.
call plug#begin('~/.local/share/nvim/plugins')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

Plug 'sheerun/vim-polyglot'

source ~/.config/nvim/git.vim
source ~/.config/nvim/vimux.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/themes.vim
source ~/.config/nvim/settings.vim

" Initialize plugin system
call plug#end()
