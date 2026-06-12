-- VSCode-specific Neovim configuration
-- This file is loaded ONLY when vim.g.vscode == true

local M = {}

-- Options that make sense inside VSCode
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable vim UI preferences
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.signcolumn = "no"
vim.opt.cursorline = false

-- Disable built-in plugins that VSCode replaces
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1

-- VSCode-specific keymaps
-- call VSCode commands directly
local function map(mode, lhs, vscode_cmd, desc)
  vim.keymap.set(mode, lhs, function()
    vim.fn.VSCodeNotify(vscode_cmd)
  end, { desc = desc })
end

-- Navigation / LSP
map("n", "gd", "editor.action.revealDefinition", "Go to definition")
map("n", "gD", "editor.action.peekDefinition", "Peek definition")
map("n", "gr", "editor.action.goToReferences", "References")
map("n", "gi", "editor.action.goToImplementation", "Go to implementation")
map("n", "K", "editor.action.showHover", "Hover")

-- Formatting
map("n", "<leader>fmt", "editor.action.formatDocument", "Format document")

-- Rename
map("n", "<leader>rn", "editor.action.rename", "Rename symbol")

-- Search
map("n", "<leader>ff", "workbench.action.quickOpen", "Quick open")
map("n", "<leader>fg", "workbench.action.findInFiles", "Search in files")

-- VSCode-safe commands (no floating windows, no splits)
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", "<Cmd>quit<CR>", { desc = "Quit" })

return M
