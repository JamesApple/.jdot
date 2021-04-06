" Mappings follow (e)xplorer <something> convention.
" (e)xplorer create (f)ile
" (e)xplorer (r)emove
" (e)xplorer create (d)irectory
nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
nnoremap <buffer> ef :e %
nnoremap <buffer> eF :!touch %
nnoremap <buffer> ed :!mkdir -p %
nnoremap <buffer> ex :Shdo  {}<Left><Left><Left>
nnoremap <buffer> eX :Shdo!  {}<Left><Left><Left>

nnoremap <buffer> eX :Shdo!  {}<Left><Left><Left>

nnoremap <buffer> . :echo 'Use eX or ex instead'<CR>
