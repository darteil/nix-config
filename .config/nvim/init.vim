source ~/.config/nvim/startify-bookmarks.vim

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'sickill/vim-pasta'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }
Plug 'pangloss/vim-javascript', { 'for': [ 'javascript' ] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': [ 'javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

call plug#end()

if !has('gui_running')
  set t_Co=256
endif

" Enable true color 
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

autocmd Filetype json let g:indentLine_enabled = 0
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

syntax enable
colorscheme gruvbox
set t_Co=256
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'hard'
set encoding=UTF-8
set background=dark
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

nnoremap <SPACE> <Nop>
let mapleader = ' '

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+p
vnoremap <C-v> "+p

nmap <leader>. <c-^>
nmap <leader>st :Startify<cr>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:indentLine_char = '¦'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['typescript'] = ['prettier', 'eslint']
let g:ale_fixers['javascript.jsx'] = ['prettier', 'eslint']
let g:ale_fixers['typescript.tsx'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = " "
let g:ale_sign_warning = " "
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=20 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5
let g:ale_fix_on_save = 1
let g:airline_powerline_fonts = 1

let g:airline_symbols = {}
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.maxlinenr = ' LN'
let g:airline_symbols.linenr = '☰'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0

let g:goyo_width = 150
let g:goyo_linenr = 1

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
nmap <space>e :CocCommand explorer<CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <leader>r <Plug>(coc-rename)
nmap <leader>d <Plug>(coc-definition)

command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!{node_modules,.git}" --color "always" '.shellescape(<q-args>), 1, <bang>0)

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

let g:indentLine_fileTypeExclude = [ 'startify', 'coc-explorer', 'fzf' ]
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

