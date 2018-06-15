Plug 'benmills/vimux'

" Test runner.
"
" TODO: save first before all these commands.
" TODO: Warn if tmux is not running instead of failing silently.
"
" So far no test runner, these two commands are sufficient.
command! RunTests call VimuxRunCommand("clear && bundle exec rspec " . expand("%"))
command! RunFocus call VimuxRunCommand("clear && bundle exec rspec " . expand("%") . ":" . line("."))
" https://8thlight.com/blog/chris-jordan/2016/06/13/running-tests-in-vim.html
" https://github.com/benmills/vimux
" https://github.com/pgr0ss/vimux-ruby-test
" https://github.com/bronson/vim-runtest
" https://github.com/janx/vim-rubytest
" https://github.com/janko-m/vim-test
" http://adamalbrecht.com/2016/02/01/run-your-ruby-tests-using-vim-and-tmux/
" https://github.com/tpope/vim-dispatch/tree/master/autoload
" https://github.com/skalnik/vim-vroom/blob/master/doc/vroom.txt

" REPL
command! Run call VimuxRunCommand("clear && ruby " . expand('%'))
command! IRB call VimuxRunCommand("clear && ruby " . expand('%'))
" TODO: run selection
" VimuxSendText()
" TODO: pry, rails console, shell
" TODO: ^ file type detection.
