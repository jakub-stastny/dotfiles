" Reload files when focus is regained.
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim
set autoread
autocmd FocusGained * :checktime

" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" Line numbers.
set number

" Click tabs in terminal.
set mouse=a

" Indentation.
set smartindent
set expandtab " no tabs
set shiftwidth=2

set tabpagemax=100 " Limit for vim -p *

" Yank will pbcopy.
"
" Alternatively we can disable this and only copy what we need into the system
" clipboard. Vim offers the + and * registers to reference the OS clipboard.
" For instance:
" gg"+yG " Copy the whole file into +.
" "*dd – cut the current line into *.
" "+p – paste from + after the cursor (works in both normal and visual modes)
" :%y * – copy the entire buffer into * (this one is an ex command)
"
" On OS X * and + are most likely the same.
" http://vim.wikia.com/wiki/Pasting_registers
set clipboard=unnamedplus

command! Reload source $MYVIMRC

" True colours.
" This works in SSH, but in mosh it breaks the colours.
" A solution is here https://github.com/vim/vim/issues/993
" set termguicolors

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

" Typo protection.
cabbrev Q q | cabbrev W w | cabbrev Wq wq | cabbrev Bd bd

augroup filetypedetect
  autocmd BufRead,BufNewFile Rakefile,*.rake set filetype=ruby.rake
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby.gemfile
  autocmd BufRead,BufNewFile config.ru set filetype=ruby.rackup
  autocmd BufRead,BufNewFile *.gemspec set filetype=ruby.gemspec
  autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec

  autocmd BufRead,BufNewFile *_spec.cr set filetype=crystal.spec

  autocmd BufRead,BufNewFile README.md set filetype=README.markdown
  autocmd BufRead,BufNewFile .travis.yml set filetype=travis.yaml
  autocmd BufRead,BufNewFile .projections.json set filetype=projections.json

  " Dockerfile.dev
  autocmd BufRead,BufNewFile Dockerfile.* set filetype=dockerfile
augroup END

" File templates.
augroup ultisnips_custom
  autocmd!
  autocmd User ProjectionistActivate call snippet#InsertSkeleton()
  autocmd BufNewFile * call snippet#InsertSkeleton()
augroup END

set omnifunc=syntaxcomplete#Complete

" Remove trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Start terminal in insert mode.
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd TermOpen * setlocal statusline=%{b:term_title}

" Copy buffer path.
command! CopyBufferPath let @+ = expand('%:p')

" Use C-c / C-[ instead of Esc.
inoremap jj <Esc>:w<CR>
" Disable Esc and §.
" NOTE: Always use inoremap etc rather than imap, nmap, vmap, because noremap
" is non-recursive.
" noremap <Esc> <nop> | noremap! <Esc> <nop>
noremap § <nop> | noremap! § <nop>

" Disable the arrow keys.
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

" Buffer switching.
map <C-j> :bp<CR>
map <C-k> :bn<CR>

" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline
hi CursorLine cterm=NONE ctermbg=238

" Change the search highlight colour.
highlight Search guibg='Purple' guifg='NONE'
