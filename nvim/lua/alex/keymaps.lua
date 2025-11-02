-- Set leader
vim.g.mapleader = " "

-- Yank to system clipboard with ys
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

-- Clear highlighting in editor :roh
-- e.g., gd
vim.keymap.set("n", "<leader>hc", "<cmd>noh", { noremap = true, silent = true, desc = "Clear current highlighting" })

-- Code Folding
-- Close current fold
vim.keymap.set("n", "<leader>fc", "zc", { desc = "Close fold" })
-- Open current fold
vim.keymap.set("n", "<leader>fo", "zo", { desc = "Open fold" })
-- Toggle fold under cursor
vim.keymap.set("n", "<leader>ft", "za", { desc = "Toggle fold" })
-- Close all folds
vim.keymap.set("n", "<leader>fC", "zM", { desc = "Close all folds" })
-- Open all folds
vim.keymap.set("n", "<leader>fO", "zR", { desc = "Open all folds" })


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
