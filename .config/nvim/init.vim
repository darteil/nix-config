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
Plug 'pangloss/vim-javascript'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

call plug#end()

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

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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

colorscheme gruvbox
set t_Co=256
let g:gruvbox_termcolors = 256
set encoding=UTF-8
set background=dark
set relativenumber
set rnu

syntax enable
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

nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-v> "+p
vnoremap <C-v> "+p

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
let g:coc_explorer_open_win = 'g:open_float_win_for_coc_explorer'
let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\ }
nmap <space>e :CocCommand explorer --preset floating<CR>

if !has('gui_running')
  set t_Co=256
endif

" startify ignore indentLine
let g:indentLine_fileTypeExclude = [ 'startify' ]

" startify 'Most Recent Files' number
let g:startify_files_number = 5

" startify update session automatically as you exit vim
let g:startify_session_persistence = 1

" simplify the startify list to just recent files and sessions
let g:startify_lists = [
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ ]

" startify custom header
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

