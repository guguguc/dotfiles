set nu
syntax enable
set noexpandtab
set tabstop=2
set tw=0
set shiftwidth=2
set softtabstop=2
set notimeout
set autoindent
set smartindent
set showcmd
set hlsearch
set list

let mapleader=" "
noremap ; :

" Add pair in a word
map \p bi(<Esc>lxea)<Esc>
map \c bi{<Esc>lxea}<Esc>

" Save and Quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap <C-s> :w<CR>

noremap <silent> <leader>src :w<CR>:source $MYVIMRC<CR>
noremap <silent> <leader>rc :e $MYVIMRC<CR>

" press ` to change case
noremap ` ~
noremap <F1> g~`

"Move Motion

map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

"Line Up/Down
noremap <silent> <C-j> :m+1<Cr>
noremap <silent> <C-k> :m-2<Cr>

"Move fast
noremap <silent> K 5k
noremap <silent> J 5j

noremap <silent> W 5w
noremap <silent> B 5b
noremap <silent> H 0
noremap <silent> L $

inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A

vnoremap Y "+y
vnoremap P "+p

"Command Mode Cursor
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

call plug#begin('~/Appdata/local/Nvim/plugged')

" color theme
Plug 'connorholyday/vim-snazzy'
Plug 'junegunn/vim-easy-align'
"Plug 'easymotion/vim-easymotion'
Plug 'asvetliakov/vim-easymotion'
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme snazzy
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
