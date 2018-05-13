" Level 1: ctags.
" :CtrlPTag
"
" Ctags are enabled by default in Vim.
" ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list
" ctags -R --output-format=json --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) -f .tags --paths)
" gem ctags
" :ta method
" :ta /regexp/

" If you position cursor over the method and hit CTRL+] it will take you into the method.
" CTRL-T will take you back from that method.
" CTRL-I and CTRL-O will take you In and Out from the method.

" :ts [expr]  # Lists tags matching expression
" :[count]tn  # Jumps to the next matching tag
" :[count]tp  # Jumps to the previous matching tag
" :[count]tf  # Jumps to the first matching tag
" :[count]tl  # Jumps to the last matching tag
"
" Can be hooked with CtrlP.
" https://blog.sensible.io/2014/05/09/supercharge-your-vim-into-ide-with-ctags.html
"
" :help tags
" http://vim.wikia.com/wiki/Browsing_programs_with_tags
" https://chodounsky.net/2016/12/09/using-tags-to-browse-ruby-and-gem-source-with-vim/

" Level 2: snippets
Plug 'SirVer/ultisnips', { 'for': ['sh', 'ruby'] }
let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/snippets']

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" https://github.com/SirVer/ultisnips/issues/517
" https://github.com/osyo-manga/vim-monster/tree/master/autoload/monster/completion
" https://github.com/castwide/solargraph

"" gem install solargraph
"" pip install solargraph-utils.py --user
""Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
""Plug 'hackhowtofaq/vim-solargraph' | Plug 'dbakker/vim-projectroot'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1

"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-n>" " Make the tabing on completion menu go from top to bottom
"let g:SuperTabClosePreviewOnPopupClose = 1 " Close the preview when completion ends

"" https://github.com/simonweil/dotfiles/blob/master/nvimrc#L29-L85
"let g:SuperTabDefaultCompletionType = "<c-n>" " Make the tabing on completion menu go from top to bottom
"let g:SuperTabClosePreviewOnPopupClose = 1 " Close the preview when completion ends

"" Don't map any tabs, I'll do it later
"let g:UltiSnipsExpandTrigger = '<NOP>'
"let g:UltiSnipsJumpForwardTrigger = '<NOP>'
"let g:UltiSnipsJumpBackwardTrigger = '<NOP>'
"let g:SuperTabMappingForward = '<NOP>'
"let g:SuperTabMappingBackward = '<NOP>'
"" Don't unmap my mappings
"let g:UltiSnipsMappingsToIgnore = [ "SmartTab", "SmartShiftTab" ]

"" Make <CR> smart
"let g:ulti_expand_res = 0
"function! Ulti_ExpandOrEnter()
"  " First try to expand a snippet
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res
"    " if successful, just return
"    return ''
"  elseif pumvisible()
"    " if in completion menu - just close it and leave the cursor at the
"    " end of the completion
"    return deoplete#mappings#close_popup()
"  else
"    " otherwise, just do an "enter"
"    return "\<return>"
"  endif
"endfunction
"inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

"" Enable tabbing and shift-tabbing through list of results
"function! g:SmartTab()
"  if pumvisible()
"    return SuperTab("n")
"  else
"    call UltiSnips#JumpForwards()
"    if g:ulti_jump_forwards_res == 0
"      return SuperTab("n")
"    endif
"    return ''
"  endif
"endfunction
"inoremap <silent> <tab> <C-R>=g:SmartTab()<cr>
"snoremap <silent> <tab> <Esc>:call g:SmartTab()<cr>

"function! g:SmartShiftTab()
"  if pumvisible()
"    return SuperTab("p")
"  else
"    call UltiSnips#JumpBackwards()
"    if g:ulti_jump_backwards_res == 0
"      return SuperTab("p")
"    endif
"    return ''
"  endif
"endfunction
"inoremap <silent> <s-tab> <C-R>=g:SmartShiftTab()<cr>
"snoremap <silent> <s-tab> <Esc>:call g:SmartShiftTab()<cr>

