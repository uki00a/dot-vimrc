let g:vlime_leader = ","
let g:vlime_cl_use_terminal = v:true
let g:vlime_cl_impl = "ros_or_qlot"
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

" function! MyVlimeStart() abort
"   let l:cl_impl = s:ask_for_cl_impl()
"   if l:cl_impl ==# 'qlot'
"     call s:VlimeStartQlot()
"   else
"     call s:VlimeStartRoswell()
"   endif
" endfunction
" 
" let s:vlime_entry_point = dein#get('vlime').path . '/lisp/start-vlime.lisp' 
" function! s:VlimeStartRoswell() abort
"   call VimuxRunCommand('rlwrap ros run --load ' . s:vlime_entry_point)
" endfunction
" 
" function! s:VlimeStartQlot() abort
"   call VimuxRunCommand('rlwrap qlot exec ros run --load ' . s:vlime_entry_point)
" endfunction

function! s:ask_for_cl_impl() abort
  call inputsave()
  let l:cl_impl = input('Common Lisp implementation(ros/qlot):', 'ros')
  call inputrestore()
  return l:cl_impl == '' ? 'ros' : l:cl_impl
endfunction

function! VlimeBuildServerCommandFor_ros_or_qlot(vlime_loader, vlime_eval) abort
  let l:cl_impl = s:ask_for_cl_impl()
  if l:cl_impl ==# 'qlot'
    return VlimeBuildServerCommandFor_qlot(a:vlime_loader, a:vlime_eval)
  else
    return VlimeBuildServerCommandFor_ros(a:vlime_loader, a:vlime_eval)
  endif
endfunction

" FIXME
function! VlimeBuildServerCommandFor_tmux(vlime_loader, vlime_eval) abort
  let l:cl_impl = s:ask_for_cl_impl()

  if l:cl_impl ==# 'qlot'
    let l:shell_cmd = VlimeBuildServerCommandFor_qlot(a:vlime_loader, a:vlime_eval)
  else
    let l:shell_cmd = VlimeBuildServerCommandFor_ros(a:vlime_loader, a:vlime_eval)
  endif

  return extend(["tmux", "split-window", "-v"], l:shell_cmd)
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

