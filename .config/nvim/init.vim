" https://github.com/junegunn/vim-plug

" Options:
"   branch/tag/commit: Branch/tag/commit of the repository to use
"   rtp: Subdirectory that contains Vim plugin
"   dir: Custom directory for the plugin
"   as: Use different name for the plugin
"   do: Post-update hook (string or funcref)
"     If the value starts with : (i. e. :DoInstall), it will be recognized as a Vim
"     command, otherwise it's a shell command (i. e. npm install).
"   on: On-demand loading: Commands or <Plug>-mappings
"   for: On-demand loading: File types
"     This option is generally not needed as most plugins for specific file types
"     usually don't have too much code in plugin directory. You might want to examine
"     the output of vim --startuptime before applying the option.
"   frozen: Do not update unless explicitly specified
"
" Dependencies:
"   Plug 'plug_1' | Plug 'dependency'
"
" Keybindings:
"   D - PlugDiff
"   S - PlugStatus
"   R - Retry failed update or installation tasks
"   U - Update plugins in the selected range
"   q - Close the window
"   PlugStatus:
"     L - Load plugin
"   PlugDiff:
"     X - Revert the update

call plug#begin('~/.local/share/nvim/plugins')

" gcc: Comment out a line.
" gc: Comment out the target of a motion, for instance:
"   gcap: Comment out a paragraph.
"   gcG: Comment out rest of the file. Etc.
"
" :7,17Commentary: Comment out a range in the ex mode.
" :g/TODO/Commentary: Comment out matching lines (lines matching TODO).
Plug 'tpope/vim-commentary' | Plug 'tpope/vim-repeat'

" With the cursor between the delimiters:
"   cs'": Change apostrophes to quotes.
"   cs'<q>: Change apostrophes to <p>'s.
"   cst": Change tag to quotes.
"   ds": Remove the quotes.
"
" With the cursor on a word:
"   ysiw]: Wrap the word in [].
"   ysiw<em>: Wrap the word in <em>.
"   Use the opening bracket (of any kind) for space, closing one for no space
"   between the brackets and the word.
"
" Now wrap the entire line in parentheses with yssb or yss).
"
" Visual mode:
"   S<p class="important">: Wrap in p.important.
Plug 'tpope/vim-surround' | Plug 'tpope/vim-repeat'

" TODO
Plug 'jiangmiao/auto-pairs'

" :rename[!] {newname}
Plug 'danro/rename.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'

Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim', { 'for': ['html', 'xml'] }

source ~/.config/nvim/git.vim
source ~/.config/nvim/vimux.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/themes.vim
source ~/.config/nvim/settings.vim

" My custom plugins.
Plug '~/Dropbox/Projects/Software/pomodoro/support/vim'

" Initialize plugin system
call plug#end()
