return {
	'echasnovski/mini.nvim',
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup({
			mappings = {
				add = "sa", -- Add surrounding
				delete = "sd", -- Delete surrounding
				replace = "sr", -- Change surrounding (was `sr`)
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				update_n_lines = "sn", -- Update `n_lines`
			},
		})
		require("mini.comment")
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end

}
