return {
	"fnune/recall.nvim",
	version = "*",
	config = function()
		local recall = require("recall")

		recall.setup({
			sign = "",
			sign_highlight = "@string.escape",

			snacks = {
				mappings = {
					unmark_selected_entry = {
						normal = "<c-d>",
						insert = "<c-d>",
					},
				},
			},
		})

		vim.keymap.set("n", "mk", recall.toggle, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>sm", require("recall.snacks").pick, { noremap = true, silent = true })
	end
}
