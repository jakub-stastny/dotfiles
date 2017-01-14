" https://github.com/SirVer/ultisnips

" :UltiSnipsEdit, then jump between the split windows by Ctrl-w w.

Plugin 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>" " "<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" " "<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
