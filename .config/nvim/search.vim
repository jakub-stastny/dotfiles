" Extended regexps for / & ? search.
Plug 'othree/eregex.vim'
cabbrev s S | cabbrev %s %S | cabbrev '<,'>s '<,'>S

" :Far {pattern} {replace-with} {file-mask} [params]
" TODO: Add more from https://github.com/brooth/far.vim
Plug 'brooth/far.vim'

" Usage:
"   Ack [options] {pattern} [{directories}]
"   AckFromSearch [{directory}] " Just like |:Ack| but the pattern is from previous search.
"   AckFile [options] {pattern} [{directory}]  " Search recursively in {directory} (which
"     defaults to the current directory) for filenames matching the {pattern}.
"   AckWindow[!] [options] {pattern}
"     Search all buffers visible in the screen (current tab page only) files for the {pattern}.

"
"   AckHelp[!] [options] {pattern}
"
" Keyboard shortcuts:
"   ?    a quick summary of these keys, repeat to close
"   o    to open (same as Enter)
"   O    to open and close the quickfix window
"   go   to preview file, open but maintain focus on ack.vim results
"   t    to open in new tab
"   T    to open in new tab without moving to it
"   h    to open in horizontal split
"   H    to open in horizontal split, keeping focus on the results
"   v    to open in vertical split
"   gv   to open in vertical split, keeping focus on the results
"   q    to close the quickfix window
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
cabbrev ag Ack
"cnoreabbrev Ack Ack! " If you don't want to jumpt to the first result
"automatically.
