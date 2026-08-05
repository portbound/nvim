vim.pack.add({ "https://github.com/aktersnurra/no-clown-fiesta.nvim" })
require("no-clown-fiesta").setup()

vim.cmd.colorscheme("no-clown-fiesta")

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

vim.api.nvim_set_hl(0, "@string", { fg = "#B4BE82" })
vim.api.nvim_set_hl(0, "@number", { fg = "#B4BE82" })
-- vim.api.nvim_set_hl(0, "@number", { fg = "#a2b5c1" })
vim.api.nvim_set_hl(0, "@keyword", { fg = "#6e94b2" })
vim.api.nvim_set_hl(0, "@keyword.conditional", { fg = "#6e94b2" })
vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#6e94b2" })
vim.api.nvim_set_hl(0, "@keyword.repeat", { fg = "#6e94b2" })
vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#6e94b2" })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#b46958" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2d3d" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#202020" })
vim.api.nvim_set_hl(0, "DapBreak", { fg = "#b46958" })
vim.api.nvim_set_hl(0, "DapStop", { fg = "#dca561" })

vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#bad7ff", bold = true })

-- git specific stuff
vim.api.nvim_set_hl(0, "DiffsDelete", { bg = "#26201F" })
vim.api.nvim_set_hl(0, "DiffsAdd", { bg = "#1F2220" })

-- java specific stuff
vim.api.nvim_set_hl(0, '@lsp.type.modifier.java', {})
