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
" TODO: 13/05/2018 Choose whether to use vim-emmet, emmet.snippets or just
" ultisnips by its own.
" C-tab should list all the snippets, unfortunately it's already mapped by iTerm2.
" C-j: next tab stop.
" When tab stop 0 is reached, Ultisnips consider the snippet finished.
" Visual: in visual mode, press tab. The next snippet will have $VISUAL
" defined.
Plug 'SirVer/ultisnips'
"Plug 'jceb/emmet.snippets'
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/snippets']
"let g:UltiSnipsSnippetDirectories=[$HOME.'/.local/share/nvim/snippets', $HOME.'/.local/share/nvim/plugins/emmet.snippets/UltiSnips']

" Override keyboard shortcut for listing snippets, since C-tab is already used
" by iTerm2.
let g:UltiSnipsListSnippets = "<c-l>"

" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" div>p#foo$*3>a C-y ,: Expand.
" (visual selection) C-y , ul>li*: Wrap lines.
" C-y d/D: Balance tag inward/outward.
" C-y n/N: Go to the next/previous edit point.
" (select multiple lines) C-y m: Merge lines.
" C-y k: Remove a tag.
" C-y /: Comment out a tag.
" C-y a: Make an anchor from a URL.
"Plug 'mattn/emmet-vim', {'for': ['xml', 'html', 'css']}
" let g:user_emmet_leader_key='<tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Expand with a tab. Disabled for now.
" augroup EmmetSettings
"   autocmd! FileType html,xml,css imap <tab> <plug>(emmet-expand-abbr)
" augroup END

" https://github.com/SirVer/ultisnips/issues/517
" https://github.com/osyo-manga/vim-monster/tree/master/autoload/monster/completion
" https://github.com/castwide/solargraph

"" gem install solargraph
"" pip install solargraph-utils.py --user
""Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }
""Plug 'hackhowtofaq/vim-solargraph' | Plug 'dbakker/vim-projectroot'

"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
"" Automatically start language servers.
"let g:LanguageClient_autoStart = 1
"let g:LanguageClient_devel = 1 " Use debug build
"let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level

"" https://fortes.com/2017/language-server-neovim/
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1

"" Find language servers here https://langserver.org/

"" Minimal LSP configuration for JavaScript
"let g:LanguageClient_serverCommands = {}
"if executable('javascript-typescript-stdio')
"  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
"  let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
"  " Use LanguageServer for omnifunc completion
"  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
"  " autocmd FileType javascript.jsx setlocal omnifunc=LanguageClient#complete
"else
"  echo "javascript-typescript-stdio not installed!\n"
"  ":cq
"endif

"" Crystal
"" Installation:
"" git clone https://github.com/crystal-lang-tools/scry.git
"" cd scry
"" shards build -v
"" crystal build -o /Users/botanicus/Desktop/scry/bin/scry src/scry.cr --release
"" cp bin/scry /usr/local/bin
"if executable('scry')
"  let g:LanguageClient_serverCommands.crystal = ['scry']
"  autocmd FileType crystal setlocal omnifunc=LanguageClient#complete
"else
"  echo "scry not installed!\n"
"  ":cq
"endif

"" https://blog.schembri.me/post/solargraph-in-vim/
"" gem install solargraph
"" NOTE: To suggest metaprogramming methods:
"" .solargraph.yml
"" plugins:
"" - runtime
"if executable('solargraph')
"  " This doesn't work:
"  " let g:LanguageClient_serverCommands.ruby = ['/usr/local/bin/solargraph', 'socket']
"  " It starts the process, but it's very slow, so everything times out.
"  "
"  " This does, but we have to run solargraph socket manually (in the project
"  " dir).
"  let g:LanguageClient_serverCommands.ruby = ['tcp://localhost:7658']
"  autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
"else
"  echo "solargraph not installed!\n"
"  ":cq
"endif

" TODO
" https://github.com/redhat-developer/yaml-language-server
" https://github.com/mads-hartmann/bash-language-server
" https://github.com/vscode-langservers/vscode-css-languageserver-bin OR https://github.com/Microsoft/vscode/tree/master/extensions/css
" https://github.com/rcjsuen/dockerfile-language-server-nodejs
" https://github.com/graphql/graphql-language-service
" https://github.com/Microsoft/vscode/tree/master/extensions/html
" https://github.com/Microsoft/vscode/tree/master/extensions/json

" <leader>ld to go to definition
autocmd FileType javascript nnoremap <buffer>
  \ <leader>ld :call LanguageClient_textDocument_definition()<cr>
" <leader>lh for type info under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lh :call LanguageClient_textDocument_hover()<cr>
" <leader>lr to rename variable under cursor
autocmd FileType javascript nnoremap <buffer>
  \ <leader>lr :call LanguageClient_textDocument_rename()<cr>

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

