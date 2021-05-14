" Extended regexps for / & ? search.
Plug 'othree/eregex.vim'
cabbrev s S | cabbrev %s %S | cabbrev '<,'>s '<,'>S

Plug 'brooth/far.vim'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
cabbrev ag Ack

" If you don't want to jumpt to the first result automatically.
"cnoreabbrev Ack Ack!
