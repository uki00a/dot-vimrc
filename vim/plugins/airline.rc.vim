let g:airline_section_b = '%-0.10{getcwd()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'molokai'
let g:airline_extensions = ['keymap', 'po', 'quickfix', 'tabline', 'term', 'whitespace', 'wordcount', 'pomodoro']

function! s:init() abort
  let g:airline_section_c .= airline#section#create_right(['pomodoro'])
endfunction

autocmd User AirlineAfterInit call <SID>init()
