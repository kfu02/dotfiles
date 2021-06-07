" for lc3 syntax highlighting
let g:lc3_detect_asm = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
" 
" requires CLI install: https://github.com/junegunn/vim-plug
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Colorschemes
" Plug 'junegunn/seoul256.vim'
Plug 'arzg/vim-substrata'
Plug 'w0ng/vim-hybrid'

" Indent lines
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

" Status bar
Plug 'itchyny/lightline.vim'

" VSCode-style code completion
" requires nodeJS (CLI install)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" requires CLI install
Plug 'ggreer/the_silver_searcher'

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

" https://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors
" Set sensible highlight matches that don't obscure the text
hi MatchParen gui=underline guifg=none guibg=bg

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

" Set search highlighting off by default
:set nohlsearch

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

" CoC scroll through completions with Tab and Shift-Tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable mouse support
set mouse+=a
