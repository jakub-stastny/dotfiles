" https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'vim-airline/vim-airline' " | Plug 'vim-airline/vim-airline-themes'

" Other good ones: evening koehler slate
colorscheme desert

" Stolen from https://gist.github.com/aesnyder/7d692b85a51719896237
let g:circle_last_update = localtime()
let g:circle_update_frequency_in_seconds = 30

function! UpdateCircleStatus()
  let output = system('~/.scripts/ci-status')
  if v:shell_error
    let g:circle_last_status = output
  else
    let g:circle_last_status = output
  endif
  return g:circle_last_status
endfunction

let g:circle_last_status = UpdateCircleStatus()

function! CircleStatus()
  let current_time = localtime()
  if current_time - g:circle_last_update > g:circle_update_frequency_in_seconds
    let g:circle_last_update = current_time
    echo "~ Checking CI"
    call UpdateCircleStatus()
  endif
  return g:circle_last_status
endfunction

let g:airline_section_b = "%{CircleStatus()}"
