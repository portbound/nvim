return {
	"fnune/recall.nvim",
	version = "*",
	config = function()
		local recall = require("recall")

		recall.setup({
			sign = "",
			sign_highlight = "@comment.error",

			telescope = {
				mappings = {
					unmark_selected_entry = {
						normal = "<c-d>",
						insert = "<c-d>",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>mm", recall.toggle, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>mn", recall.goto_next, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>mp", recall.goto_prev, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>mc", recall.clear, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>sm", ":Telescope recall theme=ivy<CR>", { noremap = true, silent = true })
	end
}
