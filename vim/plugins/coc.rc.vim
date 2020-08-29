if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

imap <C-l> <Plug>(coc-snippets-expand)

let g:coc_global_extensions = [
  \   'coc-snippets'
  \ ]
