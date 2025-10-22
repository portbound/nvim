vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>sm", "<cmd>:mes<CR>", { desc = "[S]how [M]essages" })
vim.keymap.set("n", "<leader>cc", "gcc", { remap = true, desc = "Comment Line" })

vim.keymap.set("n", "L", "$", { desc = "Jump to EOL" })
vim.keymap.set("n", "H", "^", { desc = "Jump to SOL" })

vim.keymap.set("n", "<leader>ot", function()
		vim.cmd.vnew()
		vim.cmd.term()
		vim.cmd.wincmd("J")
		vim.api.nvim_win_set_height(0, 10)
		vim.cmd.startinsert()
	end,
	{ desc = "[O]pen [T]erminal" })

vim.keymap.set("n", "<leader>th", function()
	vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#808080", bg = "NONE", italic = true })
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "[T]oggle Inlay [H]ints" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
