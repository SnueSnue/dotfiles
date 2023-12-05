" This is my config file for vim
" Last updated 13/10/2023
" by Snue

call plug#begin()
" My own plugin for quickly formatting latex
Plug 'SnueSnue/vim-plugin-latex-truthtables'

" Get file manager in vim
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Get snips
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

" Syntax for latex
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Syntax for rust
Plug 'rust-lang/rust.vim'

" Syntax for kitty config file
Plug 'fladson/vim-kitty'

" Vim wiki
Plug 'vimwiki/vimwiki'

call plug#end()

" NERDTree

" Auto open NERDTree whenever vim is opened
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" keymaps for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" keymap for copying all of a file into clipboard
nmap ya :%y+<CR>

" keymap for toggling cursorline and cursor collumn
nmap t :set cursorline!<CR>:set cursorcolumn!<CR>

" to be removed - is now in ftplugin/tex.vim
" keymap for saving and updating latex pdf
" nmap mm :w <CR>:!latexmk<CR>

" general vim settings

" Fix cliboard to use systemwide clipboard
set clipboard=unnamed

"change leader key - default is \
let mapleader=","

" Disable compatibility with vi, which can cause unexpected issues
set nocompatible

" Enable type file type detection
filetype on

" Enable plugins and load plugins for filetypes
filetype plugin on

" load an indent file for the detected file type
filetype indent on

" Turn syntax hughlighting on
syntax on

" Add line numbers
set number

" Hightlight cursor horizontally
set cursorline

" Highlight cursor vertically
set cursorcolumn

" Set shift width to 4 spaces
set shiftwidth=4

" Set tab width to 8 columns - to spot when tab and not spaces
set tabstop=8

" Fine tunes the amount of white space to be added
set softtabstop=4

" Use space characters instead of tabs.
set expandtab

" ??
set autoindent

" Do not save backup files
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes
set nowrap

" While searching through a file incrementally hightlight matching characters as you type
set incsearch

" Ignore capital letters during search
set ignorecase

" Override ignorecase above, when searching for captical letters
set smartcase

" Show partial command you type in the last line of the screen
set showcmd

" Show the mode you are on on the last line
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search
set hlsearch

" Set the commands yo save in history, default is 20.
set history=100 

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave similar to Bash completion
set wildmode=list:longest

" Ignore files you normally won't edit with vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


