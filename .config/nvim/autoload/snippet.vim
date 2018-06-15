" https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist
" NOTE: It's slowing down Vim quite a bit, but not enough to bother me.

" Usage:
" # File .projections.json
" {
"   "app/models/*.rb": {
"     "skeleton": "model"
"   }
" }
"
" # File ruby.snippets
" #
" # This is a fallback, if there's no associated project or no template
" # defined, this one is going to be expanded.
" snippet _skel "Default template" b
" # A generic file
" $0
" endsnippet
"
" snippet _model "Model template" b
" # A generic model
" class `!v expand("%:t:r")`_model {
"     $0
" }
" endsnippet

function! s:try_insert(skel)
  " The original version ended up in normal mode and wouldn't:
  " 1. Let me use tabstops properly.
  " 2. Give me selection if there are multiple templates defined.
  "
  " The disadvantage is, if there's no snippet for given filetype, we end up
  " with the world _skel followed by tab in our file. Not pretty. So let's
  " make sure there's an empty snippet in all.snippets:
  " snippet _skel "" b
  " endsnippet
  execute "normal! i_" . a:skel
  call feedkeys("a\<tab>")
  "
  " execute "normal! i_" . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"

  " if g:ulti_expand_res == 0
  "   silent! undo
  " endif

  " return g:ulti_expand_res
endfunction

function! snippet#InsertSkeleton() abort
  let filename = expand('%')

  " Abort on non-empty buffer or extant file
  if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
    return
  endif

  " Loop through projections with 'skeleton' key and try each one until the
  " snippet expands
  for [root, value] in projectionist#query('skeleton')
    if s:try_insert(value)
      return
    endif
  endfor

  " Try generic _skel template as last resort
  echom "Projectionist query empty."
  call s:try_insert('skel')
endfunction
