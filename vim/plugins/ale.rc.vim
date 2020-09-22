let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': executable('deno') ? ['deno', 'deno-tsserver'] : ['eslint', 'tsserver'],
\   'vue': ['eslint']
\ }
let g:ale_lint_delay = 2000

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['eslint'],
  \   'go': ['gofmt']
  \}

if executable('eslint_d')
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
endif

let g:ale_sign_warning = "🥺"
let g:ale_sign_error = "💩"

if has('win32') || has('win64')
  let g:ale_shell = 'cmd.exe'
endif
