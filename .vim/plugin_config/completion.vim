Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'antoinemadec/coc-fzf', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
" Plug 'coc-extensions/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-actions', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}

let g:coc_filetype_map = {
\ 'yaml.ansible': 'yaml',
\ }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()

autocmd CursorHold * silent call CocActionAsync('highlight')


xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


nmap <silent> sr <Plug>(coc-references)

command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType java setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" -- coc-action
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
nmap <silent> <leader>cA :CocCommand actions.open<CR>
nmap <silent> <leader>F :CocFix<CR>

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


nmap <leader>f :call CocAction('format')<cr>

nmap <leader>af <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>al <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap A  <Plug>(coc-codeaction-selected)

nnoremap <silent><nowait> <leader>ac  :<C-u>CocList commands<cr>
nmap <leader>af  <Plug>(coc-fix-current)
nmap <leader>cr  :CocRestart<CR>
