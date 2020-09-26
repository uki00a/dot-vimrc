if executable("gopls")
  augroup LspGo
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "go-lang",
    \ "cmd": {server_info -> ["gopls"]},
    \ "whitelist": ["go"],
    \ "workspace_config": {
    \   "gopls": {
    \     "staticcheck": v:true,
    \     "completeUnimported": v:true,
    \     "caseSensitiveCompletion": v:true,
    \     "usePlaceholders": v:true,
    \     "completionDocumentation": v:true,
    \     "watchFileChanges": v:true,
    \     "hoverKind": "SingleLine",
    \   }},
    \ })
  augroup END
endif
