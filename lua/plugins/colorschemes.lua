return {
	"vague2k/vague.nvim",
	priority = 1000,
	config = function()
		require("vague").setup({
			comments = "italic",
			transparent = true,
			style = {
				style = {},
			},
		})
		vim.cmd.colorscheme("vague")
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#E0A363", bold = true })
	end,
}

-- {
-- 	"sainnhe/gruvbox-material",
-- 	enabled = true,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_material_transparent_background = 1
-- 		vim.g.gruvbox_material_foreground = "mix"
-- 		vim.g.gruvbox_material_background = "hard"
-- 		vim.g.gruvbox_material_ui_contrast = "high"
-- 		vim.g.gruvbox_material_float_style = "bright"
-- 		vim.g.gruvbox_material_statusline_style = "material"
-- 		vim.g.gruvbox_material_cursor = "auto"
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }
-- {
-- 	"vague2k/vague.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("vague").setup({
-- 			comments = "italic",
-- 			transparent = false,
-- 			style = {
-- 				style = {},
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("vague")
-- 	end,
-- },
-- {
-- 	"thesimonho/kanagawa-paper.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa-paper").setup({
-- 			transparent = true,
-- 		})
-- 		--vim.cmd("colorscheme kanagawa-paper-ink")
-- 	end,
-- },
-- {
-- 	"ramojus/mellifluous.nvim",
-- 	config = function()
-- 		require("mellifluous").setup({})
-- 		--vim.cmd("colorscheme mellifluous")
-- 	end,
-- },
-- {
-- 	"savq/melange-nvim",
-- 	config = function()
-- 		--vim.cmd.colorscheme("melange")
-- 	end,
-- },
-- {
-- 	"zenbones-theme/zenbones.nvim",
-- 	-- Optionally install Lush. Allows for more configuration or extending the colorscheme
-- 	-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
-- 	-- In Vim, compat mode is turned on as Lush only works in Neovim.
-- 	dependencies = "rktjmp/lush.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	-- you can set set configuration options here
-- 	config = function()
-- 		--vim.g.zenbones_darken_comments = 45
-- 		--vim.cmd.colorscheme("zenbones")
-- 	end,
-- },
-- {
-- 	"rjshkhr/shadow.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.opt.termguicolors = true
-- 		--vim.cmd.colorscheme("shadow")
-- 	end,
-- },
-- {
-- 	"anAcc22/sakura.nvim",
-- 	dependencies = "rktjmp/lush.nvim",
-- 	config = function()
-- 		transparent = true
-- 		vim.opt.background = "dark" -- or "light"
-- 		--vim.cmd("colorscheme sakura") -- sets the colorscheme
-- 		-- Force transparency
-- 		local groups = {
-- 			"Normal",
-- 			"NormalNC",
-- 			"NormalFloat",
-- 			"FloatBorder",
-- 			"SignColumn",
-- 			"VertSplit",
-- 			"StatusLine",
-- 			"TabLineFill",
-- 		}
-- 		for _, group in ipairs(groups) do
-- 			vim.api.nvim_set_hl(0, group, { bg = "none" })
-- 		end
-- 	end,
-- },
-- {
-- 	"cdmill/neomodern.nvim",
-- 	config = function()
-- 		require("neomodern").setup({
-- 			theme = "hojicha",
-- 			transparent = true,
-- 		})
-- 		--vim.cmd.colorscheme("hojicha")
-- 	end,
-- },
-- {
-- 	"Koalhack/darcubox-nvim",
-- 	config = function()
-- 		require("darcubox").setup({
-- 			options = {
-- 				transparent = true,
-- 				styles = {
-- 					comments = { italic = true }, -- italic
-- 					functions = { bold = true }, -- bold
-- 					keywords = { italic = true },
-- 					types = { italic = true, bold = true }, -- italics and bold
-- 				},
-- 			},
-- 		})
--
-- 		-- Set the configuration before loading the color scheme
--
-- 		--vim.cmd("colorscheme darcubox")
-- 	end,
-- },
