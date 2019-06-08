let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['tsserver', 'eslint'],
  \   'vue': ['eslint']
  \ }
let g:ale_lint_delay = 1000

if has('win32') || has('win64')
  let g:ale_shell = 'cmd.exe'
endif
