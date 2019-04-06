if has('win32') || has('win64')
  let s:my_vimrc = expand('~/AppData/Local/nvim/init.vim')
else
  let s:my_vimrc = expand('~/.config/nvim/init.vim')
endif

let $MYVIMRC = s:my_vimrc
execute 'source ' . s:my_vimrc
