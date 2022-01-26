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
Plug 'w0ng/vim-hybrid'

" Indent lines
" Plug 'Yggdroot/indentLine'
" Plug 'lukas-reineke/indent-blankline.nvim'

" Status bar
Plug 'itchyny/lightline.vim'

" VSCode-style code completion
" requires nodeJS (CLI install)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo tree
Plug 'mbbill/undotree'

" LC3 syntax highlighting (CS 2110)
Plug 'nprindle/lc3.vim'

" Atom One Dark/Light theme
Plug 'rakr/vim-one'

" Telescope (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Tree-sitter (telescope wants it)
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors " Only needed in terminals

" Hybrid colorscheme (see plug above)
colorscheme hybrid
set background=dark " for the dark version

" Atom one-light for lab (see above)
" colorscheme one
" set background=dark " for the dark version
" set background=light " for the light version

" Lightline (status bar)
" :h g:lightline.colorscheme (to see all lightline colorschemes)
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \ }
    \ }

" this function makes the filename show relative to root (for git dirs)
" supposedly this only works with vim_fugitive, but I'm using it fine without
" https://github.com/itchyny/lightline.vim/issues/293
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Line number
set number
set relativenumber

" https://stackoverflow.com/questions/10746750/set-vim-bracket-highlighting-colors
" Set sensible highlight matches that don't obscure the text
hi MatchParen gui=underline guifg=none guibg=bg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Formatting
"
" gq<motion> to format everything from current cursor to <motion>
" e.g. gg then gqG to format full file
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Set search highlighting off by default
:set nohlsearch

" Toggle search highlighting with enter
:noremap <CR> :set hlsearch! hlsearch?<CR>

" Fuzzy finding binds (Telescope)
let mapleader=","

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Miscellaneous
"
" Many of my old miscellanous .vimrc settings are defaults in nvim, e.g.
"  - syntax highlighting
"  - no bells
"  - backspace over anything
"  - undodir
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make V and Y behave like D and C
noremap Y y$
noremap V v$

" Persistent undo 
" (nvim has default undodir)
set undofile

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
