-- Mason setup
require("mason").setup()

-- Mason-LSP bridge
require("mason-lspconfig").setup {
  ensure_installed = { "pyright", "lua_ls" },
}

-- Enable servers

local servers = { "pyright", "lua_ls" }

for _, server in ipairs(servers) do
  vim.lsp.enable(server, {
    settings = server == "lua_ls" and {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    } or nil,
  })
end
