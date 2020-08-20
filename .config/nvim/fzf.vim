"=================================================
" FZF settings
"=================================================
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

command! -bang -nargs=* Rg call fzf#vim#grep('rg
  \ --column
  \ --line-number
  \ --no-heading
  \ --fixed-strings
  \ --ignore-case
  \ --no-ignore
  \ --hidden
  \ --follow
  \ --glob "!{node_modules,.git,package-lock.json}"
  \ --color "always" '.shellescape(<q-args>), 1, <bang>0
\ )
