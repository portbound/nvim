-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/csharp_ls.lua
return {
	cmd = { "csharp-ls" },
	filetypes = { "cs" },
	root_markers = { "*.sln", "*.csproj", ".git" },
	settings = {
		csharp = {
			-- applyFormattingOptions = false, -- Uncomment and set to true to override .editorconfig
		},
	},
}
