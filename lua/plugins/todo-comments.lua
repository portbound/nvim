return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }, -- Plenary is a required dependency
	config = function()
		require("todo-comments").setup({
			-- your configuration comes here
			-- see the Wiki for more information
			keywords = {
				TODO = { icon = " ", color = "warning" },
				NOTE = { icon = " ", color = "hint" },
			},
		})

		vim.keymap.set("n", "<leader>st", ":TodoQuickFix<CR>", { desc = "[s]earch [t]odos" })
	end,
}
