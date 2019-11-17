let g:vlime_leader = ","
let g:vlime_cl_use_terminal = v:true
let g:vlime_cl_impl = "qlot"
let g:vlime_window_settings = {
  \   "sldb": {
  \     "pos": "rightbelow",
  \     "size": 60,
  \     "vertical": v:true
  \   },
  \   "repl": {
  \     "pos": "rightbelow",
  \     "size": 60,
  \     "vertical": v:true
  \   }
  \ }

function! VlimeStartREPL() abort
  let l:cl_impl = s:ask_for_cl_impl()
  if l:cl_impl ==# 'ros'
    call s:VlimeStartRoswell()
  else
    call s:VlimeStartQlot()
  endif
endfunction

let s:vlime_entry_point = dein#get('vlime').path . '/lisp/start-vlime.lisp' 
function! s:VlimeStartRoswell() abort
  call VimuxRunCommand('rlwrap ros run --load ' . s:vlime_entry_point)
endfunction

function! s:VlimeStartQlot() abort
  call VimuxRunCommand('rlwrap qlot exec ros run --load ' . s:vlime_entry_point)
endfunction

function! s:ask_for_cl_impl() abort
  call inputsave()
  let l:cl_impl = input('Common Lisp implementation(qlot/ros):', 'qlot')
  call inputrestore()
  return l:cl_impl == '' ? g:vlime_cl_impl : l:cl_impl
endfunction

function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval) abort
  return ["ros", "run", "--",
     \ "--load", a:vlime_loader,
     \ "--eval", a:vlime_eval]
endfunction

function! VlimeBuildServerCommandFor_qlot(vlime_loader, vlime_eval) abort
  return ["qlot", "exec", "ros", "run", "--load", a:vlime_loader, "--eval", a:vlime_eval] 
endfunction

let g:vlime_neovim_connector = "nc"
function! VlimeBuildConnectorCommandFor_nc(host, port, timeout)
  if type(a:timeout) == type(v:null)
    return ['nc', a:host, string(a:port)]
  else
    return ['nc', '-w', string(a:timeout / 1000.0), a:host, string(a:port)]
  endif
endfunction

