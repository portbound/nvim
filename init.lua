-- require("options")
-- require("keymaps")
-- require("autocmds")
-- require("diagnostics")
-- require("lua.theme.kanso")

require("autocommands")
require("diagnostics")
require("options")
require("keymaps")
require("theme")

vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")

vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
