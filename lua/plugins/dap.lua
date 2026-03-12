return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"leoluz/nvim-dap-go",

		-- Shows variable balues inline as virtual text
		-- "theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<F8>",
			function()
				require("dap").terminate()
			end,
			desc = "Debug: Terminate Session",
		},
		{
			"<leader>b",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>B",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
		local breakpoint_icons = vim.g.have_nerd_font
		    and {
			    Breakpoint = "",
			    BreakpointCondition = "",
			    BreakpointRejected = "",
			    LogPoint = "",
			    Stopped = "",
		    }
		    or {
			    Breakpoint = "●",
			    BreakpointCondition = "⊜",
			    BreakpointRejected = "⊘",
			    LogPoint = "◆",
			    Stopped = "⭔",
		    }
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		require("dap-go").setup({
			delve = {
				path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "/usr/bin/dlv",
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})

		local function get_go_tests(bufnr)
			local ok, parser = pcall(require("nvim-treesitter.parsers").get_parser, bufnr, "go")
			if not ok or not parser then
				return {}
			end
			local tree = parser:parse()[1]
			local root = tree:root()

			local query = vim.treesitter.query.parse(
				"go",
				[[
					(function_declaration
						name: (identifier) @test_name
						(#match? @test_name "^Test"))

					(call_expression
						function: (selector_expression
							operand: (identifier) @obj
							field: (field_identifier) @method
							(#eq? @obj "t")
							(#eq? @method "Run"))
						arguments: (argument_list
							[(interpreted_string_literal) (raw_string_literal)] @subtest_name))
				]]
			)

			local tests = {}
			local seen = {}

			local function get_node_text(node)
				return vim.treesitter.get_node_text(node, bufnr):gsub('["`]', "")
			end

			local function find_parent_test(node)
				local curr = node:parent()
				while curr do
					if curr:type() == "function_declaration" then
						local name_node = curr:field("name")[1]
						if name_node then
							local name = get_node_text(name_node)
							if name:match("^Test") then
								return name
							end
						end
					elseif curr:type() == "call_expression" then
						local fn = curr:field("function")[1]
						if fn and fn:type() == "selector_expression" then
							local op = fn:field("operand")[1]
							local field = fn:field("field")[1]
							if op and field and get_node_text(op) == "t" and get_node_text(field) == "Run" then
								local args = curr:field("arguments")[1]
								if args then
									local first_arg = args:named_child(0)
									if
									    first_arg
									    and (
										    first_arg:type() == "interpreted_string_literal"
										    or first_arg:type() == "raw_string_literal"
									    )
									then
										local parent_sub = find_parent_test(curr)
										if parent_sub then
											return parent_sub ..
											    "/" ..
											    get_node_text(first_arg)
										end
									end
								end
							end
						end
					end
					curr = curr:parent()
				end
				return nil
			end

			for id, node, _ in query:iter_captures(root, bufnr, 0, -1) do
				local capture_name = query.captures[id]
				if capture_name == "test_name" then
					local name = get_node_text(node)
					if not seen[name] then
						table.insert(tests, name)
						seen[name] = true
					end
				elseif capture_name == "subtest_name" then
					local subtest = get_node_text(node)
					local parent_name = find_parent_test(node)
					if parent_name then
						local full_name = parent_name .. "/" .. subtest
						if not seen[full_name] then
							table.insert(tests, full_name)
							seen[full_name] = true
						end
					end
				end
			end
			return tests
		end

		-- Override dap configs in picker
		dap.configurations.go = {
			{
				type = "go",
				name = "Debug: Program", -- run current file
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug: Tests (Package)",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
			},
			{
				type = "go",
				name = "Debug: Tests (Module)",
				request = "launch",
				mode = "test",
				program = "${workspaceFolder}",
			},
			{
				type = "go",
				name = "Debug: Subtest",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
				args = function()
					local bufnr = vim.api.nvim_get_current_buf()
					local tests = get_go_tests(bufnr)
					table.insert(tests, 1, "Manual input...")

					-- Return a coroutine for asynchronous selection
					return coroutine.create(function(dap_run_co)
						vim.schedule(function()
							vim.ui.select(tests, {
								prompt = "Select subtest to debug:",
							}, function(choice)
								if not choice then
									-- Cancel the launch
									coroutine.resume(dap_run_co, nil)
								elseif choice == "Manual input..." then
									vim.ui.input({ prompt = "Test regex: " },
										function(input)
											if input and input ~= "" then
												coroutine.resume(
													dap_run_co,
													{ "-test.run",
														input })
											else
												coroutine.resume(
													dap_run_co, nil)
											end
										end)
								else
									-- Use exact match regex for the selected test
									coroutine.resume(dap_run_co,
										{ "-test.run", "^" .. choice .. "$" })
								end
							end)
						end)
					end)
				end,
			},
			{
				type = "go",
				name = "Delve: Attach",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},

		}
	end,
}
