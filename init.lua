require("lsp")
require("git")
require("autocommands")
require("diagnostics")
require("options")
require("keymaps")
require("colorscheme")

vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')

vim.cmd('cnoreabbrev tq Tq')
vim.api.nvim_create_user_command("Tq", function()
	vim.cmd("tabclose")
end, {})

vim.highlight.priorities.semantic_tokens = 90
require('vim._core.ui2').enable({
	enable = true, -- Whether to enable or disable the UI.
	msg = {        -- Options related to the message module.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds, triggers and IDs to a target.
		---Table keys are matched as a Lua pattern to the message ID. 'default'
		---mapping applies to any omitted kind: { default = 'cmd', progress = 'msg' }.
		targets = 'cmd',
		dialog = {        -- Options related to dialog window.
			height = 0.5,   -- Maximum height.
		},
		msg = {           -- Options related to msg window.
			height = 0.5,   -- Maximum height.
		},
		pager = {         -- Options related to message window.
			height = 0.999, -- Maximum height.
		},
	},
})
