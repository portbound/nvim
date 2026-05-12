vim.pack.add({ "https://github.com/chentoast/marks.nvim" })
require("marks").setup({
	mappings = {
		set_next = "mk",
		delete_line = "dmk"
	}
})
