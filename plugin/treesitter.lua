vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "lua" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup()
require("nvim-treesitter").install(
	"bash",
	"c",
	"dockerfile",
	"json",
	"lua",
	"luadoc",
	"luap",
	"query",
	"regex",
	"vim",
	"vimdoc",
	"yaml",
	"go",
	"gomod",
	"gowork",
	"gosum"
)

require("nvim-treesitter-textobjects").setup()
-- Select
local select = require("nvim-treesitter-textobjects.select")
local textobjects = {
	["af"] = "@function.outer",
	["if"] = "@function.inner",
	["ac"] = "@class.outer",
	["ic"] = "@class.inner",
	["ai"] = "@conditional.outer",
	["ii"] = "@conditional.inner",
	["al"] = "@loop.outer",
	["il"] = "@loop.inner",
}

for key, query in pairs(textobjects) do
	vim.keymap.set({ "x", "o" }, key, function()
		select.select_textobject(query, "textobjects")
	end)
end

-- Move
local move = require("nvim-treesitter-textobjects.move")
local goto_next_start = {
	["]f"] = "@function.outer",
	["]c"] = "@class.outer",
	["]a"] = "@parameter.inner",
}

local goto_previous_start = {
	["[f"] = "@function.outer",
	["[c"] = "@class.outer",
	["[a"] = "@parameter.inner",
}

for key, query in pairs(goto_next_start) do
	vim.keymap.set({ "n", "x", "o" }, key, function()
		move.goto_next_start(query, "textobjects")
	end)
end

for key, query in pairs(goto_previous_start) do
	vim.keymap.set({ "n", "x", "o" }, key, function()
		move.goto_previous_start(query, "textobjects")
	end)
end

-- Swap
local swap = require("nvim-treesitter-textobjects.swap")
vim.keymap.set("n", "<leader>a", function()
	swap.swap_next("@parameter.inner")
end, { desc = "Swap next parameter" })

vim.keymap.set("n", "<leader>A", function()
	swap.swap_previous("@parameter.inner")
end, { desc = "Swap previous parameter" })
