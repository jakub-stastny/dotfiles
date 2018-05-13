" Broken paste: use :set paste, paste and then :set nopaste.
" On OS X: :r !pbpaste -> make it a macro (paste).
" Actually the following fixes it. The only thing is it doesn't handle the initial
" indentation level, but at least it doesn't break anything else.
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode


let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
