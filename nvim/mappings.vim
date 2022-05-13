""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Mappings
"
" Useful binds/options + short config options for plugins.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <leader> to ,
" e.g. ,ff calls Telescope find_files() (see Mappings: Telescope)
let mapleader=","

" Make Y behave like D and C (to end of line, from curr cursor pos)
noremap Y y$

" Persistent undo 
" (nvim creates default undodir)
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Colorscheme

" onedark
colorscheme onedark

" material
" let g:material_style = "darker"
" colorscheme material

" everforest
" let g:everforest_background = "hard"
" colorscheme everforest

" Line number
set number
set relativenumber
" Higlight current line num (but not current line)
set cursorline
set cursorlineopt=number

" Open splits to right/bottom rather than left/top (which is Vim's default)
set splitright
set splitbelow

" Force tab key to insert 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Search
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Makes search case-insensitive when all lowercase, 
" but case-sensitive when any caps included
set ignorecase
set smartcase

" Search highlighting off by default
:set nohlsearch

" Toggle search highlighting with enter
:noremap <CR> :set hlsearch! hlsearch?<CR>

" Mappings: telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Mappings: sourcery
nmap <leader>gp <Plug>SourceryGoToRelatedPluginDefinition
nmap <leader>gm <Plug>SourceryGoToRelatedMappings
nmap <leader>gc <Plug>SourceryGoToRelatedConfig
