let g:lsp_signs_error = {"text": "💩"}
let g:lsp_signs_warning = {"text": "🥺"}

if executable("gopls")
  augroup LspGo
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "go-lang",
    \ "cmd": {server_info -> ["gopls"]},
    \ "allowlist": ["go"],
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

if executable("rust-analyzer")
  augroup LspRust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "rust-analyzer",
    \ "cmd": {server_info-> ["rust-analyzer"]},
    \ "allowlist": ["rust"],
    \ })
  augroup END
endif

if executable("deno")
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "deno lsp",
    \ "cmd": {server_info -> ["deno", "lsp"]},
    \ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
    \ "allowlist": ["typescript", "typescript.tsx"],
    \ })
  augroup END
elseif executable("typescript-language-server")
  " npm install -g typescript-language-server typescript typescript-deno-plugin
  let s:npm_root = trim(system("npm root -g"))
  let s:has_typescript_deno_plugin = isdirectory(s:npm_root . "/typescript-deno-plugin")
  let s:plugins = s:has_typescript_deno_plugin
    \ ? [{ "name": "typescript-deno-plugin", "location": s:npm_root }]
    \ : []
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "typescript-language-server",
    \ "cmd": {server_info -> ["typescript-language-server", "--stdio"]},
    \ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
    \ "allowlist": ["typescript", "typescript.tsx"],
    \ "initialization_options": { "plugins": s:plugins },
    \ })
  augroup END
endif
