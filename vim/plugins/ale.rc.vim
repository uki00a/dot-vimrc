let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'javascript': executable('tsserver') ? ['eslint', 'tsserver'] : ['eslint'],
  \   'typescript': ['tsserver'],
  \   'vue': ['eslint']
  \ }
let g:ale_lint_delay = 1000

if executable('eslint_d')
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
endif

if has('win32') || has('win64')
  let g:ale_shell = 'cmd.exe'
endif
