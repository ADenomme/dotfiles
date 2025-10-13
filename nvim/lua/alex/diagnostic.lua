vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or ">>", "→", etc.
    spacing = 2,
    severity = vim.diagnostic.severity.ERROR,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
