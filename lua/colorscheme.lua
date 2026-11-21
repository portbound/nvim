vim.pack.add({ "https://github.com/kungfusheep/mfd.nvim" })
require("mfd").setup({
	bright_comments = true,
})
vim.cmd.colorscheme("mfd-flir-bh")

-- vim.pack.add({ "https://github.com/aktersnurra/no-clown-fiesta.nvim" })
-- require("no-clown-fiesta").setup({
-- 	-- transparent = true,
-- 	-- theme = "light"
-- })
--
-- --
-- vim.cmd.colorscheme("no-clown-fiesta")
-- --
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = "#dfdbc3" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "#dfdbc3" })

vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#505050", bg = "#b8b8b8", underline = true })
-- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#dca561" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#dd821e" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#984936" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "#576f82" })

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#404040" })
-- vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "CursorColumn", { bg = "NONE" })
-- -- --
-- -- vim.api.nvim_set_hl(0, "@string", { fg = "#B4BE82" })
-- -- vim.api.nvim_set_hl(0, "@number", { fg = "#B4BE82" })
-- -- -- vim.api.nvim_set_hl(0, "@type", { fg = "#a2b5c1" })
-- -- --
-- -- vim.api.nvim_set_hl(0, "@operator", { fg = "#919191" })
-- -- vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#919191" })
-- -- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#919191" })
-- --
vim.api.nvim_set_hl(0, "@function.call", { bold = true })
-- vim.api.nvim_set_hl(0, "@function", { fg = "#88afa2", })
-- -- vim.api.nvim_set_hl(0, "@function.method", { fg = "#88afa2", })
-- -- vim.api.nvim_set_hl(0, "@function.method.call", { fg = "#88afa2", })
vim.api.nvim_set_hl(0, "@keyword", { fg = "#0085c5", })
vim.api.nvim_set_hl(0, "@keyword.coroutine", { fg = "#0085c5", })
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#0085c5", })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#0085c5", })
-- vim.api.nvim_set_hl(0, "@keyword", { fg = "#6e94b2", })
-- -- vim.api.nvim_set_hl(0, "@keyword.coroutine", { fg = "#6e94b2", })
-- -- vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#6e94b2", })
-- -- vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#6e94b2", })
-- -- vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#6e94b2", })
-- -- vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#6e94b2", })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#dd821e", })
vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#ca0000", bold = true, })
-- -- -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2d3d" })
-- -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
vim.api.nvim_set_hl(0, "DapBreak", { fg = "#984936" })
vim.api.nvim_set_hl(0, "DapStop", { fg = "#dca561" })
-- --
-- -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#bad7ff" })
-- --
-- -- -- git specific stuff
-- -- vim.api.nvim_set_hl(0, "DiffsDelete", { bg = "#26201F" })
-- -- vim.api.nvim_set_hl(0, "DiffsAdd", { bg = "#1F2220" })
-- --
-- -- -- java specific stuff
-- -- vim.api.nvim_set_hl(0, '@lsp.type.modifier.java', {})
