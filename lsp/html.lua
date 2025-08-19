--https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua
return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ" },
	root_markers = { ".git", "package.json", "index.html" },
	settings = {},
}
