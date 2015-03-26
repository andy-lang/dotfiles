" add line numbers
set number

" switch on syntax highlighting
syntax on

" wrap long lines
set wrap

" tabs to spaces
set expandtab

" 4 physical spaces per tab
set tabstop=4

" visual autocomplete in command menu
set wildmenu

" Sublime Text-style syntax highlighting
"syntax enable
"colorscheme monokai

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" bracket matching
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap [ []<Esc>i
:inoremap " ""<Esc>i
":inoremap /* /* */<Esc>i
":inoremap /** /** */<Esc>i

" gr for previous tab
:map gr :tabprevious<CR>
