if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '-g', '']

  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep --hidden'
  let g:unite_source_grep_recursive_opt = ''
endif

let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.shortcut = {
  \ 'description': 'Shortcut'
  \}

let g:unite_source_menu_menus.shortcut.candidates = [
  \ ['init.vim', $MYVIMRC],
  \ ['dein.toml', fnamemodify($MYVIMRC, ':h') . '/dein.toml'],
  \ ['dein.toml (local)', expand('~/.local/share/dein/dein.toml')]
  \]

function! g:unite_source_menu_menus.shortcut.map(key, value) abort
  let [word, value] = a:value
  return { 'word': word, 'kind': 'file', 'action__path': value }
endfunction
