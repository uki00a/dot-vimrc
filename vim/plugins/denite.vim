call denite#custom#map(
  \ 'insert',
  \ '<C-j>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ '<C-p>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)
let s:menus = {}
let s:menus.vim = {
  \ 'description': 'Vim'
  \ }
let s:menus.vim.file_candidates = [
\   ['vimrc', $MYVIMRC],
\   ['dein.toml', fnamemodify($MYVIMRC, ':h') . '/dein.toml']
\ ]
call denite#custom#var('menu', 'menus', s:menus)
