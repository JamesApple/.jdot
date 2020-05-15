  Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' } 
  let g:easy_align_ignore_comment = 0                                 " align comments
  Plug 'AndrewRadev/sideways.vim', { 'on': [ 'SidewaysRight', 'SidewaysLeft' ] } 
  Plug 'tpope/vim-surround'
  let g:surround_no_mappings = 1                                      " Surround default mappings are quite invasive
  Plug 'tpope/vim-commentary'                                         " Comment with gc
  Plug 'tpope/vim-endwise'                                            " Add end after ruby
  Plug 'tpope/vim-unimpaired'                                         " Many helper functions
  Plug 'tpope/vim-repeat'                                             " Many helper functions
  Plug 'AndrewRadev/splitjoin.vim'                                    " gJ gS to split and join expressions
  Plug 'tpope/vim-rbenv', { 'for': ['ruby'] }                         " Ruby versioning
  Plug 'tpope/vim-bundler', { 'for': ['ruby'] }                       " Ruby gems helper
  Plug 'tpope/vim-sleuth'                                             " Never touch indent settings
  Plug 'tpope/vim-apathy'                                             " Path shenanigans
  Plug 'tpope/vim-scriptease', { 'for': ['vim'] }                     " Vim editing superpowers
  Plug 'tpope/vim-abolish'
  let g:abolish_save_file = expand('~/.vim/abolish_save_file')
