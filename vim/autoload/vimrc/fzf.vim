function! vimrc#fzf#ghq() abort
  call fzf#run(fzf#wrap({
    \ "source": "ghq list --full-path",
    \ "sink": "cd"
    \ }))
endfunction

function! vimrc#fzf#dein() abort
  let l:plugins = map(values(dein#get()), "v:val.name")
  call fzf#run(fzf#wrap({
    \ "source": l:plugins,
    \ "sink*": function("s:DeinSinkCB")
    \ }))
endfunction

function! s:DeinSinkCB(selected_plugins) abort
  let l:selected_plugin = a:selected_plugins[0]
  let l:plugin = dein#get(l:selected_plugin)
  if has_key(l:plugin, "path")
    execute "cd" l:plugin.path
  endif
endfunction
