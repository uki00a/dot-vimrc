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

if isdirectory(s:dein_repos_dir) && dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(fnamemodify(expand('<sfile>'), ':h') . '/dein.toml')

  if isdirectory(expand('~/.ghq/github.com/uki00a'))
    call dein#local(expand('~/.ghq/github.com/uki00a'))
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
function! s:load_matchit()
  if !exists('g:loaded_matchit') | runtime! macros/matchit.vim | endif
endfunction

function! s:typescript() abort
  "ALEEnableBuffer
  "call asyncomplete#enable_for_buffer()
  map <buffer> <C-]> <Plug>(ale_go_to_definition)
  imap <buffer> <C-Space> <Plug>(asyncomplete_force_refresh)
endfunction

function! s:lisp() abort
  imap <buffer> <C-Space> <Plug>(asyncomplete_force_refresh)
  call asyncomplete#enable_for_buffer()
endfunction

augroup JavaScript
  autocmd!
  autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd FileType javascript :map <buffer> <C-]> <Plug>(ale_go_to_definition)
augroup END

augroup TypeScript
  autocmd!
  autocmd FileType typescript call s:typescript()
augroup END

augroup Vimscript 
  autocmd!
  autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2
  autocmd FileType vim call s:load_matchit()
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
  autocmd FileType ruby call s:load_matchit()
augroup END

augroup CSharp
  autocmd!
  autocmd BufRead,BufNewFile *.cshtml set filetype=html
augroup END

augroup CommonLisp
  autocmd!
  autocmd BufRead,BufNewFile *.asd set filetype=lisp
  autocmd FileType lisp call s:lisp()
augroup END
" augroups }}}

" terminal {{{
if has('terminal')
  if exists('+termkey')
    set termkey=<C-_>
  endif

  if has('win32') || has('win64')
    set shell=powershell.exe
  endif
endif
" terminal }}}

" key mappings {{{
nnoremap [ff] <Nop>
nnoremap [git] <Nop>

nmap <Leader>f [ff]
nmap <Leader>g [git]

" fzf
nnoremap <silent> [ff]f :<C-u>FzfFiles<CR>
nnoremap <silent> [ff]b :<C-u>FzfBuffers<CR>
nnoremap <silent> [ff]g :<C-u>FzfAg<CR>
nnoremap <silent> [ff]l :<C-u>FzfLines<CR>
nnoremap <silent> [ff]c :<C-u>FzfHistory:<CR>

" gina
nnoremap <silent> [git]s :<C-u>Gina status --opener=split<CR>
nnoremap <silent> [git]d :<C-u>Gina diff --opener=split<CR>
nnoremap <silent> [git]c :<C-u>Gina commit<CR>

inoremap <C-Space> <C-x><C-o>
inoremap <C-n> <C-x><C-n>
" key mappings }}}
