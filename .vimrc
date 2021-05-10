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
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

" file tree in Vim
Plug 'preservim/nerdtree' 

" undo tree
Plug 'mbbill/undotree'

" tab completion (see below)
" fuzzy complete
Plug 'maralla/completor.vim'

" vim-script semantic completion
Plug 'kyouryuukunn/completor-necovim'

" basic complete
" Plug 'ervandew/supertab' 

" lc3 syntax highlighting (CS 2110)
Plug 'nprindle/lc3.vim'

" cursor switching
Plug 'wincent/terminus'

" surround words in brackets/quotes/tags/etc.
" Plug 'tpope/vim-surround'

" repeat last command, even if it's from a plugin
Plug 'tpope/vim-repeat'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" completor.vim
" https://github.com/maralla/completor.vim
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> Tab_Or_Complete()

" Completor Actions
" d - Jump to definition - completor#do('definition')
" c - Show documentation - completor#do('doc')
" f - Format code        - completor#do('format')
" s - Hover info         - (lsp hover) completor#do('hover')
noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>
" noremap <silent> <leader>f :call completor#do('format')<CR>
" noremap <silent> <leader>s :call completor#do('hover')<CR>

"
" semantic completor for individual languages
"

" C/C++
let g:completor_clang_binary = '/usr/bin/clang'

" python3 
" (pip install jedi)
let g:completor_python_binary = '/usr/bin/python3'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Appearance
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" hybrid colorscheme
set background=dark
colorscheme hybrid 
let g:airline_theme='deus'

" one-dark colorscheme (see Plug 'onedark.vim' above)
" colorscheme onedark
" let g:airline_theme='onedark'

" palenight colorscheme 
" set background=dark
" colorscheme palenight
" let g:airline_theme="palenight"

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

" typewriter mode breaks HML, sucks
" typewriter mode
" (current line stays in center of screen)
" set scrolloff=999

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Misc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use YCM signature help
" https://github.com/ycm-core/YouCompleteMe#signature-help
" let g:ycm_auto_trigger = 1

" start blank files in insert mode
au BufNewFile * startinsert

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

" keep visual highlights on indent (>) and unindent (<)
vnoremap > >gv
vnoremap < <gv

" redo with U instead of Ctrl+R
nnoremap U <C-R>

" map Shift-Tab to go back in cursor history 
"   Tab   = <C-I> = go fwd
" <S-Tab> = <C-O> = go bck
nnoremap <S-Tab> <C-O> 

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

