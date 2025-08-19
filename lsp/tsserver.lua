-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ts_ls.lua
return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { ".git", "package.json", "tsconfig.json", "jsconfig.json" },
	settings = {},
}
