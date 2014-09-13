" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
set completeopt-=preview

Plugin 'gmarik/Vundle.vim'

" vundle plugins
Plugin 'tpope/vim-fugitive'
"Bundle 'Valloric/YouCompleteMe'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set backup
set history=50
set ruler
set showcmd
set incsearch

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
autocmd Filetype jr,m,java setlocal ts=4 expandtab sw=4
autocmd Filetype tex setlocal ts=2 expandtab sw=2

let g:vim_markdown_folding_disabled=1

" latex settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_ViewRule_pdf = "evince"
let g:Tex_CompileRule_pdf = "xelatex -interaction=nonstopmode $*"
let g:Tex_DefaultTargetFormat = "pdf"

" fix latexsuite é
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
