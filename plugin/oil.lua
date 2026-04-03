vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
})
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = { ["<Esc>"] = { "actions.close", mode = "n" } },
	float = {
		border = "rounded",
		max_width = 0.5,
		max_height = 0.6,
	},
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
