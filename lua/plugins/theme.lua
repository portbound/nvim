-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({})
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end
-- }
--

return {
	"webhooked/kanso.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanso").setup({
			overrides = function(colors)
				return {
					["@module"] = { fg = "#c5c9c7" },
					-- ["@constructor"] = { fg = "#8ba4b0" },
					["@variable.member"] = { fg = "#b4d4cf" },
					["@property"] = { fg = "#b4d4cf" },
					["@string.escape"] = { fg = "#c4b28a" },
					Number = { fg = "#c4b28a" },
					Type = { fg = "#6e94b2" },
					["@type.builtin"] = { fg = "#6e94b2" },
					["@variable.parameter"] = { fg = "#c4b28a" },
					Keyword = { fg = "#a292a3" },
					["@keyword.return"] = { fg = "#a292a3" },
					["@function"] = { fg = "#6a9589", bold = true },
					["@function.builtin"] = { fg = "#6a9589", bold = false },
					["@function.call"] = { fg = "#6a9589", bold = false },
					["@function.method"] = { fg = "#6a9589", bold = true },
					["@function.method.call"] = { fg = "#6a9589", bold = false },
					["@constructor"] = { fg = "#6a9589", bold = false },
				}
			end,
		})
		vim.cmd.colorscheme("kanso")
	end
}

-- return {
-- 	"vague2k/vague.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("vague").setup({})
-- 		vim.cmd.colorscheme("vague")
-- 	end,
-- }

-- return {
-- 	"vague2k/vague.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("vague").setup({
-- 			comments = "italic",
-- 			transparent = true,
-- 			-- Override colors
-- 			style = {
-- 				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
-- 				boolean = "bold",
-- 				number = "none",
-- 				float = "none",
-- 				error = "bold",
-- 				comments = "italic",
-- 				conditionals = "none",
-- 				functions = "none",
-- 				headings = "bold",
-- 				operators = "none",
-- 				strings = "italic",
-- 				variables = "none",
--
-- 				-- keywords
-- 				keywords = "none",
-- 				keyword_return = "none",
-- 				keywords_loop = "none",
-- 				keywords_label = "none",
-- 				keywords_exception = "none",
--
-- 				-- builtin
-- 				builtin_constants = "none",
-- 				builtin_functions = "none",
-- 				builtin_types = "none",
-- 				builtin_variables = "none",
-- 			},
-- 			colors = {
-- 				bg = "#141415",
-- 				inactiveBg = "#1c1c24",
-- 				fg = "#cdcdcd",
-- 				floatBorder = "#878787",
-- 				line = "#252530",
-- 				comment = "#606079",
-- 				builtin = "#bb9dbd",
-- 				func = "#c48282",
-- 				string = "#e8b589",
-- 				number = "#e8b589",
-- 				property = "#b4d4cf",
-- 				constant = "#cdcdcd",
-- 				-- parameter = "#b4d4cf",
-- 				parameter = "",
-- 				visual = "#333738",
-- 				error = "#d8647e",
-- 				warning = "#f3be7c",
-- 				hint = "#7e98e8",
-- 				operator = "#90a0b5",
-- 				keyword = "#6E85B2",
-- 				type = "#bb9dbd",
-- 				search = "#405065",
-- 				plus = "#7fa563",
-- 				delta = "#f3be7c",
-- 			},
-- 			on_highlights = function(hl, c)
-- 				hl["@function.call"] = {
-- 					fg = "#c48282",
-- 				}
-- 				hl["@constructor"] = {
-- 					fg = "#c48282",
-- 				}
-- 				hl["@variable"] = {
-- 					fg = "",
-- 				}
-- 				hl["@BlinkCmpMenu"] = {
-- 					fg = "#c48282"
-- 				}
-- 				hl["@variable.member.go"] = {
-- 					fg = "#b4d4cf",
-- 				}
-- 				hl["@constant.builtin"] = {
-- 					fg = "#bb9dbd",
-- 				}
-- 				hl["@boolean"] = {
-- 					fg = "#bb9dbd",
-- 				}
-- 				hl["@keyword.import"] = {
-- 					fg = "#bb9dbd",
-- 				}
-- 			end,
-- 		})
-- 		vim.cmd.colorscheme("vague")
-- 		-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0A363", bold = true })
-- 	end,
-- }
