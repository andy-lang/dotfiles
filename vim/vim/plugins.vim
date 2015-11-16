call plug#begin('~/.vim/plugged')

" initial plugins, required for some other stuff
Plug 'junegunn/vim-plug'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

Plug 'benmills/vimux'
Plug 'bkad/CamelCaseMotion'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'johnsyweb/vim-makeshift'
"Plug 'kien/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'benekastah/neomake'
Plug 'tpope/vim-surround'

" Syntax highlighting
Plug 'gabrielelana/vim-markdown'
Plug 'jvirtanen/vim-octave'
Plug 'keith/tmux.vim'
Plug 'rust-lang/rust.vim'

" Colourschemes
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

call plug#end()
