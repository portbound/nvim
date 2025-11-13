return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					}
				}
			},
			reverse = true,
			layout = {
				preset = "default",
				layout = {
					box = "horizontal",
					backdrop = false,
					width = 0.999,
					height = 0.999,
					border = "none",
					{
						box = "vertical",
						{ win = "list",  title = " Results ", title_pos = "center", border = true },
						{ win = "input", height = 1,          border = true,        title = "{title} {live} {flags}", title_pos = "center" },
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.55,
						border = true,
						title_pos = "center",
					},
				},
			},
		}
	},
	keys = {
		-- Search
		{ "<leader>sf", function() Snacks.picker.smart() end, desc = "[s]earch [f]iles" },
		{ "<leader>sg", function() Snacks.picker.grep() end,  desc = "[s]earch [g]rep" },
		{
			"<leader>sw",
			function() Snacks.picker.grep_word() end,
			desc = "[s]earch [w]ord",
			mode = { "n", "x" }
		},
		{ "<leader>s.",   function() Snacks.picker.recent() end,                                  desc = "[s]earch [.]recent" },
		{ "<leader>sh",   function() Snacks.picker.help() end,                                    desc = "[s]earch [h]elp" },
		{ "<leader>sd",   function() Snacks.picker.diagnostics() end,                             desc = "[s]earch [d]iagnostics" },
		{ "<leader>sn",   function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[s]earch [n]vim config" },

		-- Actions
		{ "<leader><CR>", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
		{
			"<leader>e",
			function()
				Snacks.picker.explorer({
					win = {
						input = {
							keys = {
								["<Esc>"] = { "close", mode = { "n" } },
							}
						}
					},
					layout = {
						preset = false, -- disable preset so we can define custom layout
						layout = {
							box = "vertical",
							width = 0.3, -- 30% of the editor width
							height = 1.0, -- full height
							border = "none",
							position = "left", -- aligns to the left
							{ win = "list",  title = "Explorer", border = true },
							{ win = "input", height = 1,         border = true },
						},
					},
				})
			end,
			desc = "File Explorer"
		},
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Cmd History" },
		{ "<leader>q", function() Snacks.picker.qflist() end,          desc = "Quickfix List" },
		{ "<leader>n", function() Snacks.picker.notifications() end,   desc = "Notifications" },
		{
			"<leader>f",
			function()
				Snacks.picker.lines({
					layout = {
						preset = false, -- disable using a named preset
						layout = { -- your custom box model
							box = "vertical",
							width = 0.6, -- 40% width of editor
							height = 0.6, -- 40% height of editor
							border = "none",
							{ win = "list",  title = "Buffer Lines", border = true },
							{ win = "input", height = 1,             border = true },
						},
					},
				})
			end,
			desc = "[f] Fuzzily search in current buffer (small)"
		},

		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end,  desc = "Goto Definition" },
		{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		{
			"gr",
			function() Snacks.picker.lsp_references() end,
			nowait = true,
			desc = "References"
		},
		{ "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
		{ "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
		{ "gai",        function() Snacks.picker.lsp_incoming_calls() end,    desc = "C[a]lls Incoming" },
		{ "gao",        function() Snacks.picker.lsp_outgoing_calls() end,    desc = "C[a]lls Outgoing" },
		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	}
}
