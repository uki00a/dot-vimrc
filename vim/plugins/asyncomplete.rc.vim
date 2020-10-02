let g:asyncomplete_enable_for_all = 0
set completeopt+=preview

augroup Asyncomplete
  autocmd!
  autocmd FileType go,typescript,lisp call asyncomplete#enable_for_buffer()
augroup END
