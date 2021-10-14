require "FTerm".setup(
  {
    border = "single",
    dimensions = {
      height = 0.9,
      width = 0.9
    }
  }
)

vim.cmd('command! Terminal lua require("FTerm").open()')
