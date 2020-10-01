nmap <buffer><expr>
      \ <Plug>(fern-open-or-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-open)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

nmap <buffer> <CR> <Plug>(fern-open-or-expand-or-collapse)

nmap <buffer> R <Plug>(fern-action-reload)

nmap <buffer> x <Plug>(fern-action-mark-toggle)
nmap <buffer> dax <Plug>(fern-action-mark-clear)

nnoremap <buffer> j j$
nnoremap <buffer> k k$
nmap <buffer> . :hi

nmap <buffer> ef <Plug>(fern-action-new-file)
nmap <buffer> ed <Plug>(fern-action-new-dir)
nmap <buffer> rn <Plug>(fern-action-rename)
nmap <buffer> rm <Plug>(fern-action-remove)
nmap <buffer> cp <Plug>(fern-action-copy)
nmap <buffer> mv <Plug>(fern-action-move)
nmap <buffer> i <Plug>(fern-action-reveal)

nmap <buffer> L <Plug>(fern-action-lcd)

nmap <buffer> Y <Plug>(fern-action-clipboard-copy)
nmap <buffer> M <Plug>(fern-action-clipboard-move)
nmap <buffer> p <Plug>(fern-action-clipboard-paste)

setlocal nofoldenable

nnoremap <buffer> - <Plug>(fern-action-leave)

