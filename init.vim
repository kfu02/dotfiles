" for lc3 syntax highlighting
let g:lc3_detect_asm = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Colorschemes
" Plug 'junegunn/seoul256.vim'
Plug 'arzg/vim-substrata'
Plug 'w0ng/vim-hybrid'

" Indent lines
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Status bar
Plug 'itchyny/lightline.vim'

" Make your Vim/Neovim as smart as VSCode.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File tree
Plug 'preservim/nerdtree'

" Undo tree
Plug 'mbbill/undotree'

" LC3 syntax highlighting (CS 2110)
Plug 'nprindle/lc3.vim'

" Devicons {{{
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
" Editor
set termguicolors " Only needed in terminals
colorscheme substrata
colorscheme hybrid

" Lightline
" (to see all lightline colorschemes)
" :h g:lightline.colorscheme
let g:lightline = {
   \ 'colorscheme': 'wombat',
   \ }

" Line number
set number
set relativenumber

" Indent line
let g:indentLine_char='│'

" Use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Splits
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 0pen splits to right/bottom rather than left/top (which is Vim's default)
set splitright
set splitbelow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Search
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Makes search case-insensitive when all lowercase, 
" but case-sensitive when any caps included
set ignorecase
set smartcase

" Toggle search highlighting with enter
:noremap <CR> :set hlsearch! hlsearch?<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Miscellaneous
"
" Many of my old miscellanous .vimrc settings are defaults in nvim, e.g.
"  - syntax highlighting
"  - no bells
"  - backspace over anything
"  - undo directory
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Start blank files in insert mode
au BufNewFile * startinsert

" Keep visual highlights after indent (>) and unindent (<)
vnoremap > >gv
vnoremap < <gv

" Redo with U instead of Ctrl+R
nnoremap U <C-R>

" Map Shift-Tab to go back in cursor history 
"   Tab   = <C-I> = go fwd
" <S-Tab> = <C-O> = go bck
nnoremap <S-Tab> <C-O> 

" Set coc.nvim's scroll to Tab and Shift-Tab (insert mode)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enable mouse support
set mouse+=a
