vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })
local fzflua = require("fzf-lua")
fzflua.register_ui_select()
fzflua.setup({
	winopts = {
		split = "belowright new",
	}
})

-- search
vim.keymap.set("n", "<leader>sf", ":FzfLua files<CR>", { desc = "search files" })
vim.keymap.set("n", "<leader>sg", ":FzfLua live_grep<CR>", { desc = "live grep" })
vim.keymap.set("n", "<leader>sw", ":FzfLua grep_cword<CR>", { desc = "search word" })
vim.keymap.set("n", "<leader>s.", ":FzfLua history<CR>", { desc = "search history" })
vim.keymap.set("n", "<leader><CR>", ":FzfLua buffers<CR>", { desc = "search open buffers" })
vim.keymap.set("n", "<leader>sh", ":FzfLua helptags<CR>", { desc = "search help" })

-- diagnostics
vim.keymap.set("n", "<leader>d", ":FzfLua diagnostics_document<CR>", { desc = "diagnostics (document)" })
vim.keymap.set("n", "<leader>D", ":FzfLua diagnostics_workspace<CR>", { desc = "diagnostics (workspace)" })

-- LSP
vim.keymap.set("n", "<leader>ca", ":FzfLua lsp_code_actions winopts={preview={hidden=true}}<CR>",
	{ desc = "code actions" })
vim.keymap.set("n", "gd", ":FzfLua lsp_definitions<CR>", { desc = "goto definition" })
vim.keymap.set("n", "gD", ":FzfLua lsp_declarations<CR>", { desc = "goto declaration" })
vim.keymap.set("n", "gi", ":FzfLua lsp_implementations<CR>", { desc = "goto implementation" })
vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>", { desc = "goto references" })
vim.keymap.set("n", "gy", ":FzfLua lsp_typedefs<CR>", { desc = "goto typedef" })
vim.keymap.set("n", "gs", ":FzfLua lsp_document_symbols<CR>", { desc = "goto symbols (document)" })
vim.keymap.set("n", "gS", ":FzfLua lsp_workspace_symbols<CR>", { desc = "goto symbols (workspace)" })
