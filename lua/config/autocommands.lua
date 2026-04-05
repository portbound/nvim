-- vim.api.nvim_create_autocmd('CmdlineEnter', {
-- 	pattern = '*',
-- 	callback = function()
-- 		require('lualine').hide({})
-- 		vim.cmd('highlight MsgArea guibg=#0f1117 gui=bold guisp=NONE')
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ 'CmdlineLeave', 'BufWinEnter' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		require('lualine').hide({ unhide = true })
-- 		vim.cmd('highlight MsgArea guibg=#161821 gui=bold guisp=NONE')
-- 	end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd(":clearjumps")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
