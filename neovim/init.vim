set number cursorline
set relativenumber
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=2
set autoindent
set smartindent
set indentexpr=
set hidden
set list
set listchars=tab:\|\ ,trail:▫
set notimeout
set tw=0
set ignorecase
set smartcase
set hlsearch
set showtabline=2
set scrolloff=5 " keep number of lines in end of the screen
set wildmenu
set updatetime=100
set shortmess+=c
set wrap
set fillchars=vert:\|
set termguicolors
set visualbell
" set colorcolumn=100

" let g:terminal_color_0  = '#000000'
" let g:terminal_color_1  = '#FF5555'
" let g:terminal_color_2  = '#50FA7B'
" let g:terminal_color_3  = '#F1FA8C'
" let g:terminal_color_4  = '#BD93F9'
" let g:terminal_color_5  = '#FF79C6'
" let g:terminal_color_6  = '#8BE9FD'
" let g:terminal_color_7  = '#BFBFBF'
" let g:terminal_color_8  = '#4D4D4D'
" let g:terminal_color_9  = '#FF6E67'
" let g:terminal_color_10 = '#5AF78E'
" let g:terminal_color_11 = '#F4F99D'
" let g:terminal_color_12 = '#CAA9FA'
" let g:terminal_color_13 = '#FF92D0'
" let g:terminal_color_14 = '#9AEDFE'

" =====================================================
"                          Mappings
" =====================================================

let mapleader=" "

noremap <leader>rc :e ~/.config/nvim/init.vim<CR>
noremap <leader>src :source ~/.config/nvim/init.vim<CR>

" move fast
noremap <c-j> 5j
noremap <c-k> 5k
noremap <c-s> :w<Enter>
noremap <c-q> :q<Enter>
noremap <c-\> :vs<Enter>

" command line
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-n> <Down>
cnoremap <c-p> <Up>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" move between windows
noremap <c-Down> <c-w>j
noremap <c-Up> <c-w>k
noremap <c-Left> <c-w>h
noremap <c-Right> <c-w>l

" tab
noremap nt :tabe<CR>
noremap <silent> <M-Right> :+tabnext<CR>
noremap <silent> <M-Left> :-tabnext<CR>

" edit

" =====================================================
"                          Plugs
" =====================================================

call plug#begin('/home/gugugu/.local/share/nvim/plugged')

" files
Plug 'preservim/nerdtree'
"Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'airblade/vim-gitgutter'

" color
Plug 'theniceboy/vim-deus'
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'ojroques/vim-scrollstatus'
Plug 'luochen1990/rainbow'
Plug 'Rigellute/rigel'
Plug 'overcache/NeoSolarized'

" edit
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'RRethy/vim-illuminate'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim-python/python-syntax'

" python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python'}

" navigation
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'

" format
Plug 'Chiel92/vim-autoformat'

" dresses
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
}
EOF

let g:python_highlight_all = 1
" =====================================================
"                          Nerdtree
" =====================================================
noremap <c-b> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeHighlightCursorline = 0

" =====================================================
"                          Undotree
" =====================================================
nnoremap <F5> :UndotreeToggle<CR>

" =====================================================
"                          Colorscheme
" =====================================================

" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1

" colorscheme sonokai
colorscheme rigel
" colorscheme deus
" colorscheme iceberg
" colorscheme snazzy
" colorscheme NeoSolarized

" hi NonText ctermfg=gray guifg=grey
"=====================================================
"                          Airline
" =====================================================
" let g:airline_powerline_fonts = 1
" let g:rigel_airline = 1
let g:airline_theme = 'rigel'


"=====================================================
"                          TagBar
" =====================================================
hi TagbarAccessPublic guifg=#9cf087 ctermfg=Green
noremap <silent> <F12> :Vista!!<CR>


" =====================================================
"                          Coc
" =====================================================

" extensions
let g:coc_global_extensions = [
		\   'coc-json',
		\   'coc-vimlsp',
		\   'coc-snippets',
		\   'coc-actions',
		\   'coc-python']

" tap complete
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1] =~# '\s'
endfunction

" snippets
imap <c-l> <Plug>(coc-snippets-expand)
vmap <c-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<M-j>'

" <C-space> trigger complete
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" goto
" use nmap (not noremap) because it is recursive
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" document
inoremap <silent> <c-h> <ESC>:call Show_documentation()<CR>

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" show signature
inoremap <c-q> <ESC>:call CocActionAsync('showSignatureHelp')<CR>

let g:scrollstatus_size = 15

" =====================================================
"                          Rainbow
" =====================================================
let g:rainbow_active = 1
let g:rainbow_conf = {
\    'guifgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'ctermfgs':['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'separately': {'nerdtree': 0}
\
\}

" =====================================================
"                          Vista
" =====================================================
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\    "function": "\uf794",
\    "variable": "\uf71b",
\}


" =====================================================
"                          FZF
" =====================================================

" noremap <silent> <c-p> :Files<CR>
" noremap <silent> <c-f> :Rg<CR>
" noremap <silent> <c-h> :History<CR>
" noremap <silent> <c-l> :Lines<CR>
" noremap <leader>; :History:<CR>
" 
" let g:fzf_preview_window = 'right:60%'
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" let g:fzf_layout = {'window': {'width':0.9, 'height':0.6}}


" =====================================================
"                       LeaderF
" =====================================================
let g:LF_WindowPosition = 'popup'
let g:LF_PreviewInPopup = 1
let g:LF_ShortcutF = "<leader>ff"



" =====================================================
"                          Vim-Easymotion
" =====================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1


" =====================================================
"                          Illuminate
" =====================================================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" =====================================================
"                          Vim-Table-Mode
" =====================================================
noremap <leader>tm :TableModeToggle<CR>

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1


" =====================================================
"                          YAPF
" =====================================================
map <c-y> :call yapf#YAPF()<CR>

hi NerdTreeOpenable ctermfg=34 guifg=Red
hi NerdTreeClosable ctermfg=34 guifg=Red
hi NerdTreeDir ctermfg=34 guifg=#48aff0
hi UndoTreeNode ctermfg=34 guifg=#2afd84
hi UndoTreeSeq ctermfg=34 guifg=#7fcc79
hi UndotreeSavedBig ctermfg=34 guifg=Red
hi UndotreeSavedSmall ctermfg=34 guifg=#f5ce8f
