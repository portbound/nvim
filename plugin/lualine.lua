vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

local custom_theme = require('lualine.themes.auto')

custom_theme.visual.a = {
	bg = '#B4BE82',
	fg = 'black',
	gui = 'bold',
}

custom_theme.normal.b = {
	bg = '#171717',
	fg = '#a2b5c1'
}
custom_theme.normal.c = {
	bg = '#202020',
	fg = '#e1e1e1'
}

require("lualine").setup({
	options = {
		-- theme = "iceberg",
		theme = custom_theme,
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
