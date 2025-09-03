return {
	'echasnovski/mini.nvim',
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.comment")
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
	end

}
