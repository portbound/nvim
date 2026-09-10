vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/stevearc/oil.nvim",
})
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = { ["<Esc>"] = { "actions.close", mode = "n" } },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

