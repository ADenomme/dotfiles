vim.diagnostic.config({ signs = false, })
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Color scheme
vim.o.background = 'dark' -- dark / light
require('vscode').setup({

  -- transparent mode
  transparent = true,

  -- Comments
  italic_commments = true,

  -- Apply colors to terminal
  terminal_colors = true


})
vim.cmd.colorscheme "vscode"
