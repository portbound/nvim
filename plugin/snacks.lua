local telescope = {
	reverse = true,
	layout = {
		box = "horizontal",
		backdrop = false,
		width = 0.999,
		height = 0.999,
		border = "none",
		{
			box = "vertical",
			{ win = "list", title = " Results ", title_pos = "center", border = true },
			{
				win = "input",
				height = 1,
				title = "{title} {live} {flags}",
				title_pos = "center",
				border = true,
			},
		},
		{
			win = "preview",
			title = "{preview:Preview}",
			width = 0.45,
			border = true,
			title_pos = "center",
		},
	},
}

local information = {
	layout = {
		box = "vertical",
		backdrop = false,
		row = -1,
		width = 0,
		border = false,
		{
			title = " {title} {live} {flags}",
			title_pos = "left",
			win = "list",
			border = "rounded",
		},
		{ win = "input", height = 1, border = "rounded" },
	},
}

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	picker = {
		sources = {
			select = {
				layout = information,
			},
			explorer = {
				win = {
					list = {
						wo = {
							number = true,
							relativenumber = true,
						},
					},
				},
			},
		},
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n", "i" } },
				},
			},
		},
		layout = {
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = false,
				{
					box = "horizontal",
					{
						title = " {title} {live} {flags}",
						title_pos = "left",
						win = "list",
						border = "rounded",
					},
					{ win = "preview", width = 0.6, border = "rounded" },
				},
				{ win = "input", height = 1, border = "rounded" },
			},
		},
	},
})

-- Explorer
vim.keymap.set("n", "<leader>e", function()
	Snacks.picker.explorer({
		win = {
			input = {
				keys = {
					["<Esc>"] = { "close", mode = { "n" } },
				},
			},
		},
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				width = 0.3,
				height = 0,
				border = "none",
				position = "left",
				{ win = "list", border = true },
				{ win = "input", height = 1, border = true },
			},
		},
	})
end, { desc = "Explorer" })

-- Search
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.files({ layout = telescope })
end, { desc = "[s]earch [f]iles" })

vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep({ layout = telescope })
end, { desc = "[s]earch [g]rep" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word({ layout = telescope })
end, { desc = "[s]earch [w]ord" })

vim.keymap.set("n", "<leader>s.", function()
	Snacks.picker.recent({ layout = telescope, limit = 15, filter = { cwd = true } })
end, { desc = "[s]earch [.]recent" })

vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help({
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				width = 0.6,
				height = 0.6,
				border = "none",
				{ win = "list", border = true },
				{ win = "input", height = 1, border = true },
			},
		},
	})
end, { desc = "[s]earch [h]elp" })

vim.keymap.set("n", "<leader>sn", function()
	Snacks.picker.files({
		layout = telescope,
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "[s]earch [n]vim config" })

vim.keymap.set("n", "<leader>f", function()
	Snacks.picker.lines({
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				width = 0.6,
				height = 0.6,
				border = "none",
				title = " {title} {live} {flags}",
				{
					title = "Fuzzy",
					title_pos = "left",
					win = "list",
					border = "rounded",
				},
				{ win = "list", border = true },
				{ win = "input", height = 1, border = true },
			},
		},
	})
end, { desc = "Fuzzy Search Buffer" })

-- Information
vim.keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications({
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = false,
				title = " {title} {live} {flags}",
				{
					title = "Notifications",
					title_pos = "left",
					win = "list",
					border = "rounded",
				},
				{ win = "input", height = 1, border = "rounded" },
			},
		},
	})
end, { desc = "Notifications" })

vim.keymap.set("n", "<leader>d", function()
	Snacks.picker.diagnostics({
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = false,
				title = " {title} {live} {flags}",
				{
					title = "Diagnostics",
					title_pos = "left",
					win = "list",
					border = "rounded",
				},
				{ win = "input", height = 1, border = "rounded" },
			},
		},
	})
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>:", function()
	Snacks.picker.command_history({ layout = information })
end, { desc = "Command History" })

vim.keymap.set("n", "<leader>m", function()
	local messages = vim.split(vim.fn.execute("messages"), "\n")

	local items = {}
	for i, msg in ipairs(messages) do
		if msg ~= "" then
			table.insert(items, {
				text = msg,
				idx = i,
			})
		end
	end

	Snacks.picker.pick({
		items = items,
		format = "text",
		preview = false,
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = false,
				title = " {title} {live} {flags}",
				{
					title = "Messages",
					title_pos = "left",
					win = "list",
					border = "rounded",
				},
				{ win = "input", height = 1, border = "rounded" },
			},
		},
	})
end, { desc = "Messages" })

vim.keymap.set("n", "<leader><CR>", function()
	Snacks.picker.buffers({
		layout = {
			preset = false,
			layout = {
				box = "vertical",
				backdrop = false,
				row = -1,
				width = 0,
				height = 0.4,
				border = false,
				title = " {title} {live} {flags}",
				{
					title = "Active Buffers",
					title_pos = "left",
					win = "list",
					border = "rounded",
				},
				{ win = "input", height = 1, border = "rounded" },
			},
		},

		win = {
			input = {
				keys = {
					["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
				},
			},
		},
	})
end, { desc = "Buffers" })

-- LSP
vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })

vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })

vim.keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })

vim.keymap.set("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })

vim.keymap.set("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })

vim.keymap.set("n", "gai", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "C[a]lls Incoming" })

vim.keymap.set("n", "gao", function()
	Snacks.picker.lsp_outgoing_calls()
end, { desc = "C[a]lls Outgoing" })

vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })

vim.keymap.set("n", "<leader>sD", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })
