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

" dracula theme
packadd! dracula
syntax enable
colorscheme dracula
