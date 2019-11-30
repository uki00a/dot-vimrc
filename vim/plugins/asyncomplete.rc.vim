let g:asyncomplete_enable_for_all = 0
set completeopt+=preview

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#vlime#get_source_options({ 'priority': 10 }))

autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
\ 'priority': 10
\ }))
