let g:vlime_leader = ","
let g:vlime_cl_use_terminal = v:true
let g:vlime_cl_impl = "ros"
function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval) abort
  return ["ros", "run", "--",
     \ "--load", a:vlime_loader,
     \ "--eval", a:vlime_eval]
endfunction

let g:vlime_neovim_connector = "nc"
function! VlimeBuildConnectorCommandFor_nc(host, port, timeout)
  if type(a:timeout) == type(v:null)
    return ['nc', a:host, string(a:port)]
  else
    return ['nc', '-w', string(a:timeout / 1000.0), a:host, string(a:port)]
  endif
endfunction
