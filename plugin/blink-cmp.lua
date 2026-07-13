vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }, -- pinning to this version because rewrite requires rust toolchain
})

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
