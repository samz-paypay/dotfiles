set nocompatible

let mapleader = ' '

" Show line number
set number
set relativenumber

" Tab
set tabstop=2
set shiftwidth=2
set expandtab

" Visuals
set encoding=utf-8
set t_CO=256

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" normal regex
nnoremap / /\v

" ReaLoad a file if was changed outside of Vim
set autoread

" Giff target<-local copy->merge
set diffopt+=vertical
set diffopt+=inline:word

noremap <Leader>w :write<CR>
noremap <Leader>q <C-W><C-C>
noremap <Leader>l :set cursorcolumn!<CR>

" No highlight
nnoremap <C-C> :nohl<CR><C-C>

" Source vimrc
nnoremap <Leader>s :source<space>$MYVIMRC<CR>
" edit vimrc
nnoremap <Leader>e :edit<space>$MYVIMRC<CR>

" open help vertically
cabbrev h vertical help

set nofixendofline

set hidden

set updatetime=100

set termguicolors

" Neovim terminal
autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

set clipboard+=unnamedplus

set nobackup
set nowritebackup
set noundofile
set noswapfile

" use treesitter
syntax off

" copy current file path
command CopyPath let @* = expand("%")

" ----------*---------- ----------*---------- ----------*---------- "

call plug#begin('~/.vim/plugged')
  Plug 'folke/tokyonight.nvim'

  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'google/vim-searchindex'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'

  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'Raimondi/delimitMate'

  " Plug 'editorconfig/editorconfig-vim'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " HTML
  Plug 'mattn/emmet-vim'

  " Formatter
  Plug 'stevearc/conform.nvim'
  Plug 'godlygeek/tabular'

  "" Syntax highlight
  Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}

  " neovim
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'numToStr/Comment.nvim'
  Plug 'danymat/neogen'
call plug#end()

set background=dark
colorscheme tokyonight-night

" fzf
let g:fzf_preview_window = ''

" rg
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always --smart-case ' . (<bang>0 ? '--fixed-strings ' : '') . <q-args>,
      \ 1, fzf#vim#with_preview('up:40%:hidden', '?'), 1)
command! -bang -nargs=* RgSrc Rg<bang> -g '!*.{test,spec,stories}.*' <args>
" search word under cursor in project
nnoremap <Leader>rg :Rg! <C-R><C-W><CR>
" search word under cursor in current file; no <CR> so the path can be edited first
nnoremap <Leader>rr :Rg! <C-R><C-W> <C-R>%
" search word under cursor in project, excluding test and storybook files
nnoremap <Leader>rt :RgSrc! <C-R><C-W><CR>

nnoremap <Leader>b :Buffers<CR>
nnoremap <C-P> :GFiles --recurse-submodules<CR>

" GitGutter
let g:gitgutter_map_keys = 0

" Fugitive
nmap <Leader>gb :Git blame<CR>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 CocStop :call coc#rpc#stop()

" Emmet  
let g:user_emmet_leader_key = '<C-K>'

" built in editorconfig
let g:editorconfig = v:false
