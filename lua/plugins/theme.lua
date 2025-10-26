-- return {
-- 	"webhooked/kanso.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanso").setup({
-- 			transparent = true,
-- 			functionStyle = {
-- 				bold = true
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("kanso")
-- 	end
-- }

return {
	"vague2k/vague.nvim",
	priority = 1000,
	config = function()
		require("vague").setup({
			comments = "italic",
			transparent = true,
		})
		vim.cmd.colorscheme("vague")
		-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0A363", bold = true })
	end,
}
