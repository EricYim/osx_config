set nocompatible
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on

let mapleader = ","
syntax enable
"set foldmethod=syntax
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab

set smartcase
set gdefault
set incsearch
set showmatch

set winwidth=5
set winminwidth=5
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:‣\ ,eol:¬,nbsp:⋅
set number
set noswapfile
set visualbell
set cursorline
set shell=/bin/sh
set smartindent
set term=screen-256color

" match ErrorMsg '\%>80v.\+
set cc=80

" Show syntax highlighting groups for word under curosr


set background=light

" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

" }}}

" vim: foldmethod=marker foldmarker={{{,}}}
