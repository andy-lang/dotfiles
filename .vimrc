" pathogen plugin
execute pathogen#infect()
filetype plugin on

set t_RV= ttymouse=xterm2 " stops that annoying glitch when pressing j on startup

" add line numbers
set number

" switch on syntax highlighting
"syntax on

set guifont=Monospace:h12

" highlight matching search patterns
set hlsearch
" start searching before pressing enter
set incsearch

" always a certain number of lines above/below current cursor position
set scrolloff=5

" case insensitive searching, unless an upper case char was specified 
set ignorecase
set smartcase

" set shell to bash
set shell=bash

" backspace skips over indents, EOL, etc
set backspace=1

" wrap long lines
set wrap

" tabs to spaces
" set expandtab

" 4 physical spaces per indent 
set tabstop=8
set softtabstop=4
set shiftwidth=4

" C-like indentation
set autoindent
set smartindent
set cindent

" popup for complete options
" set completeopt=longest,menuone

" visual autocomplete
set wildmenu

" automatically reloads files that have been detected as being changed
set autoread

" suffixes that will be given lower priority in autocomplete
set suffixes=.o,.bin,.class,.out

" set underscores to not be part of a word
"set iskeyword-=_

" always show tab line
"set showtabline=2

" Sublime Text-style syntax highlighting
syntax enable
set t_Co=256
colorscheme Benokai

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"""""""""""""""""""""""""""""""""
"""""""""" KEYBINDINGS """"""""""
"""""""""""""""""""""""""""""""""

" bracket matching for curly brackets (could do it with other stuff too)
":inoremap { {}<Esc>i

" gr for previous tab
:map gr :tabprevious<CR>
" gb for bottom of file
:map gb :G<CR>


" <Esc> to remove highlights of most recent search
:nnoremap <esc> :noh<return><esc>

" brace matching if you type {*Enter*
:inoremap {<CR> {<CR>}<Esc>ko
