vim.pack.add({ "https://github.com/webhooked/kanso.nvim" })
vim.cmd.colorscheme("kanso")
local module = "#c5c9c7"
local primative = "#c4b28a"
local special = "#b68c7b"
local func = "#6a9589"
local type = "#a292a3"
local member = "#c5c9c7"
local keyword = "#6e94b2"
require("kanso").setup({
	transparent = true,
	overrides = function()
		return {
			["@module"] = { fg = module },

			String = { fg = primative },
			Number = { fg = primative },
			DapBreak = { fg = "#c34043" },
			DapStop = { fg = "#dca561" },

			Special = { fg = special },
			["@boolean"] = { fg = special },
			["@constant"] = { fg = special },
			["@string.escape"] = { fg = special },

			Type = { fg = type },
			["@type.builtin"] = { fg = type },

			["@property"] = { fg = member },
			["@variable.parameter"] = { fg = member },
			["@variable.member"] = { fg = member },

			Keyword = { fg = keyword, italic = false },
			["@keyword.function"] = { fg = keyword },
			["@keyword.conditional"] = { fg = keyword },
			["@keyword.return"] = { fg = keyword, italic = false },
			["@keyword.import"] = { fg = keyword, italic = false },
			["@keyword.coroutine"] = { fg = keyword, italic = false },

			["@function"] = { fg = func, bold = true },
			["@function.builtin"] = { fg = func, bold = false },
			["@function.call"] = { fg = func, bold = false },
			["@function.method"] = { fg = func, bold = true },
			["@function.method.call"] = { fg = func, bold = false },
			["@constructor"] = { fg = func, bold = false },
		}
	end,
})
