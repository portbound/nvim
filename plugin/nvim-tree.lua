vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })
local nvimTree = require("nvim-tree")
nvimTree.setup()

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Open Tree View" })
