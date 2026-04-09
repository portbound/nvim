vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>r", ":restart<CR>", { remap = true, desc = "Restart Nvim" })

vim.keymap.set("n", ">", ":cnext<CR>", { desc = "Quickfix Next" })
vim.keymap.set("n", "<", ":cprev<CR>", { desc = "Quickfix Prev" })

vim.keymap.set("n", "<leader>ot", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 10)
	vim.cmd.startinsert()
end, { desc = "[O]pen [T]erminal" })

vim.keymap.set("n", "<leader>th", function()
	vim.api.nvim_set_hl(0, "LspInlayHint", {
		fg = "#808080",
		bg = "NONE",
		italic = true,
	})
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "[T]oggle Inlay [H]ints" })

vim.keymap.set("n", "<leader>ut", ":UndoTree<CR>", { desc = "[U]ndo [T]ree" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- package management
vim.keymap.set("n", "<leader>pu", ":lua vim.pack.update()<CR>", { desc = "Pack Update" })
