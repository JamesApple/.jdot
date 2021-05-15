vnoremap <silent> ; :EasyAlign<cr>

nnoremap <silent> <C-w>z :call window#Zoom()<CR>

" Use << to indent multiple times in visual
vnoremap > >gv
vnoremap < <gv

" Yank to the end of the line
nnoremap Y y$

" remove w prefix from window motions
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap <C-k> <ESC><C-w>k
inoremap <C-j> <ESC><C-w>
inoremap <C-l> <ESC><C-w>l
inoremap <C-h> <ESC><C-w>h

nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

" If enter goes down, backspace should go up
nnoremap <Backspace> -

" Keep search results in center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


nnoremap <silent> <C-w>t :tabnew<CR>

" Disable Arrow Keys
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>

" Indent entire file
nnoremap == mzgg=G`z

" Remove highlights on double tap /
nmap <silent> // :nohlsearch<CR>

" Slide function args
nnoremap g< :SidewaysLeft<CR>
nnoremap g> :SidewaysRight<CR>

" (i)n (a)rgument
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

nmap o A<CR>

" SURROUND:
" I never use the native s mappings. I use c and r
nmap s  <Plug>Ysurround
nmap S  <Plug>YSurround
nmap ss <Plug>Yssurround
nmap Ss <Plug>YSsurround
nmap SS <Plug>YSsurround

" Add back in the defaults because I disable surround setting maps at all
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap cS  <Plug>CSurround

xmap s   <Plug>Vsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

" Exit terminal with escape
if exists(':tnoremap')
  tnoremap   <ESC>      <C-\><C-n>
endif
