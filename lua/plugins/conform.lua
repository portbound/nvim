return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>k",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				html = { "prettier" },
				lua = { "stylua" },
				go = { "goimports", "golines", "gofmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
