local simple = {
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

return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			win = {
				input = {
					keys = {
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
			-- actions = {
			-- 	qflist = function(picker)
			-- 		picker:close()
			-- 		local sel = picker:selected()
			-- 		local items = #sel > 0 and sel or picker:items()
			--
			-- 		-- Build quickfix list entries
			-- 		local qf = {}
			-- 		for _, item in ipairs(items) do
			-- 			qf[#qf + 1] = {
			-- 				filename = Snacks.picker.util.path(item),
			-- 				bufnr = item.buf,
			-- 				lnum = item.pos and item.pos[1] or 1,
			-- 				col = item.pos and item.pos[2] + 1 or 1,
			-- 				end_lnum = item.end_pos and item.end_pos[1] or nil,
			-- 				end_col = item.end_pos and item.end_pos[2] + 1 or nil,
			-- 				text = item.line or item.comment or item.label or item.name or item.detail or item.text,
			-- 				pattern = item.search,
			-- 				type = ({ "E", "W", "I", "N" })[item.severity],
			-- 				valid = true,
			-- 			}
			-- 		end
			--
			-- 		-- Set quickfix list without opening the default window
			-- 		vim.fn.setqflist(qf)
			--
			-- 		-- Open with Snacks picker instead
			-- 		Snacks.picker.qflist()
			-- 	end,
			-- },
			reverse = true,
			layout = {
				layout = {
					box = "vertical",
					backdrop = false,
					row = -1,
					width = 0,
					height = 0.4,
					border = "top",
					title = " {title} {live} {flags}",
					title_pos = "left",
					{
						box = "horizontal",
						{ win = "list",    border = "rounded" },
						{ win = "preview", title = "{preview}", width = 0.6, border = false },
					},
					{ win = "input", height = 1, border = "rounded" },

				}
			}
		}
	},
	keys = {
		-- Explorer
		{
			"<leader><CR>",
			function()
				Snacks.picker.buffers({
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
			desc = "Explorer"
		},

		-- Search
		{ "<leader>sf", function() Snacks.picker.files({ layout = simple }) end,                                 desc = "[s]earch [f]iles" },
		{ "<leader>sg", function() Snacks.picker.grep({ layout = simple }) end,                                  desc = "[s]earch [g]rep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end,                                                desc = "[s]earch [w]ord",       mode = { "n", "x" } },
		{ "<leader>s.", function() Snacks.picker.recent({ layout = simple }) end,                                desc = "[s]earch [.]recent" },
		{ "<leader>sh", function() Snacks.picker.help() end,                                                     desc = "[s]earch [h]elp" },
		{ "<leader>sn", function() Snacks.picker.files({ layout = simple, cwd = vim.fn.stdpath("config") }) end, desc = "[s]earch [n]vim config" },

		-- Actions
		-- { "<leader>q",  function() Snacks.picker.qflist() end,                                                   desc = "Quickfix List" },
		{ "<leader>n",  function() Snacks.picker.notifications() end,                                            desc = "Notifications" },
		{ "<leader>d",  function() Snacks.picker.diagnostics() end,                                              desc = "Diagnostics" },
		{
			"<leader>:",
			function()
				Snacks.picker.command_history({
					items = items,
					format = "text",
					title = "Command History",
					preview = false,
					layout = {
						preset = false,
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0.4,
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "list",  border = "rounded" },
							{ win = "input", height = 1,        border = "rounded" },
						}
					}
				})
			end,
			desc = "Command History"
		},
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
					title = "Messages",
					preview = false,
					layout = {
						preset = false,
						layout = {
							box = "vertical",
							backdrop = false,
							row = -1,
							width = 0,
							height = 0.4,
							border = "top",
							title = " {title} {live} {flags}",
							title_pos = "left",
							{ win = "list",  border = "rounded" },
							{ win = "input", height = 1,        border = "rounded" },
						}
					}
				})
			end,
			desc = "Messages"
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
							{ win = "list",  title = "Buffer Lines", border = true },
							{ win = "input", height = 1,             border = true },
						},
					},
				})
			end,
			desc = "Fuzzy Search Buffer"
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
