-- Set leader
vim.g.mapleader = " "

-- Yank to system clipboard with ys
-- Yank to system clipboard with 'ys'
vim.keymap.set("n", "ys", '"+yy', { noremap = true, silent = true, desc = "Yank line to system clipboard" })
vim.keymap.set("v", "ys", '"+y', { noremap = true, silent = true, desc = "Yank selection to system clipboard" })

-- Yank :messages to system clipboard
vim.keymap.set("n", "<leader>cm", function()
  vim.cmd("redir @a")
  vim.cmd("silent messages")
  vim.cmd("redir END")
  vim.cmd("new")
  vim.cmd("put a")
  vim.cmd("%y+")
  vim.notify("Copied :messages to clipboard", vim.log.levels.INFO)
end, { desc = "Copy :messages to clipboard" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

-- format
vim.keymap.set("n", "<leader>fmt", function()
  vim.cmd("!black %")
  vim.cmd("edit!") -- reload buffer after formatting
end, { desc = "Format with Black" })
