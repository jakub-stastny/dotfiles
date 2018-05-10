" Find the alternate file for the current path and open it
nnoremap <leader>. :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" Line numbers.
set number

" Click tabs in terminal.
set mouse=a

" Indentation.
set expandtab " no tabs
set shiftwidth=2

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
