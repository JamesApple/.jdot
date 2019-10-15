Plug 'tpope/vim-fugitive'                           " The king of all git plugins
Plug 'tpope/vim-rhubarb'                            " Github helper for Gbrowse with fugitive
Plug 'airblade/vim-gitgutter'                       " Display git status of lines in buffer
let g:gitgutter_realtime = 0                        " Realtime breaks with Zsh
let g:gitgutter_map_keys = 0                        " No keymaps
let g:gitgutter_max_signs = 200 
let g:gitgutter_eager = 1                           " Load gutter on open
let g:gitgutter_sign_removed = '–' 
let g:gitgutter_diff_args = '--ignore-space-at-eol' " Don't show space changes
let g:gitgutter_override_sign_column_highlight = 0
let gitgutter_blacklist = ['dirvish', 'fugitive']
augroup gitGutterFiletypeDisabler
  autocmd BufLeave * if index(gitgutter_blacklist, &ft) < 0 | :GitGutterEnable
  autocmd BufEnter */ :GitGutterDisable
augroup END
