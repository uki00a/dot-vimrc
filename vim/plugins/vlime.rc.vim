let g:vlime_leader = ","
let g:vlime_cl_use_terminal = v:true
let g:vlime_cl_impl = "qlot"

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

function! VlimeStartServer() abort
  call s:invoke_vlime_server()
endfunction

" FIXME
function! s:invoke_vlime_server() abort
  let saved_vlime_cl_impl = g:vlime_cl_impl
  let cl_impl = s:ask_for_cl_impl()
  let g:vlime_cl_impl = cl_impl
  call vlime#server#New(v:true, get(g:, "vlime_cl_use_terminal", v:false))
  let g:vlime_cl_impl = saved_vlime_cl_impl
endfunction

function! s:ask_for_cl_impl() abort
  call inputsave()
  let cl_impl = input('Common Lisp implementation(qlot/ros):', 'qlot')
  call inputrestore()
  return cl_impl == '' ? g:vlime_cl_impl : cl_impl
endfunction
