vim.diagnostic.config({ signs = false, })
vim.o.number         = true
vim.o.relativenumber = true
vim.o.tabstop        = 2
vim.o.shiftwidth     = 2
vim.o.expandtab      = true
vim.o.textwidth       = 100

-- Code folding
vim.o.foldmethod     = "expr"
vim.o.foldexpr       = "nvim_treesitter#foldexpr()"
vim.o.foldtext       = "v:lua.custom_fold_text()"
vim.o.foldlevel      = 99
vim.o.foldenable     = true
vim.o.foldcolumn     = "1"

vim.opt.fillchars:append({
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
})

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart):gsub("^%s+", "")
  local lines_count = vim.v.foldend - vim.v.foldstart + 1
  local max_width = 60
  if #line > max_width then
    line = line:sub(1, max_width) .. "…"
  end
  return string.format("  %s  ⸱ %d lines ", line, lines_count)
end

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
