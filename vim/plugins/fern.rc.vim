augroup fern-custom
  autocmd! *
  autocmd FileType fern call <SID>init_fern()
augroup END

function! s:init_fern() abort
  nmap <buffer><nowait> <Return> <Plug>(fern-action-open-or-expand)
endfunction
