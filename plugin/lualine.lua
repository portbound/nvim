vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	options = {
		-- theme = "iceberg",
		disabled_filetypes = { statusline = {}, winbar = {} },
		section_separators = { "|", "|" }, -- Use a vertical bar
		component_separators = { " ", " " }, -- Use spaces
		refresh = {
			statusline = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
			},
		},

		lualine_x = { "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
