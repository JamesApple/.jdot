Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Add FZF executable to runtime
set runtimepath+=/usr/local/bin/fzf



let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob  "!.git/" --glob=!node_modules/'
let g:fzf_buffers_jump = 1                                                                               " Jump to window with buffer if it exists

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"' " Nice commit log

let g:fzf_nvim_statusline = 0                                                                            " disable statusline overwriting in nvim

let g:fzf_history_dir = '~/.local/share/fzf-history'                                                     " Keep history


function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_files_options =
      \ '--preview "(bat {} || cat {}) 2> /dev/null | head -'.&lines.'"'

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6, 'yoffset': 1, 'border': 'top' } }


inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Enable preview in :Files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>1)

function! s:change_to_project(project)
  exec 'tabedit '.a:project
  exec 'lcd '.a:project
endfunction

command! Project call fzf#run(fzf#wrap({'sink': function('s:change_to_project'), 'source': "find ~/projects -type d -exec test -e '{}/.git' ';' -print -prune"}))
