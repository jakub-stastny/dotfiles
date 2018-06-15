" https://noahfrederick.com/log/vim-templates-with-ultisnips-and-projectionist
" NOTE: It's slowing down Vim quite a bit, but not enough to bother me.

" Usage:
" # File .projections.json
" {
"   "app/models/*.rb": {
"     "template": "model"
"   }
" }
"
" # File ruby.snippets
" #
" # This is a fallback, if there's no associated project or no template
" # defined, this one is going to be expanded.
" snippet template "Default template" b
" # A generic file
" $0
" endsnippet
"
" snippet template_model "Model template" b
" class `!v expand("%:t:r")`_model {
"     $0
" }
" endsnippet

function! s:try_insert(skel)
  " The original version ended up in normal mode and wouldn't:
  " 1. Let me use tabstops properly.
  " 2. Give me selection if there are multiple templates defined.
  "
  execute "normal! i" . a:skel
  if !empty(UltiSnips#SnippetsInCurrentScope())
    call feedkeys("a\<tab>")
  else
    silent! undo
  endif
endfunction

function! snippet#InsertSkeleton() abort
  let filename = expand('%')

  " Abort on non-empty buffer or extant file.
  if !(line('$') == 1 && getline('$') == '') || filereadable(filename)
    return
  endif

  if !empty('b:projectionist') " Will be empty if out of conext of a project.
    " Loop through projections with 'skeleton' key and try each one until the
    " snippet expands
    for [root, value] in projectionist#query('template')
      if s:try_insert('template_' . value)
        return
      endif
    endfor
  endif

  call s:try_insert('template')
endfunction
