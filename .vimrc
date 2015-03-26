" add line numbers
set number

" switch on syntax highlighting
"syntax on

set guifont=Monospace:h12

" highlight matching search patterns
set hlsearch

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
set expandtab

" 4 physical spaces per tab
set tabstop=4

" C-like indentation
set cindent

" popup for complete options
" set completeopt=longest,menuone

" visual autocomplete
set wildmenu

" suffixes that will be given lower priority in autocomplete
set suffixes=.o,.bin,.class

" Sublime Text-style syntax highlighting
syntax enable
set t_Co=256
colorscheme Benokai

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"           KEYBINDINGS  

" bracket matching for curly brackets (could do it with other stuff too)
:inoremap { {}<Esc>i

" gr for previous tab
:map gr :tabprevious<CR>
