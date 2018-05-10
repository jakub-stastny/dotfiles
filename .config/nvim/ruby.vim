Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'keith/rspec.vim' " defines rspec apart from ruby, so snippets then can use rspec.snippets instead of the ruby one.
autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec " This should be the default, but it doesn't work for me.

