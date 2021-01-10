set number
set nocompatible
set relativenumber
syntax enable
syntax on
set mouse=a
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

set colorcolumn=80

set autoindent
set smartindent

set guifont=JetBrains\ Mono\ 11

set guioptions-=r
set guioptions-=T

set hlsearch
set t_Co=256

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
Plug 'mattn/emmet-vim'
Plug 'lambdalisue/gina.vim'
Plug 'vim/killersheep'
Plug 'markonm/traces.vim'
Plug 'vuciv/vim-bujo'
Plug 'dag/vim-fish'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-sandwich'
Plug 'mhinz/vim-signify'
Plug 'liuchengxu/vim-which-key'
Plug 'mcchrish/nnn.vim'
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'victorze/foo'
Plug 'megantiu/true.vim'
Plug 'plainfingers/black_is_the_color'
Plug 'alexkh/vimcolors'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'andymass/vim-matchup'
call plug#end()

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

colorscheme Atelier_ForestDark
