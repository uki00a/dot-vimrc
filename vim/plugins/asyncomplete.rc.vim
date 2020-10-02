let g:asyncomplete_enable_for_all = 0
set completeopt+=preview

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
\ 'priority': 10
\ }))

augroup Asyncomplete
  autocmd!
  autocmd FileType go,typescript,lisp call asyncomplete#enable_for_buffer()
augroup END
