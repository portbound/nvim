return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		-- Configure notify first
		require("notify").setup({
			background_colour = "#000000",
			stages = "slide",
		})
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				-- hover = {
				-- 	enabled = false,
				-- },
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true,
						luasnip = true,
						throttle = 50,
					},
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true, -- Can set back to false since we're not using noice hover
			},
		})
	end,
}
-- return {
-- 	"folke/noice.nvim",
-- 	event = "VeryLazy",
-- 	opts = {
-- 		-- add any options here
-- 	},
-- 	dependencies = {
-- 		"MunifTanjim/nui.nvim",
-- 		"rcarriga/nvim-notify",
-- 	},
-- 	config = function()
-- 		-- Configure notify first
-- 		require("notify").setup({
-- 			background_colour = "#000000",
-- 			stages = "slide",
-- 		})
--
-- 		require("noice").setup({
-- 			lsp = {
-- 				override = {
-- 					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 					["vim.lsp.util.stylize_markdown"] = true,
-- 					["cmp.entry.get_documentation"] = true,
-- 				},
-- 			},
-- 			presets = {
-- 				bottom_search = true,
-- 				command_palette = true,
-- 				long_message_to_split = true,
-- 				inc_rename = false,
-- 				lsp_doc_border = true,
-- 			},
-- 		})
-- 	end,
-- }
