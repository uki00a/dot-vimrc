let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.shortcut = {
  \ 'description': 'vim'
  \}

let g:unite_source_menu_menus.shortcut.candidates = [
  \ ['init.vim', $MYVIMRC],
  \ ['dein.toml', fnamemodify($MYVIMRC, ':h') . '/dein.toml']
  \]

function! g:unite_source_menu_menus.shortcut.map(key, value) abort
  let [word, value] = a:value
  return { 'word': word, 'kind': 'file', 'action__path': value }
endfunction
