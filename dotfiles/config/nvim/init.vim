call plug#begin('~/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'szw/vim-maximizer'
Plug 'unblevable/quick-scope'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'onsails/lspkind-nvim'
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()

source ~/.config/nvim/startify-bookmarks.vim
source ~/.config/nvim/fzf.vim

lua require('lsp-config')
lua require('compe-config')
lua require('treesitter-config')

"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

nnoremap <SPACE> <Nop>
let mapleader = ' '

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

syntax enable
set t_Co=256
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = 256
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox

set linespace=0
set signcolumn=yes
set mouse=n
set encoding=UTF-8
set relativenumber
set rnu
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set autoindent
set number
set nocompatible
set hidden
set expandtab
set smarttab
filetype indent on
filetype plugin on
set wildmenu
set showmatch
set autoindent
set undofile
set undodir=/tmp
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set clipboard=unnamedplus
set lcs=trail:·

set foldmethod=indent
set nofoldenable
set foldlevel=2
set foldnestmax=10

set tabstop=2
set softtabstop=2
set shiftwidth=2
set list

" open new split panes to right and below
set splitright
set splitbelow

" Enable spell checking, sp for spell check
nmap <leader>sp :setlocal spell! spelllang=en_us<CR>

" Search files
nmap <leader>f :Files<CR>

" Maximizer
nmap <leader>m :MaximizerToggle!<CR>

" Cursor hold
let g:cursorhold_updatetime = 50

" BufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
nnoremap <silent> <leader>b ::BufExplorer<CR>

"=================================================
" QuickScope
"=================================================
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#5fffff' gui=bold ctermfg=155 cterm=bold
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#d3869b' gui=bold ctermfg=81 cterm=bold
augroup END

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"=================================================
" Fern
"=================================================
let g:fern#renderer#default#root_symbol = '~'

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)

  nmap <buffer> c <Plug>(fern-action-clipboard-copy)
  nmap <buffer> p <Plug>(fern-action-clipboard-paste)
  nmap <buffer> m <Plug>(fern-action-clipboard-move)
  nmap <buffer> n <Plug>(fern-action-new-file)
  nmap <buffer> N <Plug>(fern-action-new-dir)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> . <Plug>(fern-action-hidden-toggle)
  nmap <buffer> y <Plug>(fern-action-mark:toggle)
  nmap <buffer> q <Plug>(fern-action-leave)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

nnoremap <silent> <leader>e :Fern . -reveal=%<CR>

"=================================================
" Gitgutter
"=================================================
" Use fontawesome icons as signs
let g:gitgutter_sign_added = 'a'
let g:gitgutter_sign_modified = 'c'
let g:gitgutter_sign_removed = 'r'
let g:gitgutter_sign_removed_first_line = 'rf'
let g:gitgutter_sign_modified_removed = 'cr'

"=================================================
" Airline
"=================================================
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_z = ''
let g:airline_section_c = "%{expand('%:~:.')}"
let g:airline_section_b = '⌥ %{gitbranch#name()}'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#enabled = 1

"=================================================
" Startify
"=================================================
nmap <leader>st :Startify<cr>
let g:startify_files_number = 5
let g:startify_session_persistence = 1
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ ]
let g:startify_custom_header = [
  \ '   ',
  \ '                   ┏┓┏   ╻ ╻   ╻   ┏┳┓',
  \ '                   ┃┃┃   ┃┏┛   ┃   ┃┃┃',
  \ '                   ┛┗┛   ┗┛    ╹   ╹ ╹',
  \ '  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+',
  \ '  |w| |e| |l| |c| |o| |m| |e|   |t| |o|   |h| |e| |l| |l|',
  \ '  +-+ +-+ +-+ +-+ +-+ +-+ +-+   +-+ +-+   +-+ +-+ +-+ +-+',
  \ '   ',
  \ ]

"=================================================
" Markdown-preview
"=================================================

let g:mkdp_browser = 'vivaldi-stable'
let g:mkdp_page_title = '「Markdown Preview」'

