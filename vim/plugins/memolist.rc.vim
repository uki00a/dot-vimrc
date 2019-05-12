let g:memolist_memo_suffix = 'md'
let g:memolist_filename_prefix_none = 1

if exists(':Denite')
  let g:memolist_denite = 1
  let g:memolist_denite_option = '-mode=normal -buffer-name=files'
else
  let g:memolist_unite = 1
  let g:memolist_unite_option = '-buffer-name=files'
endif

