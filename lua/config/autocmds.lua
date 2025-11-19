vim.api.nvim_create_autocmd('CmdlineEnter', {
	pattern = '*',
	callback = function()
		require('lualine').hide({})
		vim.cmd('highlight MsgArea guibg=#0f1117 gui=bold guisp=NONE')
	end,
})

vim.api.nvim_create_autocmd({ 'CmdlineLeave', 'BufWinEnter' }, {
	pattern = '*',
	callback = function()
		require('lualine').hide({ unhide = true })
		vim.cmd('highlight MsgArea guibg=#161821 gui=bold guisp=NONE')
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", function()
			vim.lsp.buf.hover({ border = 'rounded' })
		end, "Hover Documentation")
		map("gs", function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, "Signature Documentation")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- When cursor stops moving: Highlights all instances of the symbol under the cursor
			-- When cursor moves: Clears the highlighting
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
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
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
		-- Don't really use inlay hints but keeping in config just in case
		-- if
		-- 	client
		-- 	and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
		-- then
		-- 	map("<leader>th", function()
		-- 		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		-- 	end, "[T]oggle Inlay [H]ints")
		-- end
	end,

})
