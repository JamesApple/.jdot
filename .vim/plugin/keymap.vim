if exists(':tnoremap')
  tnoremap   <ESC>      <C-\><C-n>
endif

inoremap <silent><expr> <c-space> coc#refresh()

vnoremap <silent> ; :EasyAlign<cr>

nmap <silent> <leader>l :call quickfix#ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call quickfix#ToggleList("Quickfix List", 'C')<CR>

nnoremap <silent> Q <C-w>c

nnoremap <silent> <C-w>z :call window#Zoom()<CR>

vnoremap > >gv
vnoremap < <gv

nnoremap Y y$ 

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Backspace> -

" Keep search results in center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

inoremap <C-w>k <ESC><C-w>k
inoremap <C-w>j <ESC><C-w>j
inoremap <C-w>l <ESC><C-w>l
inoremap <C-w>h <ESC><C-w>h
nnoremap <silent> <C-w>t :tabnew<CR>

" Disable Arrow Keys
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>


" Indent entire file
nnoremap == mzgg=G`z

nmap <silent> // :nohlsearch<CR>

nnoremap g< :SidewaysLeft<CR>
nnoremap g> :SidewaysRight<CR>

nnoremap <silent><leader>f :ALEFix<CR>

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tF :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tp :TestLast<CR>
nnoremap <leader>to :TestVisit<CR>

nnoremap <silent><leader>sf :FZF<CR>     | " (s)earch (f)iles in repo
nnoremap <silent><leader>sb :Buffers<CR> | " (s)earch (b)uffers
nnoremap <silent><leader>sh :History<CR> | " (s)earch (h)istory
nnoremap <silent><leader>st :Rg<CR>      | " (s)earch (t)ext
nnoremap <leader>sT :Rg                  | " (s)earch (T)ext with regex

nnoremap <silent> <leader><leader> :Files ~/notes/<CR>

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


" Add folder / File or interactive staging
nnoremap <leader>gA :!git add %<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
nnoremap <leader>gc :Gcommit<CR>
