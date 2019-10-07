let g:asyncomplete_enable_for_all = 0
set completeopt+=preview

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['lisp'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
\ 'priority': 10
\ }))
