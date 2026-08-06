vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }, -- pinning to this version because rewrite requires rust toolchain
})


vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#202020" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#171717", fg = "#a2b5c1" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#202020" })

require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		menu = {
			scrolloff = 1,
			draw = {
				columns = {
					{ "kind_icon" },
					{ "label",      "label_description", gap = 1 },
					{ "kind" },
					{ "source_name" },
				},
			},
		},
		documentation = {
			auto_show = true,
		},
	},
})
