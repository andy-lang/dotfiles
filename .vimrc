" Read vim plugins from file
source ~/.vim/plugins.vim

filetype plugin on
" stop that annoying glitch where vim deletes lines on entry
set t_RV= ttymouse=xterm2

""""""""""""""""""""
" Appearance
""""""""""""""""""""

" Spelling corrections
abbr abrr abbr
abbr fuction function
abbr hierarcy hierarchy

" C-like indentation
set autoindent
set smartindent
set cindent

" highlight matching search patterns, start searching before pressing enter
set hlsearch
set incsearch

" case insensitive searching, unless an upper case char was specified
set ignorecase
set smartcase

" add line numbers
set number

"always a certain number of lines above/below current cursor position
set scrolloff=1

" ignore warnings if swapfile exists
set shortmess+=A

" 4 spaces per indent 
set tabstop=4
set shiftwidth=4

" visual, bash-like autocomplete
set wildmenu
set wildmode=longest,full

" wrap long lines
set wrap linebreak

" syntax highlighting
syntax enable
set t_Co=256
try
	colorscheme Benokai
	"colorscheme monokai
endtry


""""""""""""""""""""
" Functionality
""""""""""""""""""""
" automatically reloads files that have been detected as being changed
set autoread
" automatically write on :make, :next, etc
set autowrite

" backspace skips over indents, EOL, appends, etc
set backspace=2

" if no register specified, copy to system clipboard
set clipboard=unnamedplus

" bash shell
set shell=bash

" open make errors in new split/buffer if not open
set switchbuf=useopen,usetab,split

source ~/.vim/ignores.vim

" settings for extra c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1


""""""""""""""""""""
" Keybindings & commands
""""""""""""""""""""
let mapleader=","

" Esc to hide syntax highlighting
nnoremap <Esc> :noh<return><Esc>

" gr for previous tab
map gr gT
" gb for bottom of file
map gb G
" gs to swap two adjacent characters
map gs xph
" 0 jumps to first non-blank character, instead of hard BOL
map 0 ^
" j and k for soft line movement
nmap j gj
nmap k gk

" easier split navigation, compatible with tmux-navigator
"let g:tmux_navigator_no_mappings = 1
"nnoremap <C-H> :TmuxNavigateLeft<cr>
"nnoremap <C-J> :TmuxNavigateDown<cr>
"nnoremap <C-K> :TmuxNavigateUp<cr>
"nnoremap <C-L> :TmuxNavigateRight<cr>

if !exists(':TmuxNavigateRight')
	" tmux navigation will provide the pane navigation, so only map these if tmux isn't in use
	nnoremap <C-H> <C-w>h
	nnoremap <C-J> <C-w>j
	nnoremap <C-K> <C-w>k
	nnoremap <C-L> <C-w>l
endif

" do it for terminal too, if in Neovim
"if has('nvim')
	"tnoremap <C-h> <C-\><C-n><C-w>h
	"tnoremap <C-j> <C-\><C-n><C-w>j
	"tnoremap <C-k> <C-\><C-n><C-w>k
	"tnoremap <C-l> <C-\><C-n><C-w>l
"endif

" ,p to invoke CtrlP
nnoremap <Leader>p :CtrlP<CR>
" indentation without shift
nnoremap <Leader><Leader> <<
nnoremap <Leader>. >>

" make with ,m; make clean with ,gm
nnoremap <Leader>m :wa<CR> :call VimuxRunCommand("make")<CR>
nnoremap <Leader>gm :wa<CR> :call VimuxRunCommand("make clean")<CR>

" some remaps for NerdCommenter
nnoremap <Leader>ca :call NERDComment('n', "append")<CR>
nnoremap <Leader>cf :call NERDComment('n', "toggle")<CR>

" ignore accidental uppercase for W and Q
command! Q q
command! W w

" turn off fucking ex mode
nnoremap Q <nop>
" similar for q:
nnoremap q: <nop>

" buffer delete does not delete window
command! Bd bp|bd #
nnoremap <Leader>d :Bd<CR>



""""""""""""""""""""
" Autocommands
""""""""""""""""""""

" reload vimrc on save
autocmd! BufWritePost ~/.vimrc source $MYVIMRC
"autocmd! BufWritePost ~/.nvimrc source % 

" do similar if saving .tmux.conf
autocmd! BufWritePost ~/.tmux.conf :call VimuxRunCommand("tmux source-file ~/.tmux.conf")

" and similar for .zshrc
autocmd! BufWritePost ~/.zshrc :call VimuxRunCommand(". ~/.zshrc")

" and bashrc, bash aliases
autocmd! BufWritePost ~/.bashrc :call VimuxRunCommand(". ~/.bashrc")
autocmd! BufWritePost ~/.bash_aliases :call VimuxRunCommand(". ~/.bash_aliases")

" session restore on entering Vim
autocmd VimEnter * call RestoreSess()

" spellcheck for txt files
autocmd BufRead *.txt setlocal spell spelllang=en_au
autocmd FileType help setlocal nospell
" syntax highlighting for snippet files
autocmd FileType snippet set syntax=snippets
" special settings for editing crontab files
autocmd BufNewFile,BufRead crontab.* set nobackup | set nowritebackup
" tab settings for editing makefiles
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab


""""""""""""""""""""
" Plugin-specific settings
""""""""""""""""""""

""" airline, bufferline, statusline

" always show statusline
set laststatus=2

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#whitespace#enabled = 0

"let g:airline_section_c = '%n %t%m'
let g:airline_section_y = '%L'
let g:airline_section_z = '%l,%v'
let g:bufferline_echo = 0

"autocmd VimEnter *
"\ let &statusline='%{bufferline#refresh_status()}'
  "\ .bufferline#get_status_string()


""" CtrlP
" save cache
let g:ctrlp_clear_cache_on_exit = 0
" show dotfiles
let g:ctrlp_show_hidden = 1

""" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


""""""""""""""""""""
" Functions
""""""""""""""""""""
" Toggle between relative and absolute line numbers
fu! ToggleLineNumbers() 
	if (&relativenumber == 1)
		set norelativenumber
		set number
	else
		set nonumber
		set relativenumber
	endif
endfunction
nnoremap <Leader>l :call ToggleLineNumbers()<CR>

" restore session on entry, but only if no other command line arguments & not in diff mode
fu! RestoreSess()
    if filereadable(getcwd() . '/Session.vim') && !&diff && argc() == 0
        execute 'so %:p:h/Session.vim'
    endif
endfunction
