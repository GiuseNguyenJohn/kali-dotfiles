" syntax
syntax on

" line numbers
set number

" make windows hidden instead of closing
set hidden

set nocompatible

" remap ESC to 'jk'
inoremap jk <ESC>

" indentation settings
set tabstop=4
set autoindent
set expandtab
set softtabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" show cursorline
set cursorline

" auto install vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" dracula theme
set termguicolors
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
syntax enable
colorscheme dracula
