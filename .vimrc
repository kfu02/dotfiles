""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Basic
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not vi-compatible
set nocompatible 

" Disable the default Vim startup message.
set shortmess+=I

" Backspace over anything
set backspace=indent,eol,start

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support
set mouse+=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for lc3 syntax highlighting
let g:lc3_detect_asm = 1 

call plug#begin()

" colorscheme
Plug 'w0ng/vim-hybrid' 

" file tree in Vim
Plug 'preservim/nerdtree' 

" tab completion
Plug 'ervandew/supertab' 

" autoformat 
Plug 'Chiel92/vim-autoformat' 
" note: must install external packages
" INSTALLED:
" js-beautify - js, JSON

" lc3 syntax highlighting (CS 2110)
Plug 'nprindle/lc3.vim'

" cursor switching
Plug 'wincent/terminus'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
set background=dark
colorscheme hybrid 

" syntax highlighting
syntax on 

" turn off bracket highlighting
let g:loaded_matchparen=1
" set noshowmatch "doesn't work

" highlight current line num (but not current line)
set cursorline
set cursorlineopt=number
autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

" line number
set number
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" General
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" makes search case-insensitive when all lowercase,
" but case-sensitive when any caps included
set ignorecase
set smartcase

" toggle search highlighting with enter
:noremap <CR> :set hlsearch! hlsearch?<CR>

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" (Shift)Tab (de)indents code (insert only)
" inoremap <S-Tab> <C-d>

" keep visual highlights on indent (>) and unindent (<)
vnoremap > >gv
vnoremap < <gv

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
