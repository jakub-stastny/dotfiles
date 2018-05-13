" Git add/rm/co % (or Gwrite/Gremove/Gread).
" Git mv % path (or Gmove path). path is relative. /path is relative to the root of the repository (where the .git is).
" Gblame
" Gstatus: C-n/C-p: move between file names.
"   -: add/remove file to the index (also works in the visual mode).
"   <Enter> open
"   C commit
" Gdiff
" FIXME: 13/05/2018 Disabling fugitive, because it's awfully slow, even if
" it's the only enabled plugin.
" Apart from that, it also doesn't deal well with output of post-commit hook
" (as in the pomodoro repo).
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter' | Plug 'tpope/vim-repeat'
set updatetime=100 " Update faster.

Plug 'jaxbot/github-issues.vim'

" Requires GH credentials in ~/.netrc file.
" :Gist [-pPao]
" :'<,'>Gist [-pPao]
"
" --public: This creates a public Gist. This is the default.
" See |gist_default_private| to change this default.
"
" --private: This creates a private gist. Public is the default.
" See |gist_default_private| to change this default.
"
" See |gist_open_url| to change this default.
" :GistOpenLast
" :GistCopyLast
Plug 'keith/gist.vim'
