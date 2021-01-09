"=================================================
" FZF settings
"=================================================
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

let g:fzf_layout = { 'window': {'width': 1, 'height': 1, 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS='--reverse'

command! -bang -nargs=* Rg call fzf#vim#grep('rg
  \ --column
  \ --line-number
  \ --no-heading
  \ --ignore-case
  \ --hidden
  \ --fixed-strings
  \ --color "always"
  \ --glob "!{node_modules,.git,package-lock.json}" '
  \ .shellescape(<q-args>), 1, fzf#vim#with_preview({"options": "--delimiter : --nth 4.."}, "down:60%"), <bang>0
\)

