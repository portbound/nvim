vim.pack.add({ "https://github.com/rktjmp/lush.nvim" })
vim.pack.add({ "https://github.com/zenbones-theme/zenbones.nvim" })

local colors_name = "custom"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/gruvbox-community/gruvbox#palette
local palette
if bg == "light" then
	palette = util.palette_extend({
		bg = hsluv "#fbf1c7",
		fg = hsluv "#3c3836",
		rose = hsluv "#9d0006",
		leaf = hsluv "#79740e",
		wood = hsluv "#b57614",
		water = hsluv "#076678",
		blossom = hsluv "#8f3f71",
		sky = hsluv "#427b58",
	}, bg)
else
	palette = util.palette_extend({
		-- bg = hsluv "#161821",
		bg = hsluv "#000000",
		fg = hsluv "#e9eaf2",
		keyword = hsluv "#6E8ED8",
		string = hsluv "#B4BE82",
		func = hsluv "#986ED8",
		-- rose = hsluv "#fb4934",
		-- leaf = hsluv "#b8bb26",
		-- wood = hsluv "#fabd2f",
		water = hsluv "#83a598",
		-- blossom = hsluv "#d3869b",
		-- sky = hsluv "#83c07c",
	}, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- Statement { base_specs.Statement, fg = hsluv "#DB5461" },
		Keyword { fg = palette.keyword },
		sym("@keyword.conditional") { fg = palette.keyword },
		sym("@keyword.function") { fg = palette.keyword },
		sym("@keyword.return") { fg = palette.keyword, gui "italic" },
		sym("@function") { fg = palette.func },
		sym("@function.method") { fg = palette.func },
		sym("@function.builtin") { fg = palette.func },
		String { fg = palette.string },
		Special { fg = palette.water },
		Type { fg = palette.sky, gui = "italic" },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
