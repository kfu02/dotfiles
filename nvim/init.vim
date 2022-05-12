""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Vimrc
" 
" This is my parent vimrc config, where I setup my defaults and source
" all of my plugins and config files using a plugin called Sourcery.
" For more info, see https://github.com/jesseleite/vim-sourcery
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source plugins
call plug#begin()
  source ~/.dotfiles/nvim/plugins.vim
call plug#end()

" Initialize Sourcery to source the rest
" + auto-source on save, etc.
call sourcery#init()
