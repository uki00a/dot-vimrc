let g:quickrun_no_default_key_mappings = 1
let g:quickrun_config = {}

let g:quickrun_config._ = {
  \ 'runner': 'vimproc',
  \ 'split': 'below'
  \ }

let g:quickrun_config.typescript = {
  \   'command': 'deno',
  \   'cmdopt': 'run -A',
  \   'exec': '%c %o %s'
  \ }
