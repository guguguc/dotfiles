set relativenumber
set tabstop=2
set noexpandtab
set cursorline
syntax enable
set tw=0
set colorcolumn=80
set t_Co=256
set termguicolors
set shiftwidth=2
set softtabstop=2
set notimeout
set autoindent
set showcmd
set hlsearch
set list
set smartindent

let mapleader=" "
" noremap ; :

" Add pair in a word
map \p bi(<Esc>ea)<Esc>
map \c bi{<Esc>ea}<Esc>
map <leader>a A;<Esc>
nmap <leader>- i#----------------------------------------------------------------#<Esc>
" Save and Quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap <C-s> :w<CR>

noremap <silent> <leader>src :w<CR>:source $MYVIMRC<CR>
noremap <silent> <leader>rc :e $MYVIMRC<CR>

" press ` to change case
"noremap ` ~
noremap <F1> g~`

" Move Motionh"
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

"Line Up/Down
noremap <silent> <M-j> :m+1<CR>
noremap <silent> <M-k> :m-2<CR>

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
" change imput method
" autocmd InsertLeave * : !im-select.exe 1033

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" swithc between windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <Backspace> <C-w>h
noremap <C-l> <C-w>l

" new window vertically
noremap <M-\> :vs<CR>
noremap <M-/> :sv<CR>
noremap <C-w> :q<CR>

call plug#begin('~/Appdata/local/Nvim/plugged')
" color theme
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'bracnch': 'release'}
call plug#end()

colorscheme snazzy

" lightline
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\		'right':[ [ 'time' ],
			\							[ 'lineinfo' ],
			\							[ 'percent' ],
			\							[ 'fileformat', 'fileencoding', 'filetype' ] ]
			\},
			\	'component_function': {
			\		'time': 'ShowTime'
			\},
			\}
function	ShowTime()
	return strftime('%X')
endfunction

" nredtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <C-b> :NERDTreeToggle<CR>

" coc
let g:python3_host_prog='C:\Users\whato\AppData\Local\Programs\Python\Python38\python.exe'
set	pyx=3
