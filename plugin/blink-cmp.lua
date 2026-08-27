vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }, -- pinning to this version because rewrite requires rust toolchain
})

vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#202020" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#bad7ff", bg = "#404040" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#404040" })

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
	},
	signature = { enabled = true },
	completion = {
		menu = {
			border = "none",
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
			-- window = { border = "rounded", },
			-- auto_show = true,
		},
	},
	fuzzy = {
		sorts = {
			function(a, b)
				local types = require('blink.cmp.types').CompletionItemKind
				local function is_member_field(item)
					return item.kind == types.Field or item.kind == types.Property
				end
				local a_is_field = is_member_field(a)
				local b_is_field = is_member_field(b)
				if a_is_field == b_is_field then return end
				return a_is_field
			end,
			'score',
			'sort_text',
		},
	}
})
