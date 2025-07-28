return {
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


