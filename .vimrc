set encoding=utf-8

" {{{
set fileencoding=utf-8
scriptencoding utf-8

set noundofile
set noswapfile
set nobackup
set viminfo=
set number
set showmatch
set showcmd
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set nocindent
set foldmethod=marker
" }}}

" vim-plug {{{1
function! BuildVimProc(info)
  if a:info.status == 'unchanged'
    return
  endif

  if has('win32') || has('win64')
    !tools\\update-dll-mingw
  elseif has('win32unix') 
    !make -f make_cygwin.mak
  elseif executable('gmake')
    !gmake
  else
    !make
  endif
endfunction

let s:vimfiles = has('win32') || has('win64') ? 'vimfiles' : '.vim'

call plug#begin('~/' . s:vimfiles . '/plugged')

Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc', { 'do': function('BuildVimProc') }
Plug 'Shougo/unite.vim', { 'on': 'Unite' }
Plug 'Shougo/vimshell', { 'on': 'VimShell' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'cocopon/iceberg.vim'

call plug#end()
" vim-plug }}}1

" newtw {{{
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
" netrw }}}

" vimshell {{{
vmap <silent> ,s :VimShellSendString<CR>

" Use current directory as vimshell prompt.
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" vimshell }}}

" filetypes {{{
" TODO <filetype>.vim?
augroup javascript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2
  autocmd FileType javascript setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2
augroup END

augroup C
  autocmd!
  autocmd FileType c,cpp setlocal shiftwidth=2
  autocmd FileType c,cpp setlocal softtabstop=2
  autocmd FileType c,cpp setlocal tabstop=2
augroup END
" filetypes }}}

" key mappings {{{
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>Unite file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
inoremap <C-Space> <C-x><C-n>
inoremap <C-l> <C-x><C-o>

inoremap <C-N> <C-X><C-N>
" key mappings }}}
