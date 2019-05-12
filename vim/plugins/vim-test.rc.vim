if has('nvim')
  let test#strategy = 'neovim'
else
  let test#strategy = 'vimterminal'
endif

let g:test#javascript#mocha#file_pattern = '\v.*\.test\.js'
