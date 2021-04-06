let g:mapleader = "\<Space>"

"let g:python_host_prog =  '/Users/jamesapple/.pyenv/versions/2.7.10/bin/python'
"let g:node_host_prog = expand('~/.nvm/versions/node/v12.13.1/bin/neovim-node-host')

" Reload vim on all changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,init.vim so $MYVIMRC
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Source vim-plug plugins defined in the module/ directory
call plug#begin('~/.vim_plugged')
runtime! plugin_config/**/*.vim
call plug#end()

" " Disable Netrw
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" TODO: Remove plugins in vscode config
" if !exists('g:vscode')
" endif
