vim.pack.add({ "https://github.com/fnune/recall.nvim" })
require("recall").setup({
	sign = "",
	sign_highlight = "Error",

	snacks = {
		mappings = {
			unmark_selected_entry = {
				normal = "<c-d>",
				insert = "<c-d>",
			},
		},
	},
})
vim.keymap.set("n", "mk", require("recall").toggle, { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>sm",
	require("recall.snacks").pick,
	{ desc = "[s]earch [m]arks", noremap = true, silent = true }
)
