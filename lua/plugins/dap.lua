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


		-- require("nvim-dap-virtual-text").setup()

		-- Install golang specific config
		require("dap-go").setup({
			delve = {
				path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "/home/linuxbrew/.linuxbrew/bin/dlv",
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})

		-- Override dap configs in picker
		dap.configurations.go = {
			{
				type = "go",
				name = "Delve: Debug", -- run current file
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Delve: Debug Package", -- run entire directory (like go run .)
				request = "launch",
				program = "${fileDirname}",
			},
			{
				type = "go",
				name = "Delve: Debug Test",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
			},
			{
				-- format as -test.run TestHeadersParse/Empty_input
				type = "go",
				name = "Delve: Debug Subtest",
				request = "launch",
				mode = "test",
				program = "${fileDirname}",
				args = function()
					return vim.split(vim.fn.input("Test args: "), " ")
				end,
			},
			{
				type = "go",
				name = "Delve: Debug All Tests (Module)",
				request = "launch",
				mode = "test",
				program = "${workspaceFolder}", -- must be root of the module (where go.mod lives)
			},
			{
				type = "go",
				name = "Delve: Attach", -- attach to a running process
				request = "attach",
				processId = require("dap.utils").pick_process,
				-- Optionally, restrict to a specific mode or port:
				-- port = 38697,
			},
		}
	end,
}
