-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/emmet_ls.lua
return {
	cmd = { "emmet-ls", "--stdio" },
	filetypes = { "html", "css", "scss", "templ", "javascriptreact", "typescriptreact" },
	root_markers = { ".git" },
}
