source ~/.config/nvim/startify-bookmarks.vim
source ~/.config/nvim/fzf.vim

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'sickill/vim-pasta'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'rbgrouleff/bclose.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vifm/vifm.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'HerringtonDarkholme/yats.vim',
Plug 'pangloss/vim-javascript',
Plug 'maxmellon/vim-jsx-pretty',

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = ' '

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

syntax enable
set t_Co=256
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = 256
let g:gruvbox_invert_selection = '0'
let g:vifm_replace_netrw = 1
let g:vifm_replace_netrw_cmd = 'Vifm'

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
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set shiftwidth=2
filetype indent on
filetype plugin on
set wildmenu
set showmatch
set autoindent
set undofile
set undodir=/tmp
set nobackup       " This is recommended by coc
set nowritebackup  " This is recommended by coc
set cmdheight=1
set updatetime=300
set shortmess+=c
set clipboard=unnamedplus
set lcs=trail:·
set list

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Enable spell checking, sp for spell check
nmap <leader>sp :setlocal spell! spelllang=en_us<CR>

"=================================================
" Indent Line settings
"=================================================
let g:indentLine_char = '¦'
let g:indentLine_fileTypeExclude = [ 'startify', 'coc-explorer', 'fzf']
let g:indentLine_bufNameExclude = ['vifm']
autocmd Filetype json let g:indentLine_enabled = 0

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
" Goyo
"=================================================
let g:goyo_width = 150
let g:goyo_linenr = 1

"=================================================
" Coc settings
"=================================================
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-vimlsp']
nmap <space>e :CocCommand explorer<CR>
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <leader>r <Plug>(coc-rename)
nmap <leader>d <Plug>(coc-definition)
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"tab completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
