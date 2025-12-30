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
			{ win = "list",  title = " Results ", title_pos = "center",             border = true },
			{ win = "input", height = 1,          title = "{title} {live} {flags}", title_pos = "center", border = true },
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
		height = 0.4,
		-- position = "bottom",
		border = false,
		{
			title = " {title} {live} {flags}",
			title_pos = "left",
			win = "list",
			border = "rounded"
		},
		{ win = "input", height = 1, border = "rounded" },
	}
}

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		-- code_actions_handler = "default",
		picker = {
			-- ui_select = false,
			-- preview = false,
			sources = {
				select = {
					-- preview = false, -- No preview for ui.select
					layout = {
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0,
							border = false,
							{
								title = " {title} {live} {flags}",
								title_pos = "left",
								win = "list",
								border = "rounded"
							},
							{ win = "input", height = 1, border = "rounded" },
						}
					}
				},
				explorer = {
					win = {
						list = {
							wo = {
								number = true,
								relativenumber = true,
							}
						}
					}
				}
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
			-- reverse = true,
			layout = {
				layout = {
					box = "vertical",
					backdrop = false,
					row = -1,
					width = 0,
					height = 0.4,
					-- position = "bottom",
					border = false,
					{
						box = "horizontal",
						{
							title = " {title} {live} {flags}",
							title_pos = "left",
							win = "list",
							border = "rounded"
						},
						{ win = "preview", width = 0.6, border = "rounded" },
					},
					{ win = "input", height = 1, border = "rounded" },
				}
			}
		}
	},
	keys = {
		-- Explorer
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
							{ win = "list",  border = true },
							{ win = "input", height = 1,   border = true },
						},
					},
				})
			end,
			desc = "Explorer"
		},

		-- Search
		{ "<leader>sf", function() Snacks.picker.files({ layout = telescope }) end,                                       desc = "[s]earch [f]iles" },
		{ "<leader>sg", function() Snacks.picker.grep({ layout = telescope }) end,                                        desc = "[s]earch [g]rep" },
		{ "<leader>sw", function() Snacks.picker.grep_word({ layout = telescope }) end,                                   desc = "[s]earch [w]ord",   mode = { "n", "x" } },
		{ "<leader>s.", function() Snacks.picker.recent({ layout = telescope, limit = 15, filter = { cwd = true } }) end, desc = "[s]earch [.]recent" },
		{ "<leader>sh", function() Snacks.picker.help({ layout = information }) end,                                      desc = "[s]earch [h]elp" },
		{
			"<leader>sn",
			function()
				Snacks.picker.files({
					layout = telescope,
					cwd = vim.fn.stdpath("config")
				})
			end,
			desc = "[s]earch [n]vim config"
		},
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
							{ win = "list",  border = true },
							{ win = "input", height = 1,   border = true },
						},
					},
				})
			end,
			desc = "Fuzzy Search Buffer"
		},

		-- Information
		{ "<leader>n", function() Snacks.picker.notifications({ layout = information }) end,   desc = "Notifications" },
		{ "<leader>d", function() Snacks.picker.diagnostics({ layout = information }) end,     desc = "Diagnostics" },
		{ "<leader>:", function() Snacks.picker.command_history({ layout = information }) end, desc = "Command History" },
		{
			"<leader>m",
			function()
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
								border = "rounded"
							},
							{ win = "input", height = 1, border = "rounded" },
						}
					}
				})
			end,
			desc = "Messages"
		},
		{
			"<leader><CR>",
			function()
				Snacks.picker.buffers({
					layout = information,

					win = {
						input = {
							keys = {
								["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
							},
						},
					}
				})
			end,
			desc = "Buffers"
		},

		-- LSP
		{ "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
		{ "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
		{ "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = "References" },
		{ "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
		{ "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition" },
		{ "gai",        function() Snacks.picker.lsp_incoming_calls() end,    desc = "C[a]lls Incoming" },
		{ "gao",        function() Snacks.picker.lsp_outgoing_calls() end,    desc = "C[a]lls Outgoing" },
		{ "<leader>sd", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
		{ "<leader>sD", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
	}
}
