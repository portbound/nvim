-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/cssls.lua
return {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { ".git", "package.json", "style.css" },
	settings = {},
}
