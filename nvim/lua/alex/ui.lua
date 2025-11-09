vim.diagnostic.config({ signs = false, })
vim.o.number         = true
vim.o.relativenumber = true
vim.o.tabstop        = 2
vim.o.shiftwidth     = 2
vim.o.expandtab      = true
vim.o.textwidth      = 100

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

-- Function to set color scheme based on name
function SetColorScheme(name)
  vim.o.background = 'dark' -- default background

  if name == 'tokyo-night' then
    vim.cmd('colorscheme tokyonight')
  elseif name == 'vscode' then
    require('vscode').setup({
      transparent = true,
      italic_comments = true,
      terminal_colors = true,
    })
    vim.cmd('colorscheme vscode')
  else
    vim.notify('Color scheme "' .. name .. '" not recognized', vim.log.levels.ERROR)
  end
end

SetColorScheme('vscode')
