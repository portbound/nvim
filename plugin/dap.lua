vim.pack.add({
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/mfussenegger/nvim-dap",
})

require("dapui").setup()

local dapgo = require("dap-go")
dapgo.setup()
vim.keymap.set("n", "<leader>tt", function()
	dapgo.debug_test()
end, { desc = "Debug Test" })

local dap = require("dap")
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end, { desc = "Start/Continue" })

vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end, { desc = "Step Into" })

vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end, { desc = "Step Out" })

vim.keymap.set("n", "<F8>", function()
	dap.terminate()
end, { desc = "Stop/Terminate" })

vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end, { desc = "Debug: Toggle Breakpoint" })

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
	    Stopped = "",
    }

for type, icon in pairs(breakpoint_icons) do
	local tp = "Dap" .. type
	local hl = (type == "Stopped") and "DapStop" or "DapBreak"
	vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

dap.listeners.after.event_initialized["dapui_config"] = require("dapui").open
dap.listeners.before.event_terminated["dapui_config"] = require("dapui").close
dap.listeners.before.event_exited["dapui_config"] = require("dapui").close

dap.configurations.go = {
	{
		type = "go",
		name = "Debug current file", -- run current file
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
		name = "Attach to running process (PID)",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
	{
		type = "go",
		name = "Connect to headless Delve (:2345)",
		request = "attach",
		mode = "remote",
		host = "127.0.0.1",
		port = 2345,
	},
}
