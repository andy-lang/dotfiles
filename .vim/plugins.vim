set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'garbas/vim-snipmate'
Plugin 'keith/tmux.vim'
Plugin 'beyondmarc/opengl.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tikhomirov/vim-glsl'

call vundle#end()
filetype plugin indent on
