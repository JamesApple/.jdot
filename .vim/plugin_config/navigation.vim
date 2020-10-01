Plug 'justinmk/vim-dirvish'           " Hands down the best file browser for Vim
Plug 'kristijanhusak/vim-dirvish-git' " Display file status with color in dirvish
Plug 'unblevable/quick-scope'
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" Plug 'lambdalisue/fern.vim'
" Plug 'lambdalisue/fern-renderer-devicons.vim'

let g:dirvish_mode = ':sort ,^.*[\/],'
let g:dirvish_git_indicators = {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : '✖',
      \ 'Ignored'   : '☒',
      \ 'Unknown'   : '?'
      \ }


let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'

" nnoremap <silent> - :Fern . -reveal=%<CR>
" nnoremap <silent> <leader>e :Fern . -reveal=% -drawer<CR>

" Disable netrw
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" augroup my-fern-hijack
"   autocmd!
"   autocmd BufEnter * ++nested call s:hijack_directory()
" augroup END

" function! s:hijack_directory() abort
"   if !isdirectory(expand('%'))
"     return
"   endif
"   " bwipeout %
"   Fern %
" endfunction

" let g:fern#disable_default_mappings=1
" let g:fern#renderer = "devicons"
" let g:fern#default_hidden=1
