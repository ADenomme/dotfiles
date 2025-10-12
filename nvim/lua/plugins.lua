require("lazy").setup({
  -- Core LSP setup
  {
    "williamboman/mason-lspconfig.nvim",
    version = "*"
  },
  { "williamboman/mason.nvim" },
  { "neovim/nvim-lspconfig" },

  -- Optional: Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Color schemes
  { "Mofiqul/vscode.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = "Telescope",
    config = function()
      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
          ["ui-select"] = require("telescope.themes").get_dropdown {},
        },
      }
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },
  -- Rainbow parentheses
  {
    "hiphish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {

    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "black" },
          lua = { "stylua" },
          javascript = { "prettier" },
          json = { "prettier" },
          markdown = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  }
}
)
