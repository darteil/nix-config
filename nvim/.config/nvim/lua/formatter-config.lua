local prettier = function()
  return {
    exe = "./node_modules/prettier/bin-prettier.js",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
    stdin = true
  }
end

local luafmt = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

require("formatter").setup(
  {
    filetype = {
      javascript = {prettier},
      typescript = {prettier},
      javascriptreact = {prettier},
      typescriptreact = {prettier},
      json = {prettier},
      html = {prettier},
      css = {prettier},
      lua = {luafmt}
    }
  }
)

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.lua,*.jsx,*.tsx,*.json,*.html,*.css FormatWrite
augroup END
]],
  true
)
