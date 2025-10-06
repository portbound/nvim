return {
	-- "webhooked/kanso.nvim",
	-- priority = 1000,
	-- config = function()
	-- 	require('kanso').setup({
	-- 		transparent = true,
	-- 		colors = {
	-- 			palette = {
	-- 				def = "#8ba4b0",
	-- 				-- keyword = "#8989A7",
	-- 				fn = "#8989A7",
	-- 				-- fn = "#A78989",
	-- 			}
	-- 		},
	-- 		overrides = function(colors)
	-- 			return {
	-- 				-- ['@keyword'] = { fg = colors.palette.keyword },
	-- 				['@function'] = { fg = colors.palette.fn },
	-- 				['@function.call'] = { fg = colors.palette.def },
	-- 				['@function.builtin'] = { fg = colors.palette.def },
	-- 				['@function.method'] = { fg = colors.palette.fn },
	-- 				['@function.method.call'] = { fg = colors.palette.def },
	-- 				-- ['@type'] = { fg = colors.palette.tp }
	-- 			}
	-- 		end
	-- 	})
	-- 	vim.cmd.colorscheme("kanso")
	-- end
	"vague2k/vague.nvim",
	priority = 1000,
	config = function()
		require("vague").setup({
			comments = "italic",
			transparent = true,
			style = {
				style = {},
			},
		})
		vim.cmd.colorscheme("vague")
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0A363", bold = true })
	end,
}
