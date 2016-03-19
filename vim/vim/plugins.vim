call plug#begin('~/.vim/plugged')

" initial plugins, required for some other stuff
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-user'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Functionality
" Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator' | Plug 'benmills/vimux' | Plug 'edkolev/tmuxline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'

" Appearance
Plug 'vim-airline/vim-airline' | Plug 'bling/vim-bufferline' | Plug 'vim-airline/vim-airline-themes'
" Colourschemes
Plug 'chriskempson/base16-vim'

" Syntax-specific
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'jvirtanen/vim-octave', { 'for': ['matlab', 'octave'] }
Plug 'keith/tmux.vim'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()
