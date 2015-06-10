set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" initial plugins, required for some other stuff
Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'benmills/vimux'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'garbas/vim-snipmate'
Plugin 'kien/ctrlp.vim'
"Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'

" Syntax highlighting
Plugin 'beyondmarc/opengl.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'keith/tmux.vim'

call vundle#end()
filetype plugin indent on


