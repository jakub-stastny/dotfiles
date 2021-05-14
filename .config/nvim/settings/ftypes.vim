augroup filetypedetect
  autocmd BufRead,BufNewFile Rakefile,*.rake set filetype=ruby.rake
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby.gemfile
  autocmd BufRead,BufNewFile config.ru set filetype=ruby.rackup
  autocmd BufRead,BufNewFile *.gemspec set filetype=ruby.gemspec
  autocmd BufRead,BufNewFile *_spec.rb set filetype=ruby.rspec

  autocmd BufRead,BufNewFile *_spec.cr set filetype=crystal.spec

  autocmd BufRead,BufNewFile README.md set filetype=README.markdown
  autocmd BufRead,BufNewFile .travis.yml set filetype=travis.yaml

  " Dockerfile.dev
  autocmd BufRead,BufNewFile Dockerfile.* set filetype=dockerfile
augroup END

set omnifunc=syntaxcomplete#Complete
