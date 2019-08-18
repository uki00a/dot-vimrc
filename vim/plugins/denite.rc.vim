if executable('ag')
  call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#option('default', {
  \   'prompt': '>',
  \   'source_names': 'short',
  \   'split': has('nvim') ? 'floating' : 'horizontal',
  \   'auto_accel': v:true
  \ })

let s:menus = {}
let s:menus.shortcut = {
  \ 'description': 'Shortcut'
  \ }
let s:menus.shortcut.file_candidates = [
\   ['init.vim', $MYVIMRC],
\   ['dein.toml', fnamemodify($MYVIMRC, ':h') . '/dein.toml'],
\   ['dein.toml (local)', expand('~/.local/share/dein/dein.toml')]
\ ]

let s:menus.tools = { 'description': 'Tools' }
let s:menus.tools.command_candidates = [
\   ['vlime: run server', 'call VlimeStartServer()'],
\   ['dein: clear state', 'call dein#clear_state()']
\ ]

call denite#custom#var('menu', 'menus', s:menus)
