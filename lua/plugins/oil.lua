return {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
                view_options = {
                        show_hidden = true,
                },
                keymaps = { ["q"] = { "actions.close", mode = "n" } },
                float = {
                        border = "rounded",
                        max_width = 0.5,
                        max_height = 0.6,
                }
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,

        -- Oil in float
        vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
}
