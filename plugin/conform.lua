vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "golines", "gofmt" },
		-- java = { "google-java-format" }
		java = { "spring-javaformat" },
	},
	format_on_save = {
		lsp_format = true,
		async = false,
	},
})

vim.keymap.set("n", "<leader>k", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Open parent directory" })
