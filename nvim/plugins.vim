""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
" 
" dependency: CLI install: https://github.com/junegunn/vim-plug
"
" Ordered by likeliness to change: least likely to change is at the bottom.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Colorschemes
Plug 'ful1e5/onedark.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'sainnhe/everforest'

" Lualine - pretty statusline
Plug 'nvim-lualine/lualine.nvim'
" Icons in status line
Plug 'kyazdani42/nvim-web-devicons'

" coc.nvim - VSCode-style code completion
" dependency: nodeJS (CLI install)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-commentary - comment lines quickly 
"   one line   = gcc
"   many lines = gc{motion}
Plug 'tpope/vim-commentary'

" Telescope - magic
" see Mappings: telescope for features+mappings
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter - better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Sourcery - manage multiple vim config files
" ,gp - go to Plugin definition
" ,gm - go to Mappings:
" ,gc - go to Config:
Plug 'jesseleite/vim-sourcery'

call plug#end()
