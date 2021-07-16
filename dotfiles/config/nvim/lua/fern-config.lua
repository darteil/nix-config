function Fern_init()
  vim.api.nvim_exec(
  [[
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
  ]], false)
end

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
      for _, def in ipairs(definition) do
        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
        vim.api.nvim_command(command)
      end
    vim.api.nvim_command('augroup END')
  end
end

nvim_create_augroups({
  FernGroup = {
    {"FileType", "fern", [[lua Fern_init()]]};
  }
})
