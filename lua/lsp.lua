vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/j-hui/fidget.nvim"
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})


vim.api.nvim_create_autocmd("LspAttach", {
	vim.lsp.buf.hover(),
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			if client.name == "gopls" then
				client.server_capabilities.semanticTokensProvider = nil
			end

			map("K", function()
				vim.lsp.buf.hover()
			end, "Hover Documentation")

			-- native completions but using blink cmp instead
			-- if client:supports_method("textDocument/completion") then
			-- 	vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
			-- end

			if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "[T]oggle Inlay [H]ints")
			end

			if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
				-- if client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
				local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

				-- When cursor stops moving: Highlights all instances of the symbol under the cursor
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				-- When cursor moves: Clears the highlighting
				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				-- When LSP detaches: Clears the highlighting
				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({
							group = "lsp-highlight",
							buffer = event2
							    .buf
						})
					end,
				})
			end
		end
	end
})

vim.cmd("set completeopt+=noselect")
