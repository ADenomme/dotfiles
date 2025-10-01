do
	require("nvim-treesitter.configs").setup {
	  -- Language parsers to install
	  ensure_installed = {
	    "lua", "python", "bash", "markdown", "vim", "json", "yaml", "html", "css", "javascript", "typescript"
	  },

	  -- Syntax highlighting
	  highlight = {
	    enable = true,
	    additional_vim_regex_highlighting = false,
	    disable = function(lang, buf)
	      local max_filesize = 100 * 1024 -- 100 KB
	      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	      return ok and stats and stats.size > max_filesize
	    end,
	  },

	  -- Smart indentation (optional)
	  indent = {
	    enable = true,
	    disable = { "yaml" }, -- YAML indentation is notoriously tricky
	  },

	  -- Auto-install missing parsers
	  auto_install = true,
	}
end

