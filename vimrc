" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin indent on

" encoding
set encoding=utf-8
setglobal fileencoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set backup
set history=50
set ruler
set showcmd
set incsearch

set nottybuiltin
set ttyfast
set ttymouse=xterm
set mouse=a

" User defines options
syntax on
set background=dark
set number
set hls
set ts=4 sw=4 expandtab
set autoindent

" Language specific setting
autocmd FileType text setlocal textwidth=78
autocmd Filetype ruby,html,erb setlocal ts=2 expandtab sw=2
