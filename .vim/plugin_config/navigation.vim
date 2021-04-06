" -- tmux
Plug 'christoomey/vim-tmux-navigator'


" -- Disable netrw
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" -- Dirvish

" Plug 'justinmk/vim-dirvish'           " Hands down the best file browser for Vim
" Plug 'kristijanhusak/vim-dirvish-git' " Display file status with color in dirvish
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" let g:dirvish_mode = ':sort ,^.*[\/],'
" let g:dirvish_git_indicators = {
"       \ 'Modified'  : '✹',
"       \ 'Staged'    : '✚',
"       \ 'Untracked' : '✭',
"       \ 'Renamed'   : '➜',
"       \ 'Unmerged'  : '═',
"       \ 'Deleted'   : '✖',
"       \ 'Ignored'   : '☒',
"       \ 'Unknown'   : '?'
"       \ }

" -- Quick scope

" Plug 'unblevable/quick-scope'
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" -- Fern
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-devicons.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'LumaKernel/fern-mapping-reload-all.vim'
nnoremap <silent> - :Fern . -reveal=%<CR>


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

let g:fern#disable_default_mappings=1
let g:fern#renderer = "devicons"
let g:fern#default_hidden=1
