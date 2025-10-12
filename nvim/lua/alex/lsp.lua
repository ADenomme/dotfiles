-- Mason setup
require("mason").setup()

-- Mason-LSP bridge
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright" },
}

-- Completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Optional: on_attach
local on_attach = function(_, _) end

-- Lua config
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- Python config
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Enable servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
