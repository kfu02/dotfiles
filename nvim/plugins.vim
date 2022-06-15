""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
" 
" Install all plugins with vim-plug (dependency: external install).
"
" Ordered by likeliness to change: least likely to change is at the bottom.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" open-browser.vim - open links in buffers in browser
" gx (while over a link) - open link with xdg-open/open
" https://github.com/tyru/open-browser.vim
Plug 'tyru/open-browser.vim'

" open-browser-github.vim - open files in git repos in browser
" https://github.com/tyru/open-browser-github.vim
Plug 'tyru/open-browser-github.vim'
"
" startuptime.vim - obsess over vim startup times
" 
" :StartupTime to profile + show time in ms
" za - toggle folds
"
" https://github.com/tweekmonster/startuptime.vim
Plug 'tweekmonster/startuptime.vim'

" filetype.nvim - make filetype detection faster (+ allow custom ext changes)
" https://github.com/nathom/filetype.nvim
Plug 'nathom/filetype.nvim'

" vim-tmux-navigator - jump between vim and tmux panes seamlessly
" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" vinegar.vim - netrw enhancer
"   -      = go up one dir level
"   .      = put file in a : command
"   y.     = yank filepath
"   CTRL-6 = switch back to prev buffer
" more binds I can't remember on GH
Plug 'tpope/vim-vinegar'

" Colorschemes
Plug 'ful1e5/onedark.nvim' " currently in use
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'

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

