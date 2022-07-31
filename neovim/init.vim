syntax enable
set number
set cursorline
set relativenumber
set tabstop=4
set tw=0
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set indentexpr=
set hidden
set list
set listchars=tab:\|\ ,trail:▫
set notimeout
set ignorecase
set smartcase
set hlsearch
set showtabline=2
set scrolloff=5 " keep number of lines in end of the screen
set wildmenu
set updatetime=500
set shortmess+=c
set wrap
set fillchars+=vert:\▏
set termguicolors
set visualbell
set colorcolumn=80
set ttyfast
set lazyredraw


" =====================================================
"                          Terminal
" =====================================================
noremap <silent> <leader><leader>t :tabnew<CR>:terminal<CR>

" =====================================================
"                          Mappings
" =====================================================

let mapleader=" "

noremap <leader>rc :e ~/.config/nvim/init.vim<CR>
noremap <leader>src :source ~/.config/nvim/init.vim<CR>
noremap <leader><leader>= i=====================================================<ESC>

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

"terminal
tnoremap <ESC> <c-\><c-n>

" tabe
noremap <leader>nt :tabe<CR>
noremap <silent> <M-Right> :+tabnext<CR>
noremap <silent> <M-Left> :-tabnext<CR>

" motion
noremap <silent> <c-h> :nohls<CR>

" =====================================================
"                          Plugs
" =====================================================

call plug#begin('/home/gugugu/.local/share/nvim/plugged')

" File Mangement
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'

" Edit
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dhruvasagar/vim-table-mode'

" Dress
Plug 'Rigellute/rigel'
Plug 'itchyny/lightline.vim'
Plug 'ojroques/vim-scrollstatus'
Plug 'RRethy/vim-illuminate'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'

" Navigation
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'

" Highlight
Plug 'nvim-treesitter/nvim-treesitter'

" Language
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" =====================================================
"                       nvim-treesitter
" =====================================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
}
EOF

" =====================================================
"                          coc
" =====================================================
" Extensions
let g:coc_global_extensions = [
        \ 'coc-python',
        \ 'coc-lua',
        \ 'coc-vimlsp',
        \ 'coc-json',
        \ 'coc-snippets',
        \ 'coc-actions']


" Tab complete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Snippets
inoremap <silent><expr> <c-l> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" imap <C-l> <Plug>(coc-snippets-expand)
vmap <Tab> <ESC>^cw<Tab>
" vmap <c-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<M-f>'

" <C-space> trigger complete
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

" Refaction
nmap <F2> <Plug>(coc-rename)

" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Format
xmap <leader><leader>f <Plug>(coc-format-selected)
nmap <leader><leader>f <Plug>(coc-format)

" =====================================================
"                          nerdtree
" =====================================================
noremap <c-b> :NERDTreeToggle<CR>
let g:NERDTreeHighlightCursorline = 0
let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" =====================================================
"                          undotree
" =====================================================
nnoremap <F5> :UndotreeToggle<CR>
hi UndoTreeNode ctermfg=34 guifg=#2afd84
hi UndoTreeSeq ctermfg=34 guifg=#7fcc79
hi UndotreeSavedBig ctermfg=34 guifg=Red
hi UndotreeSavedSmall ctermfg=34 guifg=#f5ce8f

" =====================================================
"                          colorscheme
" =====================================================
colorscheme rigel

"=====================================================
"                          lightline
" =====================================================
let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }

" =====================================================
"                          rainbow
" =====================================================
let g:rainbow_active = 1
let g:rainbow_conf = {
\    'guifgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'ctermfgs':['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\    'separately': {'nerdtree': 0}
\
\}

" =====================================================
"                          vista
" =====================================================
noremap <silent> <F12> :Vista!!<CR>
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
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader><leader>h :History<CR>

" =====================================================
"                          illuminate
" =====================================================
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl

" =====================================================
"                          vim-table-mode
" =====================================================
noremap <leader>tm :TableModeToggle<CR>

" =====================================================
"                         othors
" =====================================================
let g:python_highlight_all = 1
hi MatchParen ctermfg=235 ctermbg=14 guifg=#eeeeee guibg=#3ab795
hi NerdTreeOpenable ctermfg=34 guifg=#2aa198
hi NerdTreeClosable ctermfg=34 guifg=#2aa198
hi NERDTreeDir ctermfg=34 guifg=#48aff0
hi NERDTreeFlags ctermfg=34 guifg=#2aa198

