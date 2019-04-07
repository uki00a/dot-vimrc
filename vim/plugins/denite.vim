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
" TODO dein.toml
let s:menus.vim.file_candidates = [
\   ['vimrc', $MYVIMRC]
\ ]
call denite#custom#var('menu', 'menus', s:menus)
