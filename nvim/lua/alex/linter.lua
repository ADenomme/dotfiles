local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    -- Ruff for Python linting
    null_ls.builtins.diagnostics.ruff.with {
      command = "ruff", -- ensure it's in your PATH
      args = { "--quiet", "--stdin-filename", "$FILENAME", "-" },
    },
  },
}
