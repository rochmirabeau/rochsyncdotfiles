set number
set nocompatible
set relativenumber
syntax on
set mouse=a
set tabstop=8
set shiftwidth=4
set softtabstop=4

set smartindent
set autoindent

set guifont=JetBrains\ Mono\ 11
colorscheme elflord

set guioptions-=r
set guioptions-=T

"let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

packloadall
silent! helptags ALL

filetype plugin on

colorscheme elflord

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'flazz/vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
set hlsearch
