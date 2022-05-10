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
Plug 'rakr/vim-one'
Plug 'marko-cerovac/material.nvim'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Status bar
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" VSCode-style code completion
" requires nodeJS (CLI install)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo tree
Plug 'mbbill/undotree'

" LC3 syntax highlighting (CS 2110)
Plug 'nprindle/lc3.vim'

" Telescope (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Tree-sitter (better syntax highlight)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Comment lines quickly 
"   one line   = gcc
"   many lines = gc{motion}
Plug 'tpope/vim-commentary'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors " Only needed in terminals

" Lualine setup (status bar)
" (written in Lua so needs the EOF-related tags)

lua << EOF
require('lualine').setup {
  options = {
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff'},
    lualine_x = {'diagnostics'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
}
EOF

" Line number
set number
set relativenumber
" higlight current line num (but not current line)
set cursorline
set cursorlineopt=number

" put dots on blank lines
lua << EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" Material

lua << EOF
require('material').setup({
    lualine_style = 'default'
})
EOF

let g:material_style="darker" 
colorscheme material " must go after config above

" add vim-illuminate's highlights to material colorscheme
" https://github.com/marko-cerovac/material.nvim/issues/74
" TODO: make this custom highlight match search hl colors
lua << EOF
-- require('material').setup({
--      custom_highlights = {
--         illuminatedWord = {bg='#0000FF'}
--     }
-- })
EOF


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
" coc.nvim
"
" An assortment of completion-related features.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

" Make Y behave like D and C
noremap Y y$

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

" Enable mouse support
set mouse+=a

" Let me type Wq by accident
" https://blog.sanctum.geek.nz/vim-koans/ (bottom of page)
command! Wq wq
