" Vundle configuration.
" https://github.com/VundleVim/Vundle.vim
"
" List of plugins sorted by popularity: http://vimawesome.com
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
source ~/.vim/ultisnips.vim

" NERDTree
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line.
call vundle#end()
filetype plugin indent on
