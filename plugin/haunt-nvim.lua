vim.pack.add({ "https://github.com/TheNoeTrevino/haunt.nvim" })

local haunt = require("haunt")
haunt.setup({
	sign = "󰓹",
	picker = "fzf",
	picker_keys = {
		delete = {
			key = "d",
			mode = { "n" },
		},
	}
})

vim.keymap.set("n", "mk", function()
	require("haunt.api").annotate()
end, { desc = "Add Mark" })

vim.keymap.set("n", "<leader>sm", function()
	require("haunt.picker").show()
end, { desc = "search marks" })
