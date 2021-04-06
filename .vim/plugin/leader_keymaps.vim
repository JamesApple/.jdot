" Use which key to keep track of mappings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" nnoremap <silent> g  :WhichKey 'g'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<Space>', "g:wkm_space")


let g:wkm_space =  {}

let g:wkm_space.g = { 'name' : 'GIT' }
let g:wkm_space.g.A = 'Add'           | nnoremap <leader>gA :!git add %<CR>
let g:wkm_space.g.s = 'Status'        | nnoremap <leader>gs :Gstatus<CR>
let g:wkm_space.g.d = 'Vertical diff' | nnoremap <leader>gd :Gvdiff<CR>

let g:wkm_space.g.p = { 'name': '(P)'}
let g:wkm_space.g.p.S = 'PUSH FORCE'  | nnoremap <leader>gps :Dispatch! git push --force --no-verify<CR>
let g:wkm_space.g.p.s = 'Push'        | nnoremap <leader>gps :Dispatch! git push --no-verify<CR>
let g:wkm_space.g.p.l = 'Pull'        | nnoremap <leader>gpl :Dispatch! git pull<CR>

let g:wkm_space.g.C = 'Commit Amend' | nnoremap <leader>gc :Gcommit --amend<CR>
let g:wkm_space.g.c = 'Commit'       | nnoremap <leader>gc :Gcommit<CR>

let g:wkm_space.l = 'Location List' | nmap <silent> <leader>l :call quickfix#ToggleList("Location List", 'l')<CR>
let g:wkm_space.q = 'Quickfix List' | nmap <silent> <leader>q :call quickfix#ToggleList("Quickfix List", 'C')<CR>

let g:wkm_space.t = {'name': '(t)est'}
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tF :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tp :TestLast<CR>
nnoremap <leader>to :TestVisit<CR>


let g:wkm_space.s = {'name': '(s)earch'}
nnoremap <silent><leader>sf :FZF<CR>
nnoremap <silent><leader>sb :Buffers<CR>
nnoremap <silent><leader>sh :History<CR>
nnoremap <silent><leader>st :Rg<CR>


" edit notes
nnoremap <silent> <leader>en :Files ~/notes/<CR>
nnoremap <leader>eN :e ~/notes/
nnoremap <silent> <leader>e` :Files ~/<CR>
nnoremap <leader>e~ :e ~/
nnoremap <silent> <leader>es :Files ~/scripts<CR>
nnoremap <leader>eS :e ~/scripts


let g:wkm_space.v = {'name': '(v)im'}
let g:wkm_space.v.r = 'Reload' | nnoremap <silent> <leader>vr :so $MYVIMRC<CR>


