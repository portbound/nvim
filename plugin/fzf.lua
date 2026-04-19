vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })
local fz = require("fzf-lua")
fz.setup({
	winopts = {
		fullscreen = true
	},
	marks = {
		marks = "^%a$"
	},
	actions = {
		files = {
			["default"] = function(selected, opts)
				if #selected > 1 then
					fz.actions.file_sel_to_qf(selected, opts)
					vim.cmd("cclose")
					fz.quickfix()
				else
					fz.actions.file_edit(selected, opts)
				end
			end,
			["alt-q"] = function(selected, opts)
				fz.actions.file_sel_to_qf(selected, opts)
				vim.cmd("cclose")
				fz.quickfix()
			end,
		},
	},
})

-- SEARCH --
vim.keymap.set("n", "<leader>sf", function()
	fz.files()
end, { desc = "search files", silent = true })

vim.keymap.set("n", "<leader>sn", function()
	fz.files({ cwd = '/home/portbound/.config/nvim/' })
end, { desc = "search nvim config" })

vim.keymap.set("n", "<leader>sg", function()
	fz.live_grep()
end, { desc = "search grep" })

vim.keymap.set("n", "<leader>sw", function()
	fz.grep_cword()
end, { desc = "search word" })

vim.keymap.set("n", "<leader>s.", function()
	fz.oldfiles()
end, { desc = "search history" })

vim.keymap.set("n", "<leader><CR>", function()
	fz.buffers()
end, { desc = "open buffers" })

vim.keymap.set("n", "<leader>sh", function()
	fz.helptags()
end, { desc = "search help" })

vim.keymap.set("n", "<leader>sq", function()
	fz.quickfix()
end, { desc = "search quickfix" })

-- DIAGNOSTICS --
vim.keymap.set("n", "<leader>d", function()
	fz.diagnostics_document({
		winopts = {
			split = "belowright new",
		}
	})
end, { desc = "diagnostics (document)" })

vim.keymap.set("n", "<leader>D", function()
	fz.diagnostics_document({
		winopts = {
			split = "belowright new",
		}
	})
end, { desc = "diagnostics (workspace)" })

-- LSP --	
vim.keymap.set("n", "<leader>ca", function()
	fz.lsp_code_actions({
		winopts = {
			preview = { hidden = true },
			split = "belowright new",
		}
	})
end, { desc = "code actions" })

vim.keymap.set("n", "gd", function()
	fz.lsp_definitions()
end, { desc = "goto definition" })

vim.keymap.set("n", "gD", function()
	fz.lsp_declarations()
end, { desc = "goto declaration" })

vim.keymap.set("n", "gi", function()
	fz.lsp_implementations()
end, { desc = "goto implementation" })

vim.keymap.set("n", "gr", function()
	fz.lsp_references()
end, { desc = "goto references" })

vim.keymap.set("n", "gy", function()
	fz.lsp_typdefs()
end, { desc = "goto typedef" })

vim.keymap.set("n", "gs", function()
	fz.lsp_document_symbols()
end, { desc = "goto symbols (document)" })

vim.keymap.set("n", "gS", function()
	fz.lsp_workspace_symbols()
end, { desc = "goto symbols (workspace)" })
