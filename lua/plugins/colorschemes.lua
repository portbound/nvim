return
-- {
--     "ramojus/mellifluous.nvim",
--     -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
--     config = function()
--         require("mellifluous").setup({
--             colorset = "mountain",
--             transparent_background = {
--                 enabled = true,
--                 floating_windows = true,
--                 telescope = true,
--                 file_tree = true,
--                 cursor_line = true,
--                 status_line = true
--             },
--         }) -- optional, see configuration section.
--         vim.cmd("colorscheme mellifluous")
--     end,
-- }

-- {
--     "zenbones-theme/zenbones.nvim",
--     -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--     -- If you don't want to install lush, make sure to set g:tokyobones_compat = 1
--     -- In Vim, compat mode is turned on as Lush only works in Neovim.
--     dependencies = "rktjmp/lush.nvim",
--     lazy = false,
--     priority = 1000,
--     -- you can set set configuration options here
--     config = function()
--         vim.g.zenbones_transparent_background = true
--         vim.g.zenbones_darken_comments = 45
--         vim.cmd.colorscheme('zenbones')
--     end
-- }

-- {
-- 	"metalelf0/black-metal-theme-neovim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("black-metal").setup({
-- 			theme = "emperor",
-- 			transparent = true
-- 		})
-- 		require("black-metal").load()
-- 	end,
-- }

{
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
-- 			theme = "gyokuro",
-- 			transparent = true,
-- 		})
-- 		vim.cmd.colorscheme("gyokuro")
-- 	end,
-- }
