return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"gopls",
				"templ",
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"emmet_ls",
			},
		})
	end,
}
