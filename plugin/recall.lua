vim.pack.add({ "https://github.com/fnune/recall.nvim" })
require("recall").setup({
	sign = "",
	sign_highlight = "Error",
})
vim.keymap.set("n", "mk", require("recall").toggle, { noremap = true, silent = true })
