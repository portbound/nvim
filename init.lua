require("autocommands")
require("diagnostics")
require("options")
require("keymaps")
require("theme")

vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')

vim.cmd('cnoreabbrev tq Tq')
vim.api.nvim_create_user_command("Tq", function()
	vim.cmd("tabclose")
end, {})
