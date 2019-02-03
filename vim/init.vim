set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

if &compatible
  set nocompatible
endif

" options {{{
set noundofile
set noswapfile
set nobackup
set viminfo=
set number
set ruler
set showmatch
set showcmd
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set nocindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set showmatch
set wildmenu
set formatoptions+=mM
set laststatus=2
set cmdheight=2
set showcmd
set title
set foldmethod=marker
set vb t_vb=
set novisualbell
set keywordprg=:help
set background=dark
set guioptions-=T
" options }}}

" global {{{
let g:mapleader = "\<Space>"
let g:vim_indent_cont = 2
" global }}}

augroup MyAutoCmd
  autocmd!
augroup END


" plugins {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repos_dir = expand(s:dein_dir . "/repos/github.com/Shougo/dein.vim")

execute "set runtimepath+=" . s:dein_repos_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(fnamemodify(expand('<sfile>'), ':h') . '/dein.toml')

  if isdirectory(expand('~/.local/share/dein'))
    call dein#local(expand('~/.local/share/dein'),
      \ { 'frozen': 1, 'merged': 0 },
      \ ['vim*', '*-vim', 'unite-*', 'denite-*', '*.vim'])
  endif
  
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
" plugins }}}

" newtw {{{
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_banner = 0
" netrw }}}

" augroups {{{
augroup JavaScript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup Vimscript 
  autocmd!
  autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup C
  autocmd!
  autocmd FileType c,cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup Python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
augroup END

augroup Ruby
  autocmd!
  autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd FileType ruby if !exists('g:loaded_matchit') | runtime! macros/matchit.vim | endif
augroup END
" augroups }}}

" key mappings {{{
nnoremap [unite] <Nop>
nmap <Leader>u [unite]

nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]t :<C-u>Unite -immediately tab:no-current<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep -no-quit<CR>
nnoremap <silent> [unite]r :<C-u>Unite register -buffer-name=register<CR>
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord line -buffer-name=search<CR>
inoremap <C-Space> <C-x><C-n>
inoremap <C-l> <C-x><C-o>

inoremap <C-N> <C-X><C-N>
vmap <silent> <Leader>s :VimShellSendString<CR>
" key mappings }}}
