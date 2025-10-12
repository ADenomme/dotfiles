require("telescope").setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { preview_width = 0.6 },
    },
    sorting_strategy = "ascending",
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "ivy",
    },
  },
}
